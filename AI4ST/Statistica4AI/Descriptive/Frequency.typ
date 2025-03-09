#import "../Stats4AI_definitions.typ": *

Given a variable, let $V = {v_(1), v_(2), dots, v_(N)}$ be the set
of all possible values for that variable. If said variable is discrete,
to obtain a firsthand impression of the values in the sample it is
useful to compute the *absolute frequency* of each possible value
$v_(j) in V$. The absolute frequency $f_(j)$ is defined as the number
of occurrences of $v_(j)$ in the sample. A more general quantity is
the *absolute frequency distribution*, defined as the function $f$
that, for any $v_(j)$, outputs the corresponding absolute frequency.

From the absolute frequency it is possible to define what is called the
*cumulative absolute frequency* $F_(j)$, given by the sum of the absolute
frequencies of all possible values $v_(k) in V$ such that $v_(k) lt.eq
v_(j)$. As for the absolute frequency, it is possible to define the
*cumulative absolute frequency distribution* as the function $F$ that,
for any $v_(j)$, outputs the corresponding cumulative absolute frequency.

$ F_(j) = sum_(k: v_(k) lt.eq v_(j))^(|V|) f_(k) $

The relative frequency $p_(j)$ is given by the ratio between the absolute
frequency $f_(j)$ and the sample size $n$. As for the absolute frequency,
it is possible to define the *relative frequency distribution* as the
function $p$ that, for any $v_(j)$, outputs the corresponding relative
frequency.

$ p_(j) = frac(f_(j), n) $

From the relative frequency it is possible to define what is called the
*cumulative relative frequency* $P_(j)$, given by the sum of the relative
frequencies of all possible values $v_(k) in V$ such that $v_(k) lt.eq
v_(j)$. As for the relative frequency, it is possible to define the
*cumulative relative frequency distribution* as the function $P$ that,
for any $v_(j)$, outputs the corresponding cumulative relative frequency.

$ P_(j) = sum_(k: v_(k) lt.eq v_(j))^(|V|) p_(k) $

#exercise[
	Suppose that the number of rooms in a sample of $80$ flats has been
	counted, and reported in the following table:

	#align(
		center,
		table(
			columns: 27,
			stroke: none,
			..csv("frequencies_data.csv").flatten()
		)
	)

	Compute the absolute frequency, the relative frequency, the cumulative
	absolute frequency and the cumulative relative frequency of this variable.
] <Rooms-example>
#solution[
	#align(
		center,
		table(
			columns: 5,
			[*Number of \ rooms*], [*Absolute frequency*],
			[*Relative frequency*], [*Cumulative absolute \ frequency*],
			[*Relative absolute \ frequency*],
			..csv("frequencies_result.csv").flatten()
		)
	)
]

Sometimes, computing frequencies and arranging them in a frequency table
is not particularly representative. An alternative representation to the
tabular representation of the absolute and relative frequencies is the
*bar plot*. A bar plot is a graphical representation constitued by a
cartesian plane, where on the $x$ axis the possible values of the variable
are arranged whereas on the $y$ axis the absolute or relative frequencies
of its possible values are arranged. For each possible value $v_(i)$, a
rectangle is drawn above it, having size $f_(i)$ (for the absolute frequency)
or $p_(i)$ (for the relative frequency).

#exercise[
	Consider @Rooms-example. Draw a box plot of the absolute and
	relative frequencies.
]
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[#figure(image("frequencies_barplot_absolute.svg"))],
		[#figure(image("frequencies_barplot_relative.svg"))]
	)
]

When the variable under analysis is continuous, it is impractical to compute
the frequency for each of its possible values, since it is expected that each
possible value will appear no more than a few times. A better approach is to
partition the values of the variable into *classes*: each of these disjointed
sets represents an interval and contains the number of observations that lie
in such interval. As long as the union of all classes reconstructs the entire
set of values, the choice of the intervals and their size is arbitrary. Two
intervals may or may not have the same size.

A class may or may not contain their extremes: if it contains its highest
value (the leftmost value of the interval), said class is said to be *closed
on the right*, whereas if it contains its lowest value (the rightmost value
of the interval) said class is said to be *closed on the left*. In general,
a class is closed on the right but not on the left.

Once a class is defined, it is possible to compute the frequencies with
respect to the sizes of the classes, which are representative of the
frequencies of its values.

#exercise[
	Suppose that the level of cholesterol in a sample of $40$ patients
	has been measured, and reported in the following table:

	#align(
		center,
		table(
			columns: 20,
			stroke: none,
			..csv("frequencies2_data.csv").flatten()
		)
	)

	Compute the absolute frequency, the relative frequency, the cumulative
	absolute frequency and the cumulative relative frequency of this variable.
]
#solution[
	This variable is not discrete, but continuous. The lowest value is
	$171$, whereas the highest is $227$. A possible approach would be to
	divide the values into the following six classes:

	#align(
		center,
		table(
			columns: 6,
			stroke: none,
			[$[171-180)$], [$[180-190)$], [$[190-199)$],
			[$[199-208)$], [$[208-218)$], [$[218-227)$]
		)
	)

	From said construction, it is possible to compute the four frequencies:

	#align(
		center,
		table(
			columns: 5,
			[*Class*], [*Absolute frequency*],
			[*Relative frequency*], [*Cumulative absolute \ frequency*],
			[*Relative absolute \ frequency*],
			..csv("frequencies2_result.csv").flatten()
		)
	)
]

It is possible to draw a bar plot relative to a continuous variable,
referring to the frequencies of the classes instead of the frequencies
of each single value of the sample.

If the intervals that define each class are not of equal size, a bar
plot becomes less representative, because class sizes are not taken
into account. An alternative plot for this scenario is the *histogram*:
an histogram is a bar plot where the width of each rectangle depends on
the size of the interval of the related class, whereas the height is
given by the ratio between the frequency of the class and its size.
This quantity, called *frequency density*, can be thought of as the
frequency of a class "normalized" with respect to its size.
