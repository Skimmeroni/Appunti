import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 5, 11)
y = np.linspace(0, 5, 11)
X, Y = np.meshgrid(x, y)
Z = np.sin(X) * np.cos(Y)

plt.figure(dpi=200)
plt.pcolormesh(X, Y, Z, shading="auto")

plt.colorbar()

plt.savefig("heat.svg", format="svg", dpi=300)
plt.close()
