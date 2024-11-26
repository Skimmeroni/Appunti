#import "../Stats4AI_definitions.typ": *

Consider a certain population, assuming to be distributed as a 
certain random variable, and a sample drawn from said population 
of size $n$. Let $x_(1), x_(2), dots, x_(n)$ be the values obtained 
from said sample; since it's not possible to know said values before 
the sampling, they can be conceived as $n$ random variables.

If $X_(1), X_(2), dots, X_(n)$ are said random variables and a 
sample is drawn $k$ times, the realizations of each $i$-th sample 
are $x_(1, i), x_(2, i), dots, x_(n, i)$. If for any of these samples 
a point estimate (mean, median, ecc...) is computed, unless the exact 
same values are drawn in more than one sample, each computation of 
said point estimate will yield a different result. Point estimates 
can therefore be conceived as random variables as well, since their 
value is unknown until a sample is drawn and the probability of 
retrieving a certain values for the estimate depends on how likely 
a sample with those traits is drawn.

Any value that can be calculated from a sample is called a *statistic*. 
Prior to the act of sampling the value of a statistic is unknown, and 
therefore conceivable as a random variable. For this reason, a statistic
is often denoted with an uppercase letter while its specific realization
(dependent on the sample drawn) with a lowercase letter. Being a random
variable, it can be endowed with a probability distribution; the probability
distribution of a statistic (interpreter as a random variable) is often
referred to as a *statistic distribution*. The name emphasizes the fact
that the value of the realization of the statistic depends on which sample
is drawn from the distribution it's computed on.

The probability distribution of a statistic depends both on the 
probability distribution of the population from which the sample 
is drawn (normal, exponential, binomial, ecc...) and on the size 
$n$ of the sample, but it also depends on _how_ the sample is 
performed. The sampling procedure that allows the statistics to 
be computed with the least effort is what is called a *random 
sample*: the $n$ random variables $X_(1), X_(2), dots, X_(n)$ are
said to form a random sample if they are *independent and identically 
distributed* (*i.i.d* for short), that is, if they are all independent 
and they have the same probability distribution.

One way to obtain information about a statistic's sampling distribution
involves performing calculations based on probability rules.

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

When the computation is too difficult, another approach is to try 
(often with the aid of a software) to approximate the distribution
of the statistic by performing a *simulation experiment*, that 
consists in sampling the population many times and analyzing the 
values obtained for said statistic across all samples. The bigger
the sample size (the number of samples), the greater the precision 
of the estimation: for any practical application, a sample size of 
$500$ or $1000$ is generally enough.

Let $X_(1), X_(2), dots, X_(n)$ be a random sample. The *sample mean*
of said sample is given by:

$ overline(X) = frac(1, n) sum_(i = 1)^(n) X_(i) $

Interestingly, the sample mean does not depend on the distribution of
$X_(1), X_(2), dots, X_(n)$.

#theorem[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample from a (known)
	distribution with mean value $mu$ and standard deviation $sigma$.
	Then:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(overline(X)) = mu $],
		[$ V(overline(X)) = frac(sigma^(2), n) $]
	)

	Also, let $T_(0) = X_(1) + X_(2) + dots + X_(n)$. Then:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(T_(0)) = n mu $],
		[$ V(T_(0)) = n sigma^(2) $]
	)
]
// #proof[
// To be added
// ]
