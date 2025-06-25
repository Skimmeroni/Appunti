import numpy as np
import matplotlib.pyplot as plt

def triangular(x, a = 1.5, b = 2.5, c = 3):
	if (a <= x and x < b):
		return (x - a) / (b - a)
	elif (b <= x and x < c):
		return (c - x) / (c - b)
	else:
		return 0

def trapezoidal(x, a = 1, b = 2, c = 3, d = 4):
	if (a <= x and x < b):
		return (x - a) / (b - a)
	elif (b <= x and x < c):
		return 1
	elif (c <= x and x < d):
		return (d - x) / (d - c)
	else:
		return 0

def bell(x, a = 2.5, b = 1):
	return np.exp(-np.pow((x - a) / b, 2))

X = np.linspace(0, 5, num = 1000)
Colors = ["#7a76c2", "#ff6e9c", "#6dff88"]

for function, color in zip([triangular, trapezoidal, bell], Colors):
	fig, ax = plt.subplots()
	fig.subplots_adjust(left = 0.1, right = 0.9, top = 0.66, bottom = 0.1)
	ax.set_facecolor("#d3d3d322")
	ax.grid()
	Y = [function(i) for i in X]
	ax.plot(X, Y, c = color, linewidth = 2)
	plt.savefig(f"fuzzy_{function.__name__}.svg", bbox_inches="tight")
	plt.close()
