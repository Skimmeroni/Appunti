#import "../FoundationsQC_definitions.typ": *

Consider two Hilbert spaces $H_(1)$ and $H_(2)$, each describing the
state space of a single qubit. Clearly, there is interest in describing
the Hilbert space of the entire system, encompassing both qubits at once.

It might be tempting to describe this merging of spaces simply by computing
the direct sum of the two single qubit Hilbert spaces, like it is done in 
classical physics, but it would be incorrect. This is because the resulting
space might not be a valid description of quantum states.

The Hilbert space describing the state of two qubits is given instead by
the tensor product of the Hilbert spaces of the respecting qubits. Recall
that, due to @Tensor-product-preserves-unit and @Tensor-product-preserves-orthonormal,
the tensor product preserves both the norm of vectors and the orthonormality
of bases. This means that the tensor product of two qubit state spaces is
also guaranteed to be a valid state space.

More explicitly, let $H_(1)$ and $H_(2)$ be the state spaces of two qubits,
having $\{ket(phi_(1))_(1), ket(phi_(2))_(1)\}$ and $\{ket(phi_(1))_(2),
ket(phi_(2))_(2)\}$ respectively as bases. The basis of $H_(1) times.circle
H_(2)$, the state space of the system encompassing both qubits, is:

$ \{ket(phi_(1))_(1) times.circle ket(phi_(1))_(2),
    ket(phi_(1))_(1) times.circle ket(phi_(2))_(2),
    ket(phi_(2))_(1) times.circle ket(phi_(1))_(2),
    ket(phi_(2))_(1) times.circle ket(phi_(2))_(2)\} $

Which, in turn, means that any description of the state of two qubits
at once is in the form:

$ lambda_(1, 1) (ket(phi_(1))_(1) times.circle ket(phi_(1))_(2)) +
  lambda_(1, 2) (ket(phi_(1))_(1) times.circle ket(phi_(2))_(2)) +
  lambda_(2, 1) (ket(phi_(2))_(1) times.circle ket(phi_(1))_(2)) +
  lambda_(2, 2) (ket(phi_(2))_(1) times.circle ket(phi_(2))_(2)) $

Recall that the tensor product is not commutative, therefore the Hilbert
spaces $H_(1) times.circle H_(2)$ and $H_(2) times.circle H_(1)$ are not
the same. This means that it is strictly necessary to define an order on
the qubits, otherwise the results would be inconsistent.

In the previous expression, the order of the qubits is given by the
subscripts placed on the kets. This is fine, but cumbersome. A simpler
approach is to drop the subscripts entirely and assume that the order
of the kets mirrors the order of the qubits:

$ lambda_(1, 1) (ket(phi_(1)) times.circle ket(phi_(1))) +
  lambda_(1, 2) (ket(phi_(1)) times.circle ket(phi_(2))) +
  lambda_(2, 1) (ket(phi_(2)) times.circle ket(phi_(1))) +
  lambda_(2, 2) (ket(phi_(2)) times.circle ket(phi_(2))) $

Therefore, any tensor product $ket(phi_(i)) times.circle ket(phi_(j))$ is
the tensor product between the base state $ket(phi_(i))$ of the first qubit
and the base state $ket(phi_(j))$ of the second qubit.

It is also convenient to use the shortand $ket(phi_(i) phi_(j))$ for
$ket(phi_(i)) times.circle ket(phi_(j))$, allowing the basis of the
two-qubit system to be written more compactly:

$ \{ket(phi_(1) phi_(1)),
    ket(phi_(1) phi_(2)),
    ket(phi_(2) phi_(1)),
    ket(phi_(2) phi_(2))\} $

Again, in the notation $ket(phi_(i) phi_(j))$ it is implicitly assumed
that $ket(phi_(i))$ is the state of the first qubit and $ket(phi_(j))$
is the state of the second qubit.

