#import "../Stats4AI_definitions.typ": *

As hinted at the beginning, statistical enquiries cannot take into
account an entire population (it's either unfeasible or impossible),
having to resort to a subset of a population, a sample. There is an
obvious issue, however: if the samples are extracted randomly, it is
almost guaranteed that different samples will be constituted by different
observations. This means that the parameters computed from a sample, like
the mean or the standard deviation, cannot possibly be identical to the
parameters of the population.

Because of this uncertainty, before the data becomes available it is
necessary to regard each observation as a random variable and denote
the sample by $X_(1), X_(2), dots, X_(n)$ (notice the use of the uppercase
letters). This variation in observed values in turn implies that the value
of any function of the sample observations (the sample mean, the sample
variance, ecc...) also varies from sample to sample. Therefore, the
sample observations are themselves random variables. Any value that
can be calculated from a sample (that is, any function of the sample)
is called a *statistic*.

Since, as stated, statistics are themselves random variables, they are
often denoted with an uppercase letter while its specific realization
(dependent on the sample drawn) with a lowercase letter. Being random
variables it also means that they can be endowed with a probability
distribution; the probability distribution of a statistic is referred
to as a *statistic distribution*. The probability distribution of a
statistic depends both on the probability distribution of the population
from which the sample is drawn (normal, exponential, binomial, ecc...)
and on the size $n$ of the sample, but it also depends on _how_ the
sample is performed. 

A sampling method often encountered in practice is what's called
*random sampling*. The random variables $X_(1), X_(2), dots, X_(n)$
are said to form a random sample of size $n$ if the two following
two conditions are met:

- Each random variable $X_(i)$ with $i in {1, dots, n}$ are distributed
  in the same way. This distribution is the distribution of the population
  itself. This implies that each $X_(i)$ has the same distribution and
  variance;
- Each random variable $X_(i)$ with $i in {1, dots, n}$ is independent
  of any other.

Random variables with these characteristics are said to be *independent
and identically distributed*, or *i.i.d.* for short. The conditions of
a random sample are met by sampling without replacement where the sample
size $n$ is much smaller than the population size $N$. In practice, if
$n slash N lt.eq 0.05$ (at most $5%$ of the population is sampled), the
$X_(i)$ in the sample is approximately a random sample. The advantage of
using random samples is that retrieving the probability distribution
of any statistic becomes much more attainable.

Let $X_(1), X_(2), dots, X_(n)$ be a random sample drawn from a
certain population. Each of those variables, being distributed as
the population itself, will all have the same mean and variance.
It is possible to define the sample mean and the sample variance
of said sample as:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ overline(X) = frac(1, n) sum_(i = 1)^(n) X_(i) $],
	[$ S^(2) = frac(1, n - 1) sum_(i = 1)^(n) (X_(i) - overline(X))^(2) $]
)

Notice the use of uppercase letters instead of lowercase letters:
the sample mean/variance is now understood as a function of $n$
random variables (which are functions themselves), not as a summation
of constants. Moreover, the sample mean/variance of the sample and the
sample mean of the population are two, albeit related, quantities.

Let $mu$ and $sigma^(2)$ be the population mean and population
variance respectively. $mu$ and $sigma^(2)$ are (most likely)
unknown, but $overline(X)$ and $S^(2)$ are retrievable from a
sample. The interest is in finding the relationship between
$mu$ and $overline(X)$ and the relationship between $S^(2)$
and $sigma^(2)$.

#theorem[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample from a (known)
	distribution having mean $mu$ and variance $sigma^(2)$. Then:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(overline(X)) = mu $],
		[$ V(overline(X)) = frac(sigma^(2), n) $]
	)
] <Expected-value-and-variance-of-sample-mean>
#proof[
	Applying @Expected-value-linear-transformations and
	@Expected-value-linear-function:

	$ E(overline(X)) =
	  E(frac(1, n) sum_(i = 1)^(n) X_(i)) =
	  frac(E(sum_(i = 1)^(n) X_(i)), n) =
	  frac(sum_(i = 1)^(n) E(X_(i)), n) =
	  frac(sum_(i = 1)^(n) mu, n) =
	  frac(cancel(n) mu, cancel(n)) = mu $

	Applying @Variance-linear-transformations and
	@Variance-linear-function:

	$ V(overline(X)) = 
	  V(frac(1, n) sum_(i = 1)^(n) X_(i)) =
	  frac(V(sum_(i = 1)^(n) X_(i)), n^(2)) =
	  frac(sum_(i = 1)^(n) V(X_(i)), n^(2)) =
	  frac(sum_(i = 1)^(n) sigma^(2), n^(2)) =
	  frac(cancel(n) sigma^(2), n^(cancel(2))) =
	  frac(sigma^(2), n) $
]

