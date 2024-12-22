#import "../Stats4AI_definitions.typ": *

Some specific discrete random variables have been studied extensively, mostly
because they model very well many phenomena in the real world. For this reason,
such random variables have proper names. To denote that a random variable $X$
has the same distribution as a known random variable $F$, the notation $X
tilde F$ is used.

=== Bernoulli random variable

A discrete random variable $X$ is distributed as a *Bernoulli random variable*
of parameter $p in [0, 1]$ (denoted as $X tilde B(p)$) if it can assume
exclusively the values $1$ and $0$, with probabilities $p$ and $1 - p$
respectively. The pdf and cdf of a Bernoulli random variable $X$ of parameter
$p$ are therefore as follows:

#grid(
	columns: (0.5fr, 0.5fr),
	[#figure(image("Bernoulli_PMF.svg"))
	 $ p(x) = P(X = x) =
	   cases(p & "if" x = 1, 1 - p & "if" x = 0,
	         0 & "otherwise") $],
	[#figure(image("Bernoulli_CDF.svg"))
	 $ F(x) = P(X lt.eq x) =
	   cases(0 & "if" x < 0,
	         1 - p & "if" 0 lt.eq x < 1,
	         1 & "if" x gt.eq 1) $]
)

Bernoulli random variables model experiments that have two mutually exclusive
results: success ($X = 1$) or failure ($X = 0$), with nothing in between.

#theorem[
	The expected value and variance of a random variable $X tilde B(p)$ are
	as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = p $],
		[$ V(X) = p(1 - p) $]
	)
] <Expected-value-variance-Bernoulli>
#proof[
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = 0 dot (1 - p) + 1 dot p = 0 + p = p $],
		[$ V(X) = (0 - p)^(2) dot (1 - p) + (1 - p)^(2) dot p = \
		   p^(2)(1 - p) + p(1 - p)^(2) = (p^(2) + p(1 - p))(1 - p) = \
		   (cancel(p^(2)) + p - cancel(p^(2)))(1 - p) = p(1 - p) $]
	)
]

=== Binomial random variable

Let $Y_(1), Y_(2), dots, Y_(n)$ be $n$ independent and identically distributed
Bernoulli random variables (all having the same parameter $p$). Let $X$ be the
random variable defined as the sum of all said variables:

$ X = sum_(i = 1)^(n) Y_(i) = Y_(1) + Y_(2) + dots + Y_(n) $

The random variable $X$ defined as such is distributed as a *binomial random
variable* of parameters $p$ and $n$ (denoted as $X tilde B i(n, p)$).

Since a specific realization of $X$ is a sum of $0$s and $1$s, a realization
$k$ is simply the number of Bernoulli variables that define $X$ that had
assumed value $1$. The pdf and cdf of a binomial random variable $X$ of
parameters $n$ and $p$ are therefore as follows:

#grid(
	columns: (0.5fr, 0.5fr),
	[#figure(image("Binomial_PMF.svg"))
	 $ p(x) = P(X = x) =
	   cases(display(binom(n, x) p^(x)(1 - p)^(n - x)) & "if"
	   cases(display(x in NN), display(x lt.eq n)),
	   0 & "otherwise") $],
	[#figure(image("Binomial_CDF.svg"))
	 $ F(x) = P(X lt.eq x) =
	   sum_(k = 0)^(\u{230a} x \u{230b}) binom(n, k) p^(k) (1 - p)^(n - k) $]
)

#theorem[
	The expected value and variance of a random variable $X tilde B i(p, n)$
	are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = n p $],
		[$ V(X) = n p(1 - p) $]
	)
] <Expected-value-variance-Binomial>
#proof[
	This result can be proved by applying @Expected-value-linear-function and
	@Variance-linear-function (the latter can be applied since the Bernoulli
	random variables that constitue $X$ are independent).

	$ E(X) = E(Y_(1) + Y_(2) + dots + Y_(n)) =
	  E(Y_(1)) + E(Y_(2)) + dots + E(Y_(n)) = n E(Y_(i)) = n p $

	$ V(X) = V(Y_(1) + Y_(2) + dots + Y_(n)) =
	  V(Y_(1)) + V(Y_(2)) + dots + V(Y_(n)) = n V(Y_(i)) = n p(1 - p) $

	Where $E(Y_(i))$ and $V(Y_(i))$ are retrieved from
	@Expected-value-variance-Bernoulli.
]

Binomial random variables model experiments composed by many mutually
exclusive results.

=== Poisson random variable

