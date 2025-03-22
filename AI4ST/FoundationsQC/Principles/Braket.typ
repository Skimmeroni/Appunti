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

A basis in quantum mechanics is required to be orthonormal, which
means constituted by vectors all orthogonal to each other and whose
length is $1$.

The *tensor product* between two vectors $ket(v)$ and $ket(w)$ is the
vector $ket(v) times.circle ket(w)$ constructed as:

$ ket(v) times.circle ket(w) =
  mat(v_(1); dots.v; v_(n)) times.circle mat(w_(1); dots.v; w_(m)) =
  mat(v_(1)w_(1), dots, v_(1)w_(m), dots, v_(n)w_(1), dots, v_(n)w_(m))^(T) $

The tensor product between vectors satisfies the following relations:

- $(ket(v_(1)) + ket(v_(2))) times.circle ket(v_(3)) =
   ket(v_(1)) times.circle (ket(v_(2)) + ket(v_(3))) =
   ket(v_(1)) times.circle ket(v_(2)) + ket(v_(1)) times.circle ket(v_(3))$
- $(a ket(v_(1))) times.circle ket(v_(2)) =
   ket(v_(1)) times.circle (a ket(v_(2))) =
   a (ket(v_(1)) times.circle ket(v_(2)))$

When there is no ambiguity, the tensor product of two vectors $ket(v)$ and
$ket(w)$ is simply denoted as $ket(v) ket(w)$.

#exercise[
  What is the tensor product of the two following vectors?

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ ket(v) = mat(frac(1, sqrt(5)); -frac(2, sqrt(5))) $],
    [$ ket(w) = mat(-frac(1, sqrt(10)); frac(3, sqrt(10))) $]
  )
]
#solution[
  $ ket(v) times.circle ket(w) =
    mat(frac(1, sqrt(5))  (-frac(1, sqrt(10))),
        frac(1, sqrt(5))  frac(3, sqrt(10)),
        -frac(2, sqrt(5)) (-frac(1, sqrt(10))),
        -frac(2, sqrt(5)) frac(3, sqrt(10)))^(T) =
    mat(-frac(1, 5 sqrt(2)),
        frac(3, 5 sqrt(2)),
        -frac(2, 5 sqrt(2)),
        -frac(6, 5 sqrt(2)))^(T) $
]

The *tensor product* of two vector spaces $V$ and $W$, having bases
$A = {ket(v_(1)), ket(v_(2)), dots, ket(v_(n))}$ and $B = {ket(w_(1)),
ket(w_(2)), dots, ket(w_(m))}$ respectively, is a $n m$-dimensional
vector space denoted as $V times.circle W$.

The basis of $V times.circle W$ is constituted by all of possible tensor
products between the vectors of the two original bases. Explicitly, the
basis of $V times.circle W$ is:

$ \{ket(v_(1)) times.circle ket(w_(1)), dots,
  ket(v_(n)) times.circle ket(w_(1)), dots,
  ket(v_(1)) times.circle ket(w_(m)), dots,
  ket(v_(n)) times.circle ket(w_(m))\} $

With $ket(v_(1)), dots, ket(v_(n)) in A$ and $ket(w_(1)), dots, ket(w_(m)) in B$.

This means that any generic vector of $V times.circle W$ can be written as:

$ lambda_(1,1)(ket(v_(1)) times.circle ket(w_(1))) + dots +
  lambda_(n,1)(ket(v_(n)) times.circle ket(w_(1))) + dots +
  lambda_(1,m)(ket(v_(1)) times.circle ket(w_(m))) + dots +
  lambda_(n,m)(ket(v_(n)) times.circle ket(w_(m))) $

For $n m$ coefficients $lambda_(i, j)$ with $i in {1, dots, n}$ and
$j in {1, dots, m}$.

If $V$ and $W$ are two vector spaces for whose an inner product is
defined (like Hilbert spaces), then it is possible to define an inner
product for $V times.circle W$ as the product of the inner products
with respect to those spaces. Given $ket(v_(1)), ket(v_(2)) in V$
and $ket(w_(1)), ket(w_(2)) in W$, the inner product of $ket(v_(1))
times.circle ket(w_(1))$ and $ket(v_(2)) times.circle ket(w_(2))$
is given by:

$ (bra(v_(2)) times.circle bra(w_(2))) dot (ket(v_(1)) times.circle ket(w_(1))) =
  braket(v_(2), v_(1)) braket(w_(2), w_(1)) $

The tensor product has many properties that are of interest for quantum
state analysis.

#lemma[
  The tensor product of two unit vectors is also a unit vector.
] <Tensor-product-preserves-unit>
// #proof[
//
// ]

#lemma[
  Let $V$ and $W$ be two vector spaces having bases $A = \{ket(v_(1)),
  ket(v_(2)), dots, ket(v_(n))\}$ and $B = \{ket(w_(1)), ket(w_(2)),
  dots, ket(w_(m))\}$ respectively. If $A$ and $B$ are both orthonormal,
  then the basis:

  $ C = \{ket(v_(1)) times.circle ket(w_(1)), dots,
    ket(v_(n)) times.circle ket(w_(1)), dots,
    ket(v_(1)) times.circle ket(w_(m)), dots,
    ket(v_(n)) times.circle ket(w_(m))\} $

  Of $V times.circle W$ is also orthonormal.
] <Tensor-product-preserves-orthonormal>
// #proof[
//
// ]
