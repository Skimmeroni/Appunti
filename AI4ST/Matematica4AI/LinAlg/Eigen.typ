#import "../Math4AI_definitions.typ": *

=== Definition

Let $A$ be an $n times n$ square matrix, and let $lambda$ be a real value.
The $n$-dimensional vector $underline(x)$ is said to be an *eigenvector*
of $A$ if it's not null and if:

$ A underline(x) = lambda underline(x) $

Where $lambda$ is the corresponding *eigenvalue* of $A$. The set of all
the (distinct) eigenvalues of a matrix is called its *eigenspectrum*,
or just *spectrum*. It is customary to sort the spectrum of a matrix in
descending order.

Note that it's impossible to retrieve the eigenvectors of a matrix $A$ by
applying such definition directly. This is because the information contained
in the equation is insufficient:

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

Even if the entries of $A$ were to be known, each equation has $n$
known terms and $n + 1$ unknowns (the $n$ components of $underline(x)$
and $lambda$).

=== Computing the eigenvalues

The correct way to obtain the eigenvectors of a matrix is to retrieve
its eigenvalues first. Then, once known, apply the definition to retrieve
the eigenvectors.

Given a square matrix $A$ and a real value $lambda$, the *characteristic
polynomial* of $A$ is defined as:

$ p_(A)(lambda) =
  det(A - lambda I) &=
  c_(0) + c_(1) lambda + c_(2) lambda^(2) + dots + c_(n - 1) lambda^(n − 1) + (−1)^(n) lambda^(n) $

With $c_(0), c_(1), dots, c_(n - 1) in RR$. In particular:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ c_(0) = det(A) $],
	[$ c_(n - 1) = (−1)^(n - 1) tr(A) $]
)

The characteristic polynomial of a matrix can be used to retrieve said spectrum.

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

Note that an eigenvalue might appear more than once as root of the
characteristic polynomial. The number of times an eigenvalue figures
as solution to the characteristic polynomial of a matrix is referred
to as the *algebraic multiplicity* of the eigenvalue. The algebraic
multiplicity of an eigenvalue $lambda$ is denoted as $m_(a)(lambda)$.

#exercise[
	What is the spectrum of the following matrix?

	$ A = mat(7, frac(10, 3), -frac(2, 3);
	          -1, frac(7, 3), -frac(2, 3);
	          1, frac(2, 3), frac(11, 3)) $
] <Compute-eigenvalues>
#solution[
	The determinant of $A$ is $75$. Applying @Eigenvalues-as-polynomial-roots:

	$ p_(A)(lambda) &=
	  det(A - lambda I) =
	  det(mat(7, frac(10, 3), -frac(2, 3);
	          -1, frac(7, 3), -frac(2, 3);
	          1, frac(2, 3), frac(11, 3)) -
	      mat(lambda, 0, 0;
	          0, lambda, 0;
	          0, 0, lambda)) =
	  det(mat(7 - lambda, frac(10, 3), -frac(2, 3);
	          -1, frac(7, 3) - lambda, -frac(2, 3);
	          1, frac(2, 3), frac(11, 3) - lambda)) = \
	  &= (7 - lambda) det(mat(frac(7, 3) - lambda, -frac(2, 3); frac(2, 3), frac(11, 3) - lambda))
	     -frac(10, 3) det(mat(-1, -frac(2, 3); 1, frac(11, 3) - lambda))
	     -frac(2, 3) det(mat(-1, frac(7, 3) - lambda; 1, frac(2, 3))) = \
	  &= (7 - lambda)((frac(7, 3) - lambda)(frac(11, 3) - lambda) + frac(4, 9))
	     -frac(10, 3)(-frac(11, 3) + lambda + frac(2, 3))
	     -frac(2, 3)(-frac(2, 3) - frac(7, 3) + lambda) = \
	  &= (7 - lambda)(frac(77, 9) - frac(7, 3) lambda - frac(11, 3) lambda + lambda^(2) + frac(4, 9))
	     -frac(10, 3)(lambda - 3) -frac(2, 3)(lambda - 3) = \
	  &= (7 - lambda)(lambda^(2) - 6 lambda + 9) -4 (lambda - 3) =
	     7 lambda^(2) - 42 lambda + 63 - lambda^(3) + 6 lambda^(2) - 9 lambda -4 lambda + 12 = \
	  &= - lambda^(3) + 13 lambda^(2) - 55 lambda + 75 =
	     -(lambda - 5)(lambda^(2) - 8 lambda + 15) =
	     -(lambda - 5)(lambda - 5)(lambda - 3) $

	The two solutions are $lambda_(1) = 3$ with algebraic multiplicity
	equal to $2$ and $lambda_(2) = 5$ with algebraic multiplicity equal
	to $1$. The spectrum of $A$ is then the set ${3, 5}$.
]

