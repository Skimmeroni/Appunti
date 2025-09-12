#import "../../Stats4AI_definitions.typ": *

Summary measures that provide information on how the sample is
"dispersed", that is, how its values are detached from their
centre, are called *variability indices*.

=== Range

Given a numerical variable $X$, let $x_(1), x_(2), dots, x_(n)$
be the observations of $X$ collected from a sample of size $n$.
The *range* is the difference between the observation with the
highest value and the observation with the lowest value. This
summary measure is very simple, but depends exclusively on the
extremes of the sample.

A slightly better alternative is the *interquartile range* (*IQR*
for short), given by the difference between the third quantile and
the first quantile. The IQR represents the interval where most of
the observations lie, without being skewed by the extremes.

$ "IQR" = Q_(3) - Q_(1) $

=== Sample variance

Given a numerical variable $X$, let $x_(1), x_(2), dots, x_(n)$
be the observations of $X$ collected from a sample of size $n$.
The difference between an observation $x_(i)$ and the sample mean
$overline(x)$ is called *residue*, or *deviation from the mean*.

A residue will be positive if the observation is larger than the mean
and negative if smaller than the mean. If all the residues are small
in magnitude, then all observations are close to the mean and there
is little variability. On the other hand, if some of the deviations
are large in magnitude, then some observations lie far from the mean,
suggesting a greater amount of variability.

To obtain a summary measure from the residues, they have to be combined
in some way into a single value. The simplest way would be to sum all
residues, but @Sum-all-residues-always-zero shows that this approach
leads to nowhere.

#lemma[
	The sum of all residues is always zero.
] <Sum-all-residues-always-zero>
#proof[
	$ sum_(i = 1)^(n) overline(x) - x_(i) =
	  sum_(i = 1)^(n) overline(x) - sum_(i = 1)^(n) x_(i) =
	  n overline(x) - sum_(i = 1)^(n) x_(i) =
	  n (overline(x) - frac(sum_(i = 1)^(n) x_(i), n)) =
	  n (overline(x) - overline(x)) =
	  n dot 0 =
	  0 $

	Separating $sum_(i = 1)^(n) overline(x) - x_(i)$ into two sums is
	justified because both sums are finite.
]

There are a number of way to circumvent the issue arisen in
@Sum-all-residues-always-zero. For example, instead of computing
the sum of all residues, one could compute the sum of the absolute
values of the residues. Since the absolute value operator can
introduce some technical difficulties, a simpler approach is to
work with the square of the residues. This leads to the *sample
variance*:

$ s^(2) =
  frac(sum_(i = 1)^(n) (x_(i) - overline(x))^(2), n - 1) =
  frac(n sum_(i = 1)^(n) x_(i)^(2) - (sum_(i = 1)^(n) x_(i))^(2), n(n - 1)) $

#exercise[
	R built-in dataset `ToothGrow` contains measurements concerning
	Guinea pigs in a lab experiment, where they were fed either orange
	juice or ascorbic acid ("pure" vitamin C) to investigate a link
	between teeth grow and vitamin C intake. The length of the teeth
	of the first $10$ Guinea pigs are presented below:

	#figure(
		table(
			columns: 10,
			stroke: none,
			fill: none,
			..csv("teeth.csv").flatten()
		)
	)

	Knowing that the sample mean is $7.98$, compute the sample variance.
]
#solution[
	$ s^(2) = frac((4.2 - 7.98)^(2) + (11.5 - 7.98)^(2) + dots + (5.2 - 7.98)^(2) + (7.0 - 7.98)^(2), 10 - 1) = 7.54 $
]

The reason why the denominator has $n - 1$ instead of $n$ will become
clear when introducing parameter estimation.

// FIXME
//#lemma[
//	Consider the sum of the squares of all residues:
//
//	$ sum_(i = 1)^(n) (overline(x) - x_(i))^(2) $
//
//	Its minimum is the sample mean.
//]
// #proof[
// To be added
// ]

#lemma[
	If $s_(x)^(2)$ is the sample variance of a given sample, a
	linear transformation $f(x) = a x + b$ with $a, b in RR$
	applied to all elements of the sample gives a new sample
	whose sample variance is $s_(y) = a^(2) s_(x)^(2)$.
]
#proof[
	Let $y_(i) = a x_(i) + b$ be the $i$-th element of the
	transformed sample. Using @Sample-mean-linear:

	$ s_(y)^(2) &=
	  frac(sum_(i = 1)^(n) (y_(i) - overline(y))^(2), n - 1) =
	  frac(sum_(i = 1)^(n) (a x_(i) + cancel(b) - a overline(x) - cancel(b))^(2), n - 1) =
	  frac(sum_(i = 1)^(n) (a (x_(i) - overline(x)))^(2), n - 1) = \
	  &= frac(sum_(i = 1)^(n) a^(2) (x_(i) - overline(x))^(2), n - 1) = 
	  a^(2) (frac(sum_(i = 1)^(n) (x_(i) - overline(x))^(2), n - 1)) = 
	  a^(2) s_(x)^(2) $
]

=== Sample standard deviation

The *sample standard deviation* is defined as the square root of the sample
variance:

$ s = sqrt(s^(2)) $

It is sometimes preferred to the sample variace because it has the same
unit of measurement as the data. Being the sum of squared quantities, the
unit of measurement of the variance is also squared.

=== Coefficient of variation

The *coefficient of variation* (*CV* for short) is given by the ratio between
the sample standard deviation and the sample mean:

$ "CV" = frac(s, overline(x)) $

It describes how the observations are "spread out" while taking into account
how they differ from the sample mean.
