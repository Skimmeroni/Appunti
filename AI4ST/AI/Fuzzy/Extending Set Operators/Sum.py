from fuzzylogic.classes import Domain, Set
from fuzzylogic.functions import triangular
from matplotlib import pyplot
import itertools

T = Domain("Sum", -1, 7, res = 0.01)
T.lhs = triangular(0, 2)
T.rhs = triangular(1, 3)
T.result = triangular(1, 5)

T.lhs.plot()
T.rhs.plot()
T.result.plot()

Colors = ["#ff6e9c", "#7a76c2", "#8f00ff"]

pyplot.gca().set_facecolor("#d3d3d322")

for lines, color in zip(itertools.batched(pyplot.gca().get_legend().get_lines(), 2), Colors):
        lines[0].set_color(color)
        lines[0].set_alpha(0.33)
        lines[1].set_visible(False)

pyplot.gca().get_legend().get_lines()[4].set_alpha(1.0)

for texts, color in zip(itertools.batched(pyplot.gca().get_legend().get_texts(), 2), Colors):
        texts[1].set_visible(False)

for lines, color in zip(itertools.batched(pyplot.gca().get_lines(), 3), Colors):
        lines[0].set_color(color)
        lines[0].set_alpha(0.33)
        lines[1].set_visible(False)
        lines[2].set_visible(False)

pyplot.gca().get_lines()[6].set_alpha(1.0)

if __name__ == "__main__":
	pyplot.savefig("sum.svg", bbox_inches = "tight")
