#import "../Math4AI_definitions.typ": *

=== Definition of vector space

Let $V$ be a set, whose elements are called *vectors*. A vector $underline(v)$
is denoted as $underline(v) = (v_(1), v_(2), dots, v_(n))$, where each $v_(i)$
with $1 lt.eq i lt.eq n$ is called the $i$-th *component* of $underline(v)$.

Let $+$ be an operation on such set, a _sum_ of vectors, that has
two vectors as arguments and returns another vector. That is, foreach
$(underline(x), underline(y)) in V times V$ there exists a vector
$underline(v) in V$ such that $underline(x) + underline(y) = underline(v)$.

Let $dot$ be another operation, a _product_ between a vector and a
real number, that has a real number and a vector as argument and returns
another vector. That is, foreach $lambda in RR$ and $underline(v) in V$
there exists a vector $underline(w) in V$ such that $lambda dot underline(v)
= underline(w)$.

Suppose those operations possess the following properties:

- $(V, +)$ is an Abelian group;
- The product has the distributive property, such that for every
  $lambda in RR$ and for every $underline(x), underline(y) in V$
  it is true that $lambda dot (underline(x) + underline(y)) = lambda
  dot underline(x) + lambda dot underline(y)$;
- The product has the associative property, such that for every
  $lambda, mu in RR$ and for every $underline(x) in V$ it is true
  that $(lambda + mu) dot underline(x) = lambda dot underline(x) +
  mu dot underline(x)$;
- For every vector $underline(v) in V$, it is true that
  $1 dot underline(v) = underline(v)$.

If that is the case, the set $V$ is called *vector space*. It should be
noted that it does not matter what the elements of a vector space actually
are (be they numbers, functions, polynomals, etcetera); as long as the
aforementioned properties hold for the two operations, such set shares
all of the properties that a vector space possesses.

Given a vector space $V$, a set $W$ is said to be a *subspace* of $V$ if
it's a subset of $V$ and it's itself a vector space with respect to the
same operations defined for $V$.

For the sake of readability, the product between a real number and
a vector is often represented without the dot. That is to say, the
expressions $lambda dot underline(x)$ and $lambda underline(x)$ have
the same meaning.

