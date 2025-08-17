import numpy as np
import matplotlib.pyplot as plt

rng = np.random.default_rng(seed = 42)
s = np.array([np.array([0.1, 0]), np.array([0, 0.1])])
size = 30

def gen_data(mu, sigma, size):
	return rng.multivariate_normal(mu, sigma, size = size).T

A = gen_data(np.array([0, 0]), s, size)
B = gen_data(np.array([0, 0]), s, size)
C = gen_data(np.array([1, 1]), s, size)

fig, (ax1, ax2) = plt.subplots(1, 2)

ax1.scatter(A[0], A[1], color = "#ff6e9c")
ax1.scatter(C[0], C[1], color = "#7a76c2")
ax1.set_facecolor("#d3d3d322")
ax1.grid()

ax2.scatter(A[0], A[1], color = "#ff6e9c")
ax2.scatter(B[0], B[1], color = "#7a76c2")
ax2.set_facecolor("#d3d3d322")
ax2.grid()

if __name__ == "__main__":
	plt.savefig("separable.svg")
