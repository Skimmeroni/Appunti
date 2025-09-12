#import "../../Stats4AI_definitions.typ": *

Most statistical enqiries are interested in analyzing more than one
variable at the same time.

Consider two discrete variables $X$ and $Y$. Suppose that a bivariate
dataset is constructed from a sample of size $n$ of observations $O =
((x_(1), y_(1)), (x_(2), y_(2)), dots, (x_(n), y_(n)))$ of $X$ and
$Y$. The support of both variables considered at the same time is the
Cartesian product of the two supports, that is $D(X, Y) = D(X) times
D(Y)$.

The *double absolute frequency* $f_(i, j)$ of $(d_(i), d_(j)) in
D(X, Y)$ is defined as the number of observations in the sample
that have $d_(i)$ as the value attained by $X$ and $d_(j)$ as the
value attained by $Y$.

$ f_(i, j) = abs({(x, y) | (x, y) in O, x = d_(i), y = d_(j)}) $

From the double absolute frequency it is possible to define what
is called the *double cumulative absolute frequency* $F_(i, j)$
of $(d_(i), d_(j)) in D(X, Y)$ as the sum of the double absolute
frequencies of all $(d_(a), d_(b)) in D(X, Y)$ such that $d_(a)
lt.eq d_(i)$ and $d_(b) lt.eq d_(j)$.

$ F_(i, j) = sum_(a: d_(a) lt.eq d_(i), b: d_(b) lt.eq d_(j))^(abs(D(X, Y)))
  f_(a, b) $

The *double relative frequency* $p_(i, j)$ of $(d_(i), d_(j)) in
D(X, Y)$ is given by the ratio between the double absolute frequency
$f_(i, j)$ and the sample size $n$.

$ p_(i, j) = frac(f_(i, j), n) $

From the double absolute frequency it is possible to define what
is called the *double cumulative relative frequency* $P_(i, j)$
of $(d_(i), d_(j)) in D(X, Y)$ as the sum of the double relative
frequencies of all $(d_(a), d_(b)) in D(X, Y)$ such that $d_(a)
lt.eq d_(i)$ and $d_(b) lt.eq d_(j)$.

$ P_(i, j) = sum_(a: d_(a) lt.eq d_(i), b: d_(b) lt.eq d_(j))^(abs(D(X, Y)))
  p_(a, b) $

#exercise[
	Suppose that a sample has been collected regarding the number of
	rooms in a flat and the number of people inhabiting such flat.
	Compute the four frequencies for the sample.

	#align(
		center,
		table(
			columns: 18,
			stroke: none,
			fill: none,
			..csv("rooms_occupants_data.csv", delimiter: " ").flatten()
		)
	)
] <Flats-Occupants>
#solution[
	#align(
		center,
		table(
			inset: (
				x: 10pt,
				y: 9pt,
			),
			columns: 6,
			[*Number of \ rooms*], [*Number of \ occupants*],
			[*Double \ absolute \ frequency*], [*Double \ relative \ frequency*],
			[*Double \ cumulative \ absolute \ frequency*],
			[*Double \ cumulative \ relative \ frequency*],
			..csv("rooms_occupants_result.csv").flatten()
		)
	)
]

Frequencies for three or more variables can be defined following the
same approach. Also, if one or more of the variables are continuous,
it is still possible to assign them a frequency by partitioning the
observations into classes.

A known graphical representation for the double absolute frequency or
double relative frequency is the *heat map*, or *color map*. A heat map
is a rectangle partitioned into cells, where to each cell is assigned
one member of the support. Each cell is colored with a different shade
of the same color: the brightness of the color is proportional to the
double absolute/relative frequency of the support element assigned to
that cell.

#exercise[
	Draw a color map for the absolute frequency in @Flats-Occupants.
]
#solution[
	#figure(
		caption: [A color map for @Flats-Occupants. The brightness of
		          the color blue is proportional to the frequency of
		          a particular combination of rooms and occupants.],
		image("colormap.svg", width: 75%)
	)
]

When dealing with bivariate or multivariate data, it can still be
interesting to know the frequency of the values of a single variable,
without considering the value of the other(s). Frequencies that take
into account only one variable in each observation neglecting the
others are called *marginal frequencies*.

For example, consider two variables $X$ and $Y$ and a sample of size
$n$ of observations $O = ((x_(1), y_(1)), (x_(2), y_(2)), dots, (x_(n),
y_(n)))$. For a $d_(i) in D(X)$, the marginal absolute frequency with
respect to $X$ is defined as the number of observations in the sample
that have $d_(i)$ as the value attained by $X$ and any value as the
value attained by $Y$. On the other hand, for a $d_(j) in D(Y)$ the
marginal absolute frequency with respect to $Y$ is defined as the
number of observations in the sample that have any value as the
value attained by $X$ and $d_(j)$ as the value attained by $Y$.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ f_(i,) = abs({(x, y) | (x, y) in O, x = d_(i)}) $],
	[$ f_(,j) = abs({(x, y) | (x, y) in O, y = d_(j)}) $]
)