#exercise[
	Denote as $RR^(n)$ the set containing all vectors of real components
	#footnote("This is a misnomer.") in the $n$-dimensional plane. Prove
	that $RR^(n)$ constitutes a vector space.
]
#solution[
	It is possible to define both a sum between two vectors in
	the $n$-dimensional plane and a product between a vector in
	the $n$-dimensional space and a real number. To sum two vectors
	in the $n$-dimensional space, it suffices to sum each component
	with each component. To multiply a vector in the $n$-dimensional
	space with a real number it suffices to multiply each component
	by that number:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat(v_(1); v_(2); dots.v; v_(n)) + mat(w_(1); w_(2); dots.v; w_(n)) =
		mat(v_(1) + w_(1); v_(2) + w_(2); dots.v; v_(n) + w_(n)) $],
		[$ lambda mat(v_(1); v_(2); dots.v; v_(n)) =
		mat(lambda v_(1); lambda v_(2); dots.v; lambda v_(n)) $]
	)

	Both operations obey the properties stated:

	- $(RR^(n), +)$ constitutes an Abelian group. Infact:
	  - The sum has the associative property:

		$ mat(v_(1) + w_(1); v_(2) + w_(2); dots.v; v_(n) + w_(n)) +
		  mat(u_(1); u_(2); dots.v; u_(n)) =
		  mat(v_(1) + w_(1) + u_(1); v_(2) + w_(2) + u_(2);
		  dots.v; v_(n) + w_(n) + u_(n)) =
		  mat(v_(1); v_(2); dots.v; v_(n)) +
		  mat(w_(1) + u_(1); w_(2) + u_(2); dots.v; w_(n) + u_(n)) $
	  - There exists an identity element, in the form of the vector whose
	    components are all zero:

		$ mat(v_(1); v_(2); dots.v; v_(n)) + mat(0; 0; 0; 0) =
		  mat(v_(1) + 0; v_(2) + 0; dots.v; v_(n) + 0) =
		  mat(0 + v_(1); 0 + v_(2); dots.v; 0 + v_(n)) =
		  mat(v_(1); v_(2); dots.v; v_(n)) $
	  - Each vector in the $n$-dimensional space has an inverse element with
	    respect to the sum, that is the same vector multiplied by $-1$:

		$ mat(v_(1); v_(2); dots.v; v_(n)) + (-1) mat(v_(1); v_(2); dots.v; v_(n)) =
		  mat(v_(1); v_(2); dots.v; v_(n)) + mat(-v_(1); -v_(2); dots.v; -v_(n)) =
		  mat(v_(1) + (-v_(1)); v_(2) + (-v_(2)); dots.v; v_(n) + (-v_(n))) =
		  mat(-v_(1) + v_(1); -v_(2) + v_(2); dots.v; -v_(n) + v_(n)) =
		  mat(0; 0; dots.v; 0) $
	  - The sum has the commutative property:

		$ mat(v_(1); v_(2); dots.v; v_(n)) + mat(w_(1); w_(2); dots.v; w_(n)) =
		  mat(v_(1) + w_(1); v_(2) + w_(2); dots.v; v_(n) + w_(n)) =
		  mat(w_(1) + v_(1); w_(2) + v_(2); dots.v; w_(n) + v_(n)) =
		  mat(w_(1); w_(2); dots.v; w_(n)) + mat(v_(1); v_(2); dots.v; v_(n)) $
	- The product has the associative property:
	$ (lambda + mu) mat(v_(1); v_(2); dots.v; v_(n)) =
		mat((lambda + mu) v_(1); (lambda + mu) v_(2); dots.v;
		(lambda + mu) v_(n)) = mat(lambda v_(1) + mu v_(1);
		lambda v_(2) + mu v_(2); dots.v; lambda v_(n) + mu v_(n)) =
		mat(lambda v_(1); lambda v_(2); dots.v; lambda v_(n)) +
		mat(mu v_(1); mu v_(2); dots.v; mu v_(n)) =
		lambda mat(v_(1); v_(2); dots.v; v_(n)) +
		mu mat(v_(1); v_(2); dots.v; v_(n)) $
	- The product has the distributive property:
	$ lambda (mat(v_(1); v_(2); dots.v; v_(n)) +
		mat(w_(1); w_(2); dots.v; w_(n))) =
		lambda mat(v_(1) + w_(1); v_(2) + w_(2); dots.v; v_(n) + w_(n)) =
		mat(lambda (v_(1) + w_(1)); lambda (v_(2) + w_(2)); dots.v;
		lambda (v_(n) + w_(n))) = mat(lambda v_(1) + lambda w_(1);
		lambda v_(2) + lambda w_(2); dots.v; lambda v_(n) + lambda
		w_(n)) = lambda mat(v_(1); v_(2); dots.v; v_(n)) + lambda
		mat(w_(1); w_(2); dots.v; w_(n)) $
	- Multiplying a vector by the number $1$ leaves the vector unchanged:
	$ 1 mat(v_(1); v_(2); dots.v; v_(n)) = mat(1 v_(1); 1 v_(2);
	  dots.v; 1 v_(n)) = mat(v_(1); v_(2); dots.v; v_(n)) $
]

#exercise[
	Denote as $PP_(n)$ the set containing all polynomials with real
	coefficients and degree less than or equal to $n$. Prove that
	$PP_(n)$ constitutes a vector space.
]
#solution[
	It is possible to define both a sum between two polynomials with real
	coefficients and degree $lt.eq n$ and a product between a polynomial
	with real coefficients and degree $lt.eq n$ and a real number. To sum
	two such polynomials it suffices to sum the coefficients of their
	monomials having the same degree:

	$ (a_(n) x^(n) + a_(n - 1) x^(n - 1) + dots + a_(1) x + a_(0)) +
	  (b_(m) x^(m) + b_(m - 1) x^(m - 1) + dots + b_(1) x + b_(0)) = \
	  a_(n) x^(n) + a_(n - 1) x^(n - 1) + dots + (a_(m) + b_(m)) x^(m) +
	  (a_(m - 1) + b_(m - 1)) x^(m - 1) + dots + (a_(1) + b_(1)) x +
	  (a_(0) + b_(0)) $

	To multiply a polynomial with real coefficients and degree $lt.eq n$
	with a real number it suffices to multiply each coefficient of its
	monomials by such number:

	$ lambda (a_(n) x^(n) + a_(n - 1) x^(n - 1) + dots + a_(1) x + a_(0)) =
	(lambda a_(n)) x^(n) + (lambda a_(n - 1)) x^(n - 1) + dots +
	(lambda a_(1)) x + (lambda a_(0)) $

	Both operations satisfy the properties required.

	// Maybe add such?
]

