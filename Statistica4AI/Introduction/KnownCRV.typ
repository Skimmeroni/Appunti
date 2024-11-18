#import "../Stats4AI_definitions.typ": *

Some specific continuous random variables have been studied extensively, mostly
because they model very well many phenomena in the real world. For this reason,
such random variables have proper names. To denote that a random variable $X$
has the same distribution as a known random variable $F$, the notation $X
tilde F$ is used.

=== Uniform random variable

A continuous random variable $X$ is distributed as a *uniform random variable*
of parameters $a$ and $b$ (denoted as $X tilde U(a, b)$) if the pdf and cdf of
said variable are:

#grid(
	columns: (0.5fr, 0.5fr),
	[#figure(image("Uniform_PDF.svg"))
	 $ f(x) = cases(display(frac(1, b - a)) "if" & a lt.eq x lt.eq b,
	                0 & "otherwise") $],
	[#figure(image("Uniform_CDF.svg"))
	 $ F(x) = cases(0 & "if" x < a,
	                display(frac(x - a, b - a)) & "if" a lt.eq x lt.eq b,
	                1 & "if" x > b) $]
)

Indeed, the relation between the two holds:

$ integral_(-infinity)^(x) f(t) d t =
  integral_(-infinity)^(a) f(t) d t +
  integral_(a)^(x) f(t) d t =
  0 + integral_(a)^(x) frac(1, b - a) d t =
  frac(1, b - a) integral_(a)^(x) 1 d t =
  frac(1, b - a) (x - a) = frac(x - a, b - a) $

#theorem[
	The expected value and variance of a random variable $X tilde U(a, b)$ are
	as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = frac(b + a, 2) $],
		[$ V(X) = frac((b - a)^(2), 12) $]
	)
] <Expected-value-variance-Uniform>
#proof[
	$ E(X) = integral_(-infinity)^(+infinity) x dot f(x) d x =
	integral_(-infinity)^(a) x dot f(x) d x +
	integral_(a)^(b) x dot f(x) d x +
	integral_(b)^(+infinity) x dot f(x) d x = \
	0 + integral_(a)^(b) x (frac(1, b - a)) d x + 0 =
	frac(1, b - a) integral_(a)^(b) x d x =
	frac(1, b - a) (frac(b^(2), 2) - frac(a^(2), 2)) =
	frac(1, cancel((b - a))) frac(cancel((b - a))(b + a), 2) =
	frac(b + a, 2) $

	$ V(X) = integral_(-infinity)^(+infinity) (x - E(X))^(2) dot f(x) d x =
	integral_(-infinity)^(a) (x - E(X))^(2) dot f(x) d x +
	integral_(a)^(b) (x - E(X))^(2) dot f(x) d x + \
	integral_(b)^(+infinity) (x - E(X))^(2) dot f(x) d x =
	0 + integral_(a)^(b) (x - frac(b + a, 2))^(2) (frac(1, b - a)) d x + 0 = \
	frac(1, b - a) integral_(a)^(b) x^(2) + frac((b + a)^(2), 4) - (b + a)x
	d x = frac(1, b - a) (integral_(a)^(b) x^(2) d x + integral_(a)^(b)
	frac((b + a)^(2), 4) d x - integral_(a)^(b) (b + a)x d x) = \
	frac(1, b - a) integral_(a)^(b) x^(2) d x +
	frac((b + a)^(2), 4(b - a)) integral_(a)^(b) 1 d x
	- frac(b + a, b - a) integral_(a)^(b) x d x =
	frac(1, b - a) (frac(b^(3), 3) - frac(a^(3), 3)) +
	frac((b + a)^(2), 4 cancel((b - a))) cancel((b - a)) - \
	frac(b + a, b - a) (frac(b^(2), 2) - frac(a^(2), 2)) =
	frac(1, cancel((b - a))) frac(cancel((b - a))(b^(2) + b a + a^(2)), 3) +
	frac((b + a)^(2), 4 ) - frac(b + a, cancel((b - a)))
	frac(cancel((b - a))(b + a), 2) = \
	frac((b + a)^(2) - b a, 3) + frac((b + a)^(2), 4) - frac((b + a)^(2), 2) =
	frac(4(b + a)^(2) - 4 b a + 3(b + a)^(2) - 6(b + a)^(2), 12) = \
	frac((b + a)^(2) - 4 b a , 12) =
	frac(b^(2) + a^(2) + 2 b a - 4 b a , 12) =
	frac(b^(2) + a^(2) - 2 b a, 12) =
	frac((b - a)^(2), 12) $
]

