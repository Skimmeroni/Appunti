#import "../../Stats4AI_definitions.typ": *

Consider a single discrete variable $X$. Suppose that a univariate
dataset is constructed from a sample of size $n$ of observations
$O = (x_(1), x_(2), dots, x_(n))$ of $X$.

Any statistical enquiry should start from the *absolute frequencies*
of the values in the support of $X$. For a given $d_(i) in D(X)$, the
absolute frequency $f_(i)$ is defined as the number of observations
in the sample whose value is $d_(i)$.

$ f_(i) = abs({x | x in O, x = d_(i)}) $

From the absolute frequency it is possible to define what is called
the *cumulative absolute frequency* $F_(i)$ of $d_(i) in D(X)$ as the
sum of the absolute frequencies of all $d_(j) in D(X)$ such that
$d_(j) lt.eq d_(i)$.

$ F_(i) = sum_(j: d_(j) lt.eq d_(i))^(abs(D(X))) f_(j) $

The *relative frequency* $p_(i)$ of $d_(i) in D(X)$ is given by the
ratio between the absolute frequency $f_(i)$ and the sample size $n$.

$ p_(i) = frac(f_(i), n) $

Relative frequencies are often preferred to absolute frequencies,
because by definition they all lie in the $[0, 1]$ interval, no
matter the order of magnitude of the observations. This gives
"fairer" comparisons between the frequencies of different
variables, especially if their support varies greatly.

From the relative frequency it is possible to define what is called the
*cumulative relative frequency* $P_(i)$ of $d_(i) in D(X)$, given by the
sum of the relative frequencies of all $d_(j) in D(X)$ such that $d_(j)
lt.eq d_(i)$.

$ P_(i) = sum_(j: d_(j) lt.eq d_(i))^(abs(D(X))) p_(j) $

An element in the support of $X$ could never appear among the
observations. That is, $X$ could attain a certain value _in
theory_, but never appear in the sample. It is therefore perfectly
valid for a member of $D(X)$ to have an absolute/relative frequency
equal to $0$. Taking into account the absolute/relative frequency
of absent data might make sense if $D(X)$ is a finite set. If $D(X)$
is a discrete but infinite set (the set of natural numbers, for
example), members of the support with frequency $0$ give no meaningful
insights.

It is common to compute all four frequencies for all elements of the sample
and then arrange them into a *frequency table*.

#exercise[
	Suppose that the number of rooms in a sample of $80$ flats has been
	counted, and reported in the following table:

	#figure(
		table(
			columns: 27,
			stroke: none,
			fill: none,
			..csv("rooms_data.csv").flatten()
		)
	)

	Construct the frequency table.
] <Rooms-example>
#solution[
	#figure(
		caption: [The frequency table for the given dataset],
		table(
			columns: 5,
			table.header([*Number of \ rooms*], [*Absolute \ frequency*],
			             [*Relative \ frequency*], [*Cumulative \ absolute \ frequency*],
			             [*Relative \ absolute \ frequency*]),
			..csv("rooms_result.csv").flatten()
		)
	)
]

Sometimes, computing frequencies and arranging them in a frequency table
is not particularly informative. A visual and more direct representation
of the absolute/relative frequency is the *bar plot*, or *histogram*. A
bar plot is constituted by a Cartesian plane where on the $x$ axis lie
the members of the support of the variable. For each, a rectangle is
drawn with said member as base and whose height is proportional to its
absolute/relative frequency.

#exercise[
	Consider @Rooms-example. Draw a box plot of the relative frequencies.
]
#solution[
	#figure(
		caption: [The bar plot of the relative frequencies for the given dataset.],
		image("barplot.svg", width: 75%)
	)
]

An alternative graphical representation is the *pie chart*, where a
circle is drawn and then partitioned into slices that are proportional
to the absolute/relative frequencies.

#exercise[
	Consider @Rooms-example. Draw a pie chart of the absolute frequencies.
]
#solution[
	#figure(
		caption: [The pie chart of the absolute frequencies for the given dataset.],
		image("pie.svg", width: 75%)
	)
]

If the variable at hand is categorical, it is still possible to compute
a frequency table as long as the support of the variable is a finite or
countable set. If the variable is continuous, it is clearly impossible
to compute the frequencies "as is", because its support is an uncountable
set.

To circumvent the problem, the observations are partitioned into
*classes*: each of these disjointed sets contains the observations
that fall in a given range. The frequencies are then computed with
respect to the size of these classes, which are in a finite number.
The frequency of a class is an estimate of the frequency of all the
elements that lie inside said class.

The number of classes in which to partition the data can be chosen
arbitrarely, as well as the size of the classes. However, these are
choices that are to be taken sensibly, since a poor partition choice
can give misleading results. In general, a greater number of observations
requires a greater number of classes. As a rule of thumb:

$ "number of classes" approx sqrt("number of observations") $

In the simplest scenario, all classes are of the same size. However, it
is also perfectly valid to have classes of different sizes. This is a
sensible choice when the data is unevenly distributed, with some subsets
of the support much more present in the observations than others. Ideally,
the classes should be smaller for overrepresented subsets of the support
and larger for underrepresented subsets.

A class may or may not contain its own extremes. If a class contains its
rightmost value (the highest) it is said to be *closed on the right*. If
a class contains its leftmost value (the lowest), it is said to be *closed
on the left*. A class can be closed only on the right, only on the left,
both on the right and on the left or neither. It is common practice to
have classes that are closed on the left but not on the right.

#exercise[
	Suppose that the level of cholesterol in a sample of $40$ patients
	has been measured, and reported in the following table:

	#figure(
		table(
			columns: 20,
			stroke: none,
			fill: none,
			..csv("cholesterol_data.csv").flatten()
		)
	)

	Compute the frequency table.
]
#solution[
	This variable is not discrete, but continuous. The lowest value is
	$171$, whereas the highest is $227$. Since $sqrt(40) approx 6.324$,
	the dataset can be partitioned into the following classes:

	#figure(
		table(
			columns: 6,
			stroke: none,
			fill: none,
			[\[171-180)], [\[180-190)], [\[190-199)],
			[\[199-208)], [\[208-218)], [\[218-227)]
		)
	)

	The frequency table with respect to these classes is as follows:

	#figure(
		caption: [The frequency table for the given dataset],
		table(
			columns: 5,
			table.header([*Class*], [*Absolute \ frequency*],
			             [*Relative \ frequency*], [*Cumulative \ absolute \ frequency*],
			             [*Relative \ absolute \ frequency*]),
			..csv("cholesterol_result.csv").flatten()
		)
	)
]

A bar plot can be drawn for continuous variables as well, where the height
of the bars is proportional to the frequency of the classes. If the classes
are of different sizes, the width and the height of the bars ought to be
adjusted in order to take into account the size of the class. This is done
by drawing bars whose width is proportional to the size of the class and
whose height is proportional to the *frequency density*, the frequency
divided by the size.

The same could be done for a pie chart, scaling the radius of the slices
with respect to the size of the classes. However, this would result in a
hardly readable plot. This is one of the reasons why bar plots are to be
preferred, at least for continuous data, to pie charts.
