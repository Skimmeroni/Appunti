from fuzzylogic.classes import Domain, Set
from fuzzylogic.functions import trapezoid, alpha
from matplotlib import pyplot

T = Domain("Example", 0, 10, res = 0.1)
T.set = Set(trapezoid(1, 2, 2, 5)) | Set(trapezoid(1, 6, 7, 8, c_m = 0.5))
T.set.plot()

pyplot.gca().set_facecolor("#d3d3d322")
pyplot.gca().get_legend().set_visible(False)
for line in pyplot.gca().get_lines():
    line.set_color("#7a76c2")

pyplot.savefig("~vertical.svg", bbox_inches="tight")

fig, ax = pyplot.subplots()
ax.set_facecolor("#d3d3d322")
ax.grid()
for alpha in [0, 0.15, 0.30, 0.45, 0.60, 0.75, 0.90]:
	ax.plot([alpha + 1, min((alpha - 1.75) / -0.375, 4)], [alpha, alpha], c = "#ff6e9c")
for alpha in [0, 0.15, 0.30, 0.45]:
	ax.plot([max((alpha + 0.25) / 0.125, 4), (alpha - 4) / -0.5], [alpha, alpha], c = "#ff6e9c")
pyplot.savefig("~horizontal.svg", bbox_inches="tight")
pyplot.close()