#theorem[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample from a (known)
	distribution having mean $mu$ and variance $sigma^(2)$. Then:

	$ E(S^(2)) = sigma^(2) $
] <Expected-value-of-sample-variance>
// #proof[
// To be added
// ]

Notice how @Expected-value-and-variance-of-sample-mean and
@Expected-value-of-sample-variance are completely independent
of the nature of the population distribution, they only require
the sample to be retrieved using random sampling. The two allow,
if the distribution of $overline(X)$ and $S^(2)$ are known, to
retrieve $mu$ and $sigma^(2)$.

#exercise[
	A certain brand of MP3 player comes in three sizes: the revenue 
	in a given day is denoted by the random variable $X$. For each 
	size, the percentage of customers buying said size has been 
	computed:

	- Size: 2 GB, price: $80 dollar$, percentage: $0.2$;
	- Size: 4 GB, price: $100 dollar$, percentage: $0.3$;
	- Size: 8 GB, price: $120 dollar$, percentage: $0.5$.

	Suppose that two MP3s were sold today. $X_(1)$ and $X_(2)$ be 
	the random variables denoting respectively the revenue of the 
	first sale and the revenue of the second sale. Assume that 
	$X_(1)$ and $X_(2)$ constitute a random sample, and are therefore 
	independent and identically distributed. What are all the 
	possible sample means and sample variances?
] <MP3>
#solution[
	The expected value and variance of the population are given by:

	$ mu &= 80 dot 0.2 + 100 dot 0.3 + 120 dot 0.5 = 106 \
	  sigma^(2) &= (80^(2) dot 0.2 - 106^(2)) + (100^(2) dot 0.3 - 106^(2)) + 
	  (120^(2) dot 0.5 - 106^(2)) = 244 $

	From all the possible combination of values that the variables
	$X_(1)$ and $X_(2)$ can take, it's possible to compute all the
	possible sample means and sample variances:

	#figure(
		table(
			columns: 4,
			table.header(
				[$X_(1)$], [$X_(2)$], [$overline(X)$], [$s^(2)$],
			),
			[$80$], [$80$], [$0.5 (80 + 80) = 80$],
			[$(80 - 80)^(2) + (80 - 80)^(2) = 0$],
			[$80$], [$100$], [$0.5 (80 + 100) = 90$],
			[$(80 - 90)^(2) + (100 - 90)^(2) = 200$],
			[$80$], [$120$], [$0.5 (80 + 120) = 100$],
			[$(80 - 100)^(2) + (120 - 100)^(2) = 800$],
			[$100$], [$80$], [$0.5 (100 + 80) = 90$],
			[$(100 - 90)^(2) + (80 - 90)^(2) = 200$],
			[$100$], [$100$], [$0.5 (100 + 100) = 100$],
			[$(100 - 100)^(2) + (100 - 100)^(2) = 0$],
			[$100$], [$120$], [$0.5 (100 + 120) = 110$],
			[$(100 - 110)^(2) + (120 - 110)^(2) = 200$],
			[$120$], [$80$], [$0.5 (120 + 80) = 100$],
			[$(120 - 100)^(2) + (80 - 100)^(2) = 800$],
			[$120$], [$100$], [$0.5 (120 + 100) = 110$],
			[$(120 - 110)^(2) + (100 - 110)^(2) = 200$],
			[$120$], [$120$], [$0.5 (120 + 120) = 120$],
			[$(120 - 120)^(2) + (120 - 120)^(2) = 0$]
		)
	)

	This means that the possible values of the sample mean are ${80, 90,
	100, 110, 120}$ and the possible values of the sample variance are
	${0, 200, 800}$. Since $X_(1)$ and $X_(2)$ are independent, computing
	their joint probability is simply the product of their marginal
	probabilities. For the sample mean:

	#figure(
		table(
			columns: 2,
			table.header(
				[$overline(X)$], [$P(overline(X))$],
			),
			[$80$], [$ P({X_(1) = 80} and {X_(2) = 80}) =
			           0.2 dot 0.2 = 0.04 $],
			[$90$], [$ P&(({X_(1) = 80} and {X_(2) = 100}) or \
			            & ({X_(1) = 100} and {X_(2) = 80})) =
			           (0.2 dot 0.3) + (0.3 dot 0.2) = 0.12 $],
			[$100$], [$ P&(({X_(1) = 100} and {X_(2) = 100}) or \
			             & ({X_(1) = 80} and {X_(2) = 120}) or \
			             & ({X_(1) = 120} and {X_(2) = 80})) =
			            (0.3 dot 0.3) + (0.2 dot 0.5) + (0.5 dot 0.2) = 0.29 $],
			[$110$], [$ P&(({X_(1) = 100} and {X_(2) = 120}) or \
			             & ({X_(1) = 120} and {X_(2) = 100})) =
			            (0.3 dot 0.5) + (0.5 dot 0.3) = 0.3 $],
			[$120$], [$ P({X_(1) = 120} and {X_(2) = 120}) = 0.5 dot 0.5 = 0.25 $]
		)
	)

	The expected value of the sample mean is precisely the population
	mean, as @Expected-value-and-variance-of-sample-mean:

	$ E(overline(X)) =
	  80 dot 0.04 + 90 dot 0.12 + 100 dot 0.29 + 110 dot 0.3 + 120 dot 0.25 = 106 = mu $

	#figure(
		caption: [Stem plot of the sample mean. In blue, the possible
		          values that the sample mean can take. In fuchsia, the
		          population mean.],
		image("mp3_mean.svg", width: 75%)
	)

	For the sample variance:

	#figure(
		table(
			columns: 2,
			table.header(
				[$S^(2)$], [$P(S^(2))$],
			),
			[$0$], [$ P&(({X_(1) = 80} and {X_(2) = 80}) or \
			           & ({X_(1) = 100} and {X_(2) = 100}) or \
			           & ({X_(1) = 120} and {X_(2) = 120})) =
			            (0.2 dot 0.2) + (0.3 dot 0.3) + (0.5 dot 0.5) = 0.38 $],
			[$200$], [$ P&(({X_(1) = 80} and {X_(2) = 100}) or \
			             & ({X_(1) = 100} and {X_(2) = 80}) or \
			             & ({X_(1) = 100} and {X_(2) = 120}) or \
			             & ({X_(1) = 120} and {X_(2) = 100})) =
			            (0.2 dot 0.3) + (0.3 dot 0.2) + (0.3 dot 0.5) + (0.5 dot 0.3) = 0.42 $],
			[$800$], [$ P&(({X_(1) = 80} and {X_(2) = 120}) or \
			             & ({X_(1) = 120} and {X_(2) = 80})) =
			             (0.2 dot 0.5) + (0.5 dot 0.2) = 0.2 $],
		)
	)

	Once again, the expected value of the sample variance is precisely the
	population variance, as @Expected-value-of-sample-variance:

	$ E(S) = 0 dot 0.38 + 200 dot 0.42 + 800 dot 0.2 = 244 = sigma^(2) $

	#figure(
		caption: [Stem plot of the sample variance. In blue, the possible
		          values that the sample variance can take. In fuchsia, the
		          population variance.],
		image("mp3_variance.svg", width: 75%)
	)
]

