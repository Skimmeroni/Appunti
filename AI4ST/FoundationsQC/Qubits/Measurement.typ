#import "../FoundationsQC_definitions.typ": *

The outer product of two kets results in a matrix. Since any matrix is a
representation of a linear operator, this must mean that the outer product
of two kets results in an operator. More operators can be constructed by
summing outer products. An operator is also represented by denoting how
each vector of the basis is mapped to its result.

#exercise[
  Consider the operator $X = ketbra(10, 00) + ketbra(00, 10) +
  ketbra(11, 11) + ketbra(01, 01)$. What's the corresponding matrix?
] <Operators>
#solution[
  $X$ exchanges the ket $ket(10)$ with the ket $ket(00)$ and vice versa,
  while leaving $ket(11)$ and $ket(01)$ unchanged. Keep in mind that the
  operator is constructed with respect to the standard basis.

  $ X &= ketbra(10, 00) + ketbra(00, 10) + ketbra(11, 11) + ketbra(01, 01) =
    mat(0; 0; 1; 0) mat(1; 0; 0; 0)^(dagger) + mat(1; 0; 0; 0)
    mat(0; 0; 1; 0)^(dagger) + mat(0; 0; 0; 1) mat(0; 0; 0; 1)^(dagger) + 
    mat(0; 1; 0; 0) mat(0; 1; 0; 0)^(dagger) = \
    &= mat(0; 0; 1; 0) mat(1, 0, 0, 0) + mat(1; 0; 0; 0)
    mat(0, 0, 1, 0) + mat(0; 0; 0; 1) mat(0, 0, 0, 1) + 
    mat(0; 1; 0; 0) mat(0, 1, 0, 0) = \
    &= mat(0, 0, 0, 0;
           0, 0, 0, 0;
           1, 0, 0, 0;
           0, 0, 0, 0) +
       mat(0, 0, 1, 0;
           0, 0, 0, 0;
           0, 0, 0, 0;
           0, 0, 0, 0) +
       mat(0, 0, 0, 0;
           0, 0, 0, 0;
           0, 0, 0, 0;
           0, 0, 0, 1) +
       mat(0, 0, 0, 0;
           0, 1, 0, 0;
           0, 0, 0, 0;
           0, 0, 0, 0) =
       mat(0, 0, 1, 0;
           0, 1, 0, 0;
           1, 0, 0, 0;
           0, 0, 0, 1) $

  This can also be represented as:

  #grid(
    columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
    [$ ket(10) -> ket(00) $],
    [$ ket(00) -> ket(10) $],
    [$ ket(11) -> ket(11) $],
    [$ ket(01) -> ket(01) $]
  )
]

Results in @Operators can be generalized as follows. In an $n$-qubit
system, an operator $O: V -> V$ for the basis $\{ket(phi_(i))\}$ on
the state space $V$ can be written as:

$ O = sum_(i = 1)^(N) sum_(j = 1)^(N) p_(i j) ketbra(phi_(i), phi_(j)) $

Where $N$ is the dimension of $V$. The matrix for $O$ with respect to
the basis $\{ket(phi_(i))\}$ has the value $p_(i j)$ in the $(i, j)$-th
cell.

Any ket $ket(Psi) in V$ can be written as a linear combination
$sum_(k = 1)^(N) p_(k) ket(phi_(k))$. Applying $O$ to this vector
is equal to:

$ O ket(Psi) = (sum_(i = 1)^(N) sum_(j = 1)^(N) p_(i j)
  ketbra(phi_(i), phi_(j))) (sum_(k = 1)^(N) p_(k) ket(phi_(k))) =
  sum_(i = 1)^(N) sum_(j = 1)^(N) sum_(k = 1)^(N) p_(i j) p_(k)
  ket(phi_(i)) bra(phi_(j)) ket(phi_(k)) = sum_(i = 1)^(N)
  sum_(j = 1)^(N) p_(i j) p_(j) ket(phi_(i)) $

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
the basis.

In general, given a state space $V$, for any direct sum decomposition
$V = S_(1) plus.circle dots plus.circle S_(k)$ into orthogonal subspaces,
there exist $i$ distinct projection operators $P_(i)$, each mapping a
state $ket(v) in V$ to a vector $bold(s)_(i)$ belonging the $i$-th subspace
$S_(i)$. Framed this way, a measuring device with direct sum decomposition
$V = S_(1) plus.circle dots plus.circle S_(k)$ acting on a state $ket(Psi)$
results in the state

