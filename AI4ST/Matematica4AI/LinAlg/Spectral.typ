#import "../Math4AI_definitions.typ": *

=== Definition

Vector spaces, to be qualified as such, must provide the notion of a sum
between two vectors and the notion of a multiplication between a vector
and a scalar. However, some vector spaces support operations that go beyond
these two.

One such example is the *inner product*: given a vector space $V$, the
inner product of two vectors $underline(v_(1))$ and $underline(v_(2))$
of $V$, denoted as $angle.l underline(v_(1)), underline(v_(2)) angle.r$,
is an operation that returns a scalar and that possessing these properties:

- *Symmetry*: for any vectors $underline(v_(1)), underline(v_(2))$,
  $angle.l underline(v_(1)), underline(v_(2)) angle.r =
   angle.l underline(v_(2)), underline(v_(1)) angle.r$
- *Linearity of the first term*: For any two scalars $a, b$ and for any
  vectors $underline(v_(1)), underline(v_(2)), underline(v_(3))$,
  $angle.l a underline(v_(1)) + b underline(v_(2)), underline(v_(3))
    angle.r = a angle.l underline(v_(1)), underline(v_(3)) angle.r + b
    angle.l underline(v_(2)), underline(v_(3)) angle.r$
- *Positive-definiteness*: for any non-null vectors $underline(v_(1)),
  underline(v_(2))$, $angle.l underline(v_(1)), underline(v_(2)) angle.r
  gt.eq 0$.

Vector spaces having a well defined notion of an inner product are called
*inner product vector spaces*. Since it always return a scalar, the inner
product is sometimes also referred to as the *scalar product*.

#exercise[
	Is $RR^(n)$ an inner product vector space?
]
#solution[
	Yes. Given any two vectors $underline(x)$ and $underline(y)$ in
	$RR^(n)$, the standard inner product over $RR^(n)$ is defined as:

	$ angle.l underline(x), underline(y) angle.r =
	  x_(1) y_(1) + x_(2) y_(2) + dots + x_(n - 1) y_(n - 1) + x_(n) y_(n) =
	  sum_(i = 1)^(n) x_(i) y_(i) $

	All three properties are satisfied:

	- $angle.l underline(x), underline(y) angle.r =
	   x_(1) y_(1) + dots + x_(n) y_(n) =
	   y_(1) x_(1) + dots + y_(n) x_(n) =
	   angle.l underline(y), underline(x) angle.r$
	- $angle.l a underline(x) + b underline(y), underline(z) angle.r =
	   (a x_(1) + b y_(1)) z_(1) + dots + (a x_(n) + b y_(n)) z_(n) =
	   a (x_(1) z_(1)) + b (y_(1) z_(1)) + dots + a (x_(n) z_(n)) + b (y_(n) z_(n)) =
	   a angle.l underline(x), underline(z) angle.r + b angle.l underline(y), underline(z) angle.r $
	- $angle.l underline(x), underline(x) angle.r = 
	   x_(1) x_(1) + dots + x_(n) x_(n) =
	   x_(1)^(2) + dots + x_(n)^(2) gt.eq 0$
]

=== Orthogonality

Any inner product induces a definition of *norm* of a vector, which
generalizes the intuitive notion of "length":

$ abs(abs(underline(v))) = sqrt(angle.l underline(v)\, underline(v) angle.r) $

The inner product of a vector with itself is always non-negative, therefore
the square root is non problematic. Since it's always possible to define a
norm for any inner product vector space, they are also called *normed vector
spaces*.

In turn, the norm of a vector induces a definition of *angle* between
vectors:

$ theta = arccos(frac(angle.l underline(x)\, underline(y) angle.r,
                 abs(abs(underline(x))) abs(abs(underline(y))))) $

If the cosine of the angle between two vectors is $1$, said vectors are
said to be *parallel*, while if it is $0$ they are said to be *orthogonal*.
In particular:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ 1 = frac(angle.l underline(x)\, underline(y) angle.r,
	       abs(abs(underline(x))) abs(abs(underline(y)))) =>
	       angle.l underline(x), underline(y) angle.r =
	       abs(abs(underline(x))) abs(abs(underline(y))) $],
	[$ 0 = frac(angle.l underline(x)\, underline(y) angle.r,
	       abs(abs(underline(x))) abs(abs(underline(y)))) =>
	       angle.l underline(x), underline(y) angle.r = 0 $]
)

