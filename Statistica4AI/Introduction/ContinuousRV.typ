#import "../Stats4AI_definitions.typ": *

The *probability density function* (abbreviated as pdf) of a continuous
random variable $X$ is a function $f(x)$ such that, for any pair of numbers
$a$ and $b$:

$ P(a lt.eq X lt.eq B) = integral_(a)^(b) f(x) d x $

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

Suppose $a lt.eq b$. The pdf and cdf are strongly related:

$ P(a lt.eq X lt.eq b) = P(X lt.eq b) - P(X lt.eq a) = F(b) - F(a) $

// A random variable is said to have a *uniform distribution* on the interval
// $[a, b]$ is the pdf of said variable is:

// $ f(x) = cases(display(frac(1, b - a)) "if" & a lt.eq x lt.eq b,
//  0 & "otherwise") $
