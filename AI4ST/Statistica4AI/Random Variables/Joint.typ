#import "../Stats4AI_definitions.typ": *

Observing a single attribute is often too restrictive to analyze a problem.
In general, a complex scenario is the result of an interplay between many
phenomena, that ought to be observed simultaneously. In the realm of 
probability, this is equivalent to observing more than one random variable
at once.

Let $X$ and $Y$ be two discrete random variables defined on the same sample
space $Omega$ of an experiment. The *joint probability mass function* $p(x, 
y)$ (joint pmf, for short) is defined for each couple $(x, y)$ as:

$ p(x, y) = P({X = x} and {Y = y}) $

That is, the probability that $x$ is the realization of $X$ and at the same 
time that $y$ is the realization of $Y$. Of course, just as the pmf of a 
discrete random variable:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ p(x, y) gt.eq 0 $],
	[$ sum_(x in D(X)) sum_(y in D(Y)) p(x, y) = 1 $]
)

Let $A$ be a set consisting of pairs of $(x, y)$ values. The probability 
$P((X, Y) in A)$ that the random pair $(X, Y)$ lies in $A$ is obtained by
summing the joint pmf over pairs in $A$:

$ P((X, Y) in A) = sum_((X, Y) in A) sum p(x, y) $

The *marginal probability mass functions* of $X$ and $Y$, denoted respectively
by $p_(X)(x)$ and $p_(Y)(y)$, are given by:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ p_(X)(x) = sum_(y: p(x, y) > 0) p(x, y) forall x in D(X) $], 
	[$ p_(Y)(y) = sum_(x: p(x, y) > 0) p(x, y) forall y in D(Y) $]
)

That is, the sum of all values of a probabilities "locking" one variable
and "moving" along the other

// VERY bad phrasing

#exercise[
	Suppose that a particular company offers insurance policies for home and
	automobile in such a way that there exist different possible detractions
	for both policies:

	- For automobile insurance: $100 euro, 500 euro, 1000 euro$;
	- For home insurance: $500 euro, 1000 euro, 5000 euro$.

	Consider randomly selecting a customer having both home and automobile
	insurance. Let $X$ be the amount of automobile insurance policy deductible 
	and let $Y$ be the amount of home insurance policy deductible. Consider
	the following joint pmf for said variables:

	#table(
		columns: 4,
		[$p(x, y)$], [$500$], [$1000$], [$5000$],
		[$100$], [$0.3$], [$0.05$], [$0$],
		[$500$], [$0.15$], [$0.2$], [$0.05$],
		[$1000$], [$0.1$], [$0.1$], [$0.05$]
	)

	Is is well defined? What are the marginal probability mass functions of $X$
	and $Y$? What is the probability of $X$ being greater or equal than $500$? 
	What is the probability of $X$ and $Y$ being equal?
] <Insurance-policy>
#solution[
	The joint pmf is indeed well defined, because each probability is greater
	or equal than $0$ and:

	$ sum_(x in D(X)) sum_(y in D(Y)) p(x, y) = 0.3 + 0.05 + 0 + 0.15 + 0.2 + 
	  0.05 + 0.1 + 0.1 + 0.05 = 1 $

	The marginal probability mass function of $X$ is given by:

	$ sum_(y in D(Y)) p(X = 100, Y) = P(X = 100, Y = 500) + 
	  P(X = 100, Y = 1000) + P(X = 100, Y = 5000) = 0.3 + 0.05 + 0 = 0.35 $

	$ sum_(y in D(Y)) p(X = 500, Y) = P(X = 500, Y = 500) + 
	  P(X = 500, Y = 1000) + P(X = 500, Y = 5000) = 0.15 + 0.2 + 0.05 = 0.4 $

	$ sum_(y in D(Y)) p(X = 1000, Y) = P(X = 1000, Y = 500) + 
	  P(X = 1000, Y = 1000) + P(X = 1000, Y = 5000) = 0.1 + 0.1 + 0.05 = 0.25 $

	$ sum_(x in D(X)) p(X, Y = 500) = P(X = 100, Y = 500) + 
	  P(X = 500, Y = 500) + P(X = 1000, Y = 500) = 0.3 + 0.15 + 0.1 = 0.55 $

	$ sum_(x in D(X)) p(X, Y = 1000) = P(X = 100, Y = 1000) + 
	  P(X = 500, Y = 1000) + P(X = 1000, Y = 1000) = 0.05 + 0.2 + 0.1 = 0.35 $

	$ sum_(x in D(X)) p(X, Y = 5000) = P(X = 100, Y = 5000) + 
	  P(X = 500, Y = 5000) + P(X = 1000, Y = 5000) = 0 + 0.05 + 0.05 = 0.1 $

	$ p_(X)(x) = cases(
	  0.35 & "if" x = 100  and (y = 500 or y = 1000 or y = 5000),
	  0.4  & "if" x = 500  and (y = 500 or y = 1000 or y = 5000),
	  0.25 & "if" x = 1000 and (y = 500 or y = 1000 or y = 5000)) $

	$ p_(Y)(y) = cases(
	  0.55 & "if" y = 500  and (x = 100 or x = 500 or x = 1000),
	  0.35 & "if" y = 1000 and (x = 100 or x = 500 or x = 1000),
	  0.1  & "if" y = 5000 and (x = 100 or x = 500 or x = 1000)) $

	The probability of $X$ being greater than $500$ can be retrieved by 
	focusing on the values of $X$ and ignoring the ones of $Y$:

	$ P(X gt.eq 500) = 0.15 + 0.2 + 0.05 + 0.1 + 0.1 + 0.05 = 0.65 $

	The only values that $X$ and $Y$ can both assume are $500$ and $1000$.
	Therefore:

	$ P(X = Y) = P({X = 500 and Y = 500} union {X = 1000 and Y = 1000}) = \
	  P(X = 500 and Y = 500) + P(X = 1000 and Y = 1000) = 0.15 + 0.1 = 0.25 $
]

