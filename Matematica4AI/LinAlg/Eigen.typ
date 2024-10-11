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

Recall that to construct the associated matrix two bases ought to be
fixed, and changing the bases results in a different matrix. But since
the determinant is invariant with respect to different bases for the
associated matrix, it does not matter which bases were chosen. Therefore,
the characteristic polynomial can be said to refer to the linear
transformation itself, and not to a certain associated matrix.

Suppose that to a certain linear transformation $T: V |-> V$ it is possible
to associate a certain matrix $A$ with respect to a basis $cal(B)$ and a
different matrix $A'$ with respect to a different basis $cal(B')$. Recall
that the formula to pass from a matrix to the other is $A = P A' P^(-1)$.
Then:

$ p_(A)(lambda) = det(A - lambda I) = det(P A' P^(-1) - lambda I) =
  det(P A' P^(-1) - lambda P I P^(-1)) =
  det(P (A' P^(-1) - lambda I P^(-1))) = \
  det(P (A' - lambda I) P^(-1)) =
  cancel(det(P)) det(A' - lambda I) cancel(det(P^(-1))) =
  det(A' - lambda I) = p_(A')(lambda) $
