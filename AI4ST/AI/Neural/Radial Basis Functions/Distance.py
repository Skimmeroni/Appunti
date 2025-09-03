import matplotlib.pyplot as plt
import numpy as np

def manhattan(x, y):
	return np.abs(X) + np.abs(Y)

def euclidean(x, y):
	return np.sqrt(X**2 + Y**2)

def maximal(x, y):
	return np.maximum(np.abs(X), np.abs(Y))

X = np.linspace(-1, 1, num = 1000)
Y = np.linspace(-1, 1, num = 1000)
X, Y = np.meshgrid(X, Y)

Functions = [manhattan, euclidean, maximal]

for f in Functions:
	fig, ax = plt.subplots()
	ax.set_aspect("equal", adjustable = "box")
	ax.set_facecolor("#d3d3d322")
	ax.grid()

	Z = f(X, Y)
	plt.contour(X, Y, Z)

	if __name__ == "__main__":
		plt.savefig(f"{f.__name__}.svg", bbox_inches = "tight")

	plt.close()
