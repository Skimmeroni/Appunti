#import "../Math4AI_definitions.typ": *

=== Orthogonal sets

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
considered as vectors, form an orthogonal set. In the same way, an
*orthonormal matrix* is a matrix whose rows/columns, considered as
vectors, form an orthonormal set.

#lemma[
	An orthogonal matrix has its inverse equal to its transposed.
] <Orthogonal-inverse-equals-transposed>
// #proof[
// 
// ]

#lemma[
	Rotation matrices are orthonormal.
]
#proof[
	Consider, for the sake of simplicity, rotations in $RR^(2)$; the case
	for arbitrary dimensions follows the same idea. Let then $R_(theta) =
	display(mat(cos(theta), -sin(theta); sin(theta), cos(theta)))$ for a
	given angle $theta$. Its determinant is:

	$ det(mat(cos(theta), -sin(theta); sin(theta), cos(theta))) =
	  cos(theta) cos(theta) - sin(theta) (-sin(theta)) =
	  cos^(2)(theta) + sin^(2)(theta) = 1 $

	The inverse of $R_(theta)$ is:

	$ R^(-1)_(theta) =
	  mat(display(frac(cos(theta), 1)), display(frac(sin(theta), 1));
	      display(frac(-sin(theta), 1)), display(frac(cos(theta), 1))) =
	  mat(cos(theta), sin(theta); -sin(theta), cos(theta)) =
	  R^(T)_(theta) $

	@Orthogonal-inverse-equals-transposed ensures that $R_(theta)$ is
	orthogonal. As for the norm of its columns:

	$ vec(cos(theta), sin(theta)) dot vec(cos(theta), sin(theta)) &=
	  cos(theta) cos(theta) + sin(theta) sin(theta) =
	  cos^(2)(theta) + sin^(2)(theta) = 1 \
	  vec(cos(theta), sin(theta)) dot vec(-sin(theta), cos(theta)) &=
	  cancel(cos(theta) (-sin(theta))) + cancel(sin(theta) cos(theta)) = 0 \
	  vec(-sin(theta), cos(theta)) dot vec(cos(theta), sin(theta)) &=
	  cancel(sin(theta) cos(theta)) + cancel(cos(theta) (-sin(theta))) = 0 \
	  vec(-sin(theta), cos(theta)) dot vec(-sin(theta), cos(theta)) &=
	  (-sin(theta)) (-sin(theta)) + cos(theta) cos(theta) =
	  sin^(2)(theta) + cos^(2)(theta) = 1 $

	Which means that $R_(theta)$ is also orthonormal by definition.
]

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
	  det(mat(-1 -lambda, 1, 0; 1, -1 -lambda, 0; 0, 0, 3 -lambda)) = \
	  &= (3 - lambda) det(mat(-1 -lambda, 1; 1, -1 -lambda)) =
	  (3 - lambda)((-1 - lambda)^(2) - 1) = \
	  &= (3 - lambda)(cancel(1) + lambda^(2) + 2 lambda cancel(- 1)) =
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

	Which gives: $E_(lambda_(1)) = "span"{(-1, 1, 0)^(T)}$,
	$E_(lambda_(2)) = "span"{(1, 1, 0)^(T)}$,
	$E_(lambda_(3)) = "span"{(0, 0, 1)^(T)}$. Out of all
	the eigenvectors, the interest is to find the ones having
	norm equal to $1$.

	$ norm((-t, t, 0)^(T)) &= 1 =>
	  sqrt((-t) dot (-t) + t dot t + 0 dot 0) = 1 =>
	  sqrt(2t^(2)) = 1 =>
	  t = plus.minus frac(1, sqrt(2)) \
	  norm((t, t, 0)^(T)) &= 1 =>
	  sqrt(t dot t + t dot t + 0 dot 0) = 1 =>
	  sqrt(2t^(2)) = 1 =>
	  t = plus.minus frac(1, sqrt(2)) \
	  norm((0, 0, t)^(T)) &= 1 =>
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

#lemma[
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