#proposition[
	Let $V$ be a vector space. To prove that a set $W$ is a subspace of $V$
	it suffices to prove that it is a subset of $V$ and is algebraically
	closed with respect to the same operations defined for $V$.
] <Subspace-proven-by-being-algebraically-closed>
// #proof[
// To be added
// ]

#exercise[
	Consider the vector space $RR^(3)$. Prove that the set $W_(1)$ is
	a subspace of $RR^(3)$ while $W_(2)$ is not.

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ W_(1) = {mat(x_(1); x_(2); x_(3)) :
		   mat(x_(1); x_(2); x_(3)) in RR^(3), x_(1) + x_(2) = 0} $],
		[$ W_(2) = {mat(x_(1); x_(2); x_(3)) :
		   mat(x_(1); x_(2); x_(3)) in RR^(3), x_(2) = 2x_(3) + 1} $]
	)
]
#solution[
	The first set is a subspace of $RR^(3)$ because it is a subset of $V$
	and is algebraically closed:

	$ mat(x_(1); x_(2); x_(3)) + mat(y_(1); y_(2); y_(3)) =
	  mat(x_(1); -x_(1); x_(3)) + mat(y_(1); -y_(1); y_(3)) =
	  mat(x_(1) + y_(1); -x_(1) - y_(1); x_(3) + y_(3)) =>
	  x_(2) + y_(2) = -x_(1) - y_(1) =>
	  x_(2) + y_(2) + (x_(1) + y_(1)) = 0 $

	$ lambda mat(x_(1); x_(2); x_(3)) =
	  lambda mat(x_(1); -x_(1); x_(3)) =
	  mat(lambda x_(1); -lambda x_(1); lambda x_(3)) =>
	  lambda x_(2) = -lambda x_(1) =>
	  lambda(x_(1) + x_(2)) = 0 $

	The second one, on the other hand, is not:

	$ mat(x_(1); x_(2); x_(3)) + mat(y_(1); y_(2); y_(3)) =
	  mat(x_(1); 2x_(3) + 1; x_(3)) + mat(y_(1); 2y_(3) + 1; y_(3)) =
	  mat(x_(1) + y_(1); 2x_(3) + 2y_(3) + 2; x_(3) + y_(3)) =>
	  2x_(3) + 2y_(3) + 2 eq.not 2(x_(3) + y_(3)) + 1 $
]

#lemma[
	Let $V$ be a vector space. The sets ${underline(0)}$ and $V$ are always
	subspaces of $V$.
]
// #proof[
// To be added (it's easy)
// ]

=== Linear combinations, linear dependence and independence

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

#lemma[
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

#lemma[
	A matrix is invertible if and only if the set of its rows/columns forms a
	linearly independent set.
] <Linearly-independent-set-not-null-determinant>
// #proof[
// To be added
// ]

=== Span, bases, dimensions

A set of vectors $S = {underline(s_(1)), dots, underline(s_(n))}$ of a vector
space $V$ is said to *generate* $V$ if every vector of $V$ can be written as
a linear combination of the vectors in $S$. That is to say, $S$ generates $V$
if for every $underline(v) in V$ there exist a set of coefficients $lambda_(1),
dots, lambda_(n)$ such that:

$ underline(v) = sum_(i = 1)^(n) lambda_(i) underline(s_(i)) =
  lambda_(1) underline(s_(1)) + dots + lambda_(n) underline(s_(n)) $

The set that contains all possible linear combinations from vectors of a set
$S = {underline(s_(1)), dots, underline(s_(n))}$ is also referred to as the
*span* of $S$, denoted as $"span"{S}$. Along this line of thought, if a set
$V$ is generated by $S$, it also said to be _spanned_ by $S$.

$ "span"{S} = {underline(v) mid(|) underline(v) = sum_(i = 1)^(n) lambda_(i) underline(s_(i))} $