#exercise[
	Consider the vector space $RR^(3)$. Compute the norm of $(1, 2, 3)$.
]
#solution[
	$ abs(abs((1, 2, 3))) =
	  sqrt(angle.l (1\, 2\, 3)\, (1\, 2\, 3) angle.r) =
	  sqrt(1 dot 1 + 2 dot 2 + 3 dot 3) =
	  sqrt(1 + 4 + 9) =
	  sqrt(13) $
]

A set of vectors that are all orthogonal to each other is called
an *orthogonal set*. A set of vectors $V = {underline(v_(1)), dots,
underline(v_(n))}$ is orthogonal if, for any pair of vectors
$underline(v_(i))$ and $underline(v_(j))$ that are distinct,
$angle.l underline(v_(i)), underline(v_(j)) angle.r = 0$. An
orthogonal set that also forms a basis is called an *orthogonal
basis*.

A set of vectors that is both orthogonal and having all vectors with
norm equal to $1$ is called an *orthonormal set*; an orthonormal set
that also forms a basis is called an *orthonormal basis*. A set $V$
of vectors forms an orthonormal set if, for any $underline(v_(i)),
underline(v_(j)) in V$, the following holds:

$ angle.l underline(v_(i)), underline(v_(j)) angle.r =
  cases(1 "if" underline(v_(i)) = underline(v_(j)), 0 "otherwise") $

By extension, an *orthogonal matrix* is a matrix whose rows/columns,
considered as vectors, form an orthogonal set.

#proposition[
	An orthogonal matrix has its inverse equal to its transposed.
] <Orthogonal-inverse-equals-transposed>
// #proof[
// 
// ]

=== Spectral theorem

@Diagonalization-theorem holds an interesting result when applied to
symmetric matrices.

// #lemma[
// A symmetric matrix is always diagonalizable.
// ]
// #proof[
//
// ]

#theorem("Spectral theorem")[
	If $A$ is a symmetric matrix, there exists an orthonormal basis of the
	corresponding vector space $V$ consisting of eigenvectors of $A$, and
	each eigenvalue is real.
] <Spectral-theorem>
// #proof[
//
// ]

