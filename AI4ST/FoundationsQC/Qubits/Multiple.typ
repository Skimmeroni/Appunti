#import "../FoundationsQC_definitions.typ": *

Consider two Hilbert spaces $H_(1)$ and $H_(2)$, each describing
the state space of a qubit. The Hilbert space describing the state
of the two qubits is given by the tensor product of the two Hilbert
spaces. If the two qubits have $\{ket(phi_(1))_(1), ket(phi_(2))_(1)\}$
and $\{ket(phi_(1))_(2), ket(phi_(2))_(2)\}$ respectively as bases,
the basis of $H_(1) times.circle H_(2)$ is:

$ \{ket(phi_(1))_(1) times.circle ket(phi_(1))_(2),
    ket(phi_(1))_(1) times.circle ket(phi_(2))_(2),
    ket(phi_(2))_(1) times.circle ket(phi_(1))_(2),
    ket(phi_(2))_(1) times.circle ket(phi_(2))_(2)\} $

Which, in turn, means that any description of the state of two qubits
at once is in the form:

$ lambda_(1, 1) ket(phi_(1))_(1) times.circle ket(phi_(1))_(2) +
  lambda_(1, 2) ket(phi_(1))_(1) times.circle ket(phi_(2))_(2) +
  lambda_(2, 1) ket(phi_(2))_(1) times.circle ket(phi_(1))_(2) +
  lambda_(2, 2) ket(phi_(2))_(1) times.circle ket(phi_(2))_(2) $

In general, the subscript from the basis is dropped, since the ordering
of the states mirrors the orders of the qubits. Also, it is convenient
to use the shortand $ket(v w)$ for $ket(v) times.circle ket(w)$, allowing
the basis of the two-qubit system to be written more compactly:

$ \{ket(phi_(1) phi_(1)),
    ket(phi_(1) phi_(2)),
    ket(phi_(2) phi_(1)),
    ket(phi_(2) phi_(2))\} $

Note that, due to @Tensor-product-preserves-unit and
@Tensor-product-preserves-orthonormal, tensor product
preserves both the unity of vectors and the orthonormality
of bases. This means that the tensor product of two qubit
state spaces is also guaranteed to be a valid state space.

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
  //columns: (0.2fr, 0.2fr, 0.05fr, 0.275fr, 0.275fr),
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

Most states in $H_(1) times.circle H_(2)$ cannot be written simply
as a tensor product of a vector in $H_(1)$ and a vector in $H_(2)$.
This means that there are combined states that cannot be analysed
simply by looking at the state of the single qubits that make them
up: these combined states are effectively entities with their own
meaning, and are referred to as *entangled states*. 
