import numpy as np
import matplotlib.pyplot as plt

def heaviside(x, theta):
	return np.piecewise(x, [x >= theta, x < theta], [1, 0])

X = np.linspace(-10, 10, num = 1000)
Parameters = [-2.5, 5, 0]
Colors = ["#7a76c2", "#ff6e9c", "#6dff88"]

fig, ax = plt.subplots()
ax.set_facecolor("#d3d3d322")
ax.grid()
for theta, color in zip(Parameters, Colors):
	Y = heaviside(X, theta)
	ax.plot(X, Y, c = color, label = f"$\\theta\\ = {round(theta, 5)}$", linewidth = 2)
ax.legend()

if __name__ == "__main__":
	plt.savefig("heaviside.svg", bbox_inches = "tight")
