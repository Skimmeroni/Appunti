#import "../../Stats4AI_definitions.typ": *

As it was the case for discrete random variables, there are some
continuous random variables that are worth focusing on, since they
model very well many real world phenomena. Unlike most discrete random
variables, whose pmf could be derived from abstract experiment, the
definition of the pdf of continuous random variables mostly relies on
heuristic arguments.

=== Uniform random variable

A continuous random variable $X$ is distributed as a *uniform random
variable* of parameters $a$ and $b$ (denoted as $X tilde U(a, b)$) if
its pdf returns the same value in a given interval $[a, b]$ and $0$
elsewhere:

$ f(x) = cases(display(frac(1, b - a)) "if" & a lt.eq x lt.eq b,
	           0 & "otherwise") $

#figure(
	caption: [Probability density function of a uniform random variable,
	          with three different choices for the parameters $a$ and $b$.],
	image("uniform_PDF.svg", width: 75%)
)

To show that the pdf of a random variable $X tilde U(a, b)$ is a valid
pdf, first note how all probabilities are non negative. To show that
the pdf equals $1$ when integrated over the entire real line:

$ integral_(-infinity)^(+infinity) f(x) d x &=
  integral_(-infinity)^(a) f(x) d x +
  integral_(a)^(b) f(x) d x +
  integral_(b)^(+infinity) f(x) d x = \
  &= integral_(-infinity)^(a) 0 d x +
  integral_(a)^(b) frac(1, b - a) d x +
  integral_(b)^(+infinity) 0 d x = \
  &= 0 + frac(1, b - a) integral_(a)^(b) 1 d x + 0 = 
  frac([x]_(a)^(b), b - a) =
  frac(cancel(b - a), cancel(b - a)) = 1 $

This is why the non-null value returned by the pdf is precisely $1 slash
(b - a)$. For the cdf of $X tilde U(a, b)$, it is clear that $F(x) = 0$
when $x < a$ and $F(x) = 1$ when $x > b$. As for $a lt.eq x lt.eq b$:

$ integral_(-infinity)^(x) f(t) d t =
  integral_(-infinity)^(a) f(t) d t +
  integral_(a)^(x) f(t) d t =
  0 + integral_(a)^(x) frac(1, b - a) d t = 
  frac(1, b - a) integral_(a)^(x) 1 d t =
  frac([t]_(a)^(x), b - a) = frac(x - a, b - a) $

This gives:

$ F(x) = cases(0 & "if" x < a,
	           display(frac(x - a, b - a)) & "if" a lt.eq x lt.eq b,
	           1 & "if" x > b) $

#figure(
	caption: [Cumulative distribution function of a uniform random variable,
	          with three different choices for the parameters $a$ and $b$.],
	image("uniform_CDF.svg", width: 75%)
)

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
	The expected value is given by:

	$ E(X) &= integral_(-infinity)^(+infinity) x dot f(x) d x =
	          integral_(-infinity)^(a) x dot f(x) d x + integral_(a)^(b) x dot f(x) d x + integral_(b)^(+infinity) x dot f(x) d x = \
	       &= 0 + integral_(a)^(b) x (frac(1, b - a)) d x + 0 =
	          frac(1, b - a) integral_(a)^(b) x d x =
	          frac(1, b - a) [frac(x^(2), 2)]_(a)^(b) = \
	       &= frac(1, b - a) (frac(b^(2), 2) - frac(a^(2), 2)) = 
	          frac(cancel((b - a))(b + a), 2 cancel((b - a))) =
	          frac(b + a, 2) $

	As for $E(X^(2))$:

	$ E(X^(2)) &= integral_(-infinity)^(+infinity) x^(2) dot f(x) d x =
	          integral_(-infinity)^(a) x^(2) dot f(x) d x + integral_(a)^(b) x^(2) dot f(x) d x + integral_(b)^(+infinity) x^(2) dot f(x) d x = \
	       &= 0 + integral_(a)^(b) x^(2) (frac(1, b - a)) d x + 0 =
	          frac(1, b - a) integral_(a)^(b) x^(2) d x =
	          frac(1, b - a) [frac(x^(3), 3)]_(a)^(b) = \
	       &= frac(1, b - a) (frac(b^(3), 3) - frac(a^(3), 3)) = 
	          frac(cancel((b - a))(b^(2) + a b + a^(2)), 3cancel((b - a))) = 
	          frac(b^(2) + a b + a^(2), 3) $

	Applying @Alternative-form-for-variance-2:

	$ V(X) &= E(X^(2)) - (E(X))^(2) =
	  frac(b^(2) + a b + a^(2), 3) - (frac(b + a, 2))^(2) =
	  frac(b^(2) + a b + a^(2), 3) - frac(a^(2) + b^(2) + 2 a b, 4) = \
	  &= frac(4b^(2) + 4a b + 4a^(2) - 3a^(2) - 3b^(2) - 6 a b, 12) =
	  frac(b^(2) - 2a b + a^(2), 12) =
	  frac((b - a)^(2), 12) $
]

