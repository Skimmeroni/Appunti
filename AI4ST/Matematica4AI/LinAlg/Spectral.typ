#import "../Math4AI_definitions.typ": *

Aside from the notions of sum between two vectors and multiplication of a
vector by a scalar, which are mandatory requirements for a vector space to
be defined as such, for some (but not all) vector spaces it is possible to
also define other operations.

One such example is the *inner product*: given a vector space $V$, the
inner product of two vectors $underline(v_(1))$ and $underline(v_(2))$
of $V$, denoted as $angle.l underline(v_(1)), underline(v_(2)) angle.r$,
is an operation that returns a scalar and that possesses such properties:

- _Symmetry_: for any vectors $underline(v_(1)), underline(v_(2))$,
  $angle.l underline(v_(1)), underline(v_(2)) angle.r =
   angle.l underline(v_(2)), underline(v_(1)) angle.r$
- _Linearity of the first term_: For any two scalars $a, b$ and for any
  vectors $underline(v_(1)), underline(v_(2)), underline(v_(3))$,

  $ angle.l a underline(v_(1)) + b underline(v_(2)), underline(v_(3))
    angle.r = a angle.l underline(v_(1)), underline(v_(3)) angle.r + b
    angle.l underline(v_(2)), underline(v_(3)) angle.r $
- _Positive-definiteness_: for any non-null vectors $underline(v_(1)),
  underline(v_(2))$, $angle.l underline(v_(1)), underline(v_(2)) angle.r
  gt.eq 0$.

The simplest example of an inner product is the one defined for $RR^(n)$,
which is simply a matrix multiplication between a $1 times n$ matrix and
a $n times 1$ matrix:

$ angle.l underline(x), underline(y) angle.r = underline(x)^(T)
  underline(y) = x_(1) y_(1) + x_(2) y_(2) + dots + x_(n) y_(n) =
  sum_(i = 1)^(n) x_(i) y_(i) $

Indeed, such product possesses all of the properties presented above.

Any inner product allows the definition of the *norm* of a vector, which is
the square root of the inner product between a vector and itself:

$ || underline(v) || = sqrt(angle.l underline(v)\, underline(v) angle.r) $

Since the inner product of a vector with itself is always equal or greater
that zero (property 3), such square root is always well-defined.

In turn, the norm of a vector allows the definition of an *angle* between
vectors:

$ cos(theta) = frac(angle.l underline(x)\, underline(y) angle.r,
  || underline(x) || || underline(y) ||) $

If the cosine of the angle between two vectors is $1$, said vectors are
said to be *parallel*, while if it is $0$ they are said to be *orthogonal*.
In particular:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ 1 = frac(angle.l underline(x)\, underline(y) angle.r,
	   || underline(x) || || underline(y) ||) =>
	   angle.l underline(x), underline(y) angle.r =
	   || underline(x) || || underline(y) || $],
	[$ 0 = frac(angle.l underline(x)\, underline(y) angle.r,
	   || underline(x) || || underline(y) ||) =>
	   angle.l underline(x), underline(y) angle.r = 0 $]
)

#exercise[
	Consider the vector space $RR^(2)$. Compute the norm of $mat(1; 2)$.
]
#solution[
	$ sqrt(angle.l mat(1; 2)\, mat(1; 2) angle.r) =
	  sqrt(mat(1, 2) mat(1; 2)) = sqrt(1 dot 1 + 2 dot 2) = sqrt(5) $
]

A basis for a vector space whose vectors are pairwise orthogonal (in other
words, for any distinct $underline(v_(i)), underline(v_(j))$ in said basis,
$angle.l underline(v_(i)), underline(v_(j)) angle.r = 0$) is called an
*orthogonal basis*. In other words, a set of vectors form an orthonormal basis
if, for any distinct $underline(v_(i)), underline(v_(j))$, the following holds:

$ angle.l underline(v_(i)), underline(v_(j)) angle.r =
  cases(1 "if" underline(v_(i)) = underline(v_(j)), 0 "otherwise") $

In particular, if said vectors all have norm equal to $1$, said basis is called
an *orthonormal basis*.

If the eigenvectors of symmetric matrix form an orthonormal basis,
@Diagonalization-theorem applies in a very specific way.

#theorem("Spectral theorem")[
	Let $A$ be a symmetric matrix whose eigenvectors can form an orthonormal
	basis and whose eigenvalues are all real. Then there exist two matrices
	$P$ and $D$ such that $A = P D P^(T)$, where $P$ is an orthogonal
	matrix whose columns are the orthonormal eigenvectors of $A$ and $D$
	is a diagonal matrix whose non-zero elements are the eigenvalues of $A$.
] <Spectral-theorem>
#proof[
	The fact that $P$ and $D$ with these characteristics exist stems from
	@Diagonalization-theorem, since the eigenvectors of $A$ form a basis.
	What has to be proved is that, under such conditions, $P$ is orthogonal.

	// To be retrieved from lectures (messed up)
]

