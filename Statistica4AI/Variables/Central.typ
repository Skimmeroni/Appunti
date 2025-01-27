#import "../Stats4AI_definitions.typ": *

Consider a sequence $angle.l X_(n) angle.r = {X_(1), X_(2), dots, X_(n)}$
of identically distributed random variables such that their CDF depends on
their index. That is, for each $i in [1, n]$, the $i$-th random variable
has as CDF a functions $F_(i)(x)$ that depends on the value of $i$. The
sequence $angle.l X_(n) angle.r$ is said to be *convergent in distribution*
to a random variable $X$ having CDF $F(x)$ if the following limit is valid
for each $t in RR$ such that $F$ is continuous:

$ lim_(n -> +infinity) F_(n)(t) = F(t) $

To denote that a sequence of (identically distributed) random variables
is convergent in distribution to a random variable $X$, the notation
$angle.l X_(n) angle.r ->^(d) X$ is used.

In simpler terms, if $angle.l X_(n) angle.r ->^(d) X$ is true it means
that $F_(n)(t)$ (dependent on $n$) is approximately equal to $F(t)$ (non
dependent on $n$) and that the values of the indices of $angle.l X_(n)
angle.r$ (expected value, variance, ecc...) are approximately equal to
those of $X$.

#exercise[
	Consider the following sequence $angle.l X_(n) angle.r in NN$ of random
	variables having the following CDF (dependent on $n$):

	$ F_(n)(t) = cases(
		0 & "if" t lt.eq 0,
		t^(frac(n, n + 1)) & "if" 0 < t < 1,
		1 & "if" t gt.eq 1
	) $

	Study its convergence.
]
#solution[
	For $t lt.eq 0$ and $t gt.eq 1$, the CDF $F_(n)(t)$ is a constant, and
	therefore unproblematic. In the case of $0 < t < 1$, the limit is:

	$ lim_(n -> +infinity) t^(frac(n, n + 1)) =
	  t^(lim_(n -> +infinity) frac(n, n + 1)) =
	  t^(lim_(n -> +infinity) frac(1, 1 + frac(1, n))) =
	  t^(frac(1, 1 + frac(1, +infinity))) =
	  t^(frac(1, 1 + 0)) = t^(1) = t $

	Therefore, $angle.l X_(n) angle.r$ converges in distribution to a random
	variable having the following CDF (that does not depend on $n$):

	$ F(t) = cases(
		0 & "if" t lt.eq 0,
		t & "if" 0 < t < 1,
		1 & "if" t gt.eq 1
	) $
]

Consider a sequence $angle.l X_(n) angle.r = {X_(1), X_(2), dots, X_(n)}$
of identically distributed random variables such that their CDF depends on
their index. The sequence $angle.l X_(n) angle.r$ is said to be *convergent
in probability* to a random variable $X$ if, for any $epsilon > 0$:

$ lim_(n -> +infinity) P(abs(X_(n) - X) < epsilon) = 1 $

To denote that a sequence of (identically distributed) random variables
is convergent in probability to a random variable $X$, the notation
$angle.l X_(n) angle.r ->^(p) X$ is used.

In simpler terms, a sequence $angle.l X_(n) angle.r$ is convergent in
probability the probability of an "unusual" outcome becomes smaller and
smaller as the sequence progresses.

#theorem("Weak Law of Large Numbers")[
	Let $angle.l X_(n) angle.r = {X_(1), X_(2), dots, X_(n)}$ be a sequence
	of identically distributed random variables. Let $overline(X)_(n)$ be
	the arithmetic mean of $angle.l X_(n) angle.r$, computed as the ratio of
	the sum of the random variables in $angle.l X_(n) angle.r$ and the
	number of variables $n$:

	$ overline(X)_(n) = frac(X_(1) + X_(2) + dots + X_(n), n) $

	Since the value of $overline(X)_(n)$ depends on the values of
	$X_(1), dots, X_(n)$, it is itself a random variable.

	Suppose that each $X_(i)$ has a known and finite expected value $mu$.
	and a finite variance $sigma^(2)$. Then:

	$ overline(X)_(n) ->^(p) mu $
] <Weak-Law-of-Large-Numbers>
// #proof[
// Definitely not
// ]