A set of vectors that can generate a vector space and is itself linearly
independent is called a *basis* for such vector space.

The cardinality of a basis is called the *dimension* of the corresponding
vector space. If a vector space contains just the null vector, such vector
space is said to have dimension $0$.

A vector space whose dimension is a finite number is said to be a
*finite-dimensional* vector space. Otherwise, it is said to be an
*infinite-dimensional* vector space.

#theorem("Steinitz exchange lemma")[
	Let $U$ and $W$ be finite subsets of a vector space $V$. If $U$ is a set
	of linearly independent vectors and $V$ is spanned by $W$, then:

	+ $abs(U) lt.eq abs(W)$;
	+ It's always possible to construct a (potentially empty) set
	  $W' subset.eq W$ with $abs(W') = abs(W) - abs(U)$ such that
	  $V$ is spanned by $U union W'$.
]

#theorem("Dimension theorem for vector spaces")[
	Given a vector space $V$, any two bases of $V$ have the same
	cardinality. This cardinality is the smallest number of linearly
	independent vectors needed to generate $V$.
]
#proof[
	// First part is missing

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

#proposition[
	Once a basis is fixed, the linear combination of a vector in a vector
	space with respect to said basis is unique.
] <Basis-representation-is-unique>
// #proof[
// 
// ]

@Basis-representation-is-unique implies that a vector in a vector space
can be identified, no matter its nature, by the coordinates of the linear
combination employing a certain basis. Let $V$ be a vector space and let
$cal(B) = {cal(b)_(1), dots, cal(b)_(n)}$ be a basis for $V$. Any vector
$underline(v)$ has two, equivalent, representations with respect to $cal(B)$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ sum_(i = 1)^(n) lambda_(i) underline(cal(b)_(i)) =
	   lambda_(1) underline(cal(b)_(1)) +
	   lambda_(2) underline(cal(b)_(2)) +
	   dots +
	   lambda_(n) underline(cal(b)_(n)) $],
	[$ vec(cal(b)_(1), cal(b)_(2), dots.v, cal(b)_(n))_(cal(B)) $]
)

The suffix $cal(B)$ is necessary, otherwise it would be impossible to
tell apart representations with respect to different bases. However,
said suffix is generally omitted, since the basis is either known from
context or is not relevant.

Clearly, the same vector can be represented with more than one basis.
Each representation can be converted into another through a simple
matrix multiplication.

