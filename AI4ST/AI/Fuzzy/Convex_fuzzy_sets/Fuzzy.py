from fuzzylogic.classes import Domain
from fuzzylogic.functions import triangular, trapezoid, gauss
from matplotlib import pyplot
import itertools

T = Domain("Example", 0, 5, res = 0.01)
T.triangular = triangular(1.5, 3)
T.trapezoid = trapezoid(1, 2, 3, 4)
T.gauss = gauss(2.5, 1)

Colors = ["#7a76c2", "#ff6e9c", "#6dff88"]

for function, color in zip([T.triangular, T.trapezoid, T.gauss], Colors):
	function.plot()

	pyplot.gca().set_facecolor("#d3d3d322")
	pyplot.gca().get_legend().set_visible(False)

	pyplot.gca().get_lines()[0].set_color(color)
	pyplot.gca().get_lines()[1].set_visible(False)
	pyplot.gca().get_lines()[2].set_visible(False)

	pyplot.savefig(f"fuzzy_{function.name}.svg", bbox_inches = "tight")
	pyplot.close()
