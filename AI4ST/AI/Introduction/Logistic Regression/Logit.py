import numpy as np
import matplotlib.pyplot as plt

def linear(x, a, b):
	return a + b * x

def curve(x, a, b):
	return 6 / (1 + np.exp(a + b * x))

PointsOrig = [(1, 0.4), (2, 1.0), (3, 3.0), (4, 5.0), (5, 5.6)]
PointsTran = [(1, 2.64), (2, 1.61), (3, 0), (4, -1.61), (5, -2.64)]

X = np.linspace(0, 10, num = 100)
Z = [linear(x, 4.14, -1.38) for x in X]
Y = [curve(x, 4.14, -1.38) for x in X]

fig, ax = plt.subplots()
ax.set_facecolor("#d3d3d322")
ax.grid()
ax.plot(X, Z)
ax.scatter([p[0] for p in PointsTran], [p[1] for p in PointsTran], c = "magenta")
plt.savefig("logit1.svg")
plt.close()

fig, ax = plt.subplots()
ax.set_facecolor("#d3d3d322")
ax.grid()
ax.plot(X, Y)
ax.scatter([p[0] for p in PointsOrig], [p[1] for p in PointsOrig], c = "magenta")

if __name__ == "__main__":
	plt.savefig("logit2.svg")