$ ket(phi.alt_(i)) = frac(P_(i) ket(Psi), abs(P_(i) ket(Psi))) $

With probability $abs(P_(i) ket(Psi))^(2)$. Given one of the subspaces
$S$ and a basis $\{ket(alpha_(1)), dots, ket(alpha_(s))\}$ for this
subspace, the projector $P_(S)$ that returns the contribution given
by $\{ket(alpha_(1)), dots, ket(alpha_(s))\}$ to $ket(Psi)$ is simply
given by:

$ P_(S) = sum_(i = 1)^(s) ketbra(alpha_(i), alpha_(i)) =
  ketbra(alpha_(1), alpha_(1)) + dots + ketbra(alpha_(s), alpha_(s)) $

Indeed, since the base vectors are all orthogonal, applying $P_(S)$ to
a generic state $ket(Psi)$ nulls all contributions given by basis absent
in $S$. This also means that a projector is well-defined, since applying
a projector two times results in no difference. Note that applying a
projector to a state might not return a normalized vector.

#exercise[
  Consider the two-qubit state $ket(Psi) = frac(1, 8) ket(00) +
  frac(sqrt(7), 8) ket(01) + frac(sqrt(7), 8) ket(10) + frac(7, 8)
  ket(11)$ and the subspace spanned by $\{ket(00), ket(01)\}$. What
  is the projector with respect to the basis? What is its effect on
  $ket(Psi)$?
]
#solution[
  The projector with respect to $S$ is given by $P_(S) = ketbra(00, 00)
  + ketbra(01, 01)$. Applying to $ket(Psi)$ gives:

  $ P_(S) ket(Psi) = (ketbra(00, 00) + ketbra(01, 01)) (frac(1, 8) ket(00) +
    frac(sqrt(7), 8) ket(01) + frac(sqrt(7), 8) ket(10) + frac(7, 8) ket(11)) =
    frac(1, 8) ket(00) + frac(sqrt(7), 8) ket(01) $

  Note how this state is not normalized. Note also how applying $P_(S)$ to
  the result does not change the state:

  $ P_(S) (P_(S) ket(Psi)) =
    (ketbra(00, 00) + ketbra(01, 01)) (frac(1, 8) ket(00) +
    frac(sqrt(7), 8) ket(01)) = frac(1, 8) ket(00) braket(00, 00) +
    frac(sqrt(7), 8) ket(00) cancel(braket(00, 01)) + \
    frac(1, 8) ket(01) cancel(braket(01, 00)) +
    frac(sqrt(7), 8) ket(01) braket(01, 01) =
    frac(1, 8) ket(00) + frac(sqrt(7), 8) ket(01) =
    P_(S) ket(Psi) $
]

Any projector is not only a projector in the mathematical sense, but is also
self-ajoint. It is therefore easy to compute $abs(P_(S) ket(Psi))^(2)$:

$ abs(P_(S) ket(Psi))^(2) =
  (P_(S) ket(Psi))^(dagger) P_(S) ket(Psi) =
  braket(Psi|P_(S), Psi) $

#exercise[
  Consider the state $ket(Psi) = a_(00) ket(00) + a_(01) ket(01) +
  a_(10) ket(10) + a_(11) ket(11)$ and a decomposition $S_(00) plus.circle
  S_(01) plus.circle S_(10) plus.circle S_(11)$. Consider the projector
  $P_(01)$ and describe the assigned measurement.
]
#solution[
  Applying the projection $P_(01)$ to $ket(Psi)$ gives:

  $ P_(01) ket(Psi) &=
    ketbra(01, 01) (a_(00) ket(00) + a_(01) ket(01) + a_(10) ket(10) +
    a_(11) ket(11)) = \
    &= a_(00) ket(01) braket(01, 00) + a_(01) ket(01) braket(01, 01) +
    a_(10) ket(01) braket(01, 10) + a_(11) ket(01) braket(01, 11) =
    a_(01) ket(01) $

  The state $frac(P_(01) ket(Psi), abs(P_(01) ket(Psi)))$ is measured with
  probability:

  $ abs(P_(01) ket(Psi))^(2) =
    braket(Psi|P_(01), Psi) =
    bra(Psi) (ketbra(01, 01)) ket(Psi) =
    braket(Psi, 01) braket(01, Psi) =
    a_(01)^(dagger) a_(01) =
    abs(a_(01))^(2) $
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
