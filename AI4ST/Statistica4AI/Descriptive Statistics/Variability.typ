#import "../../Stats4AI_definitions.typ": *

Indexes that provide information on how the sample is "dispersed",
that is, how its values are detached from their centre, are called
*variability indices*.

=== Sample variance

The *sample variance* $s^(2)$ is a summary measure that describes how
"spread out" are the values of the sample, or equivalently how close
its values are to the sample mean, and is defined as:

$ s^(2) = frac(sum_(i = 1)^(n) (x_(i) - overline(x))^(2), n - 1) =
  frac(n sum_(i = 1)^(n) x_(i)^(2) - (sum_(i = 1)^(n) x_(i))^(2), n(n - 1)) $

#exercise[
	Consider the sample ${0, 3, 7, 14}$, whose sample mean is $6$. Compute its
	sample variance.
]
#solution[
	$ s^(2) = frac(sum_(i = 1)^(4) (x_(i) - overline(x))^(2), 3) =
	  frac((0 - 6)^(2) + (3 - 6)^(2) + (7 - 6)^(2) + (14 - 6)^(2), 3) =
	  frac(110, 3) approx 36.7 $
]

When the observations are distant from the sample mean, the sample variance
of the sample is big, whereas it is small when the observations are closer
to the sample mean.

As for the sample mean, the sample variance can be computed from the
relative or absolute frequency:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ s^(2) = frac(1, n) sum_(j = 1)^(n) (v_(j) - overline(x))^(2) f_(j) $],
	[$ s^(2) = sum_(j = 1)^(n) (v_(j) - overline(x))^(2) p_(j) $]
)

// Shouldn't it be n - 1?

#theorem[
	Given a discrete numerical variable $x$, let $x_(1), x_(2), dots, x_(n)$,
	be the observations collected from the sample of such variable, and let
	$c$ be a numerical constant. Then:

	+ If, for each $1 lt.eq i lt.eq n$, the $y$ variable is constructed as
	  $y_(i) = x_(i) + c$, it is true that $s^(2)_(y) = s^(2)_(x)$;
	+ If, for each $1 lt.eq i lt.eq n$, the $y$ variable is constructed as
	  $y_(i) = c x_(i)$, it is true that $s^(2)_(y) = c^(2) s^(2)_(x)$;

	Where $s^(2)_(x)$ is the sample variance of the "original" variable $x$
	and $s^(2)_(y)$ is the sample variance of the "transformed" variable $y$.
]
// #proof[
// To be added
// ]

=== Sample standard deviation

The *sample standard deviation* is defined as the square root of the sample
variance:

$ s = sqrt(s^(2)) $

It is sometimes preferred to the sample variace when there's interest in
having an index having the same unit of measurement of the sample, since
the sample variance is a squared quantity, and therefore it's unit of
measurement is also squared.

=== Interquartile range

The *interquartile range* (*IQR* for short) is given by the average between
the third quantile and the first quantile:

$ "IQR" = Q_(3) - Q_(1) $

Represents the interval where most of the observations lie.

=== Coefficient of variation

The *coefficient of variation* (*CV* for short) is given by the ratio between
the sample standard deviation and the sample mean:

$ "CV" = frac(s, overline(x)) $

It describes how the observations are "spread out" while taking into account
how they differ from the sample mean.
