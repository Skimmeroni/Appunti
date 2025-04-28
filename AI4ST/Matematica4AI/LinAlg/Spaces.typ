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
