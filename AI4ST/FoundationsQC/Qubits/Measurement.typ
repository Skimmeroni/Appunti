#import "../FoundationsQC_definitions.typ": *

In the first section, the issue of measuring the state of a single-qubit
system was introduced. Measuring the state of a $n$-qubit system follows
the same idea, but the set of possible measurements and measurement outcomes
is significantly larger. It also serves the purpose of describing in greater
detail the formal process of measuring in general.

First, recall from @Direct-sum-decomposition that any vector space can be
decomposed into a direct sum of one or more of its orthogonal subspaces.
This means that the state space of an $n$-qubit system, having dimension
$2^(n)$, can be decomposed into $k lt.eq 2^(n)$ of its orthogonal subspaces.
The number $k$ corresponds to the maximum number of possible measurement
outcomes for a state measured with that particular device. This number
varies from device to device, even between devices measuring the same
system.

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

When a measuring device with associated direct sum decomposition V =
$S_(1) plus.circle dots plus.circle S_(k)$ interacts with an $n$-qubit
system in state $ket(Psi)$, the interaction changes the state to one
entirely contained within one of the subspaces, and chooses the subspace
with probability equal to the square of the absolute value of the amplitude
of the component of $ket(Psi)$ in that subspace.

More formally, any state $ket(Psi)$ in $V$ has a unique direct
sum decomposition $ket(Psi) = a_(1) ket(phi_(1)) plus.circle dots
plus.circle a_(k) ket(phi_(k))$, where each $ket(phi_(i))$ is a
unit vector in $S_(i)$ and $a_(i)$ is a real and non-negative number.
When $ket(Psi)$ is measured, the state $ket(phi_(i))$ is obtained
with probability equal to $abs(a_(i))^(2)$. This is not a fact that
can be deduced from theory, but is instead an axiom of quantum mechanics.

#exercise[
  Rephrase the measurement of the $2$-qubit state $ket(Psi) =
  frac(1, 8) ket(00) + frac(sqrt(7), 8) ket(01) + frac(sqrt(7), 8)
  ket(10) + frac(7, 8) ket(11)$ under this formalism.
]
#solution[
  Let $V$ be the vector space associated with said $2$-qubit system.
  A device that measures the first qubit in the standard basis has
  associated the direct sum decomposition:

  $ V &= S_(1) plus.circle S_(2) =
    (ket(0) times.circle "span"\{ket(0), ket(1)\}) plus.circle
    (ket(1) times.circle "span"\{ket(0), ket(1)\}) =
    "span"\{ket(00), ket(01)\} plus.circle "span"\{ket(10), ket(11)\} = \
    &= "span"\{ket(00), ket(01), ket(10), ket(11)\} $

  To denote more explicitly what happens when a measurement is performed
  on the first qubit, the state can be rewritten as $ket(Psi) = c_(1)
  ket(Psi_(1)) + c_(2) ket(Psi_(2))$, or more explicitly:

  $ ket(Psi) = sqrt(abs(frac(1, 8))^(2) + abs(frac(sqrt(7), 8))^(2))
       (frac(frac(1, 8) ket(00) + frac(sqrt(7), 8) ket(01),
        sqrt(abs(frac(1, 8))^(2) + abs(frac(sqrt(7), 8))^(2)))) +
     sqrt(abs(frac(sqrt(7), 8))^(2) + abs(frac(7, 8))^(2))
       (frac(frac(sqrt(7), 8) ket(10) + frac(7, 8) ket(11),
        sqrt(abs(frac(sqrt(7), 8))^(2) + abs(frac(7, 8))^(2)))) $

  In this way, the state is correctly normalized and the probabilities
  for the two possible outcomes for the first qubit can be computed as:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ P_(1) = abs(frac(1, 8))^(2) + abs(frac(sqrt(7), 8))^(2) =
       frac(1, 64) + frac(7, 64) = frac(1, 8) $],
    [$ P_(2) = abs(frac(sqrt(7), 8))^(2) + abs(frac(7, 8))^(2) =
       frac(7, 64) + frac(49, 64) = frac(7, 8) $]
  )
]

Recall that the outer product of two kets results in a matrix. Since any
matrix is a representation of a linear operator, this must mean that the
outer product of two kets results in an operator. More operators can be
constructed by summing outer products. An operator is also represented by
denoting how each vector of the basis is mapped to its result.

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
