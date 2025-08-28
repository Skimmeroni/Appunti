import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Circle

fig, ax = plt.subplots()

ax.plot(0, 0, marker = 'o', color = 'b')
ax.plot(0, 1, marker = 'o', color = 'b')
ax.plot(1, 0, marker = 'o', color = 'b')
ax.plot(1, 1, marker = 'o', color = 'b')

ax.set_xlim(-0.5, 1.5)
ax.set_ylim(-0.5, 1.5)
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_aspect("equal", adjustable = "box")

ax.set_facecolor("#c3d9e8")
ax.grid()
ax.add_patch(Circle(xy = (1, 1), radius = 0.5, color = "white"))
ax.add_patch(Circle(xy = (0, 0), radius = 0.5, color = "white"))

if __name__ == "__main__":
	plt.savefig("XOR.svg", bbox_inches = "tight")
