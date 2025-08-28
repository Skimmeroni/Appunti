import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

def parabola(x):
	return np.pow(x, 2)

left_boundary = 0
right_boundary = 6
steps = [(1, "raw"), (0.1, "fine")]
X = np.linspace(left_boundary, right_boundary, 1000)
Y = parabola(X)

if __name__ == "__main__":
	for step_size, name in steps:
		fig, ax = plt.subplots()
		ax.set_facecolor("#d3d3d322")
		ax.grid()

		for i in np.arange(left_boundary, right_boundary + step_size, step_size):
			ax.add_patch(Rectangle(xy = [i - step_size / 2, 0], width = step_size,
						 height = parabola(i), lw = 1, edgecolor = "black",
						 facecolor = "#d6ddff"))

		plt.plot(X, Y, color = "#ff6e9c", lw = 2)
		ax.set_xlabel('X')
		ax.set_ylabel('Y')

		plt.savefig(f"riemann-{name}.svg", bbox_inches="tight")
		plt.close()
