#import "../Math4AI_definitions.typ": *

Let ${underline(v_(1)), underline(v_(2)), dots, underline(v_(n))}$ be a
set of $n$ vectors of a vector space $V$, and let $lambda_(1), lambda_(2),
dots, lambda_(n)$ be $n$ real numbers (not necessarely distinct). Every
summation defined as such:

$ sum_(i = 1)^(n) lambda_(i) underline(v_(i)) =
  lambda_(1) underline(v_(1)) + lambda_(2) underline(v_(2)) + dots +
  lambda_(i) underline(v_(i)) + dots + lambda_(n) underline(v_(n)) $

Is called a *linear combination* of the vectors ${underline(v_(1)),
underline(v_(2)), dots, underline(v_(n))}$, with $lambda_(1), lambda_(2),
dots, lambda_(n)$ as *coefficients*.

A set of vectors ${underline(v_(1)), underline(v_(2)), dots,
underline(v_(n))}$ is said to be *linearly independent* if the
only linear combination of such vectors that equals the null
vector is the one that has $0$ as every coefficient. If there
exists a linear combination of such vectors that is equal to the
null vector and that has at least a non-zero coefficient, those
vectors are said to be *linearly independent*.

#theorem[
	Let ${underline(v_(1)), underline(v_(2)), dots, underline(v_(n))}$ be a
	set of $n$ vectors of a vector space $V$. If those vectors are linearly
	dependent, there exists at least one vector of such set that can be
	expressed as a linear combination of the remaining vectors, and vice
	versa.
]
#proof[
	If such set of vectors is linearly dependent, there must exist a linear
	combination of the set that equals the null vector, be it:

	$ sum_(i = 1)^(n) lambda_(i) underline(v_(i)) =
	  lambda_(1) underline(v_(1)) + lambda_(2) underline(v_(2)) + dots +
	  lambda_(j) underline(v_(j)) + dots + lambda_(n) underline(v_(n)) =
	  underline(0) $

	Where there's at least a non-zero coefficient. Let's assume, without
	loss of generality, that the $j$-th coefficient is non-zero (whether
	such coefficient is the only one to be non-zero is irrelevant). The
	product of such coefficient with the corresponding vector can be
	moved to the right side of the equation like so:

	$ lambda_(1) underline(v_(1)) + lambda_(2) underline(v_(2)) + dots +
	  lambda_(n) underline(v_(n)) = -lambda_(j) underline(v_(j)) $

	Dividing both sides by $-lambda_(j)$ gives:

	$ -frac(lambda_(1), lambda_(j)) underline(v_(1))
	  - frac(lambda_(2), lambda_(j)) underline(v_(2)) - dots
	  - frac(lambda_(n), lambda_(j)) underline(v_(n)) = underline(v_(j)) $

	Each $-frac(lambda_(i), lambda_(j))$ is itself a real number, and
	therefore the expression above is a linear combination that is equal
	to a vector of the set.

	On the other hand, assume that the $j$-th vector of the set is equal
	to a linear combination of the remaining vectors like so:

	$ lambda_(1) underline(v_(1)) + lambda_(2) underline(v_(2)) + dots +
	  lambda_(n) underline(v_(n)) = underline(v_(j)) $

	Moving $underline(v_(j))$ to the left gives:

	$ lambda_(1) underline(v_(1)) + lambda_(2) underline(v_(2)) + dots
	  + (-1)underline(v_(j)) + dots + lambda_(n) underline(v_(n)) =
	  underline(0) $

	Since $-1$ is a real number, the expression on the left side of the
	equation is indeed a linear combination of the whole set, that is
	equal to the null vector.
]

