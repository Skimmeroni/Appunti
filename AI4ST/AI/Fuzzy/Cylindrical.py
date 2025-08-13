import matplotlib.pyplot as plt
import numpy as np

def bell(x, y, a, b):
	return np.exp(-np.pow(((x - a) / b), 2))

X = np.linspace(-10, 10, num = 100)
Y = np.linspace(1, 2, num = 100)
X, Y = np.meshgrid(X, Y)
Z = bell(X, Y, 1, 2)

fig = plt.figure()
ax = fig.add_subplot(projection = '3d')
ax.plot_surface(X, Y, Z, antialiased = True, shade = True)
ax.set_title("$\\widehat{\\pi}_{X}(\\mu)(x, y) = \\Omega_{1, 2}(x)$")
ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_zlabel("$\\widehat{\\pi}_{X}(\\mu)(x, y)$")

if __name__ == "__main__":
	plt.savefig("cylindrical.svg", bbox_inches = "tight", pad_inches = 0.35)