Let $Y$ a binomial random variable, and let $lambda in RR^(+)$ be the
product of its parameters $n$ and $p$. By applying the double limit
$n -> infinity, p -> 0$ while keeping their product constant a new
random variable $X$ is constructed, called a *Poisson random variable*
(denoted as $X tilde "Pois"(lambda)$). The pdf and cdf of a Poisson
random variable $X$ of parameter $lambda$ are therefore as follows:

#grid(
	columns: (0.5fr, 0.5fr),
	[#figure(image("Poisson_PMF.svg"))
	 $ p(x) = P(X = x) =
	   cases(display(frac(lambda^(x), x!) e^(-lambda)) & "if" x in NN,
	   0 & "otherwise") $],
	[#figure(image("Poisson_CDF.svg"))
	 $ F(x) = P(X lt.eq x) = sum_(k in NN, k lt.eq x)
	   frac(lambda^(k), k!) e^(-lambda) $]
)

#theorem[
	The expected value and variance of a random variable $X tilde
	"Pois"(lambda)$ are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = lambda $],
		[$ V(X) = lambda $]
	)
] <Expected-value-variance-Poisson>
#proof[
	Let $Y tilde B i(n , p)$ be a random variable to which the double limit
	$n -> infinity, p -> 0$ is applied, and let $lambda = n p$. This results
	in:

	#grid(
		columns: (0.4fr, 0.6fr),
		[$ E(X) = lim_(n -> infinity \ p -> 0) E(Y) =
		   lim_(n -> infinity \ p -> 0) n p = lambda $],
		[$ V(X) = lim_(n -> infinity \ p -> 0) V(Y) =
		   lim_(n -> infinity \ p -> 0) n p(1 - p) =
		   lambda(1 - 0) = lambda $]
	)
]

#exercise[
	Let $X$ be the number of traps occurring in a particular type of
	transistor. Suppose $X tilde "Pois"(2)$; what is the probability of
	retrieving $3$ traps? What is the probability of retrieving $3$ or
	less traps?
]
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ p(3) = P(X = 3) = frac(2^(3), 3!) e^(-2) =
		   frac(8, 6) e^(-2) approx 0.18 $],
		[$ F(3) = P(X lt.eq 3) = sum_(k in NN, k lt.eq 3)
		   frac(2^(k), k!) e^(-2) = \ frac(2^(0), 0!) e^(-2) +
		   frac(2^(1), 1!) e^(-2) + frac(2^(2), 2!) e^(-2) +
		   frac(2^(3), 3!) e^(-2) = \ e^(-2) (frac(1, 1) +
		   frac(2, 1) + frac(4, 2) + frac(8, 6)) =
		   e^(-2) frac(19, 3) approx 0.86 $]
	)
]

The Poisson distribution model events where the size of the population is very
large and the probability of the event to occur is very small. This is why the
Poisson distribution is used to model _rare events_, events that have a very
slim, but still relevant, probability to occur in a certain span of time. More
formally, a rare event can be modeled as such if the following properties hold:

+ There exist a parameter $alpha > 0$ such that for any short time interval of
  length $Delta t$, the probability that exactly one event occurs is $alpha
  Delta t dot o(Delta t)$, where $o(Delta t)$ is a little-o of $Delta t$;
+ The probability of more than one event occurring during $Delta t$ is
  $o(Delta t)$. In other words, it is much more likely that a single
  event happens during $Delta t$ than multiple events occur;
+ The number of events occurring during the time interval $Delta t$ is
  independent of the number that occur prior to this time interval.

The probability mass function of a Poisson distribution can be adapted
in this sense if, instead of the expected value $lambda$, one is given
$alpha$, the expected number of events occurring in a unitary time
interval, and a time interval $Delta t$. The probability of $k$ events
to occur in a time slice $Delta t$ is then as follows:

$ p_(k)(Delta t) = frac((alpha Delta t)^(k), k!) e^(-alpha Delta t) $

The occurrence of events over time as described is called a *Poisson process*
and the parameter $alpha$ specifies the _rate_ of said process.

=== Hypergeometric random variable

Let $N$ be the size of a population of individuals, each of them having
associated either a value of $1$ (success) or $0$ (failure). Let $M$ be
the number of individuals whose value is $1$, and therefore $N - M$ is
the number of individuals whose number is $0$. Let $n lt.eq N$ be the
size of a sample extracted from the population. The random variable $X$
whose values are the number of successes (of $1$s) found in a sample of
size $n$ is said to distributed as an *hypergeometric random variable*
(denoted $X tilde H(n, N, M)$). The pdf of an hypergeometric random
variable $X$ of parameters $M$, $N$ and $n$ is therefore as follows:

#figure(image("Hyper_PMF.svg", width: 75%))

$ p(x) = P(X = x) =
  cases(frac(display(binom(M, x) binom(N - M, n - x)), display(binom(N, n)))
  "if" & max(0, n - N + M) lt.eq x lt.eq min(n, M),
  0 & "otherwise") $

// THE CDF IS A NIGHTMARE

The binomial $binom(M, x)$ is the number of ways it is possible to extract a
sample where there are $x$ individuals whose value is $1$, while the binomial
$binom(N - M, n - x)$ is the number of ways it is possible to extract a sample
where there are $n - x$ individuals whose value is $0$. The binomial $binom(N,
n)$ is the number of combinations of elements of $N$ of size $n$ (without any
requirement on the number of individuals having a particular value).

The constraint $x lt.eq min(n, M)$ denotes that the number of observed
successes cannot be greater than the size of the entire sample (and, of
course, cannot be greater than the size of the entire population).

// The constraint $max(0, n - N + M) lt.eq x$ denotes that the number of
// observed failures have to be ... (and has to be at least $0$)

#exercise[
	A university IT office received $20$ service orders for issues with
	printers, out of which $8$ were laser printers and $12$ were inkjet
	printers. A sample of $5$ of these service orders were selected to
	perform a customer satisfaction survey. What is the probability that,
	out of those $5$, $2$ were inkjet printers?
]
#solution[
	It is possible to model this situation with an hypergeometric random
	variable. Since the outcome of interest is the one related to inkjet
	printers, the parameters of said variable $X$ will be $5$ for the
	sample size, $20$ for the population size and $12$ for the favorable
	population size. Therefore, $X tilde (5, 20, 12)$. Evaluating the pdf
	for $X = 2$ gives:

	$ p(2) = P(X = 2) = frac(display(binom(12, 2) binom(20 - 12, 5 - 2)),
	  display(binom(20, 5))) = frac(display(frac(12!, 2! (12 - 2)!))
	  display(frac(8!, 3! (8 - 3)!)), display(frac(20!, 5! (20 - 5)!))) =
	  frac(display(frac(12 dot 11 dot cancel(10!), 2 dot cancel(10!)))
	  display(frac(8 dot 7 dot 6 dot cancel(5!), 6 dot cancel(5!))),
	  display(frac(20 dot 19 dot 18 dot 17 dot 16 dot cancel(15!),
	  120 dot cancel(15!)))) = \
	  display(frac(cancel(12) dot 11 dot 8 dot 7 dot 6, cancel(12))) dot
	  display(frac(cancel(20) dot 6, cancel(20) dot 19 dot 18 dot 17 dot 16))
	  = frac(22176, 93024) approx 0.238 $
]

#theorem[
	The expected value and variance of a random variable $X tilde H(n, N, M)$
	are as follows:

	#grid(
		columns: (0.4fr, 0.6fr),
		[$ E(X) = n dot frac(M, N) $],
		[$ V(X) = (frac(N - n, N - 1)) dot n dot frac(M, N) dot
		   (1 - frac(M, N)) $]
	)
] <Expected-value-variance-Hypergeometric>
// #proof[
// To be added (is somewhere online)
// ]

The hypergeometric distribution is distinguished from the binomial
distribution because the trials are not independent, since each time
an individual is "inspected" it is removed from the sample, and therefore
the subsequent probabilities are influenced by the outcome (since the
number of individuals is decreased). By contrast, in the binomial
distribution each trial is independent from the others.

Another similarity between the two comes from observing the equations
is @Expected-value-variance-Hypergeometric. The ratio $M slash N$ is
the proportion of successes in the population, meaning that it's the
probability of picking an element of the entire population that has a
value $1$. This ratio has the same role that the parameter $p$ has in
the binomial distribution. Indeed, substituting $M slash N$ with $p$
in said equations gives:

#grid(
	columns: (0.4fr, 0.6fr),
	[$ E(X) = n p $],
	[$ V(X) = (frac(N - n, N - 1)) dot n p (1 - p) $]
)

Where the expected value is identical to the one of a binomial distributed
random variable (@Expected-value-variance-Binomial), while the variance
differs for a factor $(N - n) slash (N - 1)$. Since this factor, called
*finite population correction factor*, is always less than $1$, the variance
of an hypergeometric random variable will always be smaller than a binomial
random variable where $p = M slash N$.