In the more general case of having $n$ discrete random variables 
$X_(1), X_(2), dots, X_(n)$, the joint pmf of said variables is 
given by the function:

$ p(x_(1), x_(2), dots, x_(n)) = 
  P(X_(1) = x_(1), X_(2) = x_(2), dots, X_(n) = x_(n)) $

Let $X$ and $Y$ be two continuous random variables defined on the same sample
space $Omega$ of an experiment. The *joint probability density function* $f(x, 
y)$ (joint pmf, for short) is a function such that, for any two-dimensional
set $A$:

$ P((X, Y) in A) = integral_(A) integral f(x, y) d x d y $

Of course, just as the pdf of a continuous random variable:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ f(x, y) gt.eq 0 $],
	[$ integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) 
	   f(x, y) d x d y = 1 $]
)

In particular, if $A$ is the two-dimensional rectangle ${(x, y): a lt.eq x 
lt.eq b, c lt.eq y lt.eq d}$, then:

$ P((X, Y) in A) = P(a lt.eq X lt.eq b, c lt.eq Y lt.eq d) = 
  integral_(a)^(b) integral_(c)^(d) f(x, y) d x d y $
  
The *marginal probability density functions* of $X$ and $Y$, denoted 
respectively by $f_(X)(x)$ and $f_(Y)(y)$, are given by:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ f_(X)(x) = integral_(-infinity)^(+infinity) f(x, y) d y 
	   "for" -infinity < x < +infinity $], 
	[$ f_(Y)(y) = integral_(-infinity)^(+infinity) f(x, y) d x
	   "for" -infinity < y < +infinity $]
)

In the more general case of having $n$ continuous random variables 
$X_(1), X_(2), dots, X_(n)$, the joint pdf of said variables is the
function $f(x_(1), x_(2), dots, x_(n))$ such that for any $n$ intervals
$[a_(1), b_(1)], dots, [a_(n), b_(n)]$:

$ P(a_(1) lt.eq X_(1) lt.eq b_(1), dots, a_(n) lt.eq X_(n) lt.eq b_(n)) =
  integral_(a_(1))^(b_(1)) dots integral_(a_(n))^(b_(n)) f(x_(1), dots, x_(n))
  d x_(1), dots, d x_(n) $