#proposition[
	Similar matrices have the same spectrum.
] <Similar-matrices-same-spectrum>
#proof[
	Let $A$ and $B$ be two similar matrices. There exist then an
	invertible matrix $P$ such that $A = P B P^(-1)$. Let $p_(A)(lambda)$
	and $p_(B)(lambda)$ be the characteristic polynomial of $A$ and $B$
	respectively. Applying @Matrix-basis-change-is-matrix-multiplication
	to $p_(A)(lambda)$:

	$ p_(A)(lambda) &= det(A - lambda I) = det(P B P^(-1) - lambda I) =
	  det(P B P^(-1) - lambda P I P^(-1)) = \
	  &= det(P (B P^(-1) - lambda I P^(-1))) =
	  det(P (B - lambda I) P^(-1)) =
	  cancel(det(P)) det(B - lambda I) cancel(det(P^(-1))) = \
	  &= det(B - lambda I) = p_(B)(lambda) $
]

There is also an interesting connection between the eigenvalues of a
matrix, its determinant and its trace.

#proposition[
	The determinant of a matrix is the product of its eigenvalues
	(counted with multiplicity), whereas the trace of a matrix is
	the sum of its eigenvalues (counted with multiplicity).
]
// #proof[
//
// ]

=== Computing the eigenvectors

Once @Eigenvalues-as-polynomial-roots is applied, it is then possible
to retrieve the eigenvectors of a matrix by applying the definition.

Note that the expression $det(A - lambda I) = 0$ entails that the system
of equations associated to $A underline(x) = lambda underline(x)$ has an
infinite number of solutions. This means that for each eigenvalue there
exist not just one eigenvector, but an infinite set of them.

The vector space spanned by each set of eigenvectors associated
to a certain eigenvalue is called its *eigenspace*. The eigenspace
associated to an eigenvalue $lambda$ is denoted as $E_(lambda)$.
The dimension of an eigenspace is referred to as the *geometric
multiplicity* of the corresponding eigenvalue. The geometric
multiplicity of an eigenvalue $lambda$ is denoted as $m_(g)(lambda)$.

