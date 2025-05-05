#import "../Math4AI_definitions.typ": *

#theorem("Cholesky Decomposition")[
	For any positive definite matrix $A$ there exists a lower triangular
	matrix $L$ such that $A = L L^(T)$.
]
#proof[
	The theorem can be proven in a constructive way by defining an algorithm
	that recursively retrieves said $L$ matrix.

	First, the three matrices at play ought to have such form:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ A = mat(
			a_(1, 1), a_(1, 2), dots, a_(1, n);
			a_(1, 2), a_(2, 2), dots, a_(2, n);
			dots.v, dots.v, dots.down, dots.v;
			a_(1, n), a_(2, n), dots, a_(n, n);
		) $],
		[$ L = mat(
			l_(1, 1), 0, dots, 0;
			l_(1, 2), l_(2, 2), dots, 0;
			dots.v, dots.v, dots.down, dots.v;
			l_(1, n), l_(2, n), dots, l_(n, n);
		) $],
		[$ L^(T) = mat(
			l_(1, 1), l_(1, 2), dots, l_(1, n);
			0, l_(2, 2), dots, l_(2, n);
			dots.v, dots.v, dots.down, dots.v;
			0, 0, dots, l_(n, n);
		) $]
	)

	The $(1, 1)$ entry of the product between $L$ and $L^(T)$ is given by the
	inner product of the first row of $L$ and the first column of $L^(T)$:

	$ l_(1, 1) dot l_(1, 1) + 0 dot 0 + 0 dot 0 + dots +
	  0 dot 0 = l_(1, 1)^(2) $

	This means that, for the equality $A = L L^(T)$ to be true, $l_(1, 1)$
	ought to be equal to $sqrt(a_(1, 1))$.

	The generic $(1, i)$ entry of the product between $L$ and $L^(T)$
	is given by the inner product of the first row of $L$ and the $i$-th
	column of $L^(T)$:

	$ l_(1, 1) dot l_(1, i) + 0 dot l_(2, i) + 0 dot l_(3, i) + dots +
	  0 dot 0 = l_(1, 1) l_(1, i) $

	This means that, for the equality $A = L L^(T)$ to be true, $a_(1, i)$
	ought to be equal to $l_(1, 1) l_(1, i)$, which in turn means that
	$l_(1, i)$ ought to be equal to $a_(1, i) slash l_(1, 1)$.

	The $(2, 2)$ entry of the product between $L$ and $L^(T)$ is given by the
	inner product of the second row of $L$ and the second column of $L^(T)$:

	$ l_(1, 2) dot l_(1, 2) + l_(2, 2) dot l_(2, 2) + 0 dot 0 + dots +
	  0 dot 0 = l_(1, 2)^(2) + l_(2, 2)^(2) $

	This means that, for the equality $A = L L^(T)$ to be true, $l_(2, 2)$
	must be equal to $sqrt(a_(2, 2) - l_(1, 2)^(2))$.

	// To be completed (lectures?)

	/*
	The generic $(2, i)$ entry of the product between $L$ and $L^(T)$
	is given by the inner product of the second row of $L$ and the $i$-th
	column of $L^(T)$:

	$ l_(2, 1) dot l_(1, i) + l_(2, 2) dot l_(2, i) + 0 dot l_(3, i) + dots +
	  0 dot 0 = l_(1, 1) l_(1, i) + l_(2, 2) dot l_(2, i) $

	This means that, for the equality $A = L L^(T)$ to be true, $a_(2, i)$
	ought to be equal to $l_(1, 1) l_(1, i) + l_(2, 2) l_(2, i)$, which
	in turn means that $l_(2, 2)$ ought to be equal to $(a_(2, i) - l_(1, 1)
	l_(1, i)) slash l_(2, i)$.
	*/
]

@Diagonalization-theorem states that if a square matrix $A$ possesses certain
properties, it can be written as a product in the form $P D P^(-1)$. A more
generic result can be achieved for non-square matrices.

