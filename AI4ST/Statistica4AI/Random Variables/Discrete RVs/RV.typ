#import "../../Stats4AI_definitions.typ": *

Instead of referring to the probability values assigned to the
elements of the support of a random variable one by one, it is
more convenient to group all those probabilities into a single
function.

The *probability mass function* (*pmf* for short) of a discrete random
variable $X$ with support $D(X)$ is a function that assigns a probability
to all possible values that $X$ can take. The pmf of $X$ is denoted as
$p(X)$, and is formally defined as:

$ p(x) = P(X = x) = P(s: s in cal(S), X(s) = x) $

Note that, again, there could be more than one $s$ such that $X = X(s)$;
any choice is valid. Also, $p(x)$ must be $0$ for any $x in.not D(X)$,
because if there is no $s in cal(S)$ such that $X(s) = x$, then $p(x) =
p(emptyset) = 0$.

To ensure compliance with the Kolmogorov axioms, any pmf $p(X)$ must
satisfy two conditions:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ p(x) gt.eq 0 space forall x in D(X) $],
	[$ sum_(x in D(X)) p(x) = 1 $]
)

#exercise[
	What is the pmf of the variable $X$ in @Random-variables?
]
#solution[
	$ p(x) = P(X = x) =
	  cases(display(frac(1, 8)) & "if" x = 0 or x = 3,
	        display(frac(3, 8)) & "if" x = 1 or x = 2,
	        0 & "otherwise") $

	This is a valid pmf because it's always non-negative and the sum
	of the probabilities over the entire support is $1$:

	$ sum_(x in {0, 1, 2, 3}) p(x) =
	  p(0) + p(1) + p(2) + p(3) =
	  frac(1, 8) + frac(3, 8) + frac(3, 8) + frac(1, 8) = 1 $

	#figure(
		caption: [Plot of the probability mass function $p(x) = P(X = x)$],
		image("pmf.svg", width: 75%)
	)
]

The *cumulative distribution function* (*cdf* for short) of a discrete
random variable $X$ is defined as the probability of such random variable
to take a value less than or equal to a threshold. The cdf of $X$ is denoted
as $F(X)$, and is formally defined as:

$ F(x) = P(X lt.eq x) = sum_(y: y in D(X), y lt.eq x) p(y) $

For any $x in.not D(X)$, $F(x)$ returns the cdf of closest possible value
of $X$ to the left of $x$. In particular, if there is no $y in D(X)$ such
that $y lt.eq x$, then $F(x) = 0$.

#exercise[
	A store carries flash drives with either $1$ GB, $2$ GB, $4$ GB, $8$
	GB, or $16$ GB of memory. Let $X$ be the random variable "amount of
	memory in a purchased drive". The pmf of $X$ is as follows:

	$ p(x) =
	  cases(0.05 & "if" x = 1,
	        0.10 & "if" x = 2,
	        0.35 & "if" x = 4,
	        0.40 & "if" x = 8,
	        0.10 & "if" x = 16,
	        0 & "otherwise") $

	What is the cdf of $X$?
] <Flash-drives>
#solution[
	$ F(1)  &= sum_(y: y in D(X), y lt.eq 1) p(y)  = p(1) = 0.05 \
	  F(2)  &= sum_(y: y in D(X), y lt.eq 2) p(y)  = p(1) + p(2) = 0.05 + 0.10 = 0.15 \
	  F(4)  &= sum_(y: y in D(X), y lt.eq 4) p(y)  = p(1) + p(2) + p(4) = 0.15 + 0.35 = 0.50 \
	  F(8)  &= sum_(y: y in D(X), y lt.eq 8) p(y)  = p(1) + p(2) + p(4) + p(8) = 0.50 + 0.40 = 0.90 \
	  F(16) &= sum_(y: y in D(X), y lt.eq 16) p(y) = p(1) + p(2) + p(4) + p(8) + p(16) = 0.90 + 0.10 = 1.00 $

	To sum up:

	$ F(x) = cases(0 & "if" x < 1,
	               0.05 & "if" 1 lt.eq x < 2,
	               0.15 & "if" 2 lt.eq x < 4,
	               0.5 & "if" 4 lt.eq x < 8,
	               0.9 & "if" 8 lt.eq x < 16,
	               1 & "if" x gt.eq 16) $

	#figure(
		caption: [Plot of the cumulative distribution function $F(x) = P(X lt.eq x)$],
		image("cdf.svg", width: 75%)
	)
]

