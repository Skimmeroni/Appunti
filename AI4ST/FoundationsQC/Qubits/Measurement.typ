#import "../FoundationsQC_definitions.typ": *

The kind of measurements presented until now consisted of measuring the
state with respect to its basis. There is, however, a much richer way
to measure quantum states, that goes beyond measuring bases.

First, recall that the outer product between two kets is a matrix (an
operator). Since they are vectors like any other, this is valid for
basis vectors as well: the outer product between two basis states is
a matrix (an operator). However, basis vectors are orthonormal, making
the representation of matrices in bra-ket notation particularly enticing.

Consider an $n$-qubit system spanned by the basis $\{phi_(1), dots,
phi_(n)\}$. An operator $O$ defined in bra-ket notation with respect
to this basis is written as:

$ sum_(i = 1)^(n) sum_(j = 1)^(n) p_(i j) ketbra(phi_(i), phi_(j)) $

Any ket $ket(Psi) in V$ can be written as a linear combination
$sum_(k = 1)^(N) p_(k) ket(phi_(k))$. Applying $O$ to this ket
gives:

$ O ket(Psi) = (sum_(i = 1)^(n) sum_(j = 1)^(n) p_(i j)
  ketbra(phi_(i), phi_(j))) (sum_(k = 1)^(n) p_(k) ket(phi_(k))) =
  sum_(i = 1)^(n) sum_(j = 1)^(n) sum_(k = 1)^(n) p_(i j) p_(k)
  ket(phi_(i)) braket(phi_(j), phi_(k)) = sum_(i = 1)^(n)
  sum_(j = 1)^(n) p_(i j) p_(k) ket(phi_(i)) $

This is because, being all orthonormal, all bra-kets $braket(phi_(j),
phi_(k))$ with $j != k$ are $0$ and those with $j = k$ are $1$.

#exercise[
  Consider the operator $X = ketbra(10, 00) + ketbra(00, 10) +
  ketbra(11, 11) + ketbra(01, 01)$. What happens when applied
  to the state $ket(Phi^(+)) = frac(sqrt(2), 2) ket(00) +
  frac(sqrt(2), 2) ket(11)$?
]
#solution[
  $ X ket(Phi^(+)) &=
    sum_(i = 1)^(4) sum_(j = 1)^(4) sum_(k = 1)^(2) p_(i j) p_(k)
    ket(phi_(i)) braket(phi_(j), phi_(k)) = \
    &= sum_(i = 1)^(4) sum_(j = 1)^(4)
    p_(i j) frac(sqrt(2), 2) ket(phi_(i)) braket(phi_(j), 00) +
    p_(i j) frac(sqrt(2), 2) ket(phi_(i)) braket(phi_(j), 11) = \
    &= sum_(i = 1)^(4)
       p_(i 1) frac(sqrt(2), 2) ket(phi_(i)) braket(00, 00) +
       p_(i 1) frac(sqrt(2), 2) ket(phi_(i)) braket(00, 11) +
       p_(i 2) frac(sqrt(2), 2) ket(phi_(i)) braket(01, 00) +
       p_(i 2) frac(sqrt(2), 2) ket(phi_(i)) braket(01, 11) + \
     & p_(i 3) frac(sqrt(2), 2) ket(phi_(i)) braket(10, 00) +
       p_(i 3) frac(sqrt(2), 2) ket(phi_(i)) braket(10, 11) +
       p_(i 4) frac(sqrt(2), 2) ket(phi_(i)) braket(11, 00) +
       p_(i 4) frac(sqrt(2), 2) ket(phi_(i)) braket(11, 11) = \
    &= sum_(i = 1)^(4) p_(i 1) frac(sqrt(2), 2) ket(phi_(i)) +
       p_(i 4) frac(sqrt(2), 2) ket(phi_(i)) =
       0 dot frac(sqrt(2), 2) ket(00) + 0 dot frac(sqrt(2), 2) ket(00) +
       0 dot frac(sqrt(2), 2) ket(01) + 0 dot frac(sqrt(2), 2) ket(01) + \
     & 1 dot frac(sqrt(2), 2) ket(10) + 0 dot frac(sqrt(2), 2) ket(10) +
       0 dot frac(sqrt(2), 2) ket(11) + 1 dot frac(sqrt(2), 2) ket(11) =
       frac(sqrt(2), 2) ket(10) + frac(sqrt(2), 2) ket(11) $
]

