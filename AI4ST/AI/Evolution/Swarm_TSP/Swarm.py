import numpy
import matplotlib
from pathlib import Path
import sys
matplotlib.use("module://mplcairo.gtk")
import matplotlib.pyplot as plt
import matplotlib.animation as animation

Iterations = 100
step_size = 1.5
A = 1.25
B = 1.5
decay_factor = 0.95
global_opt = 0

emoji_font_path = "/usr/share/fonts/noto/NotoColorEmoji.ttf"
Symbols = {"bee": '🐝', "bird": '🐦', "fish": '🐠'}
sym = Symbols["bee"] if len(sys.argv) < 2 else Symbols[sys.argv[1]]

def f(p):
	return (numpy.pow(p[0], 2)) * numpy.exp(-(numpy.pow(p[0], 2) + numpy.pow(p[1], 2)))

class Swarm:
	def __init__(self, population_size = 20):
		self.data = numpy.zeros((population_size, 6), dtype = numpy.float64)
		self.data[:, 0:2] = numpy.random.rand(population_size, 2)
		self.data[:, 4:6] = self.data[:, 0:2]
		self.population_size = population_size

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
		self.positions = self.positions + self.velocities

	def update_velocities(self):
		self.velocities = (step_size * self.velocities +
		                   numpy.random.random() * A * (self.memory - self.positions) +
		                   numpy.random.random() * B * (global_opt - self.positions))

	def update_memory(self):
		mask = f(self.positions.T) > f(self.memory.T)
		mask = numpy.broadcast_to(mask, self.positions.T.shape)
		self.memory = numpy.where(mask.T, self.positions, self.memory)

if __name__ == "__main__":
	S = Swarm()
	global_opt = max(S.positions, key = lambda p: f(p))

	fig, ax = plt.subplots()
	ax.set_facecolor("#d3d3d322")
	ax.grid()
	ax.set_xlim(-10, 10)
	ax.set_ylim(-10, 10)

	texts = [ax.text(S.positions[i, 0], S.positions[i, 1], sym, ha = "center", va = "center",
			 font = Path(emoji_font_path), fontsize = 16) for i in range(S.population_size)]
	content = [texts]

	for it in range(Iterations):
		S.update_memory()
		global_opt = max(S.positions, key = lambda p: f(p))
		S.update_velocities()
		S.update_positions()
		step_size *= decay_factor

		texts = [ax.text(S.positions[i, 0], S.positions[i, 1], sym, ha = "center", va = "center",
				 font = Path(emoji_font_path), fontsize = 16) for i in range(S.population_size)]
		content.append(texts)
		print(f"Iteration: {it + 1}/{Iterations} \
			Best solution: {[f"{round(x, 4):+0.6f}" for x in global_opt]} \
			With value: {f(global_opt)}", end = '\r')

	ani = animation.ArtistAnimation(fig = fig, artists = content, interval = 100)
	plt.show()
