#import "../FoundationsQC_definitions.typ": *

Consider two Hilbert spaces $H_(1)$ and $H_(2)$, each describing
the state space of a qubit. The Hilbert space describing the state
of the two qubits is given by the tensor product of the two Hilbert
spaces. If the two qubits have $\{ket(phi_(1)), ket(phi_(2))\}$ and
$\{ket(theta_(1)), ket(theta_(2))\}$ respectively as bases, the basis
of $H_(1) times.circle H_(2)$ is:

$ \{ket(phi_(1)) times.circle ket(theta_(1)),
    ket(phi_(1)) times.circle ket(theta_(2)),
    ket(phi_(2)) times.circle ket(theta_(1)),
    ket(phi_(2)) times.circle ket(theta_(2))\} $

Which, in turn, means that any description of the state of two qubits
at once is in the form:

$ lambda_(1, 1) ket(phi_(1)) times.circle ket(theta_(1)) +
  lambda_(1, 2) ket(phi_(1)) times.circle ket(theta_(2)) +
  lambda_(2, 1) ket(phi_(2)) times.circle ket(theta_(1)) +
  lambda_(2, 2) ket(phi_(2)) times.circle ket(theta_(2)) $

Note that, due to @Tensor-product-preserves-unit and
@Tensor-product-preserves-orthonormal, tensor product
preserves both the unity of vectors and the orthonormality
of bases. This means that the tensor product of two qubit
state spaces is also guaranteed to be a valid state space.

Most states in $H_(1) times.circle H_(2)$ cannot be written simply as
a tensor product of a vector in $H_(1)$ and a vector in $H_(2)$. This
means that there are combined states that cannot be analysed simply by
looking at the state of the single qubits that make them up: these combined
states are effectively entities with their own meaning, and are referred to
as *entangled states*. 