#exercise[
  Consider the two Hilbert spaces:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ H_(1) = "span"\{ket(arrow.ccw), ket(arrow.cw)\} $],
    [$ H_(2) = "span"\{ket(+), ket(-)\} $]
  )

  Each associated to a qubit. What is the Hilbert space $H_(1)
  times.circle H_(2)$ that describes both qubits at once?
]
#solution[
  $H_(1) times.circle H_(2)$ is spanned by the following four states:

  $ ket(phi_(1)) =
    ket(arrow.ccw) times.circle ket(+) =
    (frac(sqrt(2), 2) (ket(0) + i ket(1))) times.circle (frac(sqrt(2), 2) (ket(0) + ket(1))) =
    frac(1, 2) (ket(00) + ket(01) + i ket(10) + i ket(11)) \
    ket(phi_(2)) =
    ket(arrow.ccw) times.circle ket(-) =
    (frac(sqrt(2), 2) (ket(0) + i ket(1))) times.circle (frac(sqrt(2), 2) (ket(0) - ket(1))) =
    frac(1, 2) (ket(00) - ket(01) + i ket(10) - i ket(11)) \
    ket(phi_(3)) =
    ket(arrow.cw) times.circle ket(+) =
    (frac(sqrt(2), 2) (ket(0) - i ket(1))) times.circle (frac(sqrt(2), 2) (ket(0) + ket(1))) =
    frac(1, 2) (ket(00) + ket(01) - i ket(10) - i ket(11)) \
    ket(phi_(4)) =
    ket(arrow.cw) times.circle ket(-) =
    (frac(sqrt(2), 2) (ket(0) - i ket(1))) times.circle (frac(sqrt(2), 2) (ket(0) - ket(1))) =
    frac(1, 2) (ket(00) - ket(01) - i ket(10) + i ket(11)) $
]

This can be extended naturally to the case of a system having $n > 2$
qubits. If each of those qubits is represented by a Hilbert space
$H_(i)$, with $i in \{1, dots, n\}$, the state space of the entire
system is $H_(n) times.circle H_(n - 1) times.circle dots times.circle
H_(1)$. Its basis can be written as:

$ \{ket(phi_(1) phi_(1) dots phi_(n)),
    ket(phi_(1) phi_(2) dots phi_(n)),
    dots,
    ket(phi_(2) phi_(1) dots phi_(n)),
    ket(phi_(2) phi_(2) dots phi_(n)),
    dots,
    ket(phi_(n) phi_(1) dots phi_(n)),
    ket(phi_(n) phi_(2) dots phi_(n))\} $

As it is the case for a single qubit, a state of an $n$ qubit system
is in a superposition with respect to a certain basis if the linear
combination:

$ lambda_(1, 1, dots, n) ket(phi_(1) phi_(1) dots phi_(n)) +
  lambda_(1, 2, dots, n) ket(phi_(1) phi_(2) dots phi_(n)) +
  dots +
  lambda_(n, 1, dots, n) ket(phi_(n) phi_(1) dots phi_(n)) +
  lambda_(n, 2, dots, n) ket(phi_(n) phi_(2) dots phi_(n)) $

Is not trivial, meaning that at least two coefficients are not zero.
As expected, superposition is basis-dependent.

When the basis under consideration is the standard basis, it is possible
to write the basis of an $n$-qubit state space even more compactly. Recall
that the two standard base states for a qubit are $ket(0) = mat(1; 0)$ and
$ket(1) = mat(0; 1)$. For a two qubit system, it is possible to use integers
$0, 1, 2, 3$ in the same way:

#grid(
  columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
  [$ ket(00) = ket(0) = mat(1; 0; 0; 0) $],
  [$ ket(01) = ket(1) = mat(0; 1; 0; 0) $],
  [$ ket(10) = ket(2) = mat(0; 0; 1; 0) $],
  [$ ket(11) = ket(3) = mat(0; 0; 0; 1) $]
)

In general, for a $n$ qubit state it is possible to write its standard
basis as $\{ket(0), ket(1), dots, ket(2^(n) - 2), ket(2^(n) - 1)\}$,
where each ket contains the integer representation of the binary number
constructed by justapposing the binary digits of the state of each qubit:

