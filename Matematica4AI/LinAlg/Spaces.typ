#import "../Math4AI_definitions.typ": *

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
	Consider the vector space $RR^(n)$. Check if the vectors
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
	Consider the vector space $RR^(n)$. Check if the vectors
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

A transformation $phi.alt: V |-> W$, with both $V$ and $W$ being vector
spaces, is called a *linear transformation* if and only if:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ phi.alt(underline(v_(1)) + underline(v_(2))) =
	   phi.alt(underline(v_(1))) + phi.alt(underline(v_(2)))
	   space forall underline(v_(1)), underline(v_(2)) in V $],
	[$ phi.alt(lambda underline(v)) = lambda phi.alt(underline(v))
	   space forall underline(v) in V, lambda in RR $]
)

In particular, if $V = W$, the transformation $phi.alt$ is said to be an
*endomorphism*.

#exercise[
	Consider the vector space $RR$ (that is, the set of real numbers). Check
	whether the transformations $phi.alt_(1) (x) = 2 x$ and $phi.alt_(2) (x) =
	x + 1$ are linear or not.
]
#solution[
	- The transformation $phi.alt_(1) (x) = 2 x$ is linear. Infact, given two
	  real numbers $a$ and $b$, is indeed true that $2(a + b) = 2 a + 2 b$,
	  since the product between real numbers has the distributive property.
	  Similarly, given a real number $a$ and a real number $lambda$, it is
	  true that $2(lambda a) = 2 lambda a$, since the product between real
	  numbers has the associative property;
	- The transformation $phi.alt_(2) (x) = x + 1$ is not linear. Given two
	  real numbers $a$ and $b$, it results in $phi.alt_(2) (a + b) = (a + b)
	  + 1 = a + b + 1$, while $phi.alt_(2) (a) + phi.alt_(2) (b) = a + 1 + b
	  + 1 = a + b + 2$.
]

It can be shown that a linear transformation is equivalent to a manipulation
of matrices.

Let $phi.alt: V |-> W$ be a linear transformation between two vector space
$V$ and $W$. Let $B = {underline(b_(1)), dots, underline(b_(n))}$ be a basis
for $V$ and $C = {underline(c_(1)), dots, underline(c_(m))}$ a basis for $W$.
Each vector $underline(x) in V$ can be written as a linear combination of the
vectors of $B$:

$ underline(x) = sum_(i = 1)^(n) lambda_(i) underline(b_(i)) $

Applying $phi.alt$ to $underline(x)$ gives:

$ phi.alt(underline(x)) =
  phi.alt(sum_(i = 1)^(n) lambda_(i) underline(b_(i))) =
  sum_(i = 1)^(n) phi.alt(lambda_(i) underline(b_(i))) =
  sum_(i = 1)^(n) lambda_(i) phi.alt(underline(b_(i))) $

The two rightmost equalities stem from the fact that $phi.alt$ is linear.

Each $phi.alt(b_(i))$ is a vector of $W$, since it's the result of applying
$phi.alt$ to an vector of $V$. This means that each $phi.alt(b_(i))$ can
itself be written as a linear combination of elements of $C$:

$ phi.alt(b_(i)) = sum_(j = 1)^(m) gamma_(j, i) c_(j) $

Substituting it back in the previous expression gives:

$ phi.alt(underline(x)) =
  sum_(i = 1)^(n) lambda_(i) (sum_(j = 1)^(m) gamma_(j, i) c_(j)) =
  sum_(i, j = 1)^(n, m) lambda_(i) gamma_(j, i) c_(j) $

This means that, fixed a given basis $B$, to know all the relevant
information regarding a vector $underline(x)$ of $V$ it suffices to
"store" the $lambda$ coefficients of its linear combination with
respect to $B$ in a (column) vector.

In a similar fashion, to know all the relevant information of its
image $phi.alt(underline(x))$ it suffices to store the $sum_(j = 1)^(m)
lambda_(i) gamma_(j, i)$ coefficients of its linear combination with
respect to $C$ in a (column) vector:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ underline(x) <==> mat(lambda_(1); dots.v; lambda_(n)) $],
	[$ phi.alt(underline(x)) <==> mat(mu_(1); dots.v; mu_(n)) $]
)

Where, for clarity, each $sum_(j = 1)^(m) lambda_(i) gamma_(j, i)$ has been
written simply as $mu_(i)$.

It is then possible to describe the application of the transformation
$phi.alt$ as the following product of matrices:

$ mat(mu_(1); dots.v; mu_(n)) =
  mat(gamma_(1, 1), gamma_(1, 2), dots, gamma_(1, n);
      gamma_(2, 1), gamma_(2, 2), dots, gamma_(2, n);
      dots.v, dots.v, dots.down, dots.v;
      gamma_(m, 1), gamma_(m, 2), dots, gamma_(m, n))
  mat(lambda_(1); dots.v; lambda_(n)) $