=== Exponential random variable

A continuous random variable $X$ is distributed as an *exponential random
variable* of parameter $lambda$ with $lambda > 0$ (denoted as $X tilde
E(lambda)$) if it has the following pdf:

$ f(x) = cases(lambda e^(-lambda x) & "if" x gt.eq 0,
	   0 & "otherwise") $

#figure(
	caption: [Probability density function of an exponential random variable,
	          with three different choices for the parameter $lambda$.],
	image("exponential_PDF.svg", width: 75%)
)

To show that the pdf of a random variable $X tilde E(lambda)$ is a valid
pdf, first note how all probabilities are non negative. To show that
the pdf equals $1$ when integrated over the entire real line:

$ integral_(-infinity)^(+infinity) f(x) d x &=
  integral_(-infinity)^(0) f(x) d x + integral_(0)^(+infinity) f(x) d x = 
  integral_(-infinity)^(0) 0 d x + integral_(0)^(+infinity) lambda e^(-lambda x) d x = \
  &= 0 + integral_(0)^(+infinity) lambda e^(-lambda x) d x = 
  -integral_(0)^(-infinity) e^(u) d u =
  integral_(-infinity)^(0) e^(u) d u = \
  &= [e^(u)]_(-infinity)^(0) =
  e^(0) - e^(-infinity) =
  1 - 0 =
  1 $

For the cdf of $X tilde E(lambda)$, it is clear that $F(x) = 0$ when
$x < 0$. As for $x gt.eq 0$:

$ integral_(-infinity)^(x) f(t) d t &=
  integral_(-infinity)^(0) f(t) d t + integral_(0)^(x) f(t) d t =
  integral_(-infinity)^(0) 0 d t + integral_(0)^(+infinity) lambda e^(-lambda t) d t = \
  &= 0 + integral_(0)^(x) lambda e^(-lambda t) d t =
  -integral_(0)^(-lambda x) e^(u) d u = 
  integral_(-lambda x)^(0) e^(u) d u = \
  &= [e^(u)]_(-lambda x)^(0) =
  e^(0) - e^(-lambda x) =
  1 - e^(-lambda x) $

Which gives:

$ F(x) = cases(1 - e^(-lambda x) & "if" x gt.eq 0,
	   0 & "otherwise") $