#exercise[
	Diagonalize the following symmetric matrix $A in "Mat"(3 times 3)$.
	Find an orthonormal basis out of its eigenvectors.

	$ A = mat(-1, 1, 0; 1, -1, 0; 0, 0, 3) $
]
#solution[
	The characteristic polynomial of $A$ is given by:

	$ p_(A)(lambda) &=
	  det(A - lambda I) =
	  det(mat(-1 -lambda, 1, 0; 1, -1 -lambda, 0; 0, 0, 3 -lambda)) =
	  (3 - lambda) det(mat(-1 -lambda, 1; 1, -1 -lambda)) = \
	  &= (3 - lambda)((-1 - lambda)^(2) - 1) =
	  (3 - lambda)(cancel(1) + lambda^(2) + 2 lambda cancel(- 1)) =
	  lambda (3 - lambda)(lambda + 2) $

	The spectrum of $A$ is ${-2, 0, 3}$. As for the eigenvectors:

	$ A underline(x) = lambda underline(x) =>
	  mat(-1, 1, 0; 1, -1, 0; 0, 0, 3) vec(x, y, z) = lambda vec(x, y, z) =>
	  vec(-1 dot x + 1 dot y + 0 dot z,
	      1 dot x - 1 dot y + dot 0 dot z,
	      0 dot x + 0 dot y + 3 dot z) 
	  = vec(lambda x, lambda y, lambda z) =>
	  cases(y - x = lambda x, x - y = lambda y, 3z = lambda z) $

	Solving for $lambda_(1) = -2, lambda_(2) = 0, lambda_(3) = 3$:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ cases(y - x = -2x, x - y = -2y, 3z = -2z) =>
		   cases(x = -y, y = y, z = 0) $],
		[$ cases(y - x = 0, x - y = 0, 3z = 0) =>
		   cases(x = y, y = y, z = 0) $],
		[$ cases(y - x = 3x, x - y = 3y, 3z = 3z) =>
		   cases(x = 0, y = 0, z = z) $]
	)

	Which gives: $E_(lambda_(1)) = "span"{(-t, t, 0)^(T)}$,
	$E_(lambda_(2)) = "span"{(t, t, 0)^(T)}$,
	$E_(lambda_(3)) = "span"{(0, 0, t)^(T)}$. Out of all
	the eigenvectors, the interest is to find the ones having
	norm equal to $1$.

	$ abs(abs((-t, t, 0)^(T))) &= 1 =>
	  sqrt((-t) dot (-t) + t dot t + 0 dot 0) = 1 =>
	  sqrt(2t^(2)) = 1 =>
	  t = plus.minus frac(1, sqrt(2)) \
	  abs(abs((t, t, 0)^(T))) &= 1 =>
	  sqrt(t dot t + t dot t + 0 dot 0) = 1 =>
	  sqrt(2t^(2)) = 1 =>
	  t = plus.minus frac(1, sqrt(2)) \
	  abs(abs((0, 0, t)^(T))) &= 1 =>
	  sqrt(0 dot 0 + 0 dot 0 + t dot t) = 1 =>
	  sqrt(t^(2)) = 1 =>
	  t = plus.minus 1 $

	The diagonalization of $A$ is as follows:

	$ mat(-1, 1, 0; 1, -1, 0; 0, 0, 3) =
	  mat(-frac(1, sqrt(2)), frac(1, sqrt(2)), 0;
	      frac(1, sqrt(2)), frac(1, sqrt(2)), 0;
	      0, 0, 1)
	  mat(-2, 0, 0; 0, 0, 0; 0, 0, 3)
	  mat(-frac(1, sqrt(2)), frac(1, sqrt(2)), 0;
	      frac(1, sqrt(2)), frac(1, sqrt(2)), 0;
	      0, 0, 1) $

	Where the $plus.minus$ sign has been factored out.
	Note that, due to @Orthogonal-inverse-equals-transposed, the
	eigenvector matrices have their inverse equal to their transposed.
]

=== Definite matrices

Let $A$ be a symmetric matrix and let $underline(x)$ be a column vector.
$A$ is said to be:

- *Definite positive* if, for any $underline(x)$, $angle.l underline(x), A underline(x) angle.r > 0$;
- *Semidefinite positive* if, for any $underline(x)$, $angle.l underline(x), A underline(x) angle.r gt.eq 0$;
- *Definite negative* if, for any $underline(x)$, $angle.l underline(x), A underline(x) angle.r < 0$;
- *Semidefinite negative* if, for any $underline(x)$, $angle.l underline(x), A underline(x) angle.r lt.eq 0$;
- *Indefinite* otherwise.

#proposition[
	Let $A$ be a symmetric matrix. If $A$ is:

	- Definite positive, all of its eigenvalues are strictly positive;
	- Semidefinite positive, all of its eigenvalues are non negative;
	- Definite negative, all of its eigenvalues are strictly negative;
	- Semidefinite negative, all of its eigenvalues are non positive;
] <Definite-matrices-eigenvalues>
// #proof[
// To be retrieved from lectures (messed up)
// ]

#lemma[
	For any matrix $A$, the matrices $A^(T) A$ and $A A^(T)$ are positive
	semidefinite.
] <A-transposed-A-positive-semidefinite>
#proof[
	For a matrix to be positive definite it also needs to be symmetric.
	Matrix $A^(T) A$ is indeed symmetric since $(A^(T) A)^(T) = A^(T)
	(A^(T))^(T) = A^(T) A$. Let $underline(y) = A underline(x)$. Then
	$underline(y)^(T) = (A underline(x))^(T) = underline(x)^(T) A^(T)$.
	This means that:

	$ angle.l underline(x), A^(T) A underline(x) angle.r =
	  underline(x)^(T) A^(T) A underline(x) =
	  underline(y)^(T) underline(y) = sum_(i = 1)^(n) y_(i)^(2) $

	Which, by definition, is greater or equal than $0$. $A A^(T)$ can be
	proven to be positive semidefinite following a similar line of thought.
]
