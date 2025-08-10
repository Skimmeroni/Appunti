from fuzzylogic.classes import Domain
from fuzzylogic.functions import trapezoid
from fuzzylogic.combinators import MAX
from matplotlib import pyplot
 
T = Domain("Example", 0, 9, res = 0.01)
T.left = trapezoid(1, 2, 2, 14/3)
T.right = trapezoid(2, 6, 7, 8, c_m = 0.5)
T.final = MAX(T.left, T.right)

T.final.plot()
pyplot.gca().set_facecolor("#d3d3d322")
pyplot.gca().get_legend().set_visible(False)
pyplot.gca().set_title("Fuzzy set alpha-cuts")

pyplot.gca().get_lines()[0].set_color("#7a76c2")
pyplot.gca().get_lines()[0].set_linestyle("dashed")
pyplot.gca().get_lines()[0].set_alpha(0.25)
pyplot.gca().get_lines()[1].set_visible(False)
pyplot.gca().get_lines()[2].set_visible(False)

X = [[1, 8], [1.15, 7.7], [1.3, 3.86], [4.4, 7.4], [1.45, 3.46],
     [5.6, 7.1], [1.6, 3.06], [1.75, 2.66], [1.9, 2.26]]
Y = [[0, 0], [0.15, 0.15], [0.30, 0.30], [0.30, 0.30], [0.45, 0.45],
     [0.45, 0.45], [0.60, 0.60], [0.75, 0.75], [0.90, 0.90]]

for x, y in zip(X, Y):
	pyplot.plot(x, y, c = "#ff6e9c", linewidth = 2)

if __name__ == "__main__":
	pyplot.savefig("alpha.svg", bbox_inches="tight")
