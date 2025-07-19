import numpy as np
import matplotlib.pyplot as plt

amplitude = 2
wavelength = 1.5
phase = np.pi
period = 2.5

def displacement(x, t):
	return amplitude * np.sin(2 * np.pi * (x / wavelength - t / period) + phase)

spacetime = np.linspace(0, 10, 1000)
fig, ax = plt.subplots()

Y = displacement(spacetime, 0)
ax.set_xlabel("x")
ax.set_ylabel("D(x, 0) = -2 sin(1.33pi x)")
ax.set_title("Snapshot graph of D(x, t) with t = 0")
ax.grid()
ax.plot(spacetime, Y)
plt.savefig("snapshot_graph.svg")
plt.close(fig)

fig, ax = plt.subplots()
Y = displacement(0, spacetime)
ax.set_xlabel("t")
ax.set_ylabel("D(0, t) = 2 sin(0.80pi t)")
ax.set_title("History graph of D(x, t) with x = 0")
ax.grid()
ax.plot(spacetime, Y)
plt.savefig("history_graph.svg")