#figure(
	caption: [Cumulative distribution function of an exponential random
	          variable, with three different choices for the parameter
	          $lambda$.],
	image("exponential_CDF.svg", width: 75%)
)

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
	The expected value is given by:

	$ E(X) &= integral_(-infinity)^(+infinity) x dot f(x) d x =
	  integral_(-infinity)^(0) x dot f(x) d x +
	  integral_(0)^(+infinity) x dot f(x) d x = \
	  &= 0 + integral_(0)^(+infinity) lambda x e^(-lambda x) d x = 
	  integral_(0)^(+infinity) lambda x e^(-lambda x) d x $

	Applying integration by parts:

	$ E(X) &= integral_(0)^(+infinity) lambda x e^(-lambda x) d x =
	          -integral_(0)^(+infinity) x (-lambda e^(-lambda x)) d x =
	          -[x e^(-lambda x)]^(infinity)_(0) +integral_(0)^(+infinity) e^(-lambda x) d x = \
	       &= -(infinity dot e^(-lambda dot infinity) - 0 dot e^(-lambda dot 0))
	          +integral_(0)^(+infinity) e^(-lambda x) d x =
	          -0 + integral_(0)^(+infinity) e^(-lambda x) d x = \
	       &= integral_(0)^(+infinity) e^(-lambda x) d x $

	Solving by substitution:

	$ E(X) &= integral_(0)^(+infinity) e^(-lambda x) d x =
	          integral_(0)^(-infinity) frac(e^(u), -lambda) d u = 
	          frac(1, lambda) integral_(-infinity)^(0) e^(u) d u =
	          frac(1, lambda) (e^(0) - e^(-infinity)) =
	          frac(1 - 0, lambda) =
	          frac(1, lambda) $

	As for $E(X^(2))$:

	$ E(X^(2)) &=
	  integral_(-infinity)^(+infinity) x^(2) dot f(x) d x =
	  integral_(-infinity)^(0) x^(2) dot f(x) d x + integral_(0)^(+infinity) x^(2) dot f(x) d x = \
	  &= 0 + integral_(0)^(+infinity) lambda x^(2) e^(-lambda x) d x =
	  integral_(0)^(+infinity) lambda x^(2) e^(-lambda x) d x $

	Applying integration by parts:

	$ E(X^(2)) &= integral_(0)^(+infinity) lambda x^(2) e^(-lambda x) d x =
	          -integral_(0)^(+infinity) x^(2) (-lambda e^(-lambda x)) d x = \
	       &= -[x^(2) e^(-lambda x)]^(infinity)_(0) +integral_(0)^(+infinity) 2 x e^(-lambda x) d x = \
	       &= -(infinity^(2) dot e^(-lambda dot infinity^(2)) - 0^(2) dot e^(-lambda dot 0^(2))) - 2 integral_(0)^(+infinity) x e^(-lambda x) d x = \
	       &= - 0 -2 integral_(0)^(+infinity) x e^(-lambda x) d x =
	          -2 integral_(0)^(+infinity) x e^(-lambda x) d x $

	Which can be rewritten in terms of the expected value of $X$:

	$ E(X^(2)) =
	  -2 integral_(0)^(+infinity) x e^(-lambda x) d x =
	  frac(2, lambda) integral_(0)^(+infinity) x (-lambda e^(-lambda x)) d x =
	  frac(2, lambda) E(X) =
	  frac(2, lambda) dot frac(1, lambda) =
	  frac(2, lambda^(2)) $

	Applying @Alternative-form-for-variance-2:

	$ V(X) &=
	  E(X^(2)) - (E(X))^(2) =
	  frac(2, lambda^(2)) - (frac(1, lambda))^(2) =
	  frac(2, lambda^(2)) - frac(1, lambda^(2)) =
	  frac(1, lambda^(2)) $
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

As its pdf might suggest, the exponential distribution is closely
related to the Poisson distribution. If the Poisson distribution
models the count of sparse events occurring in given time slices,
the exponential distribution models the time elapsed between occurred
events. More formally, consider a Poisson process characterized by a
rate $alpha$. If the distribution of the occurrence of the events is
modeled by a Poisson random variable with parameter $lambda = alpha
Delta t$, the distribution of length of the time intervals between
two consecutive events occurring is modeled by an exponential random
variable with parameter $lambda = alpha$.

#theorem[
	The exponential random variable is memoryless.
]
#proof[
	Let $X tilde E(lambda)$. By definition of conditional probability:

	$ P(X gt.eq x + x_(0) mid(|) X gt.eq x_(0)) =
	  frac(P((X gt.eq x + x_(0)) inter (X gt.eq x_(0))), P(X gt.eq x_(0))) $

	But the event "$X gt.eq 0$" in the numerator is redundant, since both
	events can occur if and only if $X gt.eq x + x_(0)$. Therefore,

	// FIXME: not clear

	$ P(X gt.eq x + x_(0) mid(|) X gt.eq x_(0)) &=
	  frac(P((X gt.eq x + x_(0)) inter (X gt.eq x_(0))), P(X gt.eq x_(0))) =
	  frac(P(X gt.eq x + x_(0)), P(X gt.eq x_(0))) = \
	  &= frac(1 - F(x + x_(0)), 1 - F(x_(0))) =
	  frac(cancel(1) - cancel(1) + e^(-lambda (x + x_(0))), cancel(1) - cancel(1) + e^(-lambda x_(0))) =
	  frac(e^(-lambda x) cancel(e^(-lambda x_(0))), cancel(e^(-lambda x_(0)))) = \
	  &= e^(-lambda x) =
	  1 - 1 + e^(-lambda x) =
	  1 - P(X lt.eq x) =
	  P(X gt.eq x) $
]