Again from @Direct-sum-decomposition, for any vector space $V$ there exist
a subspace $S$ of $V$ such that $V = S plus.circle S^(perp)$, where $S^(perp)$
is the vector space that contains all vectors perpendicular to $S$. This means
that any vector $ket(v) in V$ can be written in a unique way as $bold(s)_(1)
+ bold(s)_(2)$, with $bold(s)_(1) in S$ and $bold(s)_(2) in S^(perp)$.

For any $S$ of the sort it is possible to construct a linear operator $P_(S):
S -> V$, called *projection operator*, or _projectors_ for short, that maps
$ket(v)$ to $s_(1)$. To construct a projector, it is sufficient to take the
outer product of a vector with itself. As a matter of fact, a projector
simply "extracts" the "contribution" given by a basis to the state: the
product between said basis and the component of the state with respect to
the basis. Given one of the subspaces $S$ and a basis $\{ket(alpha_(1)),
dots, ket(alpha_(s))\}$ for this subspace, the projector $P_(S)$ that
returns the contribution given by $\{ket(alpha_(1)), dots, ket(alpha_(s))\}$
to $ket(Psi)$ is simply given by:

$ P_(S) = sum_(i = 1)^(s) ketbra(alpha_(i), alpha_(i)) =
  ketbra(alpha_(1), alpha_(1)) + dots + ketbra(alpha_(s), alpha_(s)) $

In general, given a state space $V$, for any direct sum decomposition
$V = S_(1) plus.circle dots plus.circle S_(k)$ into orthogonal subspaces,
there exist $i$ distinct projection operators $P_(i)$, each mapping a
state $ket(v) in V$ to a vector $bold(s)_(i)$ belonging the $i$-th subspace
$S_(i)$. Framed this way, a measuring device with direct sum decomposition
$V = S_(1) plus.circle dots plus.circle S_(k)$ acting on a state $ket(Psi)$
results in the state

$ ket(phi.alt) = frac(P_(i) ket(Psi), abs(abs(P_(i) ket(Psi)))) $

With probability $abs(abs(P_(i) ket(Psi)))^(2)$. The ratio is necessary
to (re)normalize the resulting vector in response to the measurement. A
projector is well-defined, since applying a projector two times results
in no difference.

When a measuring device with associated direct sum decomposition V =
$S_(1) plus.circle dots plus.circle S_(k)$ interacts with an $n$-qubit
system in state $ket(Psi)$, the interaction changes the state to one
entirely contained within one of the subspaces, and chooses the subspace
with probability equal to the square of the absolute value of the amplitude
of the component of $ket(Psi)$ in that subspace.

Any projector is not only a projector in the mathematical sense, but is also
self-ajoint. It is therefore easy to compute $abs(abs(P_(S) ket(Psi)))^(2)$:

$ abs(abs(P_(S) ket(Psi)))^(2) =
  (P_(S) ket(Psi))^(dagger) P_(S) ket(Psi) =
  braket(Psi|P_(S), Psi) $