#grid(
  columns: (0.21fr, 0.21fr, 0.06fr, 0.26fr, 0.26fr),
  [$ ket(00 dots 0) = ket(0) = mat(1; 0; 0; dots.v; 0; 0; 0) $],
  [$ ket(00 dots 1) = ket(1) = mat(0; 1; 0; dots.v; 0; 0; 0) $],
  [#set math.mat(delim: none); $ mat(; ; ; dots.v; ; ; ) $],
  [$ ket(11 dots 0) = ket(2^(n) - 2) = mat(0; 0; 0; dots.v; 0; 1; 0) $],
  [$ ket(11 dots 1) = ket(2^(n) - 1) = mat(0; 0; 0; dots.v; 0; 0; 1) $]
)

Note that, to use this shorthand notation, it is necessary to also specify
the number of qubits of the state. Therefore, it should be employed when
the number of qubits is either denoted explicitly or known from context.

#exercise[
  How would the matrix representation of the following state be?

  $ frac(1, 2) ket(00) + frac(1, 2)i ket(01) + frac(sqrt(2), 2) ket(11) $
]
#solution[
  Each ket has two digits, therefore this is a two qubit state:

  $ frac(1, 2) ket(00) + frac(1, 2)i ket(01) + frac(sqrt(2), 2) ket(11) =
    frac(1, 2) ket(0) + frac(1, 2)i ket(1) + frac(sqrt(2), 2) ket(3) =
    mat(frac(1, 2); frac(1, 2)i; 0; frac(sqrt(2), 2)) $
]

It is possible to use the $n$-dimensional standard basis to describe the
state of $n$-qubits, but just like the case of a single qubit there are
other bases that are useful to employ. One such basis for the case of a
$2$ qubit system is the following:

#grid(
  columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
  [$ ket(Phi^(+)) = frac(sqrt(2), 2) (ket(00) + ket(11)) $],
  [$ ket(Phi^(-)) = frac(sqrt(2), 2) (ket(00) - ket(11)) $],
  [$ ket(Psi^(+)) = frac(sqrt(2), 2) (ket(01) + ket(10)) $],
  [$ ket(Psi^(-)) = frac(sqrt(2), 2) (ket(01) - ket(10)) $]
)

These states are called *Bell states*, and the basis that they form
is called *Bell basis*.

The following $3$-qubit states often appear in quantum experiments,
respectively referred to as *Greenberger–Horne–Zeilinger state* and
*W state*:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ ket(G H Z) = frac(sqrt(2), 2) (ket(000) + ket(111)) $],
  [$ ket(W) = frac(sqrt(3), 3) (ket(100) + ket(010) + ket(001)) $]
)

Any unit vector of the $2^(n)$-dimensional state space represents a
possible state of an $n$-qubit system, but just as in the single-qubit
case there is redundancy. In the multiple-qubit case, not only do vectors
that are multiples of each other refer to the same quantum state, but
properties of the tensor product also mean that phase factors distribute
over tensor products; the same phase factor in different qubits of a
tensor product represent the same state:

$ ket(v) times.circle (e^(i theta) ket(w)) =
  e^(i theta) (ket(v) times.circle ket(w)) =
  (e^(i theta) ket(v)) times.circle ket(w) $

Phase factors in individual qubits of a single term of a superposition
can always be factored out into a single coefficient for that term.

Just as in the single-qubit case, vectors that differ only in a global
phase represent the same quantum state; the space of distinct quantum
states of an $n$-qubit system is a complex projective space of dimension
$2^(n) − 1$, but in general it is easier to consider the Hilbert space
directly but taking into account possible duplicate vectors.

The fact that state spaces describing more than one qubit are constructed
from the tensor product has a crucial consequence. Even though the tensor
product of $n$ single qubit states represents a state of a $n$-qubit system,
a state of a $n$-qubit system might not be decomposable into a tensot product
of $n$ single qubit states. This is because the dimension of a composite
Hilbert spaces grows exponentially.