#exercise[
	What are the eigenspaces of the matrix of @Compute-eigenvalues ?
] <Compute-eigenvectors>
#solution[
	$ A underline(x) = lambda_(1) underline(x) => &
	  mat(7, frac(10, 3), -frac(2, 3);
	          -1, frac(7, 3), -frac(2, 3);
	          1, frac(2, 3), frac(11, 3)) vec(x, y, z) =
	  3 vec(x, y, z) =>
	  vec(7 dot x + frac(10, 3) dot y - frac(2, 3) dot z,
	      -1 dot x + frac(7, 3) dot y - frac(2, 3) dot z,
	      1 dot x + frac(2, 3) dot y + frac(11, 3) dot z) =
	  vec(3x, 3y, 3z) => \
	  & cases(7x + frac(10, 3)y - frac(2, 3)z = 3x,
	          -x + frac(7, 3)y - frac(2, 3)z = 3y,
	          x + frac(2, 3)y + frac(11, 3)z = 3z) =>
	    cases(21x + 10y - 2z - 9x = 0,
	          3x - 7y + 2z + 9y = 0,
	          3x + 2y + 11z - 9z = 0) =>
	    cases(6x + 5y - z = 0,
	          3x + 2y + 2z = 0,
	          3x + 2y + 2z = 0) => \
	  & cases(5x + 4y = 0,
	          z = -frac(3, 2)x - y,
	          z = -frac(3, 2)x - y) =>
	    cases(x = x,
	          y = -frac(5, 4)x,
	          z = -frac(1, 4)x) $

	$ A underline(x) = lambda_(2) underline(x) => &
	  mat(7, frac(10, 3), -frac(2, 3);
	          -1, frac(7, 3), -frac(2, 3);
	          1, frac(2, 3), frac(11, 3)) vec(x, y, z) =
	  5 vec(x, y, z) =>
	  vec(7 dot x + frac(10, 3) dot y - frac(2, 3) dot z,
	      -1 dot x + frac(7, 3) dot y - frac(2, 3) dot z,
	      1 dot x + frac(2, 3) dot y + frac(11, 3) dot z) =
	  vec(5x, 5y, 5z) => \
	  & cases(7x + frac(10, 3)y - frac(2, 3)z = 5x,
	          -x + frac(7, 3)y - frac(2, 3)z = 5y,
	          x + frac(2, 3)y + frac(11, 3)z = 5z) =>
	    cases(21x + 10y - 2z - 15x = 0,
	          3x - 7y + 2z + 15y = 0,
	          3x + 2y + 11z - 15z = 0) =>
	    cases(3x + 5y - z = 0,
	          3x + 8y + 2z = 0,
	          3x + 2y - 4z = 0) => \
	  & cases(z = 3x + 5y,
	          x + 2y = 0,
	          x + 2y = 0) =>
	    cases(z = -y,
	          y = y,
	          x = -2y) $

	This means that the two eigenspaces are $E_(lambda_(1)) =
	"span"{(1, -frac(5, 4), -frac(1, 4))^(T)}$ and $E_(lambda_(2))
	= "span"{(-1, 1, -2)^(T)}$. Both have geometric multiplicity
	equal to $1$.
]

#proposition[
	For any eigenvalue $lambda$, $1 lt.eq m_(g)(lambda) lt.eq m_(a)(lambda)$.
] <Eigenvalues-inequality>
// #proof[
// To be added
// ]

=== Eigenvectors and eigenvalues of linear transformations

Eigenvectors and eigenvalues can be defined with respect to linear
transformations as well. Given an endomorphism $T: V mapsto V$, a
vector $underline(v) in V$ is an eigenvector for $T$ if $T underline(v)
= lambda underline(v)$, where $lambda$ is an eigenvalue for $T$.

As stated in @Eigenvalues-as-polynomial-roots, the eigenvalues of a matrix
can be computed employing its characteristic polynomial. Since any linear
transformation can be represented using a matrix, to compute the eigenvalues
of a linear transformation it is possible to compute the characteristic
polynomial of the associated matrix of the linear transformation. Once the
eigenvalues are known, the eigenvectors can be retrieved as usual.

@Similar-matrices-same-spectrum states that similar matrices have the
same eigenvalues, and all matrix representations of the same linear
transformations are always similar. This means that the choice of the
bases of the matrix associated to the endomorphism, with respect to
finding its eigenvalues, are irrelevant. For this reason, it is possible
to refer to the characteristic polynomial of a linear transformation
without having to specify the basis. Of course, from a practical standpoint,
the most convenient choice of basis is most likely the canonical basis.

