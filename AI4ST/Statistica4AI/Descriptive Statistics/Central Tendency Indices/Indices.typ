#import "../../Stats4AI_definitions.typ": *

Visual summaries of data can give useful insights on its overall structure,
but for a statistical enquiry this is not enough. A more formal analysis of
data often requires the calculation and interpretation of numerical *summary
measures*. A summary measure is a single value computed from the data that
captures, on its own, one or more aspects of the data.

Summary measures that provide information regarding the "center" of the
sample are called *central tendency indices*.

=== Sample mean

Given a discrete numerical variable $X$, let $x_(1), x_(2), dots, x_(n)$
be the observations of $X$ collected from a sample of size $n$. The *sample
mean* $overline(x)$ of the variable $X$ is a summary measure that describes
its average value:

$ overline(x) = frac(x_(1) + x_(2) + dots + x_(n), n) =
  frac(sum_(i = 1)^(n) x_(i), n) $

The sample mean may or may not be itself an element of the sample.

#exercise[
	What is the sample mean of the variable $X = "Number of rooms"$ in
	@Rooms-example?
]
#solution[
	$ overline(x) =
	frac(3 + 4 + 2 + 6 + 5 + 2 + 4 + dots + 3 + 5 + 4, 80) approx 4.312 $
]

The sample mean is a simple and effective summary measure, but has its
fair share of problems. For example, it is very sensitive to *outliers*,
observations that significantly deviate from the other observations. A
single observation that is very different from the others can skew the
sample mean considerably.

#lemma[
	If $overline(x)$ is the sample mean of a given sample, a linear
	transformation $f(x) = a x + b$ with $a, b in RR$ applied to all
	elements of the sample gives a new sample whose sample mean is
	$a overline(x) + b$. That is, if an entire sample is linearly
	transformed, the sample mean is transformed in accord.
] <Sample-mean-linear>
#proof[
	Let $y_(i) = a x_(i) + b$ be the $i$-th element of the transformed
	sample. This gives:

	$ overline(y) =
	  frac(sum_(i = 1)^(n) y_(i), n) =
	  frac(sum_(i = 1)^(n) a x_(i) + b, n) =
	  frac(a sum_(i = 1)^(n) x_(i), n) + frac(sum_(i = 1)^(n) b, n) =
	  a overline(x) + frac(b cancel(n), cancel(n)) =
	  a overline(x) + b $
]

The sample mean for a continuous variable can be computed using the exact
same formula as above. An alternative definition is the "averages of
the averages": computing the sample mean for each class and then averaging
the result among classes. This is faster, but less accurate.

If the variable is categorical, it makes no sense to define a mean.
Even if there's an order for the support of the variable, an average
value would still be meaningless (what is the average between "good"
and "very good"?).

=== Sample median

Given a numerical variable $X$ (discrete or continuous), let $x_(1),
x_(2), dots, x_(n)$ be the observations of $X$ collected from a sample
of size $n$, arranged from lowest to highest (including duplicates).
The *sample median* $tilde(x)$ is a summary measure that describes the
value that lies in the middle of the ordered sequence of observations.

$ tilde(x) = cases(
	"The" (frac(n + 1, 2))^("th") "value if" n "is odd",
	"The average of the" (frac(n, 2))^("th") "and the"
	(frac(n, 2) + 1)^("th") "value if" n "is even") $

#exercise[
	R built-in dataset `penguins` contains bodily measurements of
	different species of penguins. The length of the flippers (in
	centimetres) of the first $10$ Gentoo penguins are presented
	below:

	#figure(
		table(
			columns: 10,
			stroke: none,
			fill: none,
			..csv("penguins.csv").flatten()
		)
	)

	Compute the sample median.
] <Penguins-example>
#solution[
	By sorting the sample, the sample median is given by
	$(21.1 + 21.5) slash 2 = 21.3$.
]

Sample mean and sample median might appear similar, but are actually
quite different, and often do not coincide. For example, outliers do
not affect the sample median, because what matters for the sample median
are the values that lie at the center of the sample. Moreover, it is
possible to define a sample median for ordinal attributes.

=== Sample percentiles

Given a numerical variable $X$ (discrete or continuous), let $x_(1),
x_(2), dots, x_(n)$ be the observations of $X$ collected from a sample
of size $n$, arranged from lowest to highest (including duplicates).
Having fixed a real value $p in [0, 1]$, the *100-p sample percentile*
is the value $q$ such that at least the $100p percent$ of the sample
has a value greater or equal than $q$ and the $100(1 - p) percent$
of the sample has a value less than $q$.

$ q = cases(x_(floor.l n p floor.r + 1) & "if" n p in.not ZZ,
            frac(1, 2) (x_(n p) + x_(n p + 1)) & "if" n p in ZZ) $

Sample percentiles are just a generalization of the sample mean.
Indeed, the $50$-th percentile ($p = 0.5$) is precisely the sample
mean, that splits the data into two equally-sized subsets. Percentiles
split the data in the same way, but unevenly. Common choices of $p$
are:

+ $p = 0.25$, the $25$-th percentile, also called *first quartile*:
  $1 slash 4$ of the sample are on the left and $3 slash 4$ of the
  sample are on the right. Denoted as $Q_(1)$;
+ $p = 0.50$, the $50$-th percentile or sample mean, also called
  *second quartile*. Denoted as $Q_(2)$;
+ $p = 0.75$, the $75$-th percentile, also called *third quartile*:
  $3 slash 4$ of the sample are on the left and $1 slash 4$ of the
  sample are on the right. Denoted as $Q_(3)$.

#exercise[
	Compute the three quartiles of @Penguins-example
]
#solution[
	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ Q_(1) = x_(3) = 21.025 $],
		[$ Q_(2) = (x_(5) + x_(6)) slash 2 =  21.300 $],
		[$ Q_(3) = x_(8) = 21.725 $]
	)
]

An interesting graphical representation of a sample and its three main
percentiles is the *box plot*. The plot is composed by a straight line
that goes from the lowest to the highest value in the sample, above of
which lies a rectangle whose sides are drawn where the first and third
quartiles are and a vertical line inside of said rectangle where the
second quartile are.

#exercise[
	Draw a boxplot of the dataset in @Penguins-example.
]
#solution[
	#figure(
		caption: [A boxplot of the dataset in @Penguins-example, showing
		          the three quartiles.],
		[#image("boxplot.svg", width: 75%)]
	)
]

=== Sample mode

Given a sample for any non-continuous variable, the *sample mode* is
the observation having the highest frequency. A sample can have a single
mode (*monomodal*), two modes (*bimodal*) or many modes (*multimodal*).
The sample mode of a continuous variable is computed with respect to the
frequency of the classes. The sample mode is easily read from a bar plot
as the highest rectangle.
