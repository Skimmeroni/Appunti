#import "../Math4AI_definitions.typ": *

// What's the point of eigen stuff?

Let $A$ be an $n times n$ square matrix, and let $lambda$ be a real value.
The $n$-dimensional vector $underline(x)$ is said to be an *eigenvector*
of $A$ if it's not null and if:

$ A underline(x) = lambda underline(x) $

Where $lambda$ is the corresponding *eigenvalue* of $A$.

Retrieving the eigenvectors of a matrix $A$ by applying such definition is
not possible, since the information contained in the equation is insufficient.
Infact:

$ A underline(x) = lambda underline(x) =>
  mat(a_(1, 1), a_(1, 2), dots, a_(1, n);
      a_(2, 1), a_(2, 2), dots, a_(2, n);
      dots.v, dots.v, dots.down, dots.v;
      a_(n, 1), a_(n, 2), dots, a_(n, n))
  mat(x_(1); x_(2); dots.v; x_(n)) =
  lambda mat(x_(1); x_(2); dots.v; x_(n)) =>
  cases(
	a_(1, 1) dot x_(1) + a_(1, 2) dot x_(2) + dots + x_(n) a_(1, n) =
	lambda x_(1),
	a_(2, 1) dot x_(1) + a_(2, 2) dot x_(2) + dots + x_(n) a_(2, n) =
	lambda x_(2),
	dots.v,
	a_(n, 1) dot x_(1) + a_(n, 2) dot x_(2) + dots + x_(n) a_(n, n) =
	lambda x_(n)) $

Even assuming the $A$ matrix to be known, this system of equation has $n$
equations but $n + 1$ unknowns (the $n$ components of $underline(x)$ and
$lambda$). It is still possible to retrieve the eigenvectors of a matrix
by following a different approach, by first retrieving its eigenvalues and
then applying such definition.

Given a square matrix $A$ and a real value $lambda$, the *characteristic
polynomial* of $A$ is defined as:

$ p_(A)(lambda) = det(A - lambda I) = c_(0) + c_(1) lambda + c_(2) lambda^(2)
  + dots + c_(n − 1) lambda^(n − 1) + (−1)^(n) lambda^(n) $

Where:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ c_(0) = det(A) $],
	[$ c_(n − 1) = (−1)^(n − 1) tr(A) $]
)

#theorem[
	A real value is an eigenvalue for a given matrix if and only if
	it is a root of its characteristic polynomial.
] <Eigenvalues-as-polynomial-roots>
#proof[
	First, suppose that $lambda in RR$ is an eigenvalue for a $n times n$
	square matrix $A$. By definition of eigenvalue, there must exist a
	non-null vector $underline(x)$ such that $A underline(x) = lambda
	underline(x)$. Then:

	$ A underline(x) = lambda underline(x) =>
	  A underline(x) = lambda I underline(x) =>
	  A underline(x) - lambda I underline(x) = underline(0) =>
	  (A - lambda I) underline(x) = underline(0) $

	This means that $underline(x)$ is a vector that belongs to the kernel of
	the matrix $(A - lambda I)$. Therefore, the nullity of $(A - lambda I)$
	can't be zero.

	By @Rank-nullity-theorem, $dim(A - lambda I) = "rank"(A - lambda I) +
	"null"(A - lambda I)$. But $(A - lambda I)$ and $A$ have the same
	dimension, therefore $n = "rank"(A - lambda I) + "null"(A - lambda I)$.
	Since $"null"(A - lambda I)$ is non zero, for this equality to hold
	the rank of $(A - lambda I)$ has to be less than $n$.
	By @Full-rank-matrices-are-invertible, the matrix $(A - lambda I)$
	cannot be invertible, and by @Invertible-matrices-not-null-determinant
	this must mean that the determinant of $(A - lambda I)$ is $0$.

	Suppose then that $lambda$ is a root for the characteristic
	polynomial of $A$. This means that $det(A - lambda I)$ is
	equal to $0$. By @Invertible-matrices-not-null-determinant,
	this must mean that $(A - lambda I)$ is not invertible, which
	in turn by @Full-rank-matrices-are-invertible must mean that
	the rank of $(A - lambda I)$ is less than $n$. By @Rank-nullity-theorem,
	$n = "rank"(A - lambda I) + "null"(A - lambda I)$, and being the rank
	less than $n$ in turn implies that the kernel of $(A - lambda I)$ does
	not contain just the null vector. This means that it exists a vector
	$underline(x)$ such that $(A - lambda I) underline(x) = underline(0)$.
	But then:

	$ (A - lambda I) underline(x) = underline(0) =>
	  A underline(x) - lambda I underline(x) = underline(0) =>
	  A underline(x) = lambda I underline(x) =>
	  A underline(x) = lambda underline(x) $

	Which is the definition of eigenvalue.
]

Knowing how to compute eigenvalues, it is then possible to solve the
aforementioned equation and retrieve the eigenvectors.