=== Normal random variable

A continuous random variable $X$ is distributed as a *normal random variable*
(or *Gaussian random variable*) of parameters $mu$ and $sigma$ with $-infinity
< mu < +infinity$ and $sigma > 0$ (denoted as $X tilde N(mu, sigma)$) if the
pdf of said variable is:

#figure(image("Normal_PDF.svg", width: 75%))

$ f(x) = frac(1, sqrt(2 pi) sigma) e^(-frac((x - mu)^(2), 2 sigma^(2))) $

Where $mu$ and $sigma$ are respectively the expected value and the standard
deviation of the random variable. The normal random variable is the most
important distribution in statistics, since it models many real world
phenomena (IQ score, anthropometric measures, economic indicators, ecc...).

The distribution $Z tilde N(0, 1)$, that is to say the normal distribution
of parameters $mu = 0$ and $sigma = 1$, is called the *standard normal
distribution*, having pdf:

$ f(z) = frac(e^(-frac(z^(2), 2)), sqrt(2 pi)) $

Even though it is possible to compute the cdf of a normal random variable
$X$ by integrating its pdf, said computation is very hard since it's not
approachable with standard integration techniques. Despite this, the values
of the cdf of the standard normal distribution for most common values are
known and provided in table form. The cdf of $Z tilde N(0, 1)$ evaluated at
$z$ is denoted as $Phi(z)$.

The cdf of the standard normal distribution is sufficient to also compute
the cdf for any given random variable $X tilde N(mu, sigma)$. Infact, the
*standardized* version of any $X$, which is given by subtracting the expected
value of $X$ from $X$ and dividing the result by its standard deviation, is a
standard normal distribution:

$ Z = frac(X - mu, sigma) tilde N(0, 1) $

Infact, subtracting $E(X) = mu$ from $X$ sets its new expected value to $0$
and dividing the result by $S D(X) = sigma$ sets its new variance to $1$:

$ E(Z) = E(frac(X - E(X), S D(X))) = frac(1, S D(X)) E(X - E(X)) =
  frac(1, S D(X)) (E(X) - E(X)) = frac(0, S D(X)) = 0 $

$ S D(Z) = V(frac(X - E(X), S D(X))) = frac(1, (S D(X))^(2)) V(X - E(X)) =
  frac(V(X) - 0, (S D(X))^(2)) = frac(V(X), V(X)) = 1 $

Since the values of the cdf of $Z$ are known, it is the possible to compute
the values for the cdf (and pdf) of $X$ by computing the ones for $(X - mu)
slash sigma$:

$ P(a lt.eq X lt.eq b) = P(frac(a - mu, sigma) lt.eq frac(X - mu, sigma)
  lt.eq frac(b - mu, sigma)) = P(frac(a - mu, sigma) lt.eq Z
  lt.eq frac(b - mu, sigma)) = Phi(frac(b - mu, sigma)) -
  Phi(frac(a - mu, sigma)) $

$ F(a) = P(X lt.eq a) = P(frac(X - mu, sigma) lt.eq frac(a - mu, sigma)) =
  P(Z lt.eq frac(a - mu, sigma)) = Phi(frac(a - mu, sigma)) $

#exercise[
	Suppose that the time a car driver takes to react to the brake lights on a
	decelerating vehicle can be modeled as a normal distribution of parameters
	$mu = 1.25$ seconds and $sigma = 0.46$ seconds. What is the probability
	that the reaction time lies between $1$ second and $1.75$ seconds? And
	the probability of it being greater than $2$ seconds?
]
#solution[
	$ P(1 lt.eq X lt.eq 1.75) = P(frac(1 - 1.25, 0.46) lt.eq frac(X - 1.25,
	  0.46) lt.eq frac(1.75 - 1.25, 0.46)) = P(frac(-0.25, 0.46) lt.eq Z
	  lt.eq frac(0.5, 0.46)) approx \
	  Phi(1.09) - Phi(-0.54) = Phi(1.09) - (1 - Phi(0.54)) =
	  0.8621 - 0.2946 = 0.5675 $

	$ P(X > 2) = 1 - P(X lt.eq 2) = 1 - P(frac(X - 1.25, 0.46) lt.eq
	  frac(2 - 1.25, 0.46)) approx 1 - Phi(1.63) = 1 - 0.9484 = 0.0516 $
]

=== Exponential random variable

