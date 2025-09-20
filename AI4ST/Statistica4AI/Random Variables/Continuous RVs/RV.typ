#import "../../Stats4AI_definitions.typ": *

Continuous random variables don't really have a concept of support, since
a probability can be assigned to any real value. For this very reason, the
only sensible way to describe the probability assignment for the values that
it can take is through a function.

The *probability density function* (*pdf* for short) of a continuous
random variable $X$ is a function that, for any $a, b in RR$, returns
the probability of $X$ to take on a value somewhere in $[a, b]$ when
integrated in such interval. The pdf of $X$ is denoted as $f(X)$, and
is formally defined as:

$ P(a lt.eq X lt.eq b) = integral_(a)^(b) f(x) d x $

The graph of $f(x)$ is often referred to as the *density curve* of
the random variable. Stated otherwise, $P(a lt.eq X lt.eq b)$ is
given by the area under the section of the density curve of extremes
$a$ and $b$.

To ensure compliance with the Kolmogorov axioms, any pdf $f(X)$ must
satisfy two conditions:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ forall x, f(x) gt.eq 0 $],
	[$ integral_(-infinity)^(+infinity) f(x) d x = 1 $]
)

#exercise[
	The amount of gravel (in tons) sold by a particular construction
	supply company in a given week can be modeled as a continuous
	random variable $X$ with pdf:

	$ f(x) = cases(display(frac(3, 2)(1 - x^(2))) & "if" 0 lt.eq x lt.eq 1,
	               0 & "otherwise") $

	If this pdf well-defined? If it is, what is the probability of 
	the company having sold between $0.75$ and $0.9$ tons of gravel? 
] <Gravel>
#solution[
	This is a valid pdf because it's always non-negative and when
	integrated over the entire number line gives $1$:

	$ integral_(-infinity)^(+infinity) f(x) d x &=
	  integral_(-infinity)^(0) 0 d x +
	  integral_(0)^(1) frac(3, 2)(1 - x^(2)) d x +
	  integral_(0)^(+infinity) 0 d x =
	  0 + integral_(0)^(1) frac(3, 2)(1 - x^(2)) d x + 0 = \
	  &= frac(3, 2) integral_(0)^(1) (1 - x^(2)) d x =
	  frac(3, 2) (integral_(0)^(1) 1 d x - integral_(0)^(1) x^(2) d x) =
	  frac(3, 2) ([x]_(0)^(1) - [frac(x^(3), 3)]_(0)^(1)) = \
	  &= frac(3, 2) ((1 - 0) - (frac(1^(3), 3) - frac(0^(3), 3))) =
	  frac(3, 2) (1 - frac(1, 3)) = frac(3, 2) dot frac(2, 3) = 1 $

	To get $P(0.75 lt.eq X lt.eq 0.9)$:

	$ P(0.75 lt.eq X lt.eq 0.9) &=
	  integral_(0.75)^(0.9) f(x) d x =
	  frac(3, 2) integral_(0.75)^(0.9) (1 - x^(2)) d x =
	  frac(3, 2) (integral_(0.75)^(0.9) 1 d x - integral_(0.75)^(0.9) x^(2) d x) = \
	  &= frac(3, 2) ([x]_(0.75)^(0.9) - [frac(x^(3), 3)]_(0.75)^(0.9)) = 
	  frac(3, 2) ((0.9 - 0.75) - frac(1, 3) ((0.9)^(3) - (0.75)^(3))) approx \
	  &= frac(3, 2) (0.15 - 0.1) = 1.5 dot 0.05 = 0.075 $

	#figure(
		caption: [Plot of the density curve $f(x)$. The shaded area is
		          $P(0.75 lt.eq X lt.eq 0.9)$.],
		image("pdf.svg", width: 75%)
	)
]

Notice the difference between discrete and continuous variables: the
pmf of discrete variables immediately gives probabilities, while the
pdf of continuous variables has to be integrated. Also, as anticipated,
the probability of a continuous random variable $X$ to take on a specific
value $c in RR$ is always $0$ #footnote[This is sound even from a logical
perspective. The chance of picking a specific value in (a subset of) $RR$
is necessarely infinitesimal, since $RR$ is not a countable set.]:

