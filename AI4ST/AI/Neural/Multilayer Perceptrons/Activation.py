import numpy as np
import matplotlib.pyplot as plt

def semi_linear(x, theta):
	return np.piecewise(x, [x < theta - 0.5, ((x >= theta - 0.5) & (x <= theta + 0.5)), x > theta + 0.5],
	                       [0, lambda x: x - theta + 0.5, 1])

def sine_up_to_saturation(x, theta):
	return np.piecewise(x, [x < theta - np.pi / 2, ((x >= theta - np.pi / 2) & (x <= theta + np.pi / 2)), x > theta + np.pi / 2],
	                       [0, lambda x: (np.sin(x - theta) + 1) / 2, 1])

def logistic(x, theta):
	return 1 / (1 + np.exp(-(x - theta)))

def hyperbolic_tangent(x, theta):
	return 2 / (1 + np.exp(-2 * (x - theta))) - 1

def rectified_maximum(x, theta):
	return np.piecewise(x, [x - theta < 0, x - theta >= 0],
	                       [0, lambda x: x - theta])

def softplus(x, theta):
	return np.log(1 + np.exp(x - theta))

X = np.linspace(-10, 10, num = 1000)
Parameters = [-1/2 * np.pi, 1/2 * np.pi, np.pi]
Colors = ["#7a76c2", "#ff6e9c", "#6dff88"]
Functions = [semi_linear, sine_up_to_saturation, logistic, hyperbolic_tangent, rectified_maximum, softplus]

for f in Functions:
	fig, ax = plt.subplots()
	ax.set_facecolor("#d3d3d322")
	ax.grid()
	for theta, color in zip(Parameters, Colors):
		Y = f(X, theta)
		ax.plot(X, Y, c = color, label = f"$\\theta\\ = {round(theta, 5)}$", linewidth = 2)
	ax.legend()

	if __name__ == "__main__":
		plt.savefig(f"{f.__name__}.svg", bbox_inches = "tight")

	plt.close()
