import numpy as np
import matplotlib.pyplot as plt

Q = np.pow(10.0, -6)
epsilon = 8.85 * np.pow(10.0, -12)
R = 5
A = np.abs(Q) / (4 * np.pi * epsilon)

def electric_field(z):
	return A * (np.abs(z) / np.pow(np.pow(z, 2) + np.pow(R, 2), 1.5))

points = np.linspace(-100, 100, 1000)
strengths = electric_field(points)

fig, ax = plt.subplots()
ax.set_xlabel("z")
ax.set_ylabel("E")
ax.set_title("Strength of the electric field with Q = 1 μC and r = 5m")
ax.plot(points, strengths, label = "distance from the centre", color = "blue")
ax.axvline(x = +R / np.sqrt(2), color = "red", linestyle = "--", label = "z = ±R / √2")
ax.axvline(x = -R / np.sqrt(2), color = "red", linestyle = "--")
ax.legend()
ax.grid()

plt.savefig("ring.svg")
