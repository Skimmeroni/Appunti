#import "../Stats4AI_definitions.typ": *

Statistics is a science concerned with deducing conclusions from 
experimental data. In most scenarios, it is either impossible or
impractical to take into account every single member of the population.
In situations like these, the best approach is to consider a subset
of the population, called a *sample*, and analyze it hoping to draw
conclusions that can be applied to the population as a whole.

To be able to extend the conclusions drawn from a sample to the
entire population it is necessary to make some prior assumptions
regarding the relationship between the two. A crucial (and often
reasonale) hypothesis is to assume that the population has a
probability distribution. Under this assumption, when a sample is
drawn from the population, each element of the sample can be conceived
as a random variable whose probability distribution is the sample
distribution as the population one.

Suppose that the population has a probability distribution $F$. A set
of random variables $X_(1), X_(2), dots, X_(n)$, each of them having 
a probability distribution $F$, constitutes a sample of $F$. The nature
of $F$ is known only to some extent: in some cases, the distribution of
$F$ is known while its parameters are not, in other cases the parameters
of $F$ are known but the distribution itself is unknown. There are even
situations where almost everything regarding $F$ is unknown.

Together with the hypothesis of each $X_(i)$ having the same distribution,
a second (much stronger) hypothesis is to assume that all of these random
variables are independent of one another. A set of variables all having
the same probability distribution and independent of one another are
said to be *independent and identically distributed*, or *i.i.d.* for
short. In turn, a sample constituted of i.i.d. variables is called a
*random sample*.

Any value that can be calculated from a sample (that is, any function
of the sample) is called a *statistic*. Prior to the act of sampling
the value of any statistic is unknown, and can therefore be conceived
as a random variable. For this reason, a statistic is often denoted
with an uppercase letter while its specific realization (dependent on
the sample drawn) with a lowercase letter. Being a random variable,
it can be endowed with a probability distribution; the probability
distribution of a statistic (interpreter as a random variable) is
often referred to as a *statistic distribution*. The probability
distribution of a statistic depends both on the probability
distribution of the population from which the sample is drawn (normal,
exponential, binomial, ecc...) and on the size $n$ of the sample, but
it also depends on _how_ the sample is performed.

Let $X_(1), X_(2), dots, X_(n)$ be a random sample drawn from a
certain population. Each of those variables, being distributed as
the population itself, will all have the same mean and variance.
Let $mu$ and $sigma^(2)$ be their respective values. It is possible
to define the *sample mean* of said sample as:

$ overline(X) = frac(1, n) sum_(i = 1)^(n) X_(i) =
  frac(X_(1) + X_(2) + dots + X_(n), n) $

#theorem[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample from a (known)
	distribution with mean value $mu$ and standard deviation $sigma$.
	Then:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(overline(X)) = mu $],
		[$ V(overline(X)) = frac(sigma^(2), n) $]
	)
] <Expected-value-and-variance-of-sample-mean>
#proof[
	Applying @Expected-value-linear-transformations and
	@Expected-value-linear-function gives:

	$ E(overline(X)) =
	  E(frac(1, n) sum_(i = 1)^(n) X_(i)) =
	  frac(E(sum_(i = 1)^(n) X_(i)), n) =
	  frac(sum_(i = 1)^(n) E(X_(i)), n) =
	  frac(sum_(i = 1)^(n) mu, n) =
	  frac(cancel(n) mu, cancel(n)) = mu $

	Applying @Variance-linear-transformations and
	@Variance-linear-function gives:

	$ V(overline(X)) = 
	  V(frac(1, n) sum_(i = 1)^(n) X_(i)) =
	  frac(V(sum_(i = 1)^(n) X_(i)), n^(2)) =
	  frac(sum_(i = 1)^(n) V(X_(i)), n^(2)) =
	  frac(sum_(i = 1)^(n) sigma^(2), n^(2)) =
	  frac(cancel(n) sigma^(2), n^(cancel(2))) =
	  frac(sigma^(2), n) $
]

Notice how @Expected-value-and-variance-of-sample-mean is completely
independent of the nature of the population distribution.