// ADD AN EXAMPLE

Eigenvectors and eigenvalues can be defined with respect to linear
transformations as well. Given a linear transformation $T: V |-> V$,
a vector $underline(v) in V$ is an eigenvector for $T$ if $T underline(v)
= lambda underline(v)$, where $lambda$ is an eigenvalue for $T$. Notice
how it has been imposed that the transformation $T$ is an endomorphism,
since otherwise mirroring the definition of eigenvector for matrices
could not have been possible.

As stated in @Eigenvalues-as-polynomial-roots, to compute the eigenvalues
of a matrix, it suffices to compute its characteristic polynomial. But any
matrix can be associated to a linear transformation and vice versa, therefore
to compute the eigenvalues of a linear transformation it suffices to compute
the characteristic polynomial of the associated matrix of the linear
transformation.

#theorem[
	Let $T: V |-> V$ be an endomorphism, and let $A$ and $A'$ be two
	matrices associated to $T$ with respect to the bases $cal(B)$ and
	$cal(B')$ respectively. The characteristic polynomials of $A$ and
	$A'$ are equivalent.
] <Characteristic-polynomial-is-of-transformation>
#proof[
	The result follows from applying
	@Matrix-basis-change-is-matrix-multiplication
	to the characteristic polynomial of one of the matrices:

	$ p_(A)(lambda) = det(A - lambda I) = det(P A' P^(-1) - lambda I) =
	det(P A' P^(-1) - lambda P I P^(-1)) = \
	det(P (A' P^(-1) - lambda I P^(-1))) =
	det(P (A' - lambda I) P^(-1)) =
	cancel(det(P)) det(A' - lambda I) cancel(det(P^(-1))) = \
	det(A' - lambda I) = p_(A')(lambda) $
]

@Characteristic-polynomial-is-of-transformation justifies referring
to such polynomial as the characteristic polynomial of the linear
transformation itself, and not to one of the possible associated
matrices to such transformation, since the choice of the matrix is
irrelevant. Of course, the best choice for the associated matrix is
the one constructed with respect to the canonical basis, because in
general it requires the least amount of effort.

#theorem("Diagonalization theorem")[
	- *With respect to endomorphisms*. Let $T: V |-> V$ be an endomorphism
	  of dimension $n$ that has $n$ linearly independent eigenvectors
	  $underline(e_(1)), dots, underline(e_(n))$. Let $E$ be the set that
	  contains such vectors, forming a basis for $V$. Let $P$ be the matrix
	  associated to $T$ with respect to the vectors in $E$. The matrix $P$
	  is a diagonal matrix whose non-zero element are the eigenvalues of $T$.
	- *With respect to matrices*. Let $A$ be a $n times n$ matrix that has
	  $n$ linearly independent eigenvectors $underline(e_(1)), dots,
	  underline(e_(n))$. Then there exist two matrices $P$ and $D$ such
	  that $A = P D P^(-1)$, where $P$ is an invertible matrix whose columns
	  are the eigenvectors of $A$ and $D$ is a diagonal matrix whose non-zero
	  elements are the eigenvalues of $A$.
] <Diagonalization-theorem>
#proof[
	// To be revisited with respect to both points

	The first point is trivial

	For the second point, consider the two matrices $P$ and $D$:

	#grid(
	columns: (0.5fr, 0.5fr),
	[$ P = mat(underline(e_(1)), underline(e_(2)), dots, underline(e_(n))) =
	  mat(e_(1, 1), e_(2, 1), dots, e_(n, 1);
	  e_(1, 2), e_(2, 2), dots, e_(n, 2);
	  dots.v, dots.v, dots.down, dots.v;
	  e_(1, n), e_(2, n), dots, e_(n, n);) $],
	[$ D = mat(lambda_(1), 0, dots, 0;
	  0, lambda_(2), dots, 0;
	  dots.v, dots.v, dots.down, dots.v;
	  0, 0, dots, lambda_(n);) $])

	The matrix multiplication $A P$ is by definition equivalent to
	multiplying $A$ with each column vector of $P$. That is, the $i$-th
	column of $A P$ is given by multiplying the matrix $A$ with the $i$-th
	column vector of $P$, giving $A underline(e_(i))$. But by definition
	multiplying the matrix representation of an endomorphism with one of
	his eigenvectors is equivalent to multiplying said eigenvector by its
	corresponding eigenvalue. Therefore:

	$ A P = mat(A underline(e_(1)), A underline(e_(2)), dots,
	  A underline(e_(n))) = mat(lambda_(1) underline(e_(1)),
	  lambda_(2) underline(e_(2)), dots, lambda_(n) underline(e_(n))) $

	Consider the matrix multiplication $P D$. By definition, the $i$-th
	element of such matrix is given by the sum of the products of the
	corresponding elements of the $i$-th row of $P$ and the $i$-th column
	of $D$. By construction, the elements in $D$ are zero except for the
	ones on its diagonal, therefore the $i$-th column of $P D$ is just
	the $i$-th column vector of $P$ multiplied by the $i, i$-th element
	of $D$, which is $lambda_(i)$. Therefore:

	$ P D = mat(lambda_(1) underline(e_(1)), lambda_(2) underline(e_(2)),
	  dots, lambda_(n) underline(e_(n))) $

	This shows that the two matrix products $A P$ and $P D$ are equivalent.
	Since by assumption the set of the eigenvectors of $A$ form a basis, by
	@Full-rank-matrices-are-invertible $P$ has to be invertible. But then:

	$ A P = P D => A cancel(P) cancel(P^(-1)) = P D P^(-1) => A = P D P^(-1) $
]