#theorem("Singular Value Decomposition")[
	Any $m times n$ matrix $A$ can be written as the product $A = U Sigma
	V^(T)$, where:

	- $U$ is a $m times m$ orthogonal matrix whose column vectors
	  $(underline(u_(1)), dots, underline(u_(m)))$ belong to $RR^(m)$
	  and are called *left singular vectors*;
	- $Sigma$ is a $m times n$ matrix such that the $sigma_(i, i)$ entries,
	  called *singular values*, are greater or equal than $0$ while the
	  $sigma_(i, j)$ entries with $i != j$ are exactly $0$;
	- $V$ is a $n times n$ orthogonal matrix whose column vectors
	  $(underline(v_(1)), dots, underline(v_(m)))$ belong to $RR^(n)$
	  and are called *right singular vectors*.
] <SVD>
#proof[
	The theorem can be proven in a constructive way by defining an algorithm
	that generates said matrices, which in turn can prove that the equality
	holds. Assume, without loss of generality, that $m > n$.

	Suppose that $A = U Sigma V^(T)$. This means that:

	$ A^(T) A = (U Sigma V^(T))^(T) (U Sigma V^(T)) =
	  ((V^(T))^(T) Sigma^(T) U^(T)) U Sigma V^(T) =
	  V Sigma^(T) cancel(U^(T)) cancel(U) Sigma V^(T) =
	  V Sigma^(T) Sigma V^(T) $

	By @A-transposed-A-positive-semidefinite, $A^(T) A$ is positive
	semidefinite. In turn, by @Spectral-theorem, it can be diagonalized
	as $P D P^(T)$, where the eigenvalues along the diagonal of $D$ are
	non negative as of @Definite-matrices-eigenvalues.

	Since the dimension of $A$ is $m times n$, the dimension of $A^(T) A$
	ought to be $n times n$. In turn, the dimension of $D$ ought to be $n
	times n$ as well. By how $Sigma$ has been defined, the product $Sigma^(T)
	Sigma$ ought to be:

	$ Sigma^(T) Sigma =
	  mat(sigma_(1, 1), 0, dots, 0;
	      0, sigma_(2, 2), dots, 0;
	      dots.v, dots.v, dots.down, dots.v;
	      0, 0, dots, sigma_(n, n);
	      dots.v, dots.v, dots.v, dots.v;
	      0, 0, 0, 0)
	  mat(sigma_(1, 1), 0, 0, 0, dots, 0;
	      0, sigma_(2, 2), 0, 0, dots, 0;
	      dots.v, dots.v, dots.down, dots, dots, dots.v;
	      0, 0, dots, sigma_(n, n), dots, 0) =
	  mat(sigma_(1, 1)^(2), 0, dots, 0;
	      0, sigma_(2, 2)^(2), dots, 0;
	      dots.v, dots.v, dots.down, dots.v;
	      0, 0, dots, sigma_(n, n)^(2)) $

	Being $Sigma^(T) Sigma$ a diagonal matrix, the representations
	$P D P^(T)$ and $V Sigma^(T) Sigma V^(T)$ can be equated as long
	as the non-zero values of $Sigma^(T) Sigma$ are the square roots
	of the eigenvalues of $A^(T) A$ and the column vectors of $V$ are
	the normalized eigenvectors of $A^(T) A$.

	Similarly:

	$ A A^(T) = (U Sigma V^(T)) (U Sigma V^(T))^(T) =
	  U Sigma V^(T) ((V^(T))^(T) Sigma^(T) U^(T)) =
	  U Sigma cancel(V^(T)) cancel(V) Sigma^(T) U^(T)  =
	  U Sigma Sigma^(T) U^(T) $

	By @A-transposed-A-positive-semidefinite, $A A^(T)$ is
	positive semidefinite. In turn, by @Spectral-theorem,
	it can be diagonalized as $Q C Q^(T)$, where the
	eigenvalues along the diagonal of $C$ are non negative
	as of @Definite-matrices-eigenvalues.

	Since the dimension of $A$ is $m times n$, the dimension of $A A^(T)$
	ought to be $m times m$. In turn, the dimension of $C$ ought to be $m
	times m$ as well. By how $Sigma$ has been defined, the product $Sigma
	Sigma^(T)$ ought to be:

	$ Sigma Sigma^(T) =
	  mat(sigma_(1, 1), 0, 0, 0, dots, 0;
	      0, sigma_(2, 2), 0, 0, dots, 0;
	      dots.v, dots.v, dots.down, dots, dots, dots.v;
	      0, 0, dots, sigma_(m, m), dots, 0)
	  mat(sigma_(1, 1), 0, dots, 0;
	      0, sigma_(2, 2), dots, 0;
	      dots.v, dots.v, dots.down, dots.v;
	      0, 0, dots, sigma_(m, m);
	      dots.v, dots.v, dots.v, dots.v;
	      0, 0, 0, 0) =
	  mat(sigma_(1, 1)^(2), 0, dots, 0;
	      0, sigma_(2, 2)^(2), dots, 0;
	      dots.v, dots.v, dots.down, dots.v;
	      0, 0, dots, sigma_(m, m)^(2)) $

	Being $Sigma Sigma^(T)$ a diagonal matrix, the representations
	$Q C Q^(T)$ and $U Sigma Sigma^(T) U^(T)$ can be equated as long
	as the non-zero values of $Sigma Sigma^(T)$ are the square roots
	of the eigenvalues of $A A^(T)$ and the column vectors of $U$ are
	the normalized eigenvectors of $A A^(T)$.

	The next step consists of comparing the eigenvalues of the two matrices
	$D$ and $C$.

	By definition, an eigenvector $underline(e_(i))$ of $A^(T) A$ satisfies
	the equation $A^(T) A underline(e_(i)) = lambda_(i) underline(e_(i))$.
	But:

	$ A^(T) A underline(e_(i)) = lambda_(i) underline(e_(i)) =>
	  A A^(T) A underline(e_(i)) = A lambda_(i) underline(e_(i)) =>
	  (A A^(T)) (A underline(e_(i))) = lambda_(i) (A underline(e_(i))) =>
	  (A A^(T)) underline(u_(i)) = lambda_(i) underline(u_(i)) $

	If $underline(u_(i))$ is guaranteed to be different from the null
	vector, then it is an eigenvector for $A A^(T)$. If it were to be
	the null vector, then:

	$ A^(T) A underline(e_(i)) = lambda_(i) underline(e_(i)) =>
	  A^(T) underline(0) = lambda_(i) underline(e_(i)) =>
	  underline(0) = lambda_(i) underline(e_(i)) $

	Which is true exclusively if $lambda_(i)$ is $0$, because
	$underline(e_(i))$ can't be the null vector by definition
	of eigenvector.

	This means that $A^(T) A$ and $A A^(T)$ have the same eigenvalues
	(even though not necessarely the same eigenvectors) as long as said
	eigenvalues are not $0$. In other words, if $d_(i, i)$ and $c_(i, i)$
	are both different from $0$, it is guaranteed that they are equal,
	while if one of them is equal to $0$ the other one is different from $0$.

	// What if they are zero?

	// If the matrix has certain properties, it is possible to skip the
	// computation of the left singular vectors

	To complete the proof, it is necessary to show that $A$ is indeed equal
	to $U Sigma V^(T)$. Consider the matrices $A V$ and $U Sigma$. Said
	matrices are constituted by the following column vectors:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ A V = mat(underline(A_(1)) underline(v_(1)),
		   dots, underline(A_(n)) underline(v_(n))) $],
		[$ U Sigma = mat(underline(u_(1)) underline(sigma_(1)),
		   dots, underline(u_(n)) underline(sigma_(n))) $]
	)

	By the previous result, $underline(A_(i)) underline(v_(i))$ is equal to
	$underline(u_(i)) underline(sigma_(i))$ whenever the corresponding
	eigenvalues are non zero and both zero otherwise. This means that the
	two matrices can be equated column by column. Therefore:

	$ A V = U Sigma => A
	  cancel(V) cancel(V^(T)) = U Sigma V^(T) =>
	  A = U Sigma V^(T) $
]

