from fuzzylogic.classes import Domain
from fuzzylogic.functions import R, trapezoid
from fuzzylogic.combinators import MIN
from matplotlib import pyplot
import itertools

T = Domain("Example", 1, 2.5, res = 0.01)
T.mu2 = trapezoid(1.75, 1.8, 1.9, 1.95)
T.mu1 = R(1.6, 2)
T.intersection = MIN(T.mu2, T.mu1)

T.mu2.plot()
T.mu1.plot()
T.intersection.plot()

Colors = ["#ff6e9c", "#7a76c2", "#8f00ff"]

pyplot.gca().set_facecolor("#d3d3d322")

for lines, color in zip(itertools.batched(pyplot.gca().get_legend().get_lines(), 2), Colors):
	lines[0].set_color(color)
	lines[0].set_alpha(0.5)
	lines[1].set_visible(False)

pyplot.gca().get_legend().get_lines()[4].set_alpha(1.0)

for texts, color in zip(itertools.batched(pyplot.gca().get_legend().get_texts(), 2), Colors):
	texts[1].set_visible(False)

for lines, color in zip(itertools.batched(pyplot.gca().get_lines(), 3), Colors):
	lines[0].set_color(color)
	lines[0].set_alpha(0.5)
	lines[1].set_visible(False)
	lines[2].set_visible(False)

pyplot.gca().get_lines()[6].set_alpha(1.0)

if __name__ == "__main__":
	pyplot.savefig("intersection.svg", bbox_inches="tight")
