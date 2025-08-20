from fuzzylogic.classes import Domain
from fuzzylogic.functions import R, trapezoid
from fuzzylogic.combinators import MAX, MIN
from matplotlib import pyplot
 
T = Domain("Absolute", -2, 3, res = 0.01)
T.minuspointfive = trapezoid(-1.5, -0.5, -0.5, 2.5)
T.pointfive = trapezoid(-2.5, 0.5, 0.5, 1.5)
T.zero = R(0, 0.01)

T.result = MIN(MAX(T.minuspointfive, T.pointfive), T.zero)
T.minuspointfive.plot()
T.result.plot()

pyplot.gca().set_facecolor("#d3d3d322")
pyplot.gca().get_legend().set_visible(False)

pyplot.gca().get_lines()[0].set_color("#ff6e9c")
pyplot.gca().get_lines()[0].set_alpha(0.33)
pyplot.gca().get_lines()[1].set_visible(False)
pyplot.gca().get_lines()[2].set_visible(False)
pyplot.gca().get_lines()[3].set_color("#7a76c2")
pyplot.gca().get_lines()[4].set_visible(False)
pyplot.gca().get_lines()[5].set_visible(False)

if __name__ == "__main__":
	pyplot.savefig("absolute.svg", bbox_inches="tight")