This means that there are states of $n$-qubit systems that cannot be
conceived as simply the result of the combined contribution of each
qubit, but are instead entities on their own. States like these are
called *entangled states*. For example, the aforementioned Bell states
are all entangled states. Indeed, the majority of states of a $n$-qubit
system are entangled states.

#exercise[
  Consider this two $2$-qubit states. Are they entangled states?

  #grid(
    columns: (0.66fr, 0.33fr),
    [$ ket(phi_(1)) = frac(1, 8) ket(00) + frac(sqrt(7), 8) ket(01) +
                      frac(sqrt(7), 8) ket(10) + frac(7, 8) ket(11) $],
    [$ ket(phi_(2)) = frac(1, sqrt(2)) (ket(00) + ket(11)) $]
  )
]
#solution[
  $ket(phi_(1))$ is not an entangled state, because it can be decomposed
  into two single (identical) qubit states as follows:

  $ ket(phi_(1)) = frac(1, 8) ket(00) + frac(sqrt(7), 8) ket(01) +
    frac(sqrt(7), 8) ket(10) + frac(7, 8) ket(11) =
    (frac(1, sqrt(8)) ket(0) + sqrt(frac(7, 8)) ket(1)) times.circle
    (frac(1, sqrt(8)) ket(0) + sqrt(frac(7, 8)) ket(1)) $

  On the other hand, the state $ket(phi_(2))$ is entangled. Attempting a
  decomposition gives:

  $ (a ket(0) + b ket(1)) times.circle (c ket(0) + d ket(1)) =
    frac(1, sqrt(2)) (ket(00) + ket(11)) => \
    a c ket(00) + a d ket(01) + b c ket(10) + b d ket(11) =
    frac(1, sqrt(2)) (ket(00) + ket(11)) => \
    a c mat(1; 0; 0; 0) + a d mat(0; 1; 0; 0) + b c mat(0; 0; 1; 0) + b d mat(0; 0; 0; 1) =
    frac(1, sqrt(2)) (mat(1; 0; 0; 0) + mat(0; 0; 0; 1)) => \
    mat(a c; a d; b c; b d) = mat(frac(1, sqrt(2)); 0; 0; frac(1, sqrt(2))) =>
    cases(a c = frac(1, sqrt(2)), a d = 0, b c = 0, b d = frac(1, sqrt(2))) $

  Which is an impossible system of equations to solve.
]

In the case of a two-qubit system, there is one and only decomposition
(two one-qubit systems), therefore there is no ambiguity. In general,
a state can be said to be entangled only with respect to a specific
decomposition. More formally, a state $ket(Psi)$ member of a state space
$H$ decomposed as $H_(1) times.circle H_(2) times.circle dots times.circle
H_(n)$ is said to be _separable_ or _unentangled_ if:

$ ket(Psi) = (ket(v_(1)) in H_(1)) times.circle (ket(v_(2)) in H_(2))
  times.circle dots times.circle (ket(v_(n)) times.circle H_(n)) $

Otherwise, it is said to be entangled. When non specified, saying that
a $n$-qubit state is entangled means "entangled with respect to the
decomposition into $n$ individual qubit states".

// #exercise[
// An example of the different meanings of entanglement
// ]

Despite being decomposition-dependent, entanglement is basis-independent,
since the chosen basis plays no role in the definition of entanglement
(even though some bases might be more comfortable than others when working
with entangled states).

Measuring a $n$-qubit state with respect to its base states is no different
than in the single qubit case. What could be more interesting is measuring
only a part of the system; for example, in a $2$-qubit system, measuring
only the first qubit while leaving the second unmeasured, or vice versa.
This is elaborated in the next chapter.

#exercise[
  Consider the $2$-qubit state $ket(Psi) = frac(1, 8) ket(00) +
  frac(sqrt(7), 8) ket(01) + frac(sqrt(7), 8) ket(10) + frac(7, 8) ket(11)$.
  What is the probability of measuring each base state?
]
#solution[
  The probability of measuring $ket(00), ket(01), ket(10), ket(11)$ are,
  respectively: $frac(1, 64), frac(7, 64), frac(7, 64), frac(49, 64)$.
]
