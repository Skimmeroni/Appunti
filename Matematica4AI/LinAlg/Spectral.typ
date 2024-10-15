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

Let $A$ be a symmetric matrix. If its set of eigenvectors ${underline(e_(1)),
dots, underline(e_(n))}$ forms a basis and possesses the following property:

$ angle.l underline(e_(i)), underline(e_(j)) angle.r =
  cases(1 "if" underline(e_(i)) = underline(e_(j)), 0 "otherwise") $

Such set of eigenvectors is said to be a *orthonormal basis* for $A$. In other
words, the set of eigenvectors of a symmetric matrix is an orthonormal basis
for said matrix if each eigenvector is orthogonal with every other (except
with itself).

If symmetric matrix possesses an orthonormal basis, @Diagonalization-theorem
applies in a very specific way.

#theorem("Spectral theorem")[
	Let $A$ be a symmetric matrix that possesses an orthonormal basis and
	whose eigenvalues are all real. Then there exist two matrices $P$ and
	$D$ such that $A = P D P^(T)$, where $P$ is an orthogonal matrix whose
	columns are the eigenvectors of $A$ and $D$ is a diagonal matrix whose
	non-zero elements are the eigenvalues of $A$.
]
#proof[
	The fact that $P$ and $D$ with these characteristics exist stems from
	@Diagonalization-theorem, since the eigenvectors of $A$ form a basis.
	What has to be proved is that, under such conditions, $P$ is orthogonal.

	// To be retrieved from lectures (messed up)
]

A matrix $A$ is said to be *definite positive* if, for any vector
$underline(x)$, $angle.l underline(x), A underline(x) angle.r > 0$.
It is instead said to be *semidefinite positive* if, for any vector
$underline(x)$, $angle.l underline(x), A underline(x) angle.r gt.eq 0$.
