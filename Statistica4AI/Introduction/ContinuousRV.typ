#import "../Stats4AI_definitions.typ": *

The *probability density function* (abbreviated as pdf) of a continuous
random variable $X$ is a function $f(x)$ such that, for any pair of numbers
$a$ and $b$:

$ P(a lt.eq X lt.eq b) = integral_(a)^(b) f(x) d x $

That is, the probability of the random variable $X$ to assume a value that
lies in the $[a, b]$ interval is equal to the integral of $f(x)$ with said
points as extremes, which is also the area under the curve of $f(x)$ in the
interval $[a, b]$.

Any function can be a pdf as long as it satisfies the following two conditions:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ forall x, f(x) gt.eq 0 $],
	[$ integral_(-infinity)^(+infinity) f(x) d x = 1 $]
)

#exercise[
	Suppose that the chanche of having imperfection on the surface of a tire
	can be described as a random variable. Let $X$ be the angle induced by any
	vector that goes from the centre of the tire to its surface. Suppose the
	probability distribution function of $X$ is given by:

	$ f(x) = cases(display(frac(1, 360)) "if" & 0 lt.eq x lt.eq 360,
	  0 & "otherwise") $

	Is this probability distribution function well-defined? If it is, what
	is the probability of finding an imperfection between the angles $90$
	and $180$?
]
#solution[
	This pdf can assume either $0$ or $frac(1, 360)$ as its values, therefore
	the first condition is satisfied. As for the second condition:

	$ integral_(-infinity)^(+infinity) f(x) d x =
	  integral_(-infinity)^(0) 0 d x +
	  integral_(0)^(360) frac(1, 360) d x +
	  integral_(0)^(+infinity) 0 d x =
	  frac(1, 360) integral_(0)^(360) 1 d x =
	  frac(1, 360) (360 - 0) =
	  frac(360, 360) = 1 $

	The requested probability is:

	$ P(90 lt.eq X lt.eq 180) = integral_(90)^(180) frac(1, 360) d x =
	  frac(1, 360) integral_(90)^(180) 1 d x = frac(1, 360) (180 - 90) =
	  frac(90, 360) = 0.25 $
]

The *cumulative distribution function* (abbreviated as cdf) of a continuous
random variable $X$, denoted as $F(X)$, is defined as the probability of
such random variable to assume a value less than or equal to a threshold.
Given a random variable $X$, its cdf is defined as:

$ F(x) = P(X lt.eq x) = integral_(-infinity)^(x) f(t) d t $

Given $F(a)$, the probability of a random variable to assume a value less
than or equal to $a$, it is possible to compute $P(X > a)$, the probability
of said random variable to assume a value greater than $a$, since the two
events are the complement of each other:

$ P(X > a) = 1 - P(X lt.eq a) = 1 - F(a) $

#lemma[
	Let $X$ be a random variabile, and let $a$ and $b$ be two real
	numbers (suppose $a < b$). The following holds:

	$ P(a < X lt.eq b) = F(b) - F(a) $
] <Relation-between-F-and-P>
#proof[
	By definition, the events $A$ = "the realization of $X$ lies
	in $(-infinity, a]$" and $B$ = "the realization of $X$ lies
	in $(a, b]$" are incompatible. Therefore:

	$ P(-infinity < X lt.eq a) + P(a < X lt.eq b) -
	  P({-infinity < X lt.eq a} sect {a < X lt.eq b}) = \
	  P(-infinity < X lt.eq a) + P(a < X lt.eq b) - 0 =
	  P({-infinity < X lt.eq a} union {a < X lt.eq b}) $

	From which stems:

	$ F(b) = P(-infinity < X lt.eq b) = P({-infinity < X lt.eq a}
	  union {a < X lt.eq b}) = \ P(-infinity < X lt.eq a) +
	  P(a < X lt.eq b) = F(a) + P(a < X lt.eq b) =>
	  F(b) - F(a) = P(a < X lt.eq b) $
]

#corollary[
	The probability of a continuous random variable $X$ to assume a
	specific value $c$ is always $0$.
] <Continuous-variables-no-single-value>
#proof[
	$P(X = c)$ is equivalent to $P(c < X lt.eq c)$. Therefore
	@Relation-between-F-and-P applies:

	$ P(c < X lt.eq c) = F(c) - F(c) = 0 $
]

@Continuous-variables-no-single-value is sound even from a logical
perspective: the probability of choosing a specific value in (a subset
of) $RR$ is necessarely infinitesimal, since $RR$ is not a countable
set. Therefore, when dealing with the realization of a continuous random
variables, it only makes sense to think in terms of intervals.

Let $X$ be a continuous random variable probability distribution
function $f(x)$. The *expected value* (or *mean value*) of $X$,
denoted as $E(X)$ or $mu_(X)$ is given by:

