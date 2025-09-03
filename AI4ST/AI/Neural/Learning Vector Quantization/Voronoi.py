import numpy as np
import matplotlib.pyplot as plt
from scipy.spatial import Voronoi, voronoi_plot_2d

rng = np.random.default_rng()
points = rng.uniform(-10, 10, size = (10, 2))

v = Voronoi(points)
fig = voronoi_plot_2d(v)

if __name__ == "__main__":
	plt.savefig("voronoi.svg", bbox_inches = "tight")