#exercise[
	Consider the vector space $RR^(2)$. Check if the vectors
	$underline(v_(1)) = mat(1; 0)$ and $underline(v_(2)) = mat(1; 1)$
	are linearly independent or linearly dependent.
]
#solution[
	Consider such linear combination:

	$ lambda_(1) mat(1; 0) + lambda_(2) mat(1; 1) = mat(0; 0) $

	To test whether $underline(v_(1))$ and $underline(v_(2))$ are linearly
	dependent or independent, it suffices to solve this system of equations:

	$ lambda_(1) mat(1; 0) + lambda_(2) mat(1; 1) = mat(0; 0) =>
	  mat(lambda_(1); 0) + mat(lambda_(1); lambda_(2)) = mat(0; 0) =>
	  mat(2 lambda_(1); lambda_(2)) = mat(0; 0) =>
	  cases(2 lambda_(1) = 0, lambda_(2) = 0) =>
	  cases(lambda_(1) = 0, lambda_(2) = 0) $

	Since the only solution to such system is $lambda_(1) = 0,
	lambda_(2) = 0$, $underline(v_(1))$ and $underline(v_(2))$
	are linearly independent.
]

#exercise[
	Consider the vector space $RR^(2)$. Check if the vectors
	$underline(v_(1)) = mat(1; 0)$, $underline(v_(2)) = mat(1; 1)$
	and $underline(v_(3)) = mat(2; 0)$ are linearly independent or
	linearly dependent.
]
#solution[
	Consider such linear combination:

	$ lambda_(1) mat(1; 0) + lambda_(2) mat(1; 1) + lambda_(3) mat(2; 0) =
	  mat(0; 0) $

	To test whether $underline(v_(1))$, $underline(v_(2))$ and
	$underline(v_(3))$ are linearly dependent or independent,
	it suffices to solve this system of equations:

	$ lambda_(1) mat(1; 0) + lambda_(2) mat(1; 1) +
	  lambda_(3) mat(2; 0) = mat(0; 0) =>
	  cases(lambda_(1) + lambda_(2) + 2 lambda_(3) = 0, lambda_(2) = 0) =>
	  cases(lambda_(1) = -2 lambda_(3), lambda_(2) = 0) $

	Since there are infinite solutions to such system, including non-zero
	solutions, $underline(v_(1))$, $underline(v_(2))$ and $underline(v_(3))$
	are linearly dependent. For example, setting $lambda_(1) = 1$ results in:

	$ 1 mat(1; 0) + 0 mat(1; 1) -frac(1, 2) mat(2; 0) = mat(0; 0) $

	Which is, indeed, a correct identity.
]

A set of vectors $S = {underline(s_(1)), dots, underline(s_(n))}$ of a vector
space $V$ is said to *generate* $V$ if every vector of $V$ can be written as
a linear combination of the vectors in $S$. That is to say, $S$ generates $V$
if for every $underline(v) in V$ there exist a set of coefficients $lambda_(1),
dots, lambda_(n)$ such that:

$ underline(v) = sum_(i = 1)^(n) lambda_(i) underline(s_(i)) =
  lambda_(1) underline(s_(1)) + dots + lambda_(n) underline(s_(n)) $

#theorem[
	Let $S$ be a set of vectors of a vector space $V$ that can generate $V$.
	Let $underline(w) in V$ be a random vector of $V$. The set of vectors
	$S union {underline(w)}$ is linearly dependent.
]
#proof[
	If $S$ can generate $V$ and $underline(w)$ belongs to $V$, there exists a
	linear combination of the vectors in $S$ such that:

	$ underline(w) = sum_(i = 1)^(n) lambda_(i) underline(s_(i)) =
	  lambda_(1) underline(s_(1)) + dots + lambda_(n) underline(s_(n)) $

	Moving $underline(w)$ to the right side of the equation gives:

	$ underline(0) = (-1) underline(w) + lambda_(1) underline(s_(1)) + dots +
	  lambda_(n) underline(s_(n)) $

	The expression on the right side of the equation is indeed a linear
	combination of $S union {underline(w)}$, that is equal to the null
	vector. Since at least $-1$ is a non zero coefficient, such set
	is linearly dependent.
]

A set of vectors that can generate a vector space and is itself linearly
independent is called a *basis* for such vector space. The cardinality of
a basis is called the *dimension* of the corresponding vector space.

#theorem[
	A basis of a vector space has the minimum cardinality out of every set
	of vectors that can generate it. In other words, if a basis of a vector
	space has cardinality $n$, at least $n$ vectors are needed to generate
	such space.
]
// #proof[
// To be added
// ]

