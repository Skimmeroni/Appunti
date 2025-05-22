import numpy as np
import sympy as sp
import matplotlib.pyplot as plt

def heaviside(x, theta):
	return 1 if x >= theta else 0

def semi_linear(x, theta):
	if (x > theta + 0.5):
		return 1
	elif (x < theta - 0.5):
		return 0
	else:
		return (x - theta) + 0.5

def sine_up_to_saturation(x, theta):
	if (x > theta + np.pi / 2):
		return 1
	elif (x < theta - np.pi / 2):
		return 0
	else:
		return (np.sin(x - theta) + 1) / 2

def logistic(x, theta):
	return 1 / (1 + np.exp(-(x - theta)))

def hyperbolic_tangent(x, theta):
	return 2 / (1 + np.exp(-2 * (x - theta))) - 1

X = np.linspace(-10, 10, num = 100)
Parameters = [-1/2 * sp.pi, 1/2 * sp.pi, sp.pi]
Colors = ["#7a76c2", "#ff6e9c", "#6dff88"]

for f in [heaviside, semi_linear, sine_up_to_saturation, logistic, hyperbolic_tangent]:
	fig, ax = plt.subplots()
	ax.set(xlim = (-12, 12))
	fig.subplots_adjust(left = 0.1, right = 0.9, top = 0.66, bottom = 0.1)
	ax.set_facecolor("#d3d3d322")
	ax.grid()
	for theta, color in zip(Parameters, Colors):
		Y = [f(i, np.float64(theta)) for i in X]
		ax.plot(X, Y, c = color, label = f"theta = {sp.pretty(theta)}", linewidth = 2)
	ax.legend()
	plt.savefig(f"{f.__name__}.svg", bbox_inches="tight")
	plt.close()
