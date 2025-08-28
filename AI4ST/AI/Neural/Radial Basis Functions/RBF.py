import numpy as np
import matplotlib.pyplot as plt

def rectangular(x, sigma):
	return np.piecewise(x, [x >= sigma, x < sigma],
	                       [0, 1])

def triangular(x, sigma):
	return np.piecewise(x, [x >= sigma, x < sigma],
	                       [0, lambda x: 1 - (x / sigma)])

def cosine_down_to_zero(x, sigma):
	return np.piecewise(x, [x >= 2 * sigma, x < 2 * sigma],
	                       [0, lambda x: (np.cos((np.pi / (2 * sigma)) * x) + 1) / 2])

def gaussian(x, sigma):
	return np.exp(-(np.pow(x, 2) / (2 * np.pow(sigma, 2))))

X = np.linspace(0, 10, num = 1000)
Parameters = [1/2 * np.pi, 3/4 * np.pi, np.pi]
Colors = ["#7a76c2", "#ff6e9c", "#6dff88"]
Functions = [rectangular, triangular, cosine_down_to_zero, gaussian]

for f in Functions:
	fig, ax = plt.subplots()
	ax.set_facecolor("#d3d3d322")
	ax.grid()
	for sigma, color in zip(Parameters, Colors):
		Y = f(X, sigma)
		ax.plot(X, Y, c = color, label = f"$\\sigma\\ = {round(sigma, 5)}$", linewidth = 2)
	ax.legend()

	if __name__ == "__main__":
		plt.savefig(f"{f.__name__}.svg", bbox_inches = "tight")

	plt.close()