A continuous random variable $X$ is distributed as an *exponential random
variable* of parameter $lambda$ with $lambda > 0$ (denoted as $X tilde
E(lambda)$) if the pdf and cdf of said variable are:

#grid(
	columns: (0.5fr, 0.5fr),
	[#figure(image("Exponential_PDF.svg"))
	 $ f(x) = cases(lambda e^(-lambda x) & "if" x gt.eq 0,
	   0 & "otherwise") $],
	[#figure(image("Exponential_CDF.svg"))
	 $ F(x) = cases(1 - e^(-lambda x) & "if" x gt.eq 0,
	   0 & "otherwise") $]
)

Indeed, the relation between the two holds:

$ integral_(-infinity)^(x) f(t) d t =
  integral_(-infinity)^(0) f(t) d t +
  integral_(0)^(x) f(t) d t =
  0 + integral_(0)^(x) lambda e^(-lambda t) d t =
  integral_(0)^(-lambda x) cancel(lambda) frac(-1, cancel(lambda)) e^(u) d u =
  -(e^(-lambda x) - e^(0)) = 1 - e^(-lambda x) $

#theorem[
	The expected value and variance of a random variable $X tilde E(lambda)$
	are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = frac(1, lambda) $],
		[$ V(X) = frac(1, lambda^(2)) $]
	)
] <Expected-value-variance-Exponential>
#proof[
	$ E(X) = integral_(-infinity)^(+infinity) x dot f(x) d x =
	  integral_(-infinity)^(0) x dot f(x) d x +
	  integral_(0)^(+infinity) x dot f(x) d x =
	  0 + integral_(0)^(+infinity) lambda x e^(-lambda x) d x = \
	  -integral_(0)^(+infinity) x (-lambda e^(-lambda x)) d x =
	  -[x e^(-lambda x)]^(infinity)_(0)
	  +integral_(0)^(+infinity) e^(-lambda x) d x =
	  -(infinity dot e^(-lambda dot infinity) - 0 dot e^(-lambda dot 0))
	  +integral_(0)^(-infinity) frac(e^(u), -lambda) d u = \
	  -0 -frac(1, lambda) integral_(0)^(-infinity) e^(u) d u =
	  frac(1, lambda) integral_(-infinity)^(0) e^(u) d u =
	  frac(1, lambda) (e^(0) - e^(-infinity)) = frac(1, lambda) (1 - 0) =
	  frac(1, lambda) $

	$ V(X) = E(X^(2)) - (E(X))^(2) = -(frac(1, lambda))^(2) +
	  integral_(-infinity)^(+infinity) x^(2) dot f(x) d x =
	  -frac(1, lambda^(2)) + integral_(-infinity)^(0) x^(2) dot f(x) d x + \
	  integral_(0)^(+infinity) x^(2) dot f(x) d x = -frac(1, lambda^(2)) + 0 +
	  integral_(0)^(+infinity) lambda x^(2) e^(-lambda x) d x =
	  -frac(1, lambda^(2)) -integral_(0)^(+infinity) x^(2) (-lambda e^(-lambda
	  x)) d x = \
	  -frac(1, lambda^(2)) -[x^(2) e^(-lambda x)]^(infinity)_(0)
	  +integral_(0)^(+infinity) 2 x e^(-lambda x) d x =
	  -frac(1, lambda^(2))
	  -(infinity^(2) dot e^(-lambda dot infinity^(2)) -
	  0^(2) dot e^(-lambda dot 0^(2))) - \
	  frac(2, lambda) integral_(0)^(+infinity) x (-lambda e^(-lambda x)) d x =
	  -frac(1, lambda^(2)) - 0 -
	  frac(2, lambda) integral_(0)^(+infinity) x (-lambda e^(-lambda x)) d x =
	  -frac(1, lambda^(2)) - frac(2, lambda) [x e^(-lambda x)]^(infinity)_(0) \
	  +frac(2, lambda) integral_(0)^(+infinity) e^(-lambda x) d x =
	  -frac(1, lambda^(2)) - frac(2, lambda) (infinity dot e^(-lambda dot
	  infinity) - 0 dot e^(-lambda dot 0)) +frac(2, lambda)
	  integral_(0)^(-infinity) frac(e^(u), -lambda) d u =
	  -frac(1, lambda^(2)) - 0 - \
	  frac(2, lambda^(2)) integral_(0)^(-infinity) e^(u) d u =
	  -frac(1, lambda^(2)) +
	  frac(2, lambda^(2)) integral_(-infinity)^(0) e^(u) d u =
	  -frac(1, lambda^(2)) + frac(2, lambda^(2)) (e^(0) - e^(-infinity)) =
	  -frac(1, lambda^(2)) + frac(2, lambda^(2)) = frac(1, lambda^(2)) $
]

