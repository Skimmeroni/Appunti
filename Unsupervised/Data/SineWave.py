import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 1000)
y = np.sin(4*x)

plt.plot(x, y)

plt.savefig("sine.svg", format="svg", dpi=300)
plt.close()