Summarizing, it is possible to perform the Singular Value Decomposition (SVD)
of a matrix $A$ by applying the algorithm stated in @SVD:

- Compute $A^(T) A$;
- Compute the eigenvalues of $A^(T) A$. The diagonal entries of $Sigma$
  will be the square root of said eigenvalues;
- Compute the eigenvectors of $A^(T) A$. The normalized choice of eigenvectors
  will be the column vectors of $V$;
- If the $i$-th entry of $Sigma$ is non zero, the $i$-th column vector of $U$
  can be computed from the $i$-th column vector of $V$ as $A underline(e_(i))
  slash sigma_(i, i)$;
- If the $i$-th entry of $Sigma$ is $0$, the $i$-th column vector of $U$ has
  to be computed from the kernel of $A underline(x)$; // ???
- The SVD of $A$ is given by $U Sigma V^(T)$.

It is customary to place the diagonal entries of $Sigma$ in decreasing order.

#exercise[
	Compute the Singular Value Decomposition of the following matrix:

	$ A = mat(1, 0, -1; 1, 1, 1) $
]
#solution[
	First, it is necessary to compute $A^(T) A$:

	$ A^(T) A = mat(1, 1; 0, 1; -1, 1) mat(1, 0, -1; 1, 1, 1) =
	  mat(1 dot 1 + 1 dot 1, 1 dot 0 + 1 dot 1, 1 dot (-1) + 1 dot 1;
	      0 dot 1 + 1 dot 1, 0 dot 0 + 1 dot 1, 0 dot (-1) + 1 dot 1;
	      -1 dot 1 + 1 dot 1, -1 dot 0 + 1 dot 1, (-1) dot (-1) + 1 dot 1) =
	  mat(2, 1, 0; 1, 1, 1; 0, 1, 2) $

	Whose eigenvalues can be retireved from its characteristic polynomial:

	$ det(A - lambda I) = mat(delim: "|", 2 - lambda, 1, 0; 1, 1 - lambda , 1;
	  0, 1, 2 - lambda) = (2 - lambda) mat(delim: "|", 1 - lambda, 1; 1, 2 -
	  lambda) - mat(delim: "|", 1, 1; 0, 2 - lambda) + 0 mat(delim: "|", 1, 1 -
	  lambda; 0, 1) = \
	  (2 - lambda)((1 - lambda)(2 - lambda) - 1 dot 1) -
	  (1(2 - lambda) - 0 dot 1) = (2 - lambda)(2 - lambda - 2 lambda +
	  lambda^(2) - 1) - (2 - lambda) = \ (2 - lambda)(cancel(1) - 3 lambda +
	  lambda^(2) cancel(- 1)) = lambda (2 - lambda)(lambda - 3) =>
	  lambda_(1) = 3, lambda_(2) = 2, lambda_(3) = 0 $

	The diagonal elements of $Sigma$ are therefore, from top left to bottom
	right: $sqrt(3), sqrt(2), 0$.

	The normalized eigenvectors of $A^(T) A$ will be the column vectors of $V$:

	$ mat(2, 1, 0; 1, 1, 1; 0, 1, 2) mat(x; y; z) = 3 mat(x; y; z) =>
	  cases(2x + y = 3x, x + y + z = 3y, y + 2z = 3z) =>
	  cases(y = x, x + z = 2y, y = z) => cases(x = y, y = z, z = x) =>
	  mat(k; k; k) space forall k in RR $

	$ mat(2, 1, 0; 1, 1, 1; 0, 1, 2) mat(x; y; z) = 2 mat(x; y; z) =>
	  cases(2x + y = 2x, x + y + z = 2y, y + 2z = 2z) =>
	  cases(y = 0, x + z = y, y = 0) => cases(z = -x, y = 0, y = 0) =>
	  mat(k; 0; -k) space forall k in RR $

	$ mat(2, 1, 0; 1, 1, 1; 0, 1, 2) mat(x; y; z) = 0 mat(x; y; z) =>
	  cases(2x + y = 0x, x + y + z = 0y, y + 2z = 0z) =>
	  cases(y = -2x, x + z = -y, y = -2z) => cases(y = -2x, z = x, x = z ) =>
	  mat(k; -2k; k) space forall k in RR $

	Out of all eigenvectors, it is necessary to pick the ones whose norm is
	equal to $1$:

	$ || e_(1) || =
	  sqrt(angle.l mat(k; k; k)\, mat(k; k; k) angle.r) =
	  sqrt(k dot k + k dot k + k dot k) =
	  sqrt(3k^(2)) = sqrt(3) |k| = 1=> k = plus.minus frac(1, sqrt(3)) $

	$ || e_(2) || =
	  sqrt(angle.l mat(k; 0; -k)\, mat(k; 0; -k) angle.r) =
	  sqrt(k dot k + 0 dot 0 + (-k) dot (-k)) =
	  sqrt(2k^(2)) = sqrt(2) |k| = 1 => k = plus.minus frac(1, sqrt(2)) $

	$ || e_(3) || =
	  sqrt(angle.l mat(k; -k; k)\, mat(k; -k; k) angle.r) =
	  sqrt(k dot k + (-2k) dot (-2k) + k dot k) =
	  sqrt(6k^(2)) = sqrt(6) |k| = 1 => k = plus.minus frac(1, sqrt(6)) $

	Out of the two choices for the sign, the positive one is taken for
	the sake of simplicity.

	$A^(T) A$ has three eigenvalues, and only one of those is $0$. Since the
	dimension of $V$ is $3$, the dimension of $U$ is necessarely $2$ and both
	eigenvectors can be computed directly from the columns of $V$.

	$ underline(u_(1)) = frac(A underline(e_(1)), sigma_(1)) =
	  frac(1, sqrt(3)) mat(1, 0, -1; 1, 1, 1) mat(frac(1, sqrt(3));
	  frac(1, sqrt(3)); frac(1, sqrt(3))) = frac(1, sqrt(3))
	  mat(1 dot frac(1, sqrt(3)) + 0 dot frac(1, sqrt(3)) -
	      1 dot frac(1, sqrt(3)); 1 dot frac(1, sqrt(3)) +
	      1 dot frac(1, sqrt(3)) + 1 dot frac(1, sqrt(3))) =
	  frac(1, sqrt(3)) mat(0; frac(3, sqrt(3))) = mat(0; 1) $

	$ underline(u_(2)) = frac(A underline(e_(2)), sigma_(2)) =
	  frac(1, sqrt(2)) mat(1, 0, -1; 1, 1, 1) mat(frac(1, sqrt(2));
	  0; -frac(1, sqrt(2))) = frac(1, sqrt(2))
	  mat(1 dot frac(1, sqrt(2)) + 0 dot 0 - 1 dot (-frac(1, sqrt(2)));
	      1 dot frac(1, sqrt(2)) + 1 dot 0 + 1 dot (-frac(1, sqrt(2)))) =
	  frac(1, sqrt(2)) mat(frac(2, sqrt(2)); 0) = mat(1; 0) $

	As expected, said vectors are already normalized.

	The SVD of $A$ is therefore as follows:

	$ A = U Sigma V^(T) = mat(0, 1; 1, 0) mat(sqrt(3), 0, 0; 0, sqrt(2), 0)
	  mat(frac(1, sqrt(3)), frac(1, sqrt(3)), frac(1, sqrt(3));
	      frac(1, sqrt(2)), 0, -frac(1, sqrt(2));
	      frac(1, sqrt(6)), -frac(2, sqrt(6)), frac(1, sqrt(6))) $
]
