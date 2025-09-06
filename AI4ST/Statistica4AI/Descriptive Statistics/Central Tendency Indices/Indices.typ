#import "../../Stats4AI_definitions.typ": *

Indexes that provide information regarding the "center" of the sample are
called *central tendency indices*.

=== Sample mean

Given a discrete numerical variable $x$, let $x_(1), x_(2), dots, x_(n)$
be the observations collected from the sample of such variable, with $n$
being the cardinality of the sample. The *sample mean* $overline(x)$ of
the variable $x$ is a summary measure that describes its average value,
and is computed as:

$ overline(x) = frac(x_(1) + x_(2) + dots + x_(n), n) =
  frac(sum_(i = 1)^(n) x_(i), n) $

#exercise[
	Consider the sample ${1, 0, 7, 4, 4}$. What is its sample mean?
]
#solution[
	$ overline(x) = frac(1 + 0 + 7 + 4 + 4, 5) = frac(16, 5) = 3.2 $
]

If the relative or absolute frequency of the sample is known, it can be
used to compute its sample mean:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ overline(x) = frac(1, n) sum^(N)_(j = 1) v_(j) f_(j) =
	   frac(v_(1) f_(1) + v_(2) f_(2) + dots + v_(N) f_(N), n) $],
	[$ overline(x) = sum^(N)_(j = 1) v_(j) p_(j) =
	   v_(1) p_(1) + v_(2) p_(2) + dots + v_(N) p_(N) $]
)

#exercise[
	Let $v_(1) = 4, v_(2) = 5, v_(3) = 8$ and $f_(1) = 2, f_(2) = 3,
	f_(3) = 1$. What is the sample mean?
]
#solution[
	$ overline(x) = frac(4 dot 2 + 5 dot 3 + 8 dot 1, 2 + 3 + 1) =
	  frac(31, 6) = 5.16 $
]

The difference between an observation $x_(i)$ and the sample mean
$overline(x)$ is called *residue*.

#lemma[
	The sum of all residues is always zero:

	$ sum_(i = 1)^(n) overline(x) - x_(i) = (overline(x) - x_(1)) +
	  (overline(x) - x_(2)) + dots + (overline(x) - x_(n)) = 0 $
]
// #solution[
// To be added
// ]

#lemma[
	Consider the sum of the squares of all residues:

	$ sum_(i = 1)^(n) (overline(x) - x_(i))^(2) $

	Its minimum is the sample mean.
]
// #solution[
// To be added
// ]

If a variable is continuous and not discrete, it is still possible to
compute its sample mean using the formula. An alternative approach is
to use the formula but substituting $x_(i)$ with the average value from
each $i$-th class. This is faster than computing the sample mean using
every single value, but it is less precise.

#theorem[
	Let $overline(x)$ be the sample mean of some sample, and let
	$T = a x + b$ with $a, b in RR$ a linear transformation. Suppose
	that $T$ is applied to each element of the sample: the sample
	mean of the transformed sample is $a overline(x) + b$.
]
// #proof[
// To be added
// ]

=== Sample median

Given a discrete numerical variable $x$, let $x_(1), x_(2), dots, x_(n)$,
be the observations collected from the sample of such variable, arranged
from lowest to highest (including duplicates). The *sample median* $tilde(x)$
is a summary measure that describes the central value, and is calculated as
either the middle value of such sequence if $n$ is odd or the average of the
two middle values if $n$ is even:

$ tilde(x) = cases(
	"The" (frac(n + 1, 2))^("th") "value if" n "is odd",
	"The average of the" (frac(n, 2))^("th") "and the"
	(frac(n, 2) + 1)^("th") "value if" n "is even") $

#exercise[
	Consider the sample ${1, 0, 7, 4, 4}$. What is its sample median?
]
#solution[
	Rearranging the sample in increasing order gives ${0, 1, 4, 4, 7}$.
	The sample size is $5$, which is odd, therefore:

	$ tilde(x) = x_(frac(n + 1, 2)) = x_(3) = 4 $
]

Sample mean and sample median are not the same, and in general do
not coincide. In an ordered sample, the extreme values do not influence
the sample median, because it depends exclusively on the center of the
sample, whereas the sample mean is influenced by the sample as a whole.

=== Sample mode

Given a discrete numerical variable $x$, let $x_(1), x_(2), dots, x_(n)$,
be the observations collected from the sample of such variable. The *sample
mode* is the value that appears the most, that is the value having the
highest frequency. Note that a sample can have a single mode (*monomodal*)
or many modes (*multimodal*).

If a variable is continuous, it is still possible to compute the sample mode
of a sample as the class whose frequency is the highest.

=== Sample percentiles

Given a discrete numerical variable $x$, let $x_(1), x_(2), dots, x_(n)$ be
the observations collected from the sample of such variable, with $n$ being
the cardinality of the sample. Fixed a real value $p in [0, 1]$, the *100-p
sample percentile* is the value $q$ such that at least the $100p percent$ of
the sample has a value greater or equal than $q$ and the $100(1 - p) percent$
of the sample has a value less than $q$. Even though $p$ can be any number,
the most useful values of $p$ are:

+ $p = 0.25$, the $25$-th percentile, also called *first quartile*:
  $1 slash 4$ of the sample are on the left and $3 slash 4$ of the
  sample are on the right. Denoted as $Q_(1)$;
+ $p = 0.50$, the $50$-th percentile, also called *second quartile*:
  $1 slash 2$ of the sample are on the left and $1 slash 2$ of the
  sample are on the right (this is equivalent to the sample median).
  Denoted as $Q_(2)$;
+ $p = 0.75$, the $75$-th percentile, also called *third quartile*:
  $3 slash 4$ of the sample are on the left and $1 slash 4$ of the
  sample are on the right. Denoted as $Q_(3)$.

Let $n p$ be the product between the sample size and the chosen real value
$p$. The $100p$-th percentile $q$ is the value that, arranging the sample
in increasing order, is greater or equal than at least $n p$ values and
less than or equal than $n (1 - p)$ values.

The value of $q$ depends on the value of $n p$: if $n p$ is not an integer,
then $q$ is the value holding the position $\u{230A} n p \u{230B} + 1$ in
the arranged sample. If $n p$ is an integer, the value $q$ is given by the
mean between the $n p$-th element and the $n (p + 1)$-th element of the
arranged sample:

$ q = cases(x_(\u{230A} n p \u{230B} + 1) & "if" n p in.not ZZ,
            frac(1, 2) (x_(n p) + x_(n p + 1)) & "if" n p in ZZ) $

#exercise[
	Compute the three quartiles of the following sample:

	#align(
		center,
		table(
			columns: 10,
			stroke: none,
			..csv("boxplot_data.csv").flatten()
		)
	)

] <Percentiles>
#solution[
	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ Q_(1) = x_(3) = -3 $],
		[$ Q_(2) = frac(x_(5) + x_(6), 2) = 0.5 $],
		[$ Q_(3) = x_(8) = 10 $]
	)
]

An interesting graphical representation of a sample and its three main
percentiles is the *box plot*. The plot is composed by a straight line
that goes from the lowest to the highest value in the sample, above of
which lies a rectangle whose sides are drawn where the first and third
quartiles are and a vertical line inside of said rectangle where the
second quartile are.

#exercise[
	Draw a boxplot of the dataset in @Percentiles.
]
#solution[
	#figure(
		caption: [A boxplot of the dataset in @Percentiles, showing
		          the three quartiles.],
		[#image("boxplot.svg", width: 75%)]
	)
]
