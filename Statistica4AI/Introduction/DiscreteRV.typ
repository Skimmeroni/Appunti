#import "../Stats4AI_definitions.typ": *

As already stated, Kolmogorov axioms define the properties of probability
but do not offer a method for assigning them to events. The simplest
approaches, such as assigning the same probability to each event, are
far to weak to model reality. A more powerful concept to be introduced
which can help model probability is the *random variable*.

A random variable can be conceived as a mapping from the sample space
to the real line. In other words, a random variable is a function that
assigns a probability to any possible event of the sample space. Given
a sample space $cal(S)$, a random variable $X$ for such sample space is
defined as $X : cal(S) |-> RR$, and the probability of such variable
to assume a certain value $x$ of the sample space is denoted as $P(X = x)$.

// ADD AN EXAMPLE OF A RANDOM VARIABLE

Random variables fall in two broader categories: *discrete* and *continuous*.
A random variable is said to be discrete if the set of values it can assume
is either finite or countably infinite. A random variable is said to be
continuous if the two following properties apply:

+ Its set of possible values consists either of all numbers in a
  single (possibly infinite) interval on the real line or all numbers
  in a disjoint union of such intervals;
+ The probability of the random variable to assume a specific value is
  always zero.

The set of values that a random variable can assume is called its *support*.

The *probability mass function* (abbreviated as pmf) of a discrete random
variable $X$, denoted as $p(X)$, is a function that assigns a probability
to each possible value that such random variable can assume. More formally,
given a random variable $X$, for each value $x$ of its sample space the pmf
of $X$ is defined as:

$ p(x) = P(X = x) = P(omega: omega in cal(S), X(omega) = x) $

// Example goes here

The *cumulative distribution function* (abbreviated as cdf) of a discrete
random variable $X$, denoted as $F(X)$, is defined as the probability of
such random variable to assume a value less than or equal to a threshold.
More formally, given a random variable $X$, for each value $x$ of its sample
space the cdf of $X$ is defined as:

$ F(x) = P(X lt.eq x) = sum_(y: y lt.eq x) p(y) $

// Example goes here, OneNote one, with graphs and such

Let $X$ be a discrete random variable with support $D$ and probability mass
function $p(X)$. The *expected value* (or *mean value*) of $X$, denoted as
$E(X)$ or $mu_(X)$ is given by:

$ E(X) = mu_(X) = sum_(x in D) x dot p(x) $

When the variable $X$ is known, the pedix $X$ in $mu_(X)$ is omitted.

The expected value of a random variable is the equivalent of the mean with
respect to populations.

#exercise[
	Let $X$ be the Apgar score of a randomly selected child born at a certain
	hospital during the next year, with pmf as follows:

	#align(center,
		[#table(
			columns: 12,
			stroke: none,
			[$X$], [$0$], [$1$], [$2$], [$3$], [$4$], [$5$], [$6$], [$7$],
			[$8$], [$9$], [$10$],
			[$p(X)$], [$0.002$], [$0.001$], [$0.002$], [$0.005$], [$0.02$],
			[$0.04$], [$0.18$], [$0.37$], [$0.25$], [$0.12$], [$0.01$]
		)]
	)

	What is the expected value of $X$?
]
#solution[
	$ E(X) = sum_(x in D) x dot p(x) =
	  0 dot 0.002 + 1 dot 0.001 + 2 dot 0.002 + 3 dot 0.005 + 4 dot 0.02 +
	  5 dot 0.04 + 6 dot 0.18 + \ 7 dot 0.37 + 8 dot 0.25 + 9 dot 0.12 +
	  10 dot 0.01 = 7.15 $
]

The expected value is oblivious to whether its argument is a random variable
or a function whose input is a random variable. In other words, let $X$ be a
discrete random variable with support $D$ and probability mass function $p(X)$,
and let $h(X)$ be a function whose argument is (the realization of) the random
variable $X$. The expected value of $h(X)$ is still defined as:

$ E(h(X)) = mu_(h(X)) = sum_(x in D) h(x) dot p(x) $

#theorem[
	Let $X$ be a discrete random variable with support $D$ and probability
	mass function $p(X)$. Given two coefficients $a$ and $b$, the following
	equality holds:

	$ E(a X + b) = a E(X) + b $
] <Expected-value-linear-transformations>
#proof[
	Let $D$ be the support of $X$ and $p(X)$ its probability mass function.
	Let $Y$ be the random variable $Y = a X + b$. The probability of $Y$ to
	assume a particular value $a x + b$ does not depend on $a$ and $b$, but
	only on $x$. Therefore, $P(Y = a x + b) = P(X = x)$. Computing the expected
	value for $Y$ gives:

	$ E(Y) = sum_(x in D) (a x + b) dot P(Y = a x + b) =
	  sum_(x in D) (a x + b) dot P(X = x) =
	  sum_(x in D) a x dot P(X = x) + b dot P(X = x) = \
	  a sum_(x in D) x dot P(X = x) + b sum_(x in D) P(X = x) =
	  a E(X) + b dot 1 = a E(X) + b $

	Where $sum_(x in D) P(X = x) = 1$ stems from the fact that said summation
	is the sum of the probabilities of the entire sample space, which is $1$
	by definition.
]

#theorem[
	Let $X$ and $Y$ be two random variables. $E[X + Y] = E[X] + E[Y]$.
] <Expected-value-linear-function>
// #proof[
// To be added
// ]

Let $X$ be a discrete random variable with support $D$ and probability mass
function $p(X)$. The *variance* of $X$, denoted as $V(X)$ or $sigma^(2)_(X)$
is given by:

$ V(X) = sigma^(2)_(X) = sum_(x in D) (x - E(X))^(2) dot p(x) =
  E((X - E(X))^(2)) $

When the variable $X$ is known, the pedix $X$ in $sigma^(2)_(X)$ is omitted.

The square root of the variance is called the *standard deviation*:

$ S D (X) = sigma_(X) = sqrt(V(X)) $

The variance and the standard deviation measure how a random variable is
"spread out", in the sense of how much the values of the support of said
variable are detached from its expected value.

#lemma[
	Let $X$ be a discrete random variable with support $D$ and probability
	mass function $p(X)$. The following equality holds:

	$ V(X) = (sum_(x in D) x^(2) dot p(x)) - (E(X))^(2) =
	  E(X^(2)) - (E(X))^(2) $
] <Alternative-form-for-variance>
// #proof[
// To be added
// ]

#theorem[
	Let $X$ be a discrete random variable with support $D$ and probability
	mass function $p(X)$. Given two coefficients $a$ and $b$, the following
	equality holds:

	$ V(a X + b) = a^(2) V(X) $
] <Variance-linear-transformations>
#proof[
	Let $Y$ be the random variable $Y = a X + b$. From
	@Expected-value-linear-transformations, $E(Y) = E(a X + b) = a E(X) + b$.
	Substituting this expression in the variance one gives:

	$ V(Y) = E((Y - E(Y))^(2)) =
	  E((a x + cancel(b) - a E(X) - cancel(b))^(2)) =
	  sum_(x in D) (a x - a E(X))^(2) P(Y = a x + b) = \
	  sum_(x in D) a^(2) (x - E(X))^(2) P(X = x) =
	  a^(2) sum_(x in D) (x - E(X))^(2) P(X = x) =
	  a^(2) V(X) $
]

#theorem[
	Let $X$ and $Y$ be two random variables. $V[X + Y] = V[X] + V[Y]$
	if $X$ and $Y$ are independent.
] <Variance-linear-function>
// #proof[
// To be added
// ]