#exercise[
	What are the eigenvectors and eigenvalues of the linear
	transformation $T: RR_(2)[x] mapsto RR_(2)[x]$ defined
	as $T(p(x)) = p(x) - 3x frac(d, d x) p(x) + 4 frac(d^(2), d x) p(x)$?
] <Compute-eigenvectors-2>
#solution[
	First, it is necessary to construct the matrix representation of $T$.
	Evaluating the canonical basis ${1, x, x^(2)}$ with $T$ gives:

	$ cases(T(1) = 1 - 3x frac(d, d x) (1) + 4 frac(d^(2), d x) (1) = 1 - 0 + 0 = 1,
	        T(x) = x - 3x frac(d, d x) (x) + 4 frac(d^(2), d x) (x) = x - 3x = -2x,
	        T(x^(2)) = x^(2) - 3x frac(d, d x) (x^(2)) + 4 frac(d^(2), d x) (x^(2)) = x^(2) - 6x^(2) + 8 = 8 - 5x^(2)) $

	Which gives the matrix:

	#grid(
		columns: (0.2fr, 0.2fr, 0.2fr, 0.4fr),
		[$ 1 <==> vec(1, 0, 0) $],
		[$ -2x <==> vec(0, -2, 0) $],
		[$ 8 - 5x^(2) <==> vec(8, 0, -5) $],
		[$ A = mat(1, 0, 8; 0, -2, 0; 0, 0, -5) $]
	)

	The characteristic polynomial of $A$ is:

	$ det(mat(1, 0, 8; 0, -2, 0; 0, 0, -5) - lambda mat(1, 0, 0; 0, 1, 0; 0, 0, 1)) =
	  det(mat(1 - lambda, 0, 8; 0, -2 - lambda, 0; 0, 0, -5 - lambda)) =
	  (1 - lambda)(lambda + 2)(lambda + 5) $

	Which means that the spectrum of $A$ (and of $T$) is ${-5, -2, 1}$.
	The eigenspace of $A$ is:

	$ mat(1, 0, 8; 0, -2, 0; 0, 0, -5) vec(x, y, z) = -5 vec(x, y, z) => 
	  mat(1 dot x + 0 dot y + 8 dot z;
	      0 dot x -2 dot y + 0 dot z;
	      0 dot x + 0 dot y -5 dot z) = -5 vec(x, y, z) => 
	  cases(x + 8z = -5x, -2y = -5y, -5z = -5z) =>
	  cases(x = -frac(4, 3)z, y = 0, z = z) $

	$ mat(1, 0, 8; 0, -2, 0; 0, 0, -5) vec(x, y, z) = -2 vec(x, y, z) => 
	  mat(1 dot x + 0 dot y + 8 dot z;
	      0 dot x -2 dot y + 0 dot z;
	      0 dot x + 0 dot y -5 dot z) = -2 vec(x, y, z) => 
	  cases(x + 8z = -2x, -2y = -2y, -5z = -2z) =>
	  cases(x = 0, y = y, z = 0) $

	$ mat(1, 0, 8; 0, -2, 0; 0, 0, -5) vec(x, y, z) = 1 vec(x, y, z) => 
	  mat(1 dot x + 0 dot y + 8 dot z;
	      0 dot x -2 dot y + 0 dot z;
	      0 dot x + 0 dot y -5 dot z) = vec(x, y, z) => 
	  cases(x + 8z = x, -2y = y, -5z = z) =>
	  cases(x = x, y = 0, z = 0) $

	The eigenspaces are $E_(lambda_(1)) = "span"{(-frac(4, 3), 0, 1)^(T)} $,
	$E_(lambda_(2)) = "span"{(0, 1, 0)^(T)}$ and $E_(lambda_(3)) =
	"span"{(1, 0, 0)^(T)}$. All have geometric multiplicity equal to $1$.

	The eigenspaces of $T$ can be constructed by "undoing" the vector
	representation of the eigenspaces of $A$:

	#grid(
		columns: (0.4fr, 0.3fr, 0.3fr),
		[$ (-frac(4, 3)t) dot 1 + 0 dot x + t dot x^(2) = -frac(4, 3)t + x^(2)t $],
		[$ 0 dot 1 + t dot x + 0 dot x^(2) = x t $],
		[$ t dot 1 + 0 dot x + 0 dot x^(2) = t $]
	)

	Which gives: $E_(lambda_(1)) = "span"{-frac(4, 3)t + x^(2)}$,
	$E_(lambda_(2)) = "span"{x}$, $E_(lambda_(3)) = "span"{1}$.
]

=== Diagonalization