#exercise[
	Consider the vector space $PP_(2)$. Knowing that the sets $cal(B)_(1)
	= {1, x, x^(2)}$ and $cal(B)_(2) = {(x + 1), (x - 1), x^(2)}$ are both
	bases for $PP_(2)$, write the polynomial $p(x) = 3x^(2) + 2x - 5$ as a
	linear combination of each.
]
#solution[
	It's trivial to see that, for the first basis, such linear combination
	is $p(x)$ itself:

	$ lambda_(0) 1 + lambda_(1) x + lambda_(2) x^(2) = -5 + 2x + 3x^(2) =>
	  cases(lambda_(0) = -5, lambda_(1) = 2, lambda_(2) = 3) $

	Regarding the second basis, it can be rewritten as:

	$ lambda_(0) (x + 1) + lambda_(1) (x - 1) +
	  lambda_(2) x^(2) => lambda_(0) x + lambda_(0) +
	  lambda_(1) x - lambda_(1) + lambda_(2) x^(2) =>
	  (lambda_(0) - lambda_(1)) + (lambda_(0) + lambda_(1))x +
	  lambda_(2) x^(2) $

	Equating it term by term:

	$ (lambda_(0) - lambda_(1)) + (lambda_(0) + lambda_(1))x +
	  lambda_(2) x^(2) = -5 + 2x + 3x^(2) =>
	  cases(lambda_(0) - lambda_(1) = -5,
			lambda_(0) + lambda_(1) = 2,
			lambda_(2) = 3) =>
	  cases(lambda_(0) = -frac(3, 2),
			lambda_(1) = frac(7, 2),
			lambda_(2) = 3) $

	Therefore:

	$ 3x^(2) + 2x - 5 = -frac(3, 2) (x + 1) + frac(7, 2) (x - 1) + 3x^(2) $
]

The basis of a vector space that renders calculations the most "comfortable"
is called the *canonical basis* for such vector space. Such basis is different
from vector space to vector space.

#exercise[
	Determine the dimension of $RR^(n)$
]
#solution[
	Consider any $n$-dimensional vector of coordinates $a_(1), a_(2), dots,
	a_(n)$. It's easy to see that such vector is equal to the following linear
	combination:

	$ mat(a_(1); a_(2); dots; a_(n)) = a_(1) mat(1; 0; dots; 0) +
	  a_(2) mat(0; 1; dots; 0) + dots + a_(n) mat(0; 0; dots; 1) $

	A set containing such vectors in linearly independent. Infact:

	$ lambda_(1) mat(1; 0; dots.v; 0) +
	  lambda_(2) mat(0; 1; dots.v; 0) + dots +
	  lambda_(n) mat(0; 0; dots.v; 1) = mat(0; 0; dots.v; 0) =>
	  cases(
		lambda_(1) + 0 + dots + 0 = 0,
		0 + lambda_(2) + dots + 0 = 0,
		dots.v,
		0 + 0 + dots + lambda_(n) = 0)
	  => cases(
		lambda_(1) = 0,
		lambda_(2) = 0,
		dots.v,
		lambda_(n) = 0) $

	This set of vectors is linearly independent and can generate $RR^(n)$,
	therefore it's a basis for $RR^(n)$. The dimension of $RR^(n)$ is then
	$n$, since such set has cardinality $n$. In particular, this specific
	basis is the canonical basis for $RR^(n)$.
]

#exercise[
	Determine the dimension of $PP_(n)$
]
#solution[
	Consider any polynomial of degree at most $n$ having real coefficients:

	$ a_(n) x^(n) + a_(n - 1) x^(n - 1) + dots + a_(1) x + a_(0) $

	Each monomial of such polynomial are itself polynomials of degree at
	most $n$ having real coefficients. Therefore, the polynomial itself
	can be seen as a linear combination of the polynomials ${x^(n), x^(n -1),
	dots, x^(1), x^(0)}$ with coefficients $a_(n), a_(n - 1), dots, a_(1),
	a_(0)$.

	Such set of vectors is linearly independent. Infact:

	// Proof missing

	This set of vectors is linearly independent and can generate $PP_(n)$,
	therefore it's a basis for $PP_(n)$. The dimension of $PP_(n)$ is then
	$n + 1$, since such set has cardinality $n + 1$. In particular, this
	specific basis is the canonical basis for $PP_(n)$.
]