As hinted at in @MP3, computing the statistic distribution of any
statistic of a population from each possible sample is very tedious.
However, if the population is normally distributed, computing the
distribution of statistics is much easier.

#lemma[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample from a normal
	distribution with mean value $mu$ and variance $sigma^(2)$. Both
	$overline(X)$ and $S^(2)$ are themselves normally distributed.
]
// #proof[
// Requires the notion of moment-generating function
// ]

Even when the population is not normally-distributed, there are still
conditions under which a random variable that isn't normally distributed
can behave as a random variable.

#theorem("Central Limit Theorem")[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample from
	a (known) distribution with mean value $mu$ and variance
	$sigma^(2)$. If $n$ is sufficiently large, the sample mean
	$overline(X)$ is approximately distributed #footnote[The
	correct term would be *distribution convergent*.] as a
	normal random variable having mean $mu$ and variance
	$sigma^(2) slash n$. Moreover, the random variable $X_(1) +
	X_(2) + dots + X_(n)$ is approximately distributed as a normal
	random variable having mean $n mu$ and variance $n sigma^(2)$.
] <Central-Limit-Theorem>
// #proof[
// Requires the notion of a characteristic function and the
// notion of distribution convergence
// ]

@Central-Limit-Theorem does not specify the nature of the distribution
of the random variables in the sequence. This means that, as long as
it is possible to construct a sufficiently large random sample, their
sample mean can always be treated as a standard normal random variable,
even if the probability distribution of the single random variables is
unknown.

Even though @Central-Limit-Theorem does not specify a minimum sample
size for which a satisfactory approximation is given, empirical data
suggests $n = 30$ for most real-world applications. The accuracy of
the approximation also depends on the distribution of the population;
as expected, @Central-Limit-Theorem requires a much smaller sample
size to give good approximations for normal populations. On the other
hand, there are distributions for which $n = 30$ is nowhere near
sufficient, but this is the exception rather than the rule.
