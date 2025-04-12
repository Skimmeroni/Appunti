#import "../FoundationsQC_definitions.typ": *

A more comfortable formalism for denoting vectors is the *bra-ket* notation.
The *ket* associated to a label $Psi$, denoted as $ket(Psi)$, is just
its column vector representation. The *bra* of a label $Psi$, denoted as
$bra(Psi)$, is the transposed conjugate of the corresponding ket:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ ket(Psi) = mat(psi_(1); psi_(2); dots.v; psi_(n)) $],
	[$ bra(Psi) = ket(Psi)^(dagger) = mat(psi_(1)^(*), psi_(2)^(*), dots, psi_(n)^(*)) $]
)

The meaning of the label $Psi$ is arbitrary: there has to be a way
(implicit or explicitly stated) to assign labels to vectors. In general,
if a vector is referred to as $v$, its representation as ket is $ket(v)$
and the representation of its complex conjugate as bra is $bra(v)$. In
the context of quantum mechanics, the label of a ket or of a bra generally
refers to a certain quantum state.

#exercise[
	Represent the canonical basis of $RR^(2)$ using the Dirac notation.
	Recall that canonical basis vectors are often denoted as $e_(1),
	e_(2), dots, e_(n)$.
] <Bra-ket-example>
#solution[
	#grid(
		columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
		[$ ket(e_(1)) = mat(1; 0; 0; 0) $],
		[$ ket(e_(2)) = mat(0; 1; 0; 0) $],
		[$ ket(e_(3)) = mat(0; 0; 1; 0) $],
		[$ ket(e_(4)) = mat(0; 0; 0; 1) $]
	)
]

Any linear combination of vectors with respect to a basis $\{beta_(1),
dots, beta_(n)\}$ can be written seamlessly as a linear combination of
kets with respect to the basis $\{ket(beta_(1)), dots, ket(beta_(n))\}$:

$ sum_(i = 1)^(n) lambda_(i) mat(beta_(i, 1); dots.v; beta_(i, n)) =
  lambda_(1) mat(beta_(1, 1); dots.v; beta_(1, n)) +
  dots +
  lambda_(n) mat(beta_(n, 1); dots.v; beta_(n, n))
  <==>
  sum_(i = 1)^(n) lambda_(i) ket(beta_(i)) =
  lambda_(1) ket(beta_(1)) +
  dots +
  lambda_(n) ket(beta_(n)) $

The inner product of two kets $ket(Psi_(1))$ and $ket(Psi_(2))$ is simply
denoted as $braket(Psi_(1), Psi_(2))$, and is called *braket*. The outer
product of two kets $ket(Psi_(1))$ and $ket(Psi_(2))$ is simply denoted
as $ketbra(Psi_(1), Psi_(2))$, and is called *ketbra*.

#exercise[
	Consider the following two vectors, written in bra-ket notation
	following the convention of @Bra-ket-example. What are their braket
	and ketbra?

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ ket(A) = frac(3, 4) ket(e_(1)) $],
		[$ ket(B) = frac(sqrt(5), 2) ket(e_(3)) $]
	)
]
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ braket(A, B) =
		   frac(3, 4) frac(sqrt(5), 2) braket(e_(1), e_(2)) =
		   frac(3 sqrt(5), 8) $],
		[$ ketbra(A, B) =
		   frac(3, 4) ket(e_(1)) times.circle frac(sqrt(5), 2) bra(e_(2)) =
		   frac(3 sqrt(5), 8) mat(1, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0) $]
	)
]

If a state $Psi$ belongs to an Hilber space $Eta$, its conjugate $Psi^(*)$
belongs to the *dual space* $Eta^(*)$ of the Hilbert space $Eta$. Another
way of expressing it is that if a ket $ket(Psi)$ belongs to $Eta$,
then the corresponding bra $bra(Psi)$ belongs to $Eta^(*)$.

The dual space is constitued by linear functionals $Chi$ over the kets in
$Eta$: if $ket(Psi) in Eta$ then $Chi(Psi) in CC$:

$ Chi(alpha_(1) ket(Psi_(1)) + alpha_(2) ket(Psi_(2))) =
  Chi(alpha_(1) ket(Psi_(1))) + Chi(alpha_(2) ket(Psi_(2))) $

