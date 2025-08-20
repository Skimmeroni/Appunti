import numpy as np
import matplotlib.pyplot as plt

def trapezoid(x, a, b, c, d):
	return np.piecewise(x, [x < a, ((x >= a) & (x < b)), ((x >= b) & (x < c)), ((x >= c) & (x <= d)), x > d],
	                       [0, lambda x: (x - a) / (b - a), 1, lambda x: (d - x) / (d - c), 0])

def triangular(x, a, b, c):
	return np.piecewise(x, [x < a, ((x >= a) & (x < b)), ((x >= b) & (x <= c)), x > c],
	                       [0, lambda x: (x - a) / (b - a), lambda x: (c - x) / (c - b), 0])

X = np.linspace(-5, 5, 100)
Y = np.linspace(-10, 10, 100)
X, Y = np.meshgrid(X, Y)
Z = np.minimum(trapezoid(X, -1, 0, 1, 2), triangular(Y, -5, 0, 5))

fig = plt.figure()
ax = fig.add_subplot(projection = '3d')
ax.plot_surface(X, Y, Z, antialiased = True, shade = True)
ax.set_title("$\\mu_{1} \\times \\mu_{2}(x, y) = min\\{\\Pi_{-1, 0, 1, 2}(x), \\Lambda_{-5, 0, 5}(y)\\}$")
ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_zlabel("$\\mu_{1} \\times \\mu_{2}(x, y)$")

if __name__ == "__main__":
	plt.savefig("cartesian.svg", bbox_inches = "tight", pad_inches = 0.35)
