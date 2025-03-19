#import "../FoundationsQC_definitions.typ": *

An Hilbert space $H$ is a vector space on a field (assumed to be $CC$) that possesses an inner
product. Given two vectors $overline(x), overline(y) in H$, their inner
product $angle.l overline(x), overline(y) angle.r$ must satisfy (at least)
this three properties:

- Invariance with respect to conjugation: $angle.l overline(x), overline(y)
  angle.r = angle.l overline(x), overline(y) angle.r^(*)$;
- Linearity in the second position: $angle.l overline(x), alpha overline(y) +
  beta overline(z) angle.r = alpha angle.l overline(x), overline(y) angle.r +
  beta angle.l overline(x), overline(y) angle.r$;
- Antilinearity in the first position: $angle.l alpha overline(x) + beta
  overline(y), overline(z) angle.r = alpha^(*) angle.l overline(x), overline(z)
  angle.r + beta^(*) angle.l overline(y), overline(z) angle.r$;
- $angle.l overline(x), overline(x) angle.r gt.eq 0$ for any $overline(x) in CC$;
- $angle.l overline(x), overline(x) angle.r = 0$ if $overline(x) = overline(0)$.

Given two vectors $overline(x)$ and $overline(y)$, their dot product is given
by:

$ angle.l overline(x), overline(y) angle.r = mat(x_(1)^(*), dots, x_(n)^(*))
  mat(y_(1); dots.v; y_(n)) = sum_(i = 1)^(n) a_(i)^(*) b_(i) $

The notion of norm can be extended to complex-valued vectors:

$ abs(overline(x)) = sqrt(angle.l overline(x)\, overline(x) angle.r) =
  sqrt(mat(x_(1)^(*), dots, x_(n)^(*)) mat(x_(1); dots.v; x_(n))) $

A more comfortable formalism for denoting vectors is the *bra-ket* notation.
The `ket` associated to a state $Psi$, denoted as $ket(Psi)$, is just
its column vector representation. The `bra` of a state $Psi$, denoted as
$bra(Psi)$, is the transposed conjugate of the corresponding `ket`:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ ket(Psi) = mat(psi_(1); psi_(2); dots.v; psi_(n)) $],
	[$ bra(Psi) = mat(psi_(1)^(*), psi_(2)^(*), dots, psi_(n)^(*)) $]
)

If a state $Psi$ belongs to an Hilber space $Eta$, its conjugate $Psi^(*)$
belongs to the *dual space* $Eta^(*)$ of the Hilbert space $Eta$. Another
way of expressing it is that if a `ket` $ket(Psi)$ belongs to $Eta$,
then the corresponding `bra` $bra(Psi)$ belongs to $Eta^(*)$.

The dual space is constitued by linear functionals $Chi$ over the `kets` in
$Eta$: if $ket(Psi) in Eta$ then $Chi(Psi) in CC$:

$ Chi(alpha_(1) ket(Psi_(1)) + alpha_(2) ket(Psi_(2))) =
  Chi(alpha_(1) ket(Psi_(1))) + Chi(alpha_(2) ket(Psi_(2))) $

Denoting the dot product between two vectors $Psi_(1)$ and $Psi_(2)$
expressed as `kets` is particularly comfortable:

$ angle.l | Psi angle.r^(*), | Psi angle.r angle.r =
  angle.l angle.l Psi |, | Psi angle.r angle.r =
  angle.l Psi | Psi angle.r = 0 $

By definition:

$ angle.l | Psi angle.r^(*), | Psi angle.r angle.r =
  angle.l angle.l Psi |, | Psi angle.r angle.r =
  angle.l Psi | Psi angle.r = 0 $

A basis in quantum mechanics is required to be orthonormal, which means
constituted by vectors all orthogonal to each other and whose length is
$1$.