Even though matrix representation of vectors is useful from time to
time, the bra-ket notation is much comfortable to work with in quantum
mechanics. Not only because it is more compact but also because it
represents the conjugate transpose of a vector, which is an operation
performed very often, as "flipping" its symbol left-to-right. In particular,
the inner product "flips" the ket on the left side of the operation, whereas
the outer product "flips" the ket on the right side of the operation.

The bra-ket notation can also be used to represent operators in matrix
form. This is particularly useful to denote the application of operators
to states written as kets and bras. To do this, first recall that the
ketbra $ketbra(v, w)$ represents the outer product between $ket(v)$ and
$ket(w)$ or, equivalently, the tensor product between $ket(v)$ and $bra(w)$.

In particular, consider using canonical basis vectors $ket(e_(1)), dots,
ket(e_(n))$ as done in @Bra-ket-example. The ketbra of any pair of kets
$ket(e_(i)), ket(e_(j))$ is:

$ ketbra(e_(i), e_(j)) =
  mat(0; dots.v; 1; dots.v; 0) times.circle mat(0, dots, 1, dots, 0) =
  mat(0, 0, dots, 0;
      0, 0, dots, 0;
      dots.v, 1, dots.down, dots.v;
      0, 0, dots, 0) $

Which means that a generic $m times n$ matrix $A$ can be written as:

$ A = sum_(i = 1)^(m) sum_(i = 1)^(n) a_(i, j) ketbra(e_(i), e_(j)) $

Where $a_(i, j)$ is the entry of $A$ in the $i$-th row and $j$-th column,
$ket(e_(i))$ is the $i$-th canonical basis vector and $bra(e_(j))$ is the
conjugate transpose of the $j$-th canonical basis vector. This representation
is particularly powerful in the case of _sparse matrices_, matrices having
$0$ in many of its entries, because all those entries do not need to be
denoted explicitly.

#exercise[
	How would this matrix be written in bra-ket notation?

	$ A = mat(frac(sqrt(2), 2), 0, 0, 0;
	          0, 0, 0, 0;
	          frac(sqrt(2), 2), 0, 0, 0;
	          0, frac(sqrt(2), 2), 0, 0;) $
]
#solution[
	$ A &= sum_(i = 1)^(4) sum_(i = 1)^(4) a_(i, j) ketbra(i, j) = \
	  &= sum_(i = 1)^(4) a_(i, 0) ketbra(e_(i), e_(1)) +
	                  a_(i, 1) ketbra(e_(i), e_(2)) +
	                  a_(i, 2) ketbra(e_(i), e_(3)) +
	                  a_(i, 3) ketbra(e_(i), e_(4)) = \
	  &= frac(sqrt(2), 2) ketbra(e_(1), e_(1)) + 0 ketbra(e_(2), e_(1)) + 0 ketbra(e_(3), e_(1)) + 0 ketbra(e_(4), e_(1)) + 
	     0 ketbra(e_(1), e_(2)) + 0 ketbra(e_(2), e_(2)) + 0 ketbra(e_(3), e_(2)) + 0 ketbra(e_(4), e_(2)) + \
	  & space space space frac(sqrt(2), 2) ketbra(e_(1), e_(3)) + 0 ketbra(e_(2), e_(3)) + 0 ketbra(e_(3), e_(3)) + 0 ketbra(e_(4), e_(3)) + 
	     0 ketbra(e_(1), e_(4)) + frac(sqrt(2), 2) ketbra(e_(2), e_(4)) + 0 ketbra(e_(3), e_(4)) + 0 ketbra(e_(4), e_(4)) = \
	  &= frac(sqrt(2), 2) ketbra(e_(1), e_(1)) + frac(sqrt(2), 2) ketbra(e_(1), e_(3)) + frac(sqrt(2), 2) ketbra(e_(2), e_(4)) $
]

This notion generalizes to the case of any basis $\{phi_(1), dots,
phi_(n)\}$. A matrix $O$ defined in bra-ket notation with respect
to this basis is written as:

$ sum_(i = 1)^(n) sum_(j = 1)^(n) p_(i j) ketbra(phi_(i), phi_(j)) $
