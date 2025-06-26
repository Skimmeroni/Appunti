import numpy

class Swarm:
	step_size = 1.25
	A = 0.75
	B = 1
	decay_factor = 0.95
	population_size = 50

	def __init__(self):
		self.data = numpy.zeros((self.population_size, 6), dtype = numpy.float64)
		self.data[:, 0:2] = numpy.random.uniform(0, 50, size = (self.population_size, 2))
		self.data[:, 4:6] = self.data[:, 0:2]
		self.global_optimum = max(self.data[:, 0:2], key = lambda p: f(p[0], p[1]))

	@property
	def positions(self):
		return self.data[:, 0:2]

	@positions.setter
	def positions(self, content):
		self.data[:, 0:2] = content

	@property
	def velocities(self):
		return self.data[:, 2:4]

	@velocities.setter
	def velocities(self, content):
		self.data[:, 2:4] = content

	@property
	def memory(self):
		return self.data[:, 4:6]

	@memory.setter
	def memory(self, content):
		self.data[:, 4:6] = content

	def update_positions(self):
		self.positions += self.velocities

	def update_velocities(self, penalty = 1):
		self.velocities = (penalty * self.step_size * self.velocities +
		                   numpy.random.random() * self.A * (self.memory - self.positions) +
		                   numpy.random.random() * self.B * (self.global_optimum - self.positions))

	def update_memory(self):
		mask = f(self.positions.T[0], self.positions.T[1]) > f(self.memory.T[0], self.memory.T[1])
		mask = numpy.broadcast_to(mask, self.positions.T.shape)
		self.memory = numpy.where(mask.T, self.positions, self.memory)

	def update_global_optimum(self):
		self.global_optimum = max(self.positions, key = lambda p: f(p[0], p[1]))

def f(x, y):
	return ((10 + 2 * numpy.cos(5 * numpy.sqrt(numpy.pow(x, 2) + numpy.pow(x, 2)))) *
	         numpy.exp(-0.001 * (numpy.pow(x - 100, 2) + numpy.pow(y - 100, 2))))

if __name__ == "__main__":
	import matplotlib
	from pathlib import Path
	import sys
	matplotlib.use("module://mplcairo.gtk")
	import matplotlib.pyplot as plt
	import matplotlib.animation as animation

	def update_text(content):
		texts = [ax.text(S.positions[i, 0], S.positions[i, 1], sym,
		         ha = "center", va = "center", font = Path(emoji_font_path),
		         fontsize = 16) for i in range(S.population_size)]
		content.append(texts)

	emoji_font_path = "/usr/share/fonts/noto/NotoColorEmoji.ttf"
	Symbols = {"bee": '🐝', "bird": '🐦', "fish": '🐠', "ant": '🐜', "robot": '🤖'}
	sym = Symbols["bee"] if len(sys.argv) < 2 else Symbols[sys.argv[1]]
	Iterations = 100

	S = Swarm()

	fig, ax = plt.subplots()
	ax.set_facecolor("#d3d3d322")
	ax.grid()
	ax.set_xlim(50, 150)
	ax.set_ylim(50, 150)

	content = []
	update_text(content)

	penalty = 1
	for it in range(Iterations):
		S.update_memory()
		S.update_global_optimum()
		S.update_velocities(penalty)
		S.update_positions()
		penalty *= S.decay_factor

		update_text(content)

		print(f"Iteration: {it + 1}/{Iterations} \
			Best solution: {f"{round(S.global_optimum[0], 4):+0.6f} {round(S.global_optimum[1], 4):+0.6f}"} \
			With value: {f"{round(f(S.global_optimum[0], S.global_optimum[1]), 4):+0.6f}"}", end = '\r')

	print("")
	print("Summoning the swarm...")
	X = numpy.linspace(50, 150, num = 50)
	Y = numpy.linspace(50, 150, num = 50)
	X, Y = numpy.meshgrid(X, Y)
	Z = f(X, Y)
	ax.contour(X, Y, Z, antialiased = True)
	ani = animation.ArtistAnimation(fig = fig, artists = content, interval = 10)
	plt.show()