$ E(X) = mu_(X) = integral_(-infinity)^(+infinity) x dot f(x) d x $

When the variable $X$ is known, the pedix $X$ in $mu_(X)$ is omitted.

Let $X$ be a continuous random variable probability distribution
function $f(x)$. The *variance* of $X$, denoted as $V(X)$ or
$sigma^(2)_(X)$ is given by:

$ V(X) = sigma^(2)_(X) = integral_(-infinity)^(+infinity) (x - E(X))^(2)
  dot f(x) d x = E((X - E(X))^(2)) $

When the variable $X$ is known, the pedix $X$ in $sigma^(2)_(X)$ is omitted.

The square root of the variance is called the *standard deviation*:

$ S D (X) = sigma_(X) = sqrt(V(X)) $

Let $p$ be a real number between $0$ and $1$. The *(100p)-th percentile* of
the distribution of a continuous random variable $X$, denoted as $eta (p)$
is defined by:

$ p = F(eta(p)) = integral_(-infinity)^(eta(p)) f(t) d t $

That is, the cumulative distribution function of $X$ evaluated at $eta(p)$.

#exercise[
	The amount of gravel (in tons) sold by a particular construction
	supply company in a given week can be modeled as a continuous
	random variable $X$ with pdf:

	$ f(x) = cases(display(frac(3, 2)(1 - x^(2))) & "if" 0 lt.eq x lt.eq 1,
	               0 & "otherwise") $

	What is the cdf of $X$? What are the expected value and the variance of
	$X$? What is the $50$-th percentile?
]
#solution[
	The cdf of $X$ is clearly $0$ for any $x$ lower than $0$ and $1$ for any
	$x$ greater than $1$. As for $x in [0, 1]$:

	$ F(x) = integral_(-infinity)^(x) f(t) d t =
	  integral_(-infinity)^(0) f(t) d t +
	  integral_(0)^(x) f(t) d t =
	  0 + integral_(0)^(x) frac(3, 2)(1 - t^(2)) d t =
	  frac(3, 2) (integral_(0)^(x) 1 d t -
	  integral_(0)^(x) t^(2) d t) = \
	  frac(3, 2) [(x - 0) - (frac(x^(3), 3) - frac(0^(3), 3))] =
	  frac(3, 2) (x - frac(x^(3), 3)) =
	  frac(1, 2) x (3 - x^(2)) $

	The expected value is given by computing the integral:

	$ E(X) = integral_(-infinity)^(+infinity) x dot f(x) d x =
	  integral_(-infinity)^(0) x dot f(x) d x +
	  integral_(0)^(1) x dot f(x) d x +
	  integral_(1)^(+infinity) x dot f(x) d x = \
	  0 + integral_(0)^(1) x dot frac(3, 2)(1 - x^(2)) d x + 0 =
	  frac(3, 2) integral_(0)^(1) x - x^(3) d x =
	  frac(3, 2) (integral_(0)^(1) x d x - integral_(0)^(1) x^(3) d x) = \
	  frac(3, 2) ((frac(1^(2), 2) - frac(0^(2), 2)) -
	  (frac(1^(4), 4) - frac(0^(4), 4))) =
	  frac(3, 2) (frac(1, 2) - frac(1, 4)) = frac(3, 8) $

	As for the variance:

	$ V(X) = E(X^(2)) - (E(X))^(2) = -(frac(3, 8))^(2) +
	  integral_(-infinity)^(+infinity) x^(2) dot f(x) d x =
	  -frac(9, 64) + integral_(-infinity)^(0) x^(2) dot f(x) d x + \
	  integral_(0)^(1) x^(2) dot f(x) d x +
	  integral_(1)^(+infinity) x^(2) dot f(x) d x =
	  -frac(9, 64) + 0 + integral_(0)^(1) x^(2) dot frac(3, 2)(1 - x^(2)) d x +
	  0 = -frac(9, 64) + frac(3, 2) integral_(0)^(1) x^(2) - x^(4) d x = \
	  -frac(9, 64) + frac(3, 2) (integral_(0)^(1) x^(2) d x - integral_(0)^(1)
	  x^(4) d x) =
	  -frac(9, 64) + frac(3, 2) ((frac(1^(3), 3) - frac(0^(3), 3)) -
	  (frac(1^(5), 5) - frac(0^(5), 5))) =
	  -frac(9, 64) + frac(3, 2) (frac(1, 3) - frac(1, 5)) =
	  frac(19, 320) $

	The $50$-th percentile is given when $p = 0.5$. Applying the formula gives:

	$ 0.5 = F(eta(p)) = frac(1, 2) eta(p) (3 - (eta(p))^(2)) =>
	  (eta(p))^(3) - 3 eta(p) + 1 = 0 => eta(p) approx 0.347 $
]

