import numpy as np
import matplotlib.pyplot as plt

c = 300000

def gamma(v):
	return (1 / np.sqrt(1 - (np.pow(v, 2) / np.pow(c, 2))))

velocities = np.linspace(0, c - 1, 1000000)
gammas = gamma(velocities)

fig, ax = plt.subplots()
ax.set_xlabel("velocity [km / s]")
ax.set_ylabel("γ")
ax.set_title("Scaling of γ with respect to velocity")
ax.set_yscale("log")
ax.plot(velocities, gammas, label = "gamma", color = "blue")
ax.legend()
ax.grid()


plt.savefig("gamma.svg")

