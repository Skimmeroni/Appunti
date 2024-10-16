#import "../Math4AI_definitions.typ": *

A symmetric matrix $A$ is said to be *definite positive* if, for any vector
$underline(x)$, $angle.l underline(x), A underline(x) angle.r > 0$. It is
instead said to be *semidefinite positive* if, for any vector $underline(x)$,
$angle.l underline(x), A underline(x) angle.r gt.eq 0$.

#theorem[
	If a symmetric matrix is definite positive, each one of its eigenvalues
	is real and strictly positive.
] <Definite-positive-is-positive-eigenvalues>
#proof[
	// To be retrieved from lectures (messed up)
]

#theorem[
	If a symmetric matrix is definite positive, each one of its eigenvalues
	is real and either positive or equal to $0$.
] <Semidefinite-positive-is-positive-or-null-eigenvalues>
#proof[
	The idea is the same as in @Definite-positive-is-positive-eigenvalues but
	considering $gt.eq$ instead of $>$.
]

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