$ P(X = c) =
  P(c lt.eq X lt.eq c) =
  integral_(c)^(c) f(x) d x =
  lim_(epsilon -> 0) 
  integral_(c - epsilon)^(c + epsilon) f(x) d x =
  0 $

This also implies that taking into account the extremes of an interval when
computing probabilities makes no difference:

$ P(a lt.eq X lt.eq b) =
  P(a < X lt.eq b) =
  P(a lt.eq X < b) =
  P(a < X < b) $

The *cumulative distribution function* (*cdf* for short) of a continuous
random variable $X$ is defined as the probability of such random variable
to take a value less than or equal to a threshold. The cdf of $X$ is denoted
as $F(X)$, and is formally defined as:

$ F(x) = P(X lt.eq x) = integral_(-infinity)^(x) f(t) d t $

The cdf for continuous random variables is the continuous counterpart
to the cdf for discrete random variables, replacing a summation with
an integral. This implies that to obtain the pdf from the cdf of a
random variable, it suffices to take the derivative of the cdf.

#exercise[
	What is the cdf of the variable $X$ in @Gravel?
]
#solution[
	The cdf of $X$ is clearly $0$ for $x < 0$:

	$ F(x) =
	  integral_(-infinity)^(x) f(t) d t = 
	  integral_(-infinity)^(x) 0 d t = 0 $

	For $x in [0, 1]$:

	$ F(x) &= integral_(-infinity)^(x) f(t) d t =
	  integral_(-infinity)^(0) f(t) d t + integral_(0)^(x) f(t) d t =
	  integral_(-infinity)^(0) 0 d t + integral_(0)^(x) frac(3, 2)(1 - t^(2)) d t = \
	  &= 0 + frac(3, 2) (integral_(0)^(x) 1 d t - integral_(0)^(x) t^(2) d t) =
	  frac(3, 2) [(x - 0) - (frac(x^(3), 3) - frac(0^(3), 3))] = \
	  &= frac(3, 2) (x - frac(x^(3), 3)) = frac(1, 2) x (3 - x^(2)) $

	For $x > 1$:

	$ F(x) = integral_(-infinity)^(x) f(t) d t =
	  integral_(-infinity)^(0) f(t) d t +
	  integral_(0)^(1) f(t) d t +
	  integral_(1)^(x) f(t) d t = 
	  0 + 1 + 0 = 1 $

	This gives:

	$ F(x) = cases(0 & "if" x < 0,
	               display(frac(1, 2) x (3 - x^(2))) & "if" 0 lt.eq x lt.eq 1,
	               1 & "otherwise") $	

	#figure(
		caption: [Plot of the cdf $F(x)$.],
		image("cdf.svg", width: 75%)
	)
]

It's possible to connect the probabilities computed from the cdf of a
continuous random variable with the probabilities computed from the pdf
in the following way. For a given sample space $cal(S)$, let $X : cal(S)
mapsto RR$ be a continuous random variable with known cdf $F(x)$. For any
$a, b in RR$:

$ P(a lt.eq X lt.eq b) =
  integral_(a)^(b) f(x) d x =
  integral_(-infinity)^(b) f(x) d x - integral_(-infinity)^(a) f(x) d x =
  F(b) - F(a) $

It's also easy to show that:

$ P(X > x) =
  integral_(x)^(+infinity) f(t) d t =
  integral_(-infinity)^(+infinity) f(t) d t -
  integral_(-infinity)^(x) f(t) d t =
  1 - F(x) $

Let $p$ be a real number between $0$ and $1$. The *(100p)-th percentile* of
the distribution of a continuous random variable $X$, denoted as $eta (p)$
is defined by:

$ p = F(eta(p)) = integral_(-infinity)^(eta(p)) f(t) d t $

