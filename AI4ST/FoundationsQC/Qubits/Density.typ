#import "../FoundationsQC_definitions.typ": *

Quantum states that can be described by a single unit vector (like
the ones introduced until now) are called *pure states*. Not all
quantum states can be described with pure states, however. For example,
pure states are assumed to be perfectly fault-tolerant, whereas real
quantum computers are very unstable.

Let $X$ be a $n$-qubit system, and let $A$ be a $m$-qubit subsystem
of $X$. It is then possible to write $X = A times.circle B$, where
$B$ is a $(n - m)$-qubit subsystem of $X$. The interest is to find
out how much information regarding $X$ (the whole) can be gathered
from only measuring $A$ (one of its parts). The structure that holds
this information is called *mixed state* of $A$, and is modelled
mathematically by a *density matrix* or, equivalently, *density operator*.

The mixed state of $A$ must capture all possible results of measurement
by operators in the form $O times.circle I$, where $O$ is a measurement
operator acting on the $m$ qubits of $A$ and $I$ is the identity matrix
acting (doing nothing) on the $n − m$ qubits of $B$.

Let $M = 2^(m)$ and $L = 2^(n - m)$. Let $\{ket(alpha_(0)), dots,
ket(alpha_(M - 1))\}$ and $\{ket(beta_(0)), dots, ket(beta_(L - 1))\}$
be two bases for $A$ and $B$ respectively. A basis of the entire $n$-qubit
system $X = A times.circle B$ can be constructed from these two as:

$ \{ket(alpha_(0)) times.circle ket(beta_(0)), dots,
    ket(alpha_(M - 1)) times.circle ket(beta_(0)), dots,
    ket(alpha_(0)) times.circle ket(beta_(L - 1)), dots,
    ket(alpha_(M - 1)) times.circle ket(beta_(L - 1))\} $

Let $ket(x)$ be a generic state of $X$. It is possible to write it in
linear combination form as:

$ ket(x) &= lambda_(0, 0) (ket(alpha_(0)) times.circle ket(beta_(0))) + dots +
           lambda_(M - 1, 0) (ket(alpha_(M - 1)) times.circle ket(beta_(0))) + dots +
           lambda_(0, L - 1) (ket(alpha_(0)) times.circle ket(beta_(L - 1))) + dots + \
           &lambda_(M - 1, L - 1) (ket(alpha_(M - 1)) times.circle ket(beta_(L - 1))) =
           sum_(i = 0)^(M - 1) sum_(j = 0)^(N - 1) lambda_(i, j) (ket(alpha_(i)) times.circle ket(beta_(j))) $

Any measurement performed on $A$ alone is described by Hermitian
operators $O^(A)$ having $\{P^(A)_(0), P^(A)_(1), dots, P^(A)_(M)\}$
projectors. On the whole space $X$, such measurements have the form
$O^(A) times.circle I^(B)$ with projectors $\{P^(A)_(0) times.circle
I^(B), P^(A)_(1) times.circle I^(B), dots, P^(A)_(M) times.circle I^(B)\}$.

For any particular projector $P^(A)_(i)$, the probability that a measurement
of $ket(x)$ by $O^(A) times.circle I_(B)$ results in a state present in the
subspace of $P^(A)_(i)$ is given by $abs(abs(P^(A)_(i) times.circle I^(B)
ket(x)))^(2) = braket(x | P^(A)_(i) times.circle I^(B), x)$. Writing $ket(x)$
explicitly gives:

$ braket(x | P^(A)_(i) times.circle I^(B), x) &=
  [sum_(i = 0)^(M - 1) sum_(j = 0)^(N - 1) lambda_(i, j) (ket(alpha_(i)) times.circle ket(beta_(j)))]^(dagger)
  P^(A)_(i) times.circle I^(B)
  [sum_(k = 0)^(M - 1) sum_(l = 0)^(N - 1) lambda_(k, l) (ket(alpha_(k)) times.circle ket(beta_(l)))] = \
  &= [sum_(i = 0)^(M - 1) sum_(j = 0)^(N - 1) lambda_(i, j)^(*) (bra(alpha_(i)) times.circle bra(beta_(j)))]
  P^(A)_(i) times.circle I^(B)
  [sum_(k = 0)^(M - 1) sum_(l = 0)^(N - 1) lambda_(k, l) (ket(alpha_(k)) times.circle ket(beta_(l)))] = \
  &= lambda_(i, j)^(*) lambda_(k, l)
  [sum_(i = 0)^(M - 1) sum_(j = 0)^(N - 1) bra(alpha_(i)) times.circle bra(beta_(j))]
  P^(A)_(i) times.circle I^(B)
  [sum_(k = 0)^(M - 1) sum_(l = 0)^(N - 1) ket(alpha_(k)) times.circle ket(beta_(l))] = \
  &= lambda_(i, j)^(*) lambda_(k, l)
  [sum_(i = 0)^(M - 1) sum_(j = 0)^(N - 1) bra(alpha_(i)) P^(A)_(i) times.circle bra(beta_(j)) I^(B)]
  [sum_(k = 0)^(M - 1) sum_(l = 0)^(N - 1) ket(alpha_(k)) times.circle ket(beta_(l))] = \
  &= lambda_(i, j)^(*) lambda_(k, l)
  [sum_(i = 0)^(M - 1) sum_(j = 0)^(N - 1) sum_(k = 0)^(M - 1) sum_(l = 0)^(N - 1)
  bra(alpha_(i)) P^(A)_(i) ket(alpha_(k)) times.circle bra(beta_(j)) I^(B) ket(beta_(l))] = \
  &= sum_(i = 0)^(M - 1) sum_(j = 0)^(N - 1) sum_(k = 0)^(M - 1) sum_(l = 0)^(N - 1)
  lambda_(i, j)^(*) lambda_(k, l)
  bra(alpha_(i)) P^(A)_(i) ket(alpha_(k)) times.circle braket(beta_(j), beta_(l)) $

Recall that, since all bases are orthonormal, $braket(beta_(j), beta_(l))$
is $0$ when $i != j$ and $1$ otherwise. Therefore, the expression can be
simplified as:

$ braket(x | P^(A)_(i) times.circle I^(B), x) =
  sum_(i = 0)^(M - 1) sum_(j = 0)^(N - 1) sum_(k = 0)^(M - 1)
  lambda_(i, j)^(*) lambda_(k, j)
  bra(alpha_(i)) P^(A)_(i) ket(alpha_(k)) $
