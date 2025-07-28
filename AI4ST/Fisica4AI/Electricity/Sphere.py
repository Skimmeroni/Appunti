import numpy as np
import matplotlib.pyplot as plt

Q = np.pow(10.0, -6)
K = 1 / (8.85 * np.pow(10.0, -12) * 4 * np.pi)
R = 5

def electric_field(r):
	return np.piecewise(r, [r < R, r >= R], [lambda r: r * K * Q / np.pow(R, 3), lambda r: K * Q / np.pow(r, 2)])

radii = np.linspace(0, 20, 1000)
strengths = electric_field(radii)

fig, ax = plt.subplots()
ax.set_xlabel("r")
ax.set_ylabel("E")
ax.set_title("Strength of the electric field with Q = 1 μC and R = 5m")
ax.plot(radii, strengths, label = "r", color = "blue")
ax.axhline(K * Q / np.pow(R, 2), color = "red", linestyle = "--", label = "E = Q / 4 pi epsilon R^2")
ax.legend()
ax.grid()

plt.savefig("sphere.svg")