It is actually possible to prove a much stronger result, mainly that the
exponential random variable is the _only_ continuous random variable that
is memoryless. 

=== Normal random variable

The *normal random variable*, or *Gaussian random variable*, is
the most important distribution in statistics, since it appears
very often in many empirical sciences (results of IQ tests,
anthropometric measures, economic indicators, ecc...). A continuous
random variable $X$ is distributed as a normal random variable of
parameters $mu$ and $sigma$ with $-infinity < mu < +infinity$ and
$sigma > 0$ (denoted as $X tilde N(mu, sigma)$) if the pdf of said
variable is:

$ f(x) = frac(1, sqrt(2 pi) sigma) e^(display(-frac((x - mu)^(2), 2 sigma^(2)))) $

#figure(
	caption: [Probability density function of a normal random variable,
	          with three different choices for the parameters $mu$ and
	          $sigma$.],
	image("normal_PDF.svg", width: 75%)
)

Showing that such pdf is valid is not obvious, since it requires computing
the so-called Gaussian integral.

#theorem[
	The expected value and variance of a random variable $X tilde
	N(mu, sigma)$ are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = mu $],
		[$ V(X) = sigma^(2) $]
	)
] <Expected-value-variance-Normal>
// #proof[
// Potentially feasible
// ]

The density curve of a normal random variable $X tilde N(mu, sigma)$
has a characteristic bell shape, with the mean $mu$ located in the
middle. This means that the mean of a normal distribution coincides
with its median. Changing the value of the mean rigidly shifts the
entire curve without chaning its shape. Changing the value of the
standard deviation "stretches" or "squished" the curve while keeping
it in place.

The inflection points of a normal curve (the points in which the derivative
changes sign) occur at $mu + sigma$ and $mu - sigma$. Thus the value of
$sigma$ can be thought of as the distance from the mean to these inflection
points. A large value of $sigma$ gives a curve that is spread out from $mu$,
a small value of $sigma$ gives a curve that is tightly compressed around $mu$.

Integrating the pdf of a normal random variable is very hard, because
it requires advanced calculus techniques and it is only feasible with
the aid of a computer. This is why to compute probabilities with a random
distribution a different approach is taken.

The distribution $Z tilde N(0, 1)$, that is to say the normal distribution
with parameters $mu = 0$ and $sigma = 1$, is called the *standard normal
distribution*, having pdf:

$ f(z) = frac(1, sqrt(2 pi)) e^(display(-frac(z^(2), 2))) $

This pdf is sufficiently approachable for it to be integrated. Actually,
probabilities of normal random variables are more commonly computed from
their cdf; the cdf of $Z tilde N(0, 1)$ evaluated at $z$ is denoted as
$Phi(z)$. The values of the cdf of the standard normal distribution for
the most common choices of $z$ are known and provided in table form. 

The cdf of the standard normal distribution is sufficient to also compute
the cdf for any normal random variable. This is because any normal random
variable $X tilde N(mu, sigma)$ can be reduced to a standard normal random
variable by subtracting its expected value and dividing by its standard
deviation:

$ frac(X - mu, sigma) tilde Z tilde N(0, 1) $

This means that, for example, to compute the probability that $X tilde
N(mu, sigma)$ falls in the interval $[a, b]$, it is possible to proceed
as follows:

