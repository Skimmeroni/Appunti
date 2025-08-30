import matplotlib.pyplot as plt
import numpy as np

def triangular(x, sigma):
	return np.piecewise(x, [x >= sigma, x < sigma],
	                       [0, lambda x: 1 - (x / sigma)])

def gaussian(x, sigma):
	return np.exp(-(np.pow(x, 2) / (2 * np.pow(sigma, 2))))

X = np.linspace(-1, 1, num = 1000)
Y = np.linspace(-1, 1, num = 1000)
X, Y = np.meshgrid(X, Y)

Functions = [triangular, gaussian]

for f in Functions:
	fig, ax = plt.subplots()
	ax.set_aspect("equal", adjustable = "box")
	ax.set_facecolor("#d3d3d322")
	ax.grid()

	Z = np.sqrt(X**2 + Y**2)
	Z = f(Z, 1)
	plt.contourf(X, Y, Z, 15)
	plt.colorbar()

	if __name__ == "__main__":
		plt.savefig(f"{f.__name__}-radius.svg", bbox_inches = "tight")

	plt.close()
