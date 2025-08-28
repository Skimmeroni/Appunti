import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Circle

Parameters = [[(1, 1), 0.5], [(1, 1), 1.25], [(0, 1), 1.25]]
Functions = ["AND", "OR", "IF-THEN"]

for f, p in zip(Functions, Parameters):
	fig, ax = plt.subplots()

	ax.plot(0, 0, marker = 'o', color = 'b')
	ax.plot(0, 1, marker = 'o', color = 'b')
	ax.plot(1, 0, marker = 'o', color = 'b')
	ax.plot(1, 1, marker = 'o', color = 'b')

	ax.set_xlim(-0.5, 1.5)
	ax.set_ylim(-0.5, 1.5)
	ax.set_xlabel('X')
	ax.set_ylabel('Y')
	ax.set_aspect("equal", adjustable = "box")

	ax.set_facecolor("#d3d3d322")
	ax.grid()
	ax.add_patch(Circle(xy = p[0], radius = p[1], alpha = 0.25))

	if __name__ == "__main__":
		plt.savefig(f"{f}.svg", bbox_inches = "tight")
		plt.close()