#exercise[
  Consider the two-qubit state $ket(Psi) = frac(1, 4) ket(00) +
  frac(1, 2) ket(01) + frac(1, 2) ket(10) + frac(sqrt(7), 4) ket(11)$
  and the subspace decomposition $S plus.circle S^(perp)$, where
  $S = "span"\{ket(00), ket(01), ket(10)\}$. What is the projector
  with respect to this subspace? Which is the state reached after
  measurement? With which probability?
]
#solution[
  The projector associated to $S$ is $P_(S) = ketbra(00, 00) +
  ketbra(01, 01) + ketbra(10, 10)$. Applying the projector to
  $ket(Psi)$ gives:
  
  $ P_(S) ket(Psi) &=
    (ketbra(00, 00) + ketbra(01, 01) + ketbra(10, 10))
    (frac(1, 4) ket(00) + frac(1, 2) ket(01) + frac(1, 2) ket(10) + frac(sqrt(7), 4) ket(11)) = \
    &= frac(1, 4) ket(00) braket(00, 00) + frac(1, 2) ket(00) braket(00, 01) +
    frac(1, 2) ket(00) braket(00, 10) + frac(sqrt(7), 4) ket(00) braket(00, 11) +
    frac(1, 4) ket(01) braket(01, 00) + \
    &= frac(1, 2) ket(01) braket(01, 01) + frac(1, 2) ket(01) braket(01, 10) +
    frac(sqrt(7), 4) ket(01) braket(01, 11) + frac(1, 4) ket(10) braket(10, 00) +
    frac(1, 2) ket(10) braket(10, 01) + \
    &= frac(1, 2) ket(10) braket(10, 10) + frac(sqrt(7), 4) ket(10) braket(10, 11) =
    frac(1, 4) ket(00) + frac(1, 2) ket(01) + frac(1, 2) ket(10) $

  Computing its Euclidean norm:

  $ abs(abs(P_(S) ket(Psi))) =
    abs(abs(frac(1, 4) ket(00) + frac(1, 2) ket(01) + frac(1, 2) ket(10))) =
    sqrt((frac(1, 4))^(2) + (frac(1, 2))^(2) + (frac(1, 2))^(2)) =
    sqrt(frac(9, 16)) =
    frac(3, 4) $

  The new state reached with respect to this measurement process is:

  $ ket(phi.alt) =
    frac(P_(S) ket(Psi), abs(abs(P_(S) ket(Psi)))) = 
    frac(display(frac(1, 4)) ket(00) + display(frac(1, 2)) ket(01) + display(frac(1, 2)) ket(10),
         display(frac(3, 4))) =
    frac(1, 3) ket(00) + frac(2, 3) ket(01) + frac(2, 3) ket(10) $

  With probability:

  $ abs(abs(P_(S) ket(Psi))) =
    braket(Psi|P_(S), Psi) = 
    (frac(3, 4))^(2) =
    frac(9, 16) $
]

As a matter of fact, the observation that any device has an associated
direct sum decomposition is just a generalization of the single-qubit
case. Every device measuring a single-qubit system has an associated
orthonormal basis ${ket(v_(1)), ket(v_(2))}$ for the state space $V$
of the system, having dimension $2$. Each of these vectors generate a
one-dimensional subspace, $S_(1)$ and $S_(2)$, consisting of all $alpha
ket(v_(1))$ and $beta ket(v_(2))$ respectively, with $alpha, beta in CC$,
and $V = S_(1) plus.circle S_(2)$. Furthermore, the only nontrivial (with
no subspaces of dimension $0$) possible decompositions of $V$ are the ones
into two subspaces of dimension $1$, and any choice of unit length vectors,
one from each of the subspaces, yields an orthonormal basis.

#exercise[
  Rephrase the measurement of the single-qubit state $ket(Psi) =
  frac(sqrt(2), 2) ket(0) + frac(sqrt(2), 2) ket(1)$ under this
  formalism.
]
#solution[
  Let $V$ be the vector space associated with said single-qubit system.
  A device that measures a qubit in the standard basis has associated the
  direct sum decomposition:

  $ V = S_(1) plus.circle S_(2) =
    "span"\{ket(0)\} plus.circle "span"\{ket(1)\} =
    "span"\{ket(0), ket(1)\} $

  The state $ket(Psi)$ measured by such a device will be $ket(0)$ with
  probability $abs(frac(sqrt(2), 2))^(2) = frac(1, 2)$, the amplitude
  of $ket(Psi)$ in the subspace $S_(1)$, and $ket(1)$ with probability
  $abs(frac(sqrt(2), 2))^(2) = frac(1, 2)$, the amplitude of $ket(Psi)$
  in the subspace $S_(2)$.
]