The cdf can be obtained from the pmf, but it's also possible to go the
other way around: obtaining the pmf from the cdf.

For a given sample space $cal(S)$, let $X : cal(S) mapsto RR$ be a discrete
random variable with known cdf $F(x)$ and known support $D(X) = x_(0), x_(1),
dots$. Suppose that $a in D(X)$ is a value for which there's interest in
computing $p(a)$; let $a^(-) in D(X)$ be highest value in the support of
$X$ being smaller than $a$. That is, $a^(-) = max_(x in D(X)){x | x < a}$.
To obtain $p(a)$, one computes:

$ F(a) - F(a^(-)) &=
  sum_(y: y in D(X), y lt.eq a) p(y) - sum_(y: y in D(X), y lt.eq a^(-)) p(y) = \
  &= (p(x_(0)) + p(x_(1)) + dots + p(a^(-)) + p(a)) - (p(x_(0)) + p(x_(1)) + dots + p(a^(-))) = \
  &= cancel(p(x_(0))) + cancel(p(x_(1))) + dots + cancel(p(a^(-))) + p(a) -
     cancel(p(x_(0))) - cancel(p(x_(1))) - dots - cancel(p(a^(-))) = \
  &= p(a) $

In general, to obtain the probability of a random variable to take any value
that lies in the interval $[a, b]$, one computes:

$ F(b) - F(a^(-)) &=
  sum_(y: y in D(X), y lt.eq b) p(y) - sum_(y: y in D(X), y lt.eq a^(-)) p(y) = \
  &= (p(x_(0)) + dots + p(a^(-)) + p(a) + dots + p(b)) - (p(x_(0)) + dots + p(a^(-))) = \
  &= cancel(p(x_(0))) + dots + cancel(p(a^(-))) + p(a) + dots + p(b) - cancel(p(x_(0))) - dots - cancel(p(a^(-))) = \
  &= p(a) + dots + p(b) = P(X = a or dots X = b) = \
  &= P(a lt.eq x lt.eq b) $

Notice how it's necessary to use $a^(-)$ and not $a$, since otherwise the
leftmost extreme would be left out.

#exercise[
	Consider @Flash-drives. What is $P(2 lt.eq x lt.eq 8)$?
]
#solution[
	Being $D(X) = {1, 2, 4, 8, 16}$, one has $2^(-) = 1$. Therefore:

	$ P(2 lt.eq x lt.eq 8) = F(8) - F(2^(-)) = F(8) - F(1) = 0.9 - 0.05 = 0.85 $
]

Let $X$ be a discrete random variable with support $D(X)$ and probability
mass function $p(X)$. The *expected value* (or *mean value*) of $X$, denoted
as $E(X)$ or $mu_(X)$, is the sum of all possible values in $D(X)$ weighted
by their probabilities:

$ E(X) = mu_(X) = sum_(x in D(X)) x dot p(x) $

When the variable $X$ is known from context, the pedix $X$ in $mu_(X)$
is omitted.

The expected value is, in some sense, the counterpart of the sample mean,
but with different weights to each term of the sum. Like the sample mean,
it is perfectly valid for the expected value to be a value that is not
present in the support of the related variable. Interestingly, the
expected value is not guaranteed to exist.

#exercise[
	What is the expected value of the variable $X$ in @Flash-drives?
]
#solution[
	$ E(X) &= sum_(x in D(X)) x dot p(x) =
	          1 dot 0.05 + 2 dot 0.10 + 4 dot 0.35 + 8 dot 0.40 + 16 dot 0.10 = \
	       &= 0.05 + 0.20 + 1.40 + 3.20 + 1.60 = 6.45 $
]

The expected value is oblivious to whether its argument is a random
variable or a function whose input is a random variable. In other
words, let $X$ be a discrete random variable with support $D(X)$ and
pmf $p(X)$, and let $h(X)$ be a function whose argument is $X$ itself.
The expected value of $h(X)$ is still defined as:

$ E(h(X)) = mu_(h(X)) = sum_(x in D(X)) h(x) dot p(x) $

