import matplotlib.pyplot as plt
import numpy as np
from matplotlib import cm

def lukasiewicz_norm(X, Y):
	return np.maximum(X + Y - 1, 0)

def lukasiewicz_conorm(X, Y):
	return np.minimum(X + Y, 1)

def algebraic_product(X, Y):
	return X * Y

def algebraic_sum(X, Y):
	return X + Y - X * Y

def drastic_product(X, Y):
	return np.where((X == 1) | (Y == 1), np.minimum(X, Y), 0)

def drastic_sum(X, Y):
	return np.where((X == 0) | (Y == 0), np.maximum(X, Y), 1)

def nilpotent_minimum(X, Y):
	return np.where(X + Y > 1, np.minimum(X, Y), 0)

def nilpotent_maximum(X, Y):
	return np.where(X + Y < 1, np.maximum(X, Y), 1)

X = np.linspace(0, 1, num = 100)
Y = np.linspace(0, 1, num = 100)
X, Y = np.meshgrid(X, Y)

for f in [lukasiewicz_norm, algebraic_product, drastic_product, lukasiewicz_conorm, algebraic_sum, drastic_sum, nilpotent_minimum, nilpotent_maximum]:
	Z = f(X, Y)
	fig, ax = plt.subplots(subplot_kw = {"projection": "3d"} )
	ax.plot_surface(X, Y, Z, cmap = cm.viridis, antialiased = True)
	plt.gca().invert_xaxis()
	plt.savefig(f"{f.__name__}.svg", bbox_inches="tight")
	plt.close()
