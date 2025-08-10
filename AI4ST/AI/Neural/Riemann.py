import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

def parabola(x):
	return x**2

interval = range(0, 6, 1)
X = np.linspace(interval.start, interval.stop, num = 100)
Y = [parabola(x) for x in X]

fig, ax = plt.subplots()
for i in interval:
	ax.add_patch(Rectangle(xy = [i, 0], width = interval.step,
                     height = parabola(i + interval.step / 2), alpha = 0.3,
                     lw = 1, edgecolor = "black"))
plt.plot(X, Y)

if __name__ == "__main__":
	plt.savefig("riemann.svg")