If for a given square matrix $A$ there exist an invertible matrix $P$
and a diagonal matrix $D$ such that $A = P D P^(-1)$, matrix $A$ is
said to be *diagonalizable*. As stated in @Diagonalization-theorem,
the matrix $P$ is an invertible matrix whose columns are the eigenvectors
of $A$ while $D$ is a diagonal matrix whose non-zero elements are the
eigenvalues of $A$.

By the Fundamental Theorem of Algebra, the characteristic polynomial
of any matrix will always have at least $n$ roots, albeit they might
be complex numbers. Therefore, any square matrix will always have $n$
(not necessarely distinct) eigenvalues. Despite this, the fact that the
set of its eigenvectors forms a basis for the vector space associated to
$A$ isn't always true, therefore not all matrices are diagonalizable. A
matrix whose set of eigenvectors does not form a basis is said to be
*defective*.

// Add an example of a diagonalizable matrix

#exercise[
	Prove that the matrix $A = mat(0, 1; 0, 0)$ is defective.
]
#solution[
	Computing the characteristic polynomial of $A$ gives:

	$ p_(A)(lambda) =
	  det(A - lambda I) =
	  mat(delim: "|", 0 - lambda, 1 - 0; 0 - 0, 0 - lambda) =
	  mat(delim: "|", -lambda, 1; 0, -lambda) =
	  (-lambda) dot (-lambda) - (0 dot 1) =
	  lambda^(2) $

	Such polynomial has only two roots, both being $0$. Therefore, the
	eigenvalues of $A$ are $lambda_(1) = lambda_(2) = 0$. By applying the
	definition:

	$ A underline(x) = lambda underline(x) =>
	mat(0, 1; 0, 0)
	mat(x; y) =
	0 mat(x; y) =>
	mat(0 dot x + 1 dot y; 0 dot x + 0 dot y)
	= mat(0 dot x; 0 dot y) =>
	mat(y; 0) = mat(0; 0) =>
	cases(y = 0, 0 = 0) $

	This means that the eigenvectors of $A$ are all the vectors in the
	form $mat(0; k)$ with $k in RR$. Of course, the set $E = {mat(0; k)}
	subset RR^(2)$ is not linearly independent (at least two vectors are
	needed) and therefore $A$ is defective.
]

Determining whether a matrix is diagonalizable through such definition can
quickly become cumbersome, but there are necessary and sufficient conditions
that are equivalent and that can ease the process.

Let $A$ be a matrix and $lambda$ one of its eigenvalues. The number of
times $lambda$ appears as a root of the characteristic polynomial of $A$
is the *algebraic multiplicity* of $lambda$, and is denoted as $m_(a)(lambda)$.
The dimension of the vector space generated by the set of eigenvectors that
have $lambda$ as their eigenvalue is the *geometric multiplicity* of $lambda$,
and is denoted as $m_(g)(lambda)$.

#theorem[
	For any eigenvalue $lambda$, the following inequality holds:

	$ 1 lt.eq m_(g)(lambda) lt.eq m_(a)(lambda) $
] <Eigenvalues-inequality>
// #proof[
// To be added
// ]

#theorem[
	A matrix is diagonalizable if and only if, for each of its eigenvalues
	$lambda_(i)$, $m_(g)(lambda_(i)) = m_(a)(lambda_(i))$.
] <Same-multiplicity-is-diagonalizable>
// #proof[
// To be added
//]

#corollary[
	Any $n times n$ matrix that has $n$ distinct eigenvalues is diagonalizable.
] <Single-multiplicity-is-diagonalizable>
#proof[
	If a matrix has as many distinct eigenvalues as its dimension it means
	that the algebraic multiplicity of any of its eigenvalues is $1$. By
	@Eigenvalues-inequality, for any eigenvalue $lambda_(i)$ its geometric
	multiplicity must also be $1$, because $1 lt.eq m_(g)(lambda_(i)) lt.eq
	1$. The fact that such matrix is diagonalizable follows from applying
	@Same-multiplicity-is-diagonalizable.
]

#theorem[
	A symmetric matrix is always diagonalizable.
]