=== Geometric random variable

Let $X$ be a random variable that represents the number of (failed) attempts
necessary to have a Bernoulli random variable with parameter $p$ to assume
value $1$. The random variable $X$ is said to distributed as a *geometric
random variable* (denoted $X tilde G(p)$). The pdf and cdf of a geometric
random variable $X$ of parameter $p$ are therefore as follows:

#grid(
	columns: (0.5fr, 0.5fr),
	[#figure(image("Geometric_PMF.svg"))
	 $ p(x) = P(X = x) =
	   cases(p(1 - p)^(x) & "if" x in NN,
	   0 & "otherwise") $],
	[#figure(image("Geometric_CDF.svg"))
	 $ F(x) = P(X lt.eq x) = sum_(k in NN, k lt.eq x)
	   p(1 - p)^(k) $]
)

The factor $(1 - p)^(x)$ represents the probability of obtaining a failure
for exactly $x$ times. This factor is then multiplied by $p$, which is the
probability of obtaining a single success.

A geometric distribution $X tilde G(p)$ has a property called *memorylessness*,
expressed mathematically as $P(X > x + y | X > y) = P(X > x)$ with $x$ and $y$
positive integers. In other words, the number of attempts necessary for an
experiment to have a specific result does not depend on the previous ones.

#theorem[
	The expected value and variance of a random variable $X tilde G(p)$ are as
	follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = frac(1 - p, p) $],
		[$ V(X) = frac(1 - p, p^(2)) $]
	)
] <Expected-value-variance-Geometric>
#proof[
	This result can be proven by applying known theorems concerning geometric
	functions:

	$ E(X) = p(1 - p)^(0) dot 0 + p(1 - p)^(1) dot 1 + p(1 - p)^(2) dot 2 +
	  ... = p(1 - p) + 2p(1 - p)^(2) + 3p(1 - p)^(3) + ... = \ sum_(i =
	  0)^(infinity) i p(1 - p)^(i) = p sum_(i = 0)^(infinity) i(1 - p)^(i) =
	  p (1 - p) sum_(i = 0)^(infinity) i(1 - p)^(i - 1) =
	  p (1 - p) [frac(d, d p) (-sum_(i = 0)^(infinity) (1 - p)^(i))] = \
	  p (1 - p) frac(d, d p) (- frac(1, p)) = cancel(p) (1 - p)
	  (frac(1, p^(cancel(2)))) = frac(1 - p, p) $

	Then, applying @Alternative-form-for-variance:

	$ V(X) = E(X^(2)) - (E(X))^(2) = frac((2 - p)(1 - p), p^(2)) -
	  (frac(1 - p, p))^(2) = frac(2 - 2p - p + p^(2), p^(2)) -
	  frac(1 + p^(2) - 2p, p^(2)) = \ frac(2 - 3p + cancel(p^(2))
	  - 1 - cancel(p^(2)) + 2p, p^(2)) = frac(1 - p, p^(2)) $
]

=== Negative binomial random variable

Let $X$ be a random variable that represents the number of (failed) attempts
necessary to have a Bernoulli random variable with parameter $p$ to assume
value $1$ for $r$ times. The random variable $X$ is said to distributed as a
*negative binomial random variable* (denoted $X tilde N B(r, p)$). The pdf
of a negative binomial random variable $X$ of parameters $r$ and $p$ is
therefore as follows:

#figure(image("NegBinom_PMF.svg", width: 75%))

$ p(x) = P(X = x) = cases(display(binom(x + r - 1, r - 1)) p^(r)(1 - p)^(x) &
  "if" x in NN, 0 & "otherwise") $

// How about the cdf?

The factor $(1 - p)^(x)$ represents the probability of obtaining a failure
for exactly $x$ times. The factor $p^(r)$ represents the probability of
obtaining a success $r$ times. The factor $binom(x + r - 1, r - 1)$ represents
the number of ways that $r - 1$ successes out of $x + r - 1$ attempts can be
arranged.

Of course, if $r$ is set to $1$ said random variable reduces itself to a
geometric random variable:

$ binom(x + 1 - 1, 1 - 1) p^(1)(1 - p)^(x) = binom(x, 0) p(1 - p)^(x) =
  (frac(x!, 0! (x - 0)!)) p(1 - p)^(x) = (frac(cancel(x!), cancel(x!)))
  p(1 - p)^(x) = p(1 - p)^(x) $