$ P(a lt.eq X lt.eq b) &=
  P(a - mu lt.eq X - mu lt.eq b - mu) = 
  P(frac(a - mu, sigma) lt.eq frac(X - mu, sigma) lt.eq frac(b - mu, sigma)) = \
  &= P(frac(a - mu, sigma) lt.eq Z lt.eq frac(b - mu, sigma)) =
  Phi(frac(b - mu, sigma)) - Phi(frac(a - mu, sigma)) $

#exercise[
	Suppose that the time a car driver takes to react to the brake lights on a
	decelerating vehicle can be modeled as a normal distribution of parameters
	$mu = 1.25$ seconds and $sigma = 0.46$ seconds. What is the probability
	that the reaction time lies between $1$ second and $1.75$ seconds? And
	the probability of it being greater than $2$ seconds?
]
#solution[
	$ P(1 lt.eq X lt.eq 1.75) &=
	  P(frac(1 - 1.25, 0.46) lt.eq frac(X - 1.25, 0.46) lt.eq frac(1.75 - 1.25, 0.46)) = \
	  &= P(frac(-0.25, 0.46) lt.eq Z lt.eq frac(0.5, 0.46)) approx 
	  Phi(1.09) - Phi(-0.54) = \
	  &= Phi(1.09) - (1 - Phi(0.54)) = 
	  0.8621 - 0.2946 =
	  0.5675 $

	$ P(X gt.eq 2) &=
	  1 - P(X lt.eq 2) =
	  1 - P(frac(X - 1.25, 0.46) lt.eq frac(2 - 1.25, 0.46)) approx \
	  &= 1 - Phi(1.63) =
	  1 - 0.9484 =
	  0.0516 $
]

=== Chi-squared random variable

Given an integer $n$, let $X$ be a random variable constructed by summing
the squares of $n$ independent standard normal random variables:

$ X = sum_(i = 1)^(n) Z_(i)^(2) = Z_(1)^(2) + Z_(2)^(2) + dots + Z_(n)^(2) $

The random variable $X$ defined as such is called a *Chi-squared random
variable* with $n$ degrees of freedom (denoted as $X tilde chi^(2)(n)$).
Being the result of a sum of squared values, a Chi-squared random variable
is always positive.

#figure(
	caption: [Probability density function of a Chi-squared random
	          variable, with three different choices for the parameter
	          $n$.],
	image("chisquared_PDF.svg", width: 75%)
)

#figure(
	caption: [Cumulative distribution function of a Chi-squared random
	          variable, with three different choices for the parameter
	          $n$.],
	image("chisquared_CDF.svg", width: 75%)
)

#theorem[
	The expected value and variance of a random variable $X tilde
	chi^(2)(n)$ are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = n $],
		[$ V(X) = 2n $]
	)
] <Expected-value-variance-Chi-squared>
// #proof[
// Relies on the properties of the gamma function
// ]

As for the (standard) normal distribution, the quantiles of Chi-squared
distributions have been tabulated, since computing them directly is
unfeasible without the aid of a computer.

=== Student t random variable

Given an integer $n$, let $Z$ be a standard normal distribution and $Y_(n)$
a Chi-squared distribution with $n$ degrees of freedom. Assume that $Z$ and
$Y_(n)$ are independent of each other. Let $X$ be the random variable defined
as the ratio of $Z$ and the square root of $Y_(n)$:

$ X = frac(Z, sqrt(Y_(n))) $

The random variable $X$ defined as such is called a *Student t random
variable* with $n$ degrees of freedom (denoted as $X tilde T(n)$).

#figure(
	caption: [Probability density function of a Student t random
	          variable, with three different choices for the parameter
	          $n$.],
	image("student_t_PDF.svg", width: 75%)
)

#figure(
	caption: [Cumulative distribution function of a Student t random
	          variable, with three different choices for the parameter
	          $n$.],
	image("student_t_CDF.svg", width: 75%)
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
// Relies on the properties of the gamma function
// ]

The quantiles of a Student t distribution have been tabulated, since
it's unfeasible to compute them by hand.

The degrees of freedom of a Student t random variable are related 
to how "heavy" the tails of its pdf are. With $n -> infinity$, the
Chi-squared distribution at the denominator becomes less and less
influential, and the Student t distribution approaches a normal
distribution. 
