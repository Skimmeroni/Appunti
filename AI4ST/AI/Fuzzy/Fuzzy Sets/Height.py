from fuzzylogic.classes import Domain
from fuzzylogic.functions import R
from matplotlib import pyplot

T = Domain("Height", 1, 2.5, res = 0.01)
T.h = R(1.6, 2)
T.h.plot()

pyplot.gca().set_facecolor("#d3d3d322")
pyplot.gca().get_legend().set_visible(False)

pyplot.gca().get_lines()[0].set_color("#7a76c2")
pyplot.gca().get_lines()[1].set_visible(False)
pyplot.gca().get_lines()[2].set_visible(False)

if __name__ == "__main__":
	pyplot.savefig("height.svg", bbox_inches="tight")