#theorem("Diagonalization theorem")[
	- (*With respect to matrices*) Let $A$ be a $n times n$ matrix
	  that has $n$ linearly independent eigenvectors $underline(e_(1)),
	  dots, underline(e_(n))$. Then there exist a diagonal matrix $D$
	  that is similar to $A$, meaning that there exist a matrix $P$
	  such that $A = P D P^(-1)$. In particular, the matrix $D$ has
	  the eigenvalues of $A$ as non-zero elements (counted with
	  multiplicity) and $P$ has the eigenvectors of $A$ as columns.
	- (*With respect to endomorphisms*) Let $T: V mapsto V$ be an
	  endomorphism mapping vector spaces of dimension $n$ having
	  $n$ linearly independent eigenvectors $underline(e_(1)), dots,
	  underline(e_(n))$. Let $M$ be the matrix representation of $T$
	  with respect to said eigenvectors. The matrix $M$ is a diagonal
	  matrix whose non-zero entries are the eigenvalues of $T$.
] <Diagonalization-theorem>
#proof[
	// The second depends on the first?

	Consider the two matrices $P$ and $D$:

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

If @Diagonalization-theorem holds for a certain matrix, said matrix is said
to be *diagonalizable*. Note that, even though a matrix always has as many
eigenvalues as its dimension, not all matrices are diagonalizable. This is
because the Fundamental Theorem of Algebra states that the characteristic
polynomial of a matrix of dimension $n$ will always have $n$ roots (albeit
some might be complex numbers), but the corresponding eigenvectors might
not form a basis.

A matrix that is not diagonalizable is said to be *defective*. Determining
whether a matrix is diagonalizable or defective can be done either applying
@Diagonalization-theorem directly, but there are equivalent necessary and
sufficient conditions that can simplify the process.

#theorem[
	A matrix is diagonalizable if and only if, for each of its eigenvalues
	$lambda_(i)$, $m_(g)(lambda_(i)) = m_(a)(lambda_(i))$.
] <Same-multiplicity-is-diagonalizable>
// #proof[
// To be added
//]

#corollary[
	If a matrix of dimension $n$ has $n$ distinct eigenvalues, then it's
	always diagonalizable.
] <Distinct-eigenvalues-always-diagonalizable>
#proof[
	Consider a matrix of dimension $n$ having $n$ distinct
	eigenvalues. Each eigenvalue, by definition, has both
	algebraic and geometric multiplicity equal to $1$. Therefore,
	@Same-multiplicity-is-diagonalizable always applies.
]

The process of "breaking down" a diagonalizable matrix $A$ into a triplet
$P D P^(-1)$ applying @Diagonalization-theorem is called *diagonalization*.
Note that, for any matrix diagonalizable $A$, there exist an infinite amount
of possible diagonalizations, since for any $k in RR$, the matrix $(k P) D
(k^(-1) P^(-1))$ would still be a valid diagonalization (multiplying an
eigenvector by a scalar still gives an eigenvector).

#exercise[
	Consider the matrices in @Compute-eigenvectors and
	@Compute-eigenvectors-2. Are they diagonalizable?
]
#solution[
	The matrix in @Compute-eigenvectors has eigenvalues $lambda_(1) =
	3$ and $lambda_(2) = 5$. Their algebraic multiplicity are $2$ and
	$1$ respectively, whereas their geometric multiplicity are both
	$1$. By virtue of @Same-multiplicity-is-diagonalizable, it is not
	diagonalizable.

	On the other hand, the matrix in @Compute-eigenvectors-2 has
	three eigenvalues, whose algebraic and geometric multiplicity
	is $1$ in all of three cases. This means that, due to
	@Distinct-eigenvalues-always-diagonalizable, it is diagonalizable.
	The diagonalization is:

	$ mat(1, 0, 8; 0, -2, 0; 0, 0, -5) =
	  mat(-frac(4, 3), 0, 1; 0, 1, 0; 1, 0, 0) 
	  mat(-5, 0, 0; 0, -2, 0; 0, 0, 1)
	  mat(0, 0, 1; 0, 1, 0; 1, 0, frac(4, 3)) $
]