The notion of dependence and independence of two random variables can 
be phrased in the language of joint probability mass/density functions. 
Two random variables $X$ and $Y$ are said to be independent if, for
any pair $(x, y)$ with $x$ being a realization of $X$ and $y$ being a
realization of $Y$, the following holds:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ p(x, y) = p_(X)(x) dot p_(Y)(y) "with" X, Y "discrete" $],
	[$ f(x, y) = f_(X)(x) dot f_(Y)(y) "with" X, Y "continuous" $]
)

Otherwise, $X$ and $Y$ are dependent (not independent).

#exercise[
	Consider @Insurance-policy. Are $X$ and $Y$ dependent or independent?
]
#solution[
	$X$ and $Y$ are not independent, and it can be shown with a single 
	counterexample. Consider $X = 1000$ and $Y = 5000$:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ P(X = 1000 and Y = 5000) = 0.05 $],
		[$ P(X = 1000) dot P(Y = 5000) = 0.25 dot 0.1 = 0.025 $]
	)

	Since the two values differ, $X$ and $Y$ ought to be dependent.
]

Moreover, joint pmf/pdf can be used to prove the linearity of 
expected value and variance.

#theorem[
	For any two random variables $X$ and $Y$ with supports $D(X)$ and
	$D(Y)$ respectively, $E[X + Y] = E[X] + E[Y]$.
] <Expected-value-linear-function>
// #proof[
// To be added
// ]

Unlike the expected value, the variance is not always a linear
function, but only when the variables at hand are independent.

#theorem[
	For any two independent random variables $X$ and $Y$ with supports
	$D(X)$ and $D(Y)$ respectively, $V[X + Y] = V[X] + V[Y]$.
] <Variance-linear-function>
// #proof[
// To be added
// ]

In the more general case of having $n$ random variables $X_(1), X_(2), dots, 
X_(n)$, said variables are independent if for any subset $X_(i_(1)), X_(i_(2)),
dots, X_(i_(k))$ of size $k in [2, n]$, the joint pmfs or pdfs is equal to the 
product of the marginal pmfs or pdfs.

Let $X$ and $Y$ be two discrete random variables with joint pmf $p(x, y)$
and marginal pmf of $X$ $p_(X)(x)$. Then, for any $X$ value $x$ for which
$p_(X)(x) > 0$, the *conditional probability mass function of Y given
that X = x* is:

$ p_(Y | X)(y | x) = frac(p(x\, y), p_(X)(x)) forall y in D(Y) $

Let $X$ and $Y$ be two continuous random variables with joint pdf $f(x, y)$
and marginal pdf of $X$ $f_(X)(x)$. Then, for any $X$ value $x$ for which
$f_(X)(x) > 0$, the *conditional probability density function of Y given
that X = x* is:

$ f_(Y | X)(y | x) = frac(f(x\, y), f_(X)(x)) "for" -infinity < y < +infinity $

Let $X$ and $Y$ be two random variables having a joint pmf $p(x, y)$ or 
joint pdf $f(x, y)$ (according to whether they are discrete or continuous). 
Then the expected value of a function $h(X, Y)$, denoted as $E[h(X, Y)]$ or 
$mu_(h(X, Y))$, is given by:

$ E[h(X, Y)] = cases(
  sum_(x in D(X)) sum_(y in D(Y)) h(x, y) dot p(x, y)
  & "if" X "and" Y "are discrete",
  integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) 
  h(x, y) dot f(x, y) d x d y
  & "if" X "and" Y "are continuous") $
  
The *covariance* between two random variables $X$ and $Y$ is given by:

$ "Cov"(X, Y) = cases(
  sum_(x in D(X)) sum_(y in D(Y)) (x - E(X))(y - E(Y)) p(x, y)
  & "if" X "and" Y "are discrete",
  integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) 
  (x - E(X)) (y - E(Y)) f(x, y) d x d y
  & "if" X "and" Y "are continuous") $
  
The covariance is particularly useful for analyzing the linear similarity of
two dependent random variables.

