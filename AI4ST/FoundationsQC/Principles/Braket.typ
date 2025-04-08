#import "../FoundationsQC_definitions.typ": *

A more comfortable formalism for denoting vectors is the *bra-ket* notation.
The *ket* associated to a state $Psi$, denoted as $ket(Psi)$, is just
its column vector representation. The *bra* of a state $Psi$, denoted as
$bra(Psi)$, is the transposed conjugate of the corresponding ket:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ ket(Psi) = mat(psi_(1); psi_(2); dots.v; psi_(n)) $],
	[$ bra(Psi) = ket(Psi)^(dagger) = mat(psi_(1)^(*), psi_(2)^(*), dots, psi_(n)^(*)) $]
)

If a state $Psi$ belongs to an Hilber space $Eta$, its conjugate $Psi^(*)$
belongs to the *dual space* $Eta^(*)$ of the Hilbert space $Eta$. Another
way of expressing it is that if a ket $ket(Psi)$ belongs to $Eta$,
then the corresponding bra $bra(Psi)$ belongs to $Eta^(*)$.

The dual space is constitued by linear functionals $Chi$ over the kets in
$Eta$: if $ket(Psi) in Eta$ then $Chi(Psi) in CC$:

$ Chi(alpha_(1) ket(Psi_(1)) + alpha_(2) ket(Psi_(2))) =
  Chi(alpha_(1) ket(Psi_(1))) + Chi(alpha_(2) ket(Psi_(2))) $

The inner product of two kets $ket(Psi_(1))$ and $ket(Psi_(2))$ is simply
denoted as $braket(Psi_(1), Psi_(2))$, and is called *braket*. The outer
product of two kets $ket(Psi_(1))$ and $ket(Psi_(2))$ is simply denoted
as $ketbra(Psi_(1), Psi_(2))$, and is called *ketbra*:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ angle.l ket(Psi_(1)), ket(Psi_(2)) angle.r =
	   ket(Psi_(1))^(dagger) ket(Psi_(2)) =
	   braket(Psi_(1), Psi_(2)) $],
	[$ angle.r ket(Psi_(1)), ket(Psi_(2)) angle.l =
	   ket(Psi_(1)) ket(Psi_(2))^(dagger) =
	   ketbra(Psi_(1), Psi_(2)) $]
)

Even though matrix representation of vectors is useful from time to
time, the bra-ket notation is much comfortable to work with in quantum
mechanics. Not only because it is more compact but also because it
represents the conjugate transpose of a vector, which is an operation
performed very often, as "flipping" its symbol left-to-right. In particular,
the inner product "flips" the ket on the left side of the operation, whereas
the outer product "flips" the ket on the right side of the operation.
