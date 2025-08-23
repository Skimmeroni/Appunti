import numpy as np
import matplotlib.pyplot as plt

def line(x, m, q):
	return m * x + q

X = np.linspace(-0.5, 1.5, 100)
Y1 = line(X, -1, 0.5)
Y2 = line(X, -1, 1.5)

fig, ax = plt.subplots()

ax.fill_between(X, Y1, 2, color = 'b', alpha = 0.1)
ax.fill_between(X, Y2, -2, color = 'm', alpha = 0.1)

ax.plot(0, 0, marker = 'o', color = 'b')
ax.plot(0, 1, marker = 'o', color = 'b')
ax.plot(1, 0, marker = 'o', color = 'b')
ax.plot(1, 1, marker = 'o', color = 'b')
ax.plot(X, Y1, color = 'b')
ax.plot(X, Y2, color = 'm')

ax.set_xlim(-0.5, 1.5)
ax.set_ylim(-0.5, 1.5)
ax.set_xlabel('X')
ax.set_ylabel('Y')

ax.set_facecolor("#d3d3d322")
ax.grid()

if __name__ == "__main__":
	plt.savefig("xor.svg", bbox_inches = "tight")

plt.close()
