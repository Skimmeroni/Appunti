from matplotlib import pyplot

fig, ax = pyplot.subplots()
ax.set_facecolor("#d3d3d322")
ax.grid()
for alpha in [0, 0.15, 0.30, 0.45, 0.60, 0.75, 0.90]:
	ax.plot([alpha + 1, min((alpha - 1.75) / -0.375, 4)], [alpha, alpha], c = "#ff6e9c")
for alpha in [0, 0.15, 0.30, 0.45]:
	ax.plot([max((alpha + 0.25) / 0.125, 4), (alpha - 4) / -0.5], [alpha, alpha], c = "#ff6e9c")
pyplot.savefig("horizontal.svg", bbox_inches="tight")
pyplot.close()