#exercise[
	Consider the following symmetric matrix $A$. Find the two matrices $D$
	and $P$ described in @Spectral-theorem.

	$ A = mat(-1, 1, 0; 1, -1, 0; 0, 0, 3) $
]
#solution[
	$A$ is diagonalizable by virtue of @Symmetric-is-diagonalizable.
	The eigenvalues can be retrieved from:

	$ det(A - lambda I) =
	  mat(delim: "|", -1 - lambda, 1, 0; 1, -1 - lambda, 0; 0, 0, 3 - lambda) =
	  (3 - lambda) mat(delim: "|", -1 - lambda, 1; 1, -1 - lambda) =
	  (3 - lambda)((-1 - lambda)^(2) - 1) = \
	  (3 - lambda)(cancel(1) + lambda^(2) + 2 lambda cancel(- 1)) =
	  (3 - lambda)(lambda^(2) + 2 lambda) =
	  lambda (3 - lambda)(lambda + 2) =>
	  lambda_(1) = 0, lambda_(2) = 3, lambda_(3) = -2 $

	An eigenvector can then be retrieved as follows:

	$ A underline(x) = lambda underline(x) =>
	  mat(-1, 1, 0; 1, -1, 0; 0, 0, 3) mat(x; y; z) =
	  lambda mat(x; y; z) =>
	  mat(-1 dot x + 1 dot y + 0 dot z; 1 dot x - 1 dot y + 0 dot z;
	      0 dot x + 0 dot y + 3 dot z) = mat(lambda x; lambda y; lambda z) =>
	  mat(y - x; x - y; 3z) = mat(lambda x; lambda y; lambda z) $

	Having three eigenvalues, this amounts to solve three systems of
	linear equations:

	$ cases(y - x = lambda_(1) x, x - y = lambda_(1) y, 3z = lambda_(1) z) =>
	  cases(y - x = 0 x, x - y = 0 y, 3z = 0 z) =>
	  cases(y - x = 0, x - y = 0, 3z = 0) =>
	  cases(y = x, x = y, z = 0) =>
	  cases(y = x, 0 = 0, z = 0) =>
	  mat(k; k; 0) space forall k in RR $

	$ cases(y - x = lambda_(2) x, x - y = lambda_(2) y, 3z = lambda_(2) z) =>
	  cases(y - x = 3x, x - y = 3y, 3z = 3z) =>
	  cases(y = 4x, x = 4y, 0 = 0) =>
	  cases(y = 4x, x = 16x, 0 = 0) =>
	  cases(y = 0, x = 0, 0 = 0) =>
	  mat(0; 0; k) space forall k in RR $

	$ cases(y - x = lambda_(3) x, x - y = lambda_(3) y, 3z = lambda_(3) z) =>
	  cases(y - x = -2x, x - y = -2y, 3z = -2z) =>
	  cases(y = -x, x = -y, 5z = 0) =>
	  cases(y = -x, x = -(-x), z = 0) =>
	  cases(y = -x, 0 = 0, z = 0) =>
	  mat(k; -k; 0) space forall k in RR $

	Which gives:

	$ A = P' D P'^(-1) => mat(-1, 1, 0; 1, -1, 0; 0, 0, 3) =
	  mat(k, 0, k; k, 0, -k; 0, k, 0) mat(0, 0, 0; 0, 3, 0; 0, 0, -2)
	  mat(frac(1, 2k), frac(1, 2k), 0; 0, 0, frac(1, k);
	  frac(1, 2k), -frac(1, 2k), 0) $

	Out of all $P$ matrices, the one of interest is the one whose columns
	vectors have norm equal to 1.

	$ || e_(1) || =
	  sqrt(angle.l mat(k; k; 0)\, mat(k; k; 0) angle.r) =
	  sqrt(mat(k; k; 0) mat(k, k, 0)) =
	  sqrt(k dot k + k dot k + 0 dot 0) =
	  sqrt(2k^(2)) = sqrt(2) |k| $

	$ || e_(2) || =
	  sqrt(angle.l mat(0; 0; k)\, mat(0; 0; k) angle.r) =
	  sqrt(mat(0; 0; k) mat(0, 0, k)) =
	  sqrt(0 dot 0 + 0 dot 0 + k dot k) =
	  sqrt(k^(2)) = |k| $

	$ || e_(3) || =
	  sqrt(angle.l mat(k; -k; 0)\, mat(k; -k; 0) angle.r) =
	  sqrt(mat(k; -k; 0) mat(k, -k, 0)) =
	  sqrt(k dot k + (-k) dot (-k) + 0 dot 0) =
	  sqrt(2k^(2)) = sqrt(2) |k| $

	It then suffices to impose the norm to be equal to $1$:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ sqrt(2) |k| = 1 => k = plus.minus frac(1, sqrt(2)) $],
		[$ |k| = 1 => k = plus.minus 1 $],
		[$ sqrt(2) |k| = 1 => k = plus.minus frac(1, sqrt(2)) $]
	)

	Which gives:

	$ A = P D P^(T) => mat(-1, 1, 0; 1, -1, 0; 0, 0, 3) =
	  mat(plus.minus frac(1, sqrt(2)), 0, plus.minus frac(1, sqrt(2));
	      plus.minus frac(1, sqrt(2)), 0, minus.plus frac(1, sqrt(2));
	      0, plus.minus 1, 0) mat(0, 0, 0; 0, 3, 0; 0, 0, -2)
	  mat(plus.minus frac(1, sqrt(2)), plus.minus frac(1, sqrt(2)), 0;
	      0, 0, plus.minus 1;
	      plus.minus frac(1, sqrt(2)), minus.plus frac(1, sqrt(2)), 0) $
]