#exercise[
	Suppose that the stress range of a certain bridge connection (measured in
	Megapascal) can be modeled as an exponential distribution $X$ with expected
	value equal to $6$. What is the probability of the stress to be less than
	or equal to $10$ Megapascal?
]
#solution[
	If the expected value of $X$ is $6$, since the expected value of an
	exponential distribution is $1 slash lambda$ the lambda parameter of
	$X$ is $lambda = 0.1667$.

	$ P(X lt.eq 10) = F(10) = 1 - e^(-0.1667 dot 10) = 1 - e^(-1.667) approx
	  1 - 0.189 = 0.811 $
]

The exponential distribution and the Poisson distribution are closely related.
Indeed, suppose that the number of events occurring in any time interval of
length $Delta t$ has a Poisson distribution with parameter $alpha Delta t$
(where alpha, the rate of the event process, is the expected number of events
occurring in $1$ unit of time) and that number of occurrences in nonoverlapping
intervals are independent of one another. Then the distribution of elapsed time
between the occurrence of two successive events is exponential with parameter
$lambda = alpha$.

#theorem[
	The geometric distribution function has the memorylessness property.
]
#proof[
	Let $X tilde E(lambda)$. Then:

	$ P(X gt.eq t + t_(0) | X gt.eq t_(0)) & = frac(P[(X gt.eq t + t_(0)) sect
	  (X gt.eq t_(0))], P(X gt.eq t_(0))) = frac(P(X gt.eq t + t_(0)),
	  P(X gt.eq t_(0))) = \
	  & = frac(1 - F(t + t_(0)), 1 - F(t)) = e^(-lambda t) = P(X gt.eq t) $
]

=== Chi-square random variable

Given an integer $n$, let $X$ be a random variable constructed by summing
the squares of $n$ independent standard normal random variables:

$ X = sum_(i = 1)^(n) Z_(i)^(2) = Z_(1)^(2) + Z_(2)^(2) + dots + Z_(n)^(2) $

The random variable $X$ defined as such is called a *Chi-squared random
variable* with $n$ degrees of freedom (denoted as $X tilde chi^(2)(n)$).
Being the result of a sum of squared values, a Chi-squared random variable
is always positive.

#grid(
	columns: (0.5fr, 0.5fr),
	[#figure(image("ChiSquare_PDF.svg"))],
	[#figure(image("ChiSquare_CDF.svg"))]
)

#theorem[
	The expected value and variance of a random variable $X tilde chi(n)$
	are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = n $],
		[$ V(X) = 2n $]
	)
] <Expected-value-variance-Chi-square>
#proof[
	The expected value of $X$ can be computed by applying
	@Expected-value-linear-function and @Alternative-form-for-variance:

	$ E(X) = E(Z_(1)^(2) + Z_(2)^(2) + dots + Z_(n)^(2)) =
	  sum_(i = 1)^(n) E(Z_(i)^(2)) = sum_(i = 1)^(n) V(Z_(i)) +
	  (E(Z_(i)))^(2) = n(1 + 0^(2)) = n $

	// Variance?
]

=== Student t random variable

Given an integer $n$, let $Z$ be a standard normal distribution and $Y_(n)$
a Chi-square distribution with $n$ degrees of freedom, independent of each
other. Let $X$ be a random variable constructed by computing the ratio of
$Z$ and the square root of $Y_(n)$:

$ X = frac(Z, sqrt(Y_(n))) $

The random variable $X$ defined as such is called a *Student t random
variable* with $n$ degrees of freedom (denoted as $X tilde T(n)$).

#grid(
	columns: (0.5fr, 0.5fr),
	[#figure(image("Student_PDF.svg"))],
	[#figure(image("Student_CDF.svg"))]
)

#theorem[
	The expected value and variance of a random variable $X tilde T(n)$
	are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = cases(0 & "if" n > 1,
		   "undefined" & "otherwise") $],
		[$ V(X) = cases(display(frac(n, n - 1)) & "if" n > 2,
		   "undefined" & "otherwise") $]
	)
] <Expected-value-variance-Student-t>
// #proof[
// Feasible?
// ]