#theorem[
	Let $X$ be a discrete random variable with support $D(X)$ and pmf
	$p(X)$. For any $a, b in RR$:

	$ E(a X + b) = a E(X) + b $
] <Expected-value-linear-transformations>
#proof[
	Let $h(x) = a X + b$. Then:

	$ E(h(x)) &=
	  E(a X + b) =
	  sum_(x in D(X)) h(x) dot p(x) =
	  sum_(x in D(X)) (a x + b) dot p(x) = \
	  &= sum_(x in D(X)) a x dot p(x) + b dot p(x) =
	  sum_(x in D(X)) a x dot p(x) + sum_(x in D(X)) b dot p(x) = \
	  &= a sum_(x in D(X)) x dot p(x) + b sum_(x in D(X)) p(x) =
	  a E(X) + b dot 1 = a E(X) + b $

	Since $sum_(x in D(X)) p(x) = 1$ by definition.
]

Let $X$ be a discrete random variable with support $D(X)$ and
probability mass function $p(X)$. The *variance* of $X$, denoted
as $V(X)$ or $sigma^(2)_(X)$, is a measure of how the values in
$D(X)$ differ from the expected value:

$ V(X) = sigma^(2)_(X) =
  sum_(x in D(X)) (x - E(X))^(2) dot p(x) =
  E((X - E(X))^(2)) $

When the variable $X$ is known from context, the pedix $X$ in
$sigma^(2)_(X)$ is omitted. If the expected value is the counterpart
to the sample mean, the variance is the counterpart to the sample
variance.

#exercise[
	What is the variance of the variable $X$ in @Flash-drives?
]
#solution[
	$ V(X) &=
	  sum_(x in D(X)) (x - E(X))^(2) dot p(x) = 
	  (1 - 6.45)^(2) dot 0.05 + dots + (16 - 6.45)^(2) dot 0.10 = \
	  &= 29.7 dot 0.05 + 19.8 dot 0.10 + 6.0 dot 0.35 + 2.4 dot 0.40 + 91.2 dot 0.10 approx \
	  &approx 1.49 + 1.98 + 2.10 + 0.96 + 9.12 approx 15.65 $
]

The square root of the variance is called the *standard deviation*,
denoted as $S D (X)$ or $sigma_(X)$:

$ S D (X) = sigma_(X) = sqrt(V(X)) $

@Alternative-form-for-variance gives a simpler way to compute the
variance of a discrete random variable.

#lemma[
	Let $X$ be a discrete random variable with support $D$ and probability
	mass function $p(X)$. The following equality holds:

	$ V(X) = (sum_(x in D) x^(2) dot p(x)) - (E(X))^(2) =
	  E(X^(2)) - (E(X))^(2) $
] <Alternative-form-for-variance>
#proof[
	Expanding the square in the formula:

	$ V(X) &=
	  sum_(x in D(X)) (x - E(X))^(2) dot p(x) =
	  sum_(x in D(X)) (x^(2) + (E(X))^(2) - 2 x E(X)) dot p(x) = \
	  &= sum_(x in D(X)) x^(2) dot p(x) + sum_(x in D(X)) (E(X))^(2) dot p(x) - sum_(x in D(X)) 2 x E(X) dot p(x) = \
	  &= (sum_(x in D(X)) x^(2) dot p(x)) + (E(X))^(2) (sum_(x in D(X)) p(x)) - 2 E(X) (sum_(x in D(X)) x dot p(x)) = \
	  &= E(X^(2)) + (E(X))^(2) dot 1 - 2 E(X) dot E(X) = E(X^(2)) + (E(X))^(2) - 2 (E(X))^(2) = \
	  &= E(X^(2)) - (E(X))^(2) $
]

#theorem[
	Let $X$ be a discrete random variable with support $D(X)$ and pmf
	$p(X)$. For any $a, b in RR$:

	$ V(a X + b) = a^(2) V(X) $
] <Variance-linear-transformations>
#proof[
	Applying @Expected-value-linear-transformations:

	$ V(a X + b) &=
	  E(((a X + b) - E(a X + b))^(2)) =
	  E((a X + cancel(b) - a E(X) - cancel(b))^(2)) = \
	  &- E((a (X - E(X)))^(2)) =
	  E(a^(2) (X - E(X))^(2)) =
	  a^(2) E((X - E(X))^(2)) = \
	  &= a^(2) V(X) $
]