In simpler terms, @Weak-Law-of-Large-Numbers states that the arithmetic mean
of a sequence of i.i.d. random variables gets closer and closer to their "true"
expected value the longer of a sequence is considered. 

#exercise[
	Consider the random variabile $X$, whose values are the possible outcomes
	of a 6-faced fair dice roll. Compare the expected value of $X$ with the
	approximation retrieved by applying @Weak-Law-of-Large-Numbers.
]
#solution[
	It is easy to see that:

	$ E(X) = 1 dot frac(1, 6) + 2 dot frac(1, 6) + 3 dot frac(1, 6) +
	  4 dot frac(1, 6) + 5 dot frac(1, 6) + 6 dot frac(1, 6) =
	  frac(1 + 2 + 3 + 4 + 5 + 6, 6) = frac(21, 6) = 3.5 $

	Suppose that $n = 10$. Picking $10$ random values for $X$ (no matter
	how they are distributed) gives:

	$ frac(5 + 3 + 1 + 5 + 1 + 2 + 1 + 3 + 5 + 5, 10) = frac(31, 10) = 3.1 $

	Which is a reasonable approximation of $E(X)$. With $n = 20$:

	$ frac(6 + 4 + 1 + 1 + 3 + 4 + 2 + 2 + 4 + 1 +
	  2 + 6 + 5 + 2 + 6 + 2 + 4 + 5 + 6 + 3, 20) = frac(69, 20) = 3.45 $

	Which is an even better approximation.
]

Note that, with respect to @Weak-Law-of-Large-Numbers, the distribution of
$overline(X)_(n)$ is irrelevant. Also notice how the theorem does not give
any indication on how "fast" the convergence of $overline(X)_(n)$ to $mu$
is. Intuitively, it is possible to relate the speed of convergence to the
standard deviation of the $X_(i)$ variables, since a smaller standard
deviation entails that the values of $overline(X)_(n)$ will be closer
to their expected value, and therefore closer to $mu$.

#theorem("Central Limit Theorem")[
	Let $angle.l X_(n) angle.r = {X_(1), X_(2), dots, X_(n)}$ be a
	sequence of independent and identically distributed random variables,
	and let $overline(X)_(n)$ be the arithmetic mean of $angle.l X_(n)
	angle.r$. Suppose that each $X_(i)$ has a known and finite expected
	value $mu$. and a known and finite variance $sigma^(2)$. Then, the
	normalized arithmetic mean converges in distribution to a standard
	normal variable:

	$ frac(n(overline(X)_(n) - mu), sigma sqrt(n)) ->^(d) Z ~ N(0, 1) $

] <Central-Limit-Theorem>
// #proof[
// Not a chance
// ]

Note that @Central-Limit-Theorem does not specify the nature of the
distribution to which it is applied. This means that, as long as it
is possible to construct a sufficiently large #footnote[Even though
the theorem does not specify a minimum size of $n$ such that the
theorem holds for practical purposes, empirical data seems to suggest
a value of $30$ for most real-world applications.] sequence of i.i.d.
random variables, said sequence can always be treated as a standard
normal random variable, even if the single variables have an unknown
(yet equal among all of them) distribution.

#exercise[
	Suppose that $angle.l X_(n) angle.r$ is a sequence of $40$ independent
	and randomly distributed random variables, each having $mu = 14$ and
	$sigma = 4.8$. What is the probability of $overline(X_(n))$ being less
	than or equal to $13$?
]
#solution[
	Even though the distribution of $X$ is unknown, it is still possible to
	apply @Central-Limit-Theorem:

	$ P(overline(X_(n)) lt.eq 13) = P(frac(n(overline(X_(n)) - mu),
	  sigma sqrt(n)) lt.eq frac(n(13 - mu), sigma sqrt(n))) = 
	  P(Z lt.eq frac(40 (13 - 14), 4.8 dot sqrt(40))) =
	  Phi(frac(-40, 30.33)) approx 0.09 $
]