That is, the cdf of $X$ evaluated at $eta(p)$. In particular, the $50$-th
percentile is also called the *median*, denoted $tilde(mu)_(X)$ (or just
$tilde(mu)$ if there's no ambiguity).

#exercise[
	What is the median of the variable $X$ in @Gravel?
]
#solution[
	The median is given by setting $p = 0.5$. Applying the formula gives:

	$ 0.5 = F(eta(p)) =>
	  frac(1, 2) = frac(1, 2) eta(p) (3 - (eta(p))^(2)) =>
	  (eta(p))^(3) - 3eta(p) + 1 = 0 $

	The possible (approximated) solutions #footnote[Computed with `R`
	issuing `polyroot(c(1, -3, 0, 1))`] are $0.3473$, $-1.8794$ and
	$1.5321$. The first solution is the only acceptable one, since
	the other two fall outside of $[0, 1]$.
]

Let $X$ be a continuous random variable and probability density function
$f(X)$. The *expected value* (or *mean value*) of $X$, denoted as $E(X)$
or $mu_(X)$, is the continuous counterpart to the expected value of
discrete random variables:

$ E(X) = mu_(X) = integral_(-infinity)^(+infinity) x dot f(x) d x $

When the variable $X$ is known from context, the pedix $X$ in $mu_(X)$
is omitted.

#exercise[
	What is the expected value of the variable $X$ in @Gravel?
]
#solution[
	$ E(X) &= integral_(-infinity)^(+infinity) x dot f(x) d x =
	  integral_(-infinity)^(0) x dot f(x) d x +
	  integral_(0)^(1) x dot f(x) d x +
	  integral_(1)^(+infinity) x dot f(x) d x = \
	  &= 0 + integral_(0)^(1) x dot frac(3, 2)(1 - x^(2)) d x + 0 =
	  frac(3, 2) integral_(0)^(1) x - x^(3) d x =
	  frac(3, 2) (integral_(0)^(1) x d x - integral_(0)^(1) x^(3) d x) = \
	  &= frac(3, 2) ((frac(1^(2), 2) - frac(0^(2), 2)) -
	  (frac(1^(4), 4) - frac(0^(4), 4))) =
	  frac(3, 2) (frac(1, 2) - frac(1, 4)) = frac(3, 8) approx 0.375 $
]

The expected value is oblivious to whether its argument is a random
variable or a function whose input is a random variable. In other
words, let $X$ be a continuous random variable and pdf $p(X)$, and
let $h(X)$ be a function whose argument is $X$ itself. The expected
value of $h(X)$ is still defined as:

$ E(h(X)) = mu_(h(X)) = integral_(-infinity)^(+infinity) h(x) dot f(x) d x $

#theorem[
	Let $X$ be a continuous random variable with pdf $f(x)$.
	For any $a, b in RR$:

	$ E(a X + b) = a E(X) + b $
] <Expected-value-linear-transformations-2>
#proof[
	Let $h(x) = a X + b$. Then:

	$ E(h(x)) &=
	  E(a X + b) =
	  integral_(-infinity)^(+infinity) (a x + b) dot f(x) d x =
	  integral_(-infinity)^(+infinity) a x dot f(x) + b dot f(x) d x = \
	  &= a integral_(-infinity)^(+infinity) x dot f(x) d x + b integral_(-infinity)^(+infinity) f(x) d x =
	  a E(X) + b dot 1 = a E(X) + b $

	Since $integral_(-infinity)^(+infinity) f(x) d x = 1$ by definition.
]

Let $X$ be a continuous random variable with probability density function
$f(x)$. The *variance* of $X$, denoted as $V(X)$ or $sigma^(2)_(X)$, is a
measure of how the values taken by the variable differ from the expected
value:

$ V(X) = sigma^(2)_(X) =
  integral_(-infinity)^(+infinity) (x - E(X))^(2) dot f(x) d x =
  E((X - E(X))^(2)) $

When the variable $X$ is known from context, the pedix $X$ in
$sigma^(2)_(X)$ is omitted.

