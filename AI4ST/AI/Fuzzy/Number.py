from fuzzylogic.classes import Domain, Set
from fuzzylogic.functions import triangular, R, S
from matplotlib import pyplot
import itertools

T = Domain("Temperatures", -5, 50, res = 0.1)
T.freezing = S(4, 10)
T.cold = triangular(9, 18)
T.mild = triangular(15, 27)
T.warm = triangular(22, 34)
T.hot = R(32, 38)

T.freezing.plot()
T.cold.plot()
T.mild.plot()
T.warm.plot()
T.hot.plot()

Colors = ["#440154", "#3b528b", "#21918c", "#5ec962", "#fd7b25"]

pyplot.gca().set_facecolor("#d3d3d322")
pyplot.gca().get_legend().set_visible(False)

for lines, color in zip(itertools.batched(pyplot.gca().get_lines(), 3), Colors):
	lines[0].set_color(color)
	lines[1].set_visible(False)
	lines[2].set_visible(False)

pyplot.savefig("number.svg", bbox_inches="tight")
