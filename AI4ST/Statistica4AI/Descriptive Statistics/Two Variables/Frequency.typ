#import "../../Stats4AI_definitions.typ": *

In most cases, there is interest in analyzing more than one variable at a
time for the same sample. For the sake of simplicity, consider a situation
where only two variables are under analysis at the same time (it is trivial
to generalize to $m$ variables), either both discrete or both continuous.
The set of observations will therefore be in the form ${(x_(1), y_(1)),
(x_(2), y_(2)), dots, (x_(n), y_(n))}$, where $x_(i)$ is the value coming
from the first variable and $y_(i)$ is the value coming from the second
variable.

Given two variables $X$ and $Y$, let $V = {(v_(j), v_(i))}$ with
$1 lt.eq i lt.eq N$ and $1 lt.eq j lt.eq M$ be the set of all
possible couples that can be constructed by choosing a value for
$X$ and a value for $Y$. In the same fashion as the single variable
case, it is possible to compute the *absolute frequency* $f_(j i)$
as the number of observations in the sample having $v_(j)$ as the
value for the first variable and $v_(i)$ as the value for the second
variable.  From the absolute frequency it is possible to compute the
*double absolute frequency distribution* as the function $f$ that,
for any $(v_(j), v_(i))$, outputs the corresponding absolute frequency.

From the absolute frequency it is possible to define what is called the
*cumulative absolute frequency* $F_(j, i)$, given by the sum of the absolute
frequencies of all possible values $(v_(a), v_(b)) in V$ such that $v_(a)
lt.eq v_(j)$ and $v_(b) lt.eq v_(i)$. As for the absolute frequency, it is
possible to define the *cumulative double absolute frequency distribution* as
the function $F$ that, for any $(v_(j), v_(i))$, outputs the corresponding
cumulative absolute frequency.

$ F_(j, i) = sum_(a: v_(a) lt.eq v_(j), b: v_(b) lt.eq v_(i))^(|V|)
  f_(a, b) $

The relative frequency $p_(j, i)$ is given by the ratio between the
absolute frequency $f_(j, i)$ and the sample size $n$. As for the
absolute frequency, it is possible to define the *double relative
frequency distribution* as the function $p$ that, for any $(v_(j),
v_(i))$, outputs the corresponding relative frequency.

$ p_(j, i) = frac(f_(j, i), n) $

From the relative frequency it is possible to define what is called the
*cumulative relative frequency* $P_(j, i)$, given by the sum of the relative
frequencies of all possible values $(v_(a), v_(b)) in V$ such that $v_(a)
lt.eq v_(j)$ and $v_(b) lt.eq v_(i)$. As for the relative frequency, it is
possible to define the *cumulative double relative frequency distribution*
as the function $P$ that, for any $(v_(j), v_(i))$, outputs the corresponding
cumulative relative frequency.

$ P_(j, i) = sum_(a: v_(a) lt.eq v_(j), b: v_(b) lt.eq v_(i))^(|V|)
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
			..csv("rooms_occupants_data.csv", delimiter: " ").flatten()
		)
	)
] <Flats-Occupants>
#solution[
	#align(
		center,
		table(
			columns: 6,
			[*Number of \ rooms*], [*Number of \ occupants*],
			[*Absolute \ frequency*], [*Relative \ frequency*],
			[*Cumulative \ absolute \ frequency*],
			[*Relative \ absolute \ frequency*],
			..csv("rooms_occupants_result.csv").flatten()
		)
	)
]

One way to obtain a graphical representation for two variables is the
*heat map*, or *color map*: a table where the possible values for the
two variables are arranged on the sides and each $(v_(j), v_(i))$ cell
is coloured: said colour is as bright as $f_(j, i)$ is high.

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

Aside from said frequencies, that are analogous to single
variable frequencies, other frequencies can be considered
when analyzing samples with two variables. One such example
are *marginal frequencies*, frequencies computed on exclusively
one of the two variables without taking into account the value
of the other.