#exercise[
	A certain brand of MP3 player comes in three sizes: the revenue 
	in a given day is denoted by the random variable $X$. For each 
	size, the percentage of customers buying said size has been 
	computed:

	#table(
		columns: 3,
		[*Size*], [*Price*], [$percent$ *of customers*],
		[$2$GB], [$80 dollar$], [$20 percent$],
		[$4$GB], [$100 dollar$], [$30 percent$],
		[$8$GB], [$120 dollar$], [$50 percent$]
	)

	Suppose that $2$ MP3s were sold today. $X_(1)$ and $X_(2)$ be 
	the random variables denoting respectively the revenue of the 
	first sale and the revenue of the second sale. Assume that 
	$X_(1)$ and $X_(2)$ constitute a random sample, and are therefore 
	independent and identically distributed. What is the joint 
	probability distribution of $X$ and $Y$? What are all the 
	possible sample means and sample variances?
]
#solution[
	The expected value and variance of $X$ are given by:

	$ mu = sum x p(x) = 80 dot 0.2 + 100 dot 0.3 + 120 dot 0.5 = 106 $

	$ sigma^(2) = (80^(2) dot 0.2 - 106^(2)) + (100^(2) dot 0.3 - 106^(2)) + 
	  (120^(2) dot 0.5 - 106^(2)) = 244 $

	#table(
		columns: 5,
		[$X_(1)$], [$X_(2)$], [$p(X_(1), X_(2))$], [$overline(X)$], [$s^(2)$],
		[$80$], [$80$], [$0.2 dot 0.2 = 0.04$], [$frac(80 + 80, 2) = 80$],
		[$(80 - 80)^(2) + (80 - 80)^(2) = 0 + 0 = 0$],
		[$80$], [$100$], [$0.2 dot 0.3 = 0.06$], [$frac(80 + 100, 2) = 90$],
		[$(80 - 90)^(2) + (100 - 90)^(2) = 100 + 100 = 200$],
		[$80$], [$120$], [$0.2 dot 0.5 = 0.1$], [$frac(80 + 120, 2) = 100$],
		[$(80 - 100)^(2) + (120 - 100)^(2) = 400 + 400 = 800$],
		[$100$], [$80$], [$0.3 dot 0.2 = 0.06$], [$frac(100 + 80, 2) = 90$],
		[$(100 - 90)^(2) + (80 - 90)^(2) = 100 + 100 = 200$],
		[$100$], [$100$], [$0.3 dot 0.3 = 0.09$], [$frac(100 + 100, 2) = 100$],
		[$(100 - 100)^(2) + (100 - 100)^(2) = 0 + 0 = 0$],
		[$100$], [$120$], [$0.3 dot 0.5 = 0.15$], [$frac(100 + 120, 2) = 110$],
		[$(100 - 110)^(2) + (120 - 110)^(2) = 100 + 100 = 200$],
		[$120$], [$80$], [$0.5 dot 0.2 = 0.1$], [$frac(120 + 80, 2) = 100$],
		[$(120 - 100)^(2) + (80 - 100)^(2) = 400 + 400 = 800$],
		[$120$], [$100$], [$0.5 dot 0.3 = 0.15$], [$frac(120 + 100, 2) = 110$],
		[$(120 - 110)^(2) + (100 - 110)^(2) = 100 + 100 = 200$],
		[$120$], [$120$], [$0.5 dot 0.5 = 0.25$], [$frac(120 + 120, 2) = 120$],
		[$(120 - 120)^(2) + (120 - 120)^(2) = 0 + 0 = 0$]
	)

	Sample mean:

		$ P(overline(X) = 80) = P({X_(1) = 80} and {X_(2) = 80}) = 0.04 $

		$ P(overline(X) = 90) = P({X_(1) = 80} and {X_(2) = 100} or 
		  {X_(1) = 100} and {X_(2) = 80}) = 0.06 + 0.06 = 0.12 $

		$ P(overline(X) = 100) = P({X_(1) = 100} and {X_(2) = 100} or
		  {X_(1) = 80} and {X_(2) = 120} or {X_(1) = 120} and {X_(2) = 80}) = 
		  0.1 + 0.1 + 0.09 = 0.29 $

		$ P(overline(X) = 110) = P({X_(1) = 100} and {X_(2) = 120} or 
		  {X_(1) = 120} and {X_(2) = 100}) = 0.15 + 0.15 = 0.3 $

		$ P(overline(X) = 120) = P({X_(1) = 120} and {X_(2) = 120}) = 0.25 $

	Sample variance:

		$ P(s^(2) = 0) = P({X_(1) = 80} and {X_(2) = 80} or
		  {X_(1) = 100} and {X_(2) = 100} or {X_(1) = 120} and {X_(2) = 120}) = 
		  0.04 + 0.09 + 0.25 = 0.38 $

		$ P(s^(2) = 200) = P({X_(1) = 80} and {X_(2) = 100} or
		  {X_(1) = 100} and {X_(2) = 80} or {X_(1) = 100} and {X_(2) = 120}
		  or X_(1) = 100} and {X_(2) = 120}) = 0.06 + 0.06 + 0.15 + 0.15 = 
		  0.42 $

		$ P(s^(2) = 800) = P({X_(1) = 120} and {X_(2) = 80} or
		  {X_(1) = 80} and {X_(2) = 120}) = 0.1 + 0.1 = 0.2 $
]

Let $X_(1), X_(2), dots, X_(n)$ be a random sample drawn from a
certain population, all having expected value $mu$ and variance
$sigma^(2)$ It is possible to define the *sample variance* of
said sample as:

$ S^(2) = frac(1, n - 1) sum_(i = 1)^(n) (X_(i) - overline(X))^(2) $

The square root of $S^(2)$, denoted as $S$, is called the *sample
standard deviation*.

#theorem[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample from a (known)
	distribution with mean value $mu$ and variance $sigma^(2)$. Then:

	$ E(S^(2)) = sigma^(2) $
] <Expected-value-of-sample-variance>
// #proof[
// To be added
// ]
