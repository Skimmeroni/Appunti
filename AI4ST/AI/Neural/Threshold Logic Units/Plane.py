import numpy as np
import matplotlib.pyplot as plt

def line(x, m, q):
	return m * x + q

X = np.linspace(-0.5, 1.5, 100)
Parameters = [(-1, 1.5), (-1, 0.5), (1, 0.5)]
Functions = ["AND", "OR", "IF-THEN"]

for f, p in zip(Functions, Parameters):
	Y = line(X, p[0], p[1])

	fig, ax = plt.subplots()
	head = (0.5, line(0.5, p[0], p[1]))
	ax.annotate("", xytext = head, xy = (0.75, line(0.75, -(1 / p[0]), head[1] + 0.5 / p[0])),
	            arrowprops = dict(arrowstyle = "->"))

	ax.fill_between(X, Y, np.sign(p[0]) * -2, color = 'b', alpha = 0.1)

	ax.plot(0, 0, marker = 'o', color = 'b')
	ax.plot(0, 1, marker = 'o', color = 'b')
	ax.plot(1, 0, marker = 'o', color = 'b')
	ax.plot(1, 1, marker = 'o', color = 'b')
	ax.plot(X, Y)

	ax.set_xlim(-0.5, 1.5)
	ax.set_ylim(-0.5, 1.5)
	ax.set_xlabel('X')
	ax.set_ylabel('Y')

	ax.set_facecolor("#d3d3d322")
	ax.grid()

	if __name__ == "__main__":
		plt.savefig(f"{f}.svg", bbox_inches = "tight")

	plt.close()