#exercise[
	Consider @Insurance-policy. Compute the covariance of $X$ and $Y$.
]
#solution[
	First, the expected value of $X$ and $Y$ have to be computed:
	
	$ E(X) = sum_(x in D(X)) x dot P(X = x) = 100 dot 0.35 + 500 dot 0.4 +
		1000 dot 0.25 = 485 $

	$ E(Y) = sum_(y in D(Y)) y dot P(Y = y) = 500 dot 0.55 + 1000 dot 0.35 +
		5000 dot 0.1 = 1125 $

	It is then possible to compute the covariance as:

	$ "Cov"(X, Y) = 
	  sum_(x in D(X)) sum_(y in D(Y)) (x - E(X))(y - E(Y)) p(x, y) = 
	  (100 - 485) (500 - 1125) (0.3) + \ (100 - 485) (1000 - 1125) (0.05) + 
	  (100 - 485) (5000 - 1125) (0) + (500 - 485) (500 - 1125) (0.15) + \
	  (500 - 485) (1000 - 1125) (0.2) + (500 - 485) (5000 - 1125) (0.05) + 
	  (1000 - 485) (500 - 1125) (0.1) + \ (1000 - 485) (1000 - 1125) (0.1) + 
	  (1000 - 485) (5000 - 1125) (0.05) = 136875 $
]

#theorem[
	Let $X$ and $Y$ be two random variables, and let $a$ and $b$ be two real
	numbers. The following equality holds:

	$ "Cov"(a X, b Y) = a b "Cov"(X, Y) $
]
// #proof[
// To be added
// ]

#theorem[
	Let $X$ and $Y$ be two random variables. The following equality holds:

	$ "Cov"(X, Y) = E(X Y) - E(X) dot E(Y) $
]
// #proof[
// To be added
// ]

Since the covariance has no minimum and no maximum, it isn't really 
indicative of the order of magnitude of the random variables.

A better measure of the relationship between two random variables $X$ and 
$Y$ is given by the *correlation coefficient*, denoted as $"Corr"(X, Y)$
or $rho_(X, Y)$ and given by:

$ "Corr"(X, Y) = frac("Cov"(X\, Y), V(X) V(Y)) $

#theorem[
	For any pair of random variables $X$ and $Y$,
	$-1 lt.eq "Corr"(X, Y) lt.eq 1$.
] <Correlation-coefficient-is-bounded>
// #proof[
// To be added
// ]

The correlation coefficient is more descriptive of the relationship 
between two random variables than their variance because, as stated 
in @Correlation-coefficient-is-bounded, it is bounded, and therefore 
is indicative of the scale of the values of the variables.

#theorem[
	Let $X$ and $Y$ be two random variables. If $"Corr"(X, Y) = 
	plus.minus 1$, there exist two real numbers $a$ and $b$, with
	$a != 0$, such that $Y = a X + b$.
] <Correlation-coefficient-as-linear-similarity>
// #proof[
// To be added
// ]

@Correlation-coefficient-as-linear-similarity can be generalized 
by stating that if $"Corr"(X, Y)$ is close to $plus.minus 1$, it 
means that the two random variables are almost linearly correlated, 
while if it is close to $0$ it means that the two random variables 
are poorly linearly correlated, or not correlated at all. 

#lemma[
	If $X$ and $Y$ are two independent random variables,
	$"Corr"(X, Y) = 0$.
]
// #proof[
// To be added
// ]

#theorem[
	Let $X$ and $Y$ be two random variables, and let $a$, $b$, $c$ and 
	$d$ be four real numbers. If $a$ and $c$ have the same sign, the 
	following equality holds:

	$ "Corr"(a X + b, c Y + d) = "Corr"(X, Y) $
]
// #proof[
// To be added
// ]

An example of a bivariate distribution is the *bivariate normal distribution*,
an extension of the normal distribution in two dimensions:

$ f(x, y) = frac(1, pi sigma_(x) sigma_(y) sqrt(1 - rho^(2)))
  exp(-frac(1, 2(1 - rho^(2))) [(frac(x - mu_(x), sigma_(x)))^(2) +
  (frac(y - mu_(y), sigma_(y)))^(2) -2 rho(frac(x - mu_(x), sigma_(x)))
  (frac(y - mu_(y), sigma_(y)))]) $