#exercise[
	What is the variance of the variable $X$ in @Gravel?
]
#solution[
	$ V(X) &= integral_(-infinity)^(+infinity) (x - E(X))^(2) dot f(x) d x = \
	  &= integral_(-infinity)^(0) (x - frac(3, 8))^(2) dot 0 d x +
	  integral_(0)^(1) (x - frac(3, 8))^(2) dot frac(3, 2)(1 - x^(2)) d x +
	  integral_(1)^(+infinity) (x - frac(3, 8))^(2) dot 0 d x = \
	  &= 0 + frac(3, 2) integral_(0)^(1) (x - frac(3, 8))^(2) (1 - x^(2)) d x + 0 =
	  frac(3, 2) integral_(0)^(1) (x^(2) + frac(9, 64) - frac(3, 4) x) (1 - x^(2)) d x = \
	  &= frac(3, 2) integral_(0)^(1) x^(2) + frac(9, 64) - frac(3, 4) x - x^(4) - frac(9, 64) x^(2) + frac(3, 4) x^(3) d x = \
	  &= frac(3, 2) (frac(9, 64) integral_(0)^(1) d x -
	                frac(3, 4) integral_(0)^(1) x d x -
	                integral_(0)^(1) x^(4) d x +
	                frac(55, 64) integral_(0)^(1) x^(2) d x +
	                frac(3, 4) integral_(0)^(1) x^(3) d x) = \
	  &= frac(3, 2) (frac(9, 64) dot 1 -
	                frac(3, 4) dot frac(1, 2) -
	                frac(1, 5) +
	                frac(55, 64) dot frac(1, 3) +
	                frac(3, 4) dot frac(1, 4)) =
	  frac(3, 2) dot frac(19, 480) = frac(19, 320) approx 0.059 $
]

The square root of the variance is called the *standard deviation*:

$ S D (X) = sigma_(X) = sqrt(V(X)) $

@Alternative-form-for-variance-2 gives a simpler way to compute the
variance of a continuous random variable.

#lemma[
	Let $X$ be a continuous random variable with probability
	density function $f(x)$. The following equality holds:

	$ V(X) = E(X^(2)) - (E(X))^(2) $
] <Alternative-form-for-variance-2>
#proof[
	Expanding the square in the formula:

	$ V(X) &=
	  integral_(-infinity)^(+infinity) (x - E(X))^(2) dot f(x) d x = 
	  integral_(-infinity)^(+infinity) (x^(2) + (E(X))^(2) - 2 x E(X)) dot f(x) d x = \
	  &= integral_(-infinity)^(+infinity) x^(2) dot f(x) + (E(X))^(2) dot f(x) - 2 x E(X) dot f(x) d x = \
	  &= integral_(-infinity)^(+infinity) x^(2) dot f(x) d x + integral_(-infinity)^(+infinity) (E(X))^(2) dot f(x) d x - integral_(-infinity)^(+infinity) 2 x E(X) dot f(x) d x = \
	  &= E(X^(2)) + (E(X))^(2) integral_(-infinity)^(+infinity) f(x) d x - 2 E(X) integral_(-infinity)^(+infinity) x dot f(x) d x = \
	  &= E(X^(2)) + (E(X))^(2) dot 1 - 2 E(X) dot E(X) = \
	  &= E(X^(2)) + (E(X))^(2) - 2 (E(X))^(2) =
	  E(X^(2)) - (E(X))^(2) $
]

#theorem[
	Let $X$ be a continuous random variable and pdf $f(x)$.
	For any $a, b in RR$:

	$ V(a X + b) = a^(2) V(X) $
] <Variance-linear-transformations-2>
#proof[
	Applying @Expected-value-linear-transformations-2:

	$ V(a X + b) &=
	  E(((a X + b) - E(a X + b))^(2)) =
	  E((a X + cancel(b) - a E(X) - cancel(b))^(2)) = \
	  &- E((a (X - E(X)))^(2)) =
	  E(a^(2) (X - E(X))^(2)) =
	  a^(2) E((X - E(X))^(2)) = \
	  &= a^(2) V(X) $
]
