import numpy as np
import matplotlib.pyplot as plt

def stepwise(x, a, b, h):
	return np.piecewise(x, [x < a, (x >= a) & (x <= b), x > b], [0, h, 0])

X = np.linspace(0, 10, num = 1000)
Parameters = [(1, 2, 3), (3, 9, 1), (5, 8, 4)]
Colors = ["#7a76c2", "#ff6e9c", "#6dff88"]

fig, ax = plt.subplots()
ax.set_facecolor("#d3d3d322")
ax.grid()
for params, color in zip(Parameters, Colors):
	Y = stepwise(X, params[0], params[1], params[2])
	ax.plot(X, Y, c = color, label = f"a = {params[0]}, b = {params[1]}, h = {params[2]}", linewidth = 2)
ax.legend()

if __name__ == "__main__":
	plt.savefig("stepwise.svg", bbox_inches = "tight")
