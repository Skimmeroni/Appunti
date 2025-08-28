import numpy as np
import matplotlib.pyplot as plt

def f(x):
	return (-1 / 3) * np.pow(x, 5) + (5 / 3) * np.pow(x, 4) - (1 / 3) * np.pow(x, 3) - (23 / 3) * np.pow(x, 2) + (56 / 6) * x - 2

def exponential(x, a, b, c):
	return np.exp(a - (np.pow((x - b) / (np.sqrt(2) * c), 2)))

X = np.linspace(0, 4, 1000)
Y = f(X)
E1 = exponential(X, 0.7, 2.95, 0.3)
E2 = exponential(X, 0, 0.7, -0.2)
E3 = -1 * exponential(X, -0.2, 1.8, -0.2)

fig, ax = plt.subplots()
ax.set_ylim(-1, 2.5)
ax.set_xlim(0, 4)
ax.plot(X, Y, color = "#7a76c2")
ax.plot(X, E1, color = "#ff6e9c")
ax.plot(X, E2, color = "#ff6e9c")
ax.plot(X, E3, color = "#ff6e9c")

ax.set_aspect("equal", adjustable = "box")
ax.set_facecolor("#d3d3d322")
ax.grid()

if __name__ == "__main__":
	plt.savefig("bell.svg", bbox_inches = "tight")