This formalism allows one to construct measurements that don't simply
refer to one or more base states.

#exercise[
  Consider the $2$-qubit state $ket(Psi) = frac(1, 8) ket(00) +
  frac(sqrt(7), 8) ket(01) + frac(sqrt(7), 8) ket(10) + frac(7, 8) ket(11)$.
  What is the probability of observing the first qubit in state $ket(0)$?
]
#solution[
  Measuring the first qubit in the state $ket(0)$ is equivalent to measuring
  the overall system in a state that is either $ket(00)$ or $ket(01)$. Let
  $V$ be the vector space associated with said $2$-qubit system. A device
  that measures the first qubit in the standard basis has associated the
  direct sum decomposition:

  $ V &= S plus.circle S^(perp) =
    (ket(0) times.circle "span"\{ket(0), ket(1)\}) plus.circle
    (ket(1) times.circle "span"\{ket(0), ket(1)\}) =
    "span"\{ket(00), ket(01)\} plus.circle "span"\{ket(10), ket(11)\} = \
    &= "span"\{ket(00), ket(01), ket(10), ket(11)\} $

  The projector associated to $S$ is then $P_(S) = ketbra(00, 00) +
  ketbra(01, 01)$. Applying the projector to $ket(Psi)$ gives:

  $ P_(S) ket(Psi) =
    (ketbra(00, 00) + ketbra(01, 01))(frac(1, 8) ket(00) +
     frac(sqrt(7), 8) ket(01) + frac(sqrt(7), 8) ket(10) + frac(7, 8) ket(11)) =
    frac(1, 8) ket(00) + frac(sqrt(7), 8) ket(01) $

  Which means that the probability of measuring the first qubit in the state
  $ket(0)$ is:

  $ abs(abs(P_(S) ket(Psi))) =
    braket(Psi|P_(S), Psi) =
    abs(abs(frac(1, 8) ket(00) + frac(sqrt(7), 8) ket(01)))^(2) =
    (frac(1, 8))^(2) + (frac(sqrt(7), 8))^(2) =
    frac(1, 64) + frac(7, 64) = 
    frac(1, 8) $
]

Recall that, for any Hermitian operator, @Eigenspace-decomposition
describes a unique decomposition into its eigenspaces. Given this
correspondence, Hermitian operators can be used to describe measurements.

Let $P_(i)$ be the projectors onto the subspaces $S_(i)$, and let
$\{lambda_(1), dots, lambda_(k)\}$ be a set of distinct real values.
Then, the Hermitian operator $O = sum_(i = 1)^(k) lambda_(i) P_(i)$
has $S_(1) plus.circle dots plus.circle S_(k)$ as its direct sum
decomposition. Thus, when describing a measurement, instead of
directly specifying the associated subspace decomposition, it is
sufficient to specify a Hermitian operator whose eigenspace decomposition
is that decomposition.

Any Hermitian operator with the appropriate direct sum decomposition can
be used to specify a given measurement; in particular, the values of the
$lambda_(i)$ are irrelevant as long as they are distinct. The $lambda_(i)$
should be thought of simply as labels for the corresponding subspaces, or
equivalently as labels for the measurement outcomes #footnote[In quantum
physics, these labels are often chosen to represent a shared property,
such as the energy, of the eigenstates in the corresponding eigenspace.].

It is important to stress that it is not an Hermitian operator that acts
on a state when measured, but instead the projectors associated to said
operator. The Hermitian operator is just a way (frequently used in quantum
mechanics) to write in compact form the projectors associated to a measuring
apparatus.
