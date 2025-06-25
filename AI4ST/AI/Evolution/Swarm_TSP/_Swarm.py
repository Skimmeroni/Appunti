import numpy
import matplotlib
from pathlib import Path
import sys
matplotlib.use("module://mplcairo.gtk")
import matplotlib.pyplot as plt
import matplotlib.animation as animation

Population_size = 30
Dimensions = 2
Iterations = 50
Alpha = 0.95

W = 1.5
A = 1.25
B = 1.5

emoji_font_path = "/usr/share/fonts/noto/NotoColorEmoji.ttf"
Symbols = {"bee": '🐝', "bird": '🐦', "fish": '🐠'}
sym = Symbols["bee"] if len(sys.argv) < 2 else Symbols[sys.argv[1]]

def f(p):
	return (numpy.pow(p[0], 2)) * numpy.exp(-(numpy.pow(p[0], 2) + numpy.pow(p[1], 2)))

class Particle:
	def __init__(self):
		self.position = numpy.full((Dimensions), [numpy.random.random() for d in range(Dimensions)])
		self.velocity = numpy.full((Dimensions), [-5 for d in range(Dimensions)])
		self.local_opt = self.position

#S.positions = numpy.array([_S[i].position for i in range(20)])

if __name__ == "__main__":
	Particles = [Particle() for i in range (Population_size)]

	global_opt = max(Particles, key = lambda p: f(p.position)).position

	fig, ax = plt.subplots()
	ax.set_facecolor("#d3d3d322")
	ax.grid()
	X = [p.position[0] for p in Particles]
	Y = [p.position[1] for p in Particles]

	texts = [ax.text(X[i], Y[i], sym, ha = "center", va = "center",
			font = Path(emoji_font_path), fontsize = 16) for i in range(Population_size)]
	content = [texts]
	ax.set_xlim(-10, 10)
	ax.set_ylim(-10, 10)

	for it in range(Iterations):
		for p in Particles:
			p.local_opt = p.position if f(p.position) > f(p.local_opt) else p.local_opt
		
		global_opt = max(Particles, key = lambda p: f(p.position)).position

		for p in Particles:
			theta_one = numpy.random.random()
			theta_two = numpy.random.random()
			p.velocity = W * p.velocity + \
						theta_one * A * (p.local_opt - p.position) + \
						theta_two * B * (global_opt - p.position)
			p.position = p.position + p.velocity

		W = W * Alpha

		X = [p.position[0] for p in Particles]
		Y = [p.position[1] for p in Particles]
		texts = [ax.text(X[i], Y[i], sym, ha = "center", va = "center",
				font = Path(emoji_font_path), fontsize = 16) for i in range(Population_size)]
		content.append(texts)
		print(f"Iteration: {it + 1}/{Iterations}, \
				Best solution: {[f"{round(x, 4):+0.6f}" for x in global_opt]} \
				With value: {f(global_opt)}", end = '\r')

	ani = animation.ArtistAnimation(fig = fig, artists = content, interval = 100)
	plt.show()