#proposition[
	Let $V$ be a vector space, and let $cal(B) = {underline(b_(1)),
	underline(b_(2)), dots, underline(b_(n))}$ and $cal(B') =
	{underline(b'_(1)), underline(b'_(2)), dots, underline(b'_(n))}$
	be two bases of $V$. Any generic vector $underline(x) in V$, can
	be represented with respect to both bases:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ underline(x) <=> mat(x_(1); x_(2); dots.v; x_(n))_(cal(B)) $],
		[$ underline(x) <=> mat(x'_(1); x'_(2); dots.v; x'_(n))_(cal(B')) $]
	)

	There exists an invertible matrix $P$, independent of $underline(x)$,
	such that:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat(x_(1); x_(2); dots.v; x_(n)) =
		P mat(x'_(1); x'_(2); dots.v; x'_(n)) $],
		[$ mat(x'_(1); x'_(2); dots.v; x'_(n)) =
		P^(-1) mat(x_(1); x_(2); dots.v; x_(n)) $])
] <Basis-change-is-matrix-multiplication>
#proof[
	Being both bases constituted by vectors of the same vector space, it is
	possible to express the elements of $cal(B')$ as linear combinations of
	the elements of $cal(B)$:

	$ cases(
		underline(b'_(1)) = p_(1, 1) underline(b_(1)) +
		p_(1, 2) underline(b_(2)) + dots + p_(1, n) underline(b_(n)) =
		sum_(j = 1)^(n) p_(1, j) underline(b_(j)),
		underline(b'_(2)) = p_(2, 1) underline(b_(1)) +
		p_(2, 2) underline(b_(2)) + dots + p_(2, n) underline(b_(n)) =
		sum_(j = 1)^(n) p_(2, j) underline(b_(j)),
		dots.v,
		underline(b'_(n)) = p_(n, 1) underline(b_(1)) +
		p_(n, 2) underline(b_(2)) + dots + p_(n, n) underline(b_(n)) =
		sum_(j = 1)^(n) p_(n, j) underline(b_(j))) $

	Therefore:

	$ underline(x) =
	sum_(j = 1)^(n) x'_(j) underline(b'_(j)) =
	sum_(j = 1)^(n) x'_(j) sum_(i = 1)^(n) p_(j, i) underline(b_(i)) =
	sum_(i = 1)^(n) x_(i) underline(b_(i)) $

	By comparing the third and fourth members of the equality term by term:

	$ x_(i) = sum_(j = 1)^(n) p_(i, j) x'_(j) =>
	mat(x_(1); x_(2); dots.v; x_(n)) =
	mat(
	p_(1, 1), p_(1, 2), dots, p_(1, n);
	p_(2, 1), p_(2, 2), dots, p_(2, n);
	dots.v, dots.v, dots.down, dots.v;
	p_(n, 1), p_(n, 2), dots, p_(n, n))
	mat(x'_(1); x'_(2); dots.v; x'_(n)) =
	P mat(x'_(1); x'_(2); dots.v; x'_(n)) $

	Of course, it is also possible to go the other way around, expressing the
	elements of $cal(B)$ as linear combinations of the elements of $cal(B')$:

	$ cases(
		underline(b_(1)) = q_(1, 1) underline(b'_(1)) +
		q_(1, 2) underline(b'_(2)) + dots + q_(1, n) underline(b'_(n)) =
		sum_(j = 1)^(n) q_(1, j) underline(b'_(j)),
		underline(b_(2)) = q_(2, 1) underline(b'_(1)) +
		q_(2, 2) underline(b'_(2)) + dots + q_(2, n) underline(b'_(n)) =
		sum_(j = 1)^(n) q_(2, j) underline(b'_(j)),
		dots.v,
		underline(b_(n)) = q_(n, 1) underline(b'_(1)) +
		q_(n, 2) underline(b'_(2)) + dots + q_(n, n) underline(b'_(n)) =
		sum_(j = 1)^(n) q_(n, j) underline(b'_(j))) $


	Therefore:

	$ underline(x) =
	sum_(j = 1)^(n) x_(j) underline(b_(j)) =
	sum_(j = 1)^(n) x_(j) sum_(i = 1)^(n) q_(j, i) underline(b'_(i)) =
	sum_(i = 1)^(n) x'_(i) underline(b'_(i)) $

	By comparing the third and fourth members of the equality term by term:

	$ x'_(i) = sum_(j = 1)^(n) q_(i, j) x_(j) =>
	mat(x'_(1); x'_(2); dots.v; x'_(n)) =
	mat(
	q_(1, 1), q_(1, 2), dots, q_(1, n);
	q_(2, 1), q_(2, 2), dots, q_(2, n);
	dots.v, dots.v, dots.down, dots.v;
	q_(n, 1), q_(n, 2), dots, q_(n, n))
	mat(x_(1); x_(2); dots.v; x_(n)) =
	Q mat(x_(1); x_(2); dots.v; x_(n)) $

	Substituting the one in the expression of the other gives:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat(x_(1); x_(2); dots.v; x_(n)) =
		P mat(x'_(1); x'_(2); dots.v; x'_(n)) =
		P Q mat(x_(1); x_(2); dots.v; x_(n)) $],
		[$ mat(x'_(1); x'_(2); dots.v; x'_(n)) =
		Q mat(x_(1); x_(2); dots.v; x_(n)) =
		Q P mat(x'_(1); x'_(2); dots.v; x'_(n)) $])

	Since the two matrices on the edges of the equalities are the same,
	for these equalities to hold both matrix products $P Q$ and $Q P$
	must be equal to the identity matrix. In other words, $P$ and $Q$
	are the inverse of each other, therefore:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat(x_(1); x_(2); dots.v; x_(n)) =
		P mat(x'_(1); x'_(2); dots.v; x'_(n)) $],
		[$ mat(x'_(1); x'_(2); dots.v; x'_(n)) =
		P^(-1) mat(x_(1); x_(2); dots.v; x_(n)) $])
]

// ADD AN EXAMPLE
