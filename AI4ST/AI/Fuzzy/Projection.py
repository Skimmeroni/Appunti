import matplotlib.pyplot as plt
import numpy as np

def trapezoid(x, a, b, c, d):
	return np.piecewise(x, [x < a, ((x >= a) & (x < b)), ((x >= b) & (x < c)), ((x >= c) & (x <= d)), x > d],
	                       [0, lambda x: (x - a) / (b - a), 1, lambda x: (d - x) / (d - c), 0])

def triangular(x, a, b, c):
	return np.piecewise(x, [x < a, ((x >= a) & (x < b)), ((x >= b) & (x <= c)), x > c],
	                       [0, lambda x: (x - a) / (b - a), lambda x: (c - x) / (c - b), 0])

X = np.linspace(-5, 5, 500)
Y = np.linspace(-10, 10, 500)
T1 = trapezoid(X, -1, 0, 1, 2)
T2 = triangular(Y, -5, 0, 5)

fig = plt.figure()
ax = fig.add_subplot(projection = '3d')
ax.plot(X, T1, zdir = 'y', zs = 10, color = "#ff6e9c")
ax.plot(Y, T2, zdir = 'x', zs = -4, color = "#7a76c2")

X = np.linspace(-1, 2, 100)
Y = np.linspace(-5, 5, 100)
X, Y = np.meshgrid(X, Y)
Z = np.minimum(trapezoid(X, -1, 0, 1, 2), triangular(Y, -5, 0, 5))
ax.plot_surface(X, Y, Z, antialiased = True, lw = 0.25, color = "#d3d3d322", edgecolor = "black", alpha = 0.33, rstride = 5, cstride = 5)

ax.set_title("Projections of $\\mu_{1} \\times \\mu_{2}$")
ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_zlabel("$\\mu_{1} \\times \\mu_{2}(x, y)$")

if __name__ == "__main__":
	plt.savefig("projection.svg", bbox_inches = "tight", pad_inches = 0.35)
