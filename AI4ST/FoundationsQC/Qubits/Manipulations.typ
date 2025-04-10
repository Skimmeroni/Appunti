#import "../FoundationsQC_definitions.typ": *

The manipulation of the state of an arbitrary-sized qubit system is done
through *quantum transformations*. A quantum transformation is simply an
operator that, when applied to a valid quantum state, results in a new
quantum state that is still valid.

In order for this requirement to be followed, before introducing some
examples of quantum transformations, it is necessary to clearly state
what constraint a quantum transformation must abide to:

+ The Hilbert space of the possible qubit states should be the same
  before and after applying a transformation. A quantum transformation
  must then be an _endomorphism_, mapping elements from an Hilbert
  space to elements to the same space.
+ A quantum state is a linear combination (of base states), therefore
  a quantum transformation must be linear. In other words, given a
  state $a_(1) ket(phi_(1)) + dots + a_(n) ket(phi_(n))$ and a quantum
  transformation $U$, the following must hold:

  $ U(a_(1) ket(phi_(1) + dots + a_(n) ket(phi_(n))) =
    U(a_(1) ket(phi_(1))) + dots + U(a_(n) ket(phi_(n))) =
    a_(1) U(ket(phi_(1))) + dots + a_(n) U(ket(phi_(n))) $

  This way, applying a quantum transformation to a superposition of
  states is the same as applying the transformation to each component
  of the superposition.
+ A quantum state is a unit vector, therefore a quantum transformation
  must return a state that is also a unit vector.
+ A quantum state is a linear combination of vectors from an orthonormal
  basis, therefore quantum transformations must map orthonormal bases to
  orthonormal bases.

Clearly, measurements cannot be considered quantum transformations.

Constraint number $2$ imposes that the operator has a matrix representation
with respect to a given basis. As stated in @Equivalent-definitions-of-unitary-matrix, 
the one and only kind of matrices that abide to constraint number $3$ and $4$
are the unitary matrices. This means that the set of unitary matrices and the
set of valid quantum transformations are exactly the same set.

The fact that quantum transformations are unitary has important consequences.
First, recall from @Unitary-matrices-are-inner-product-invariant that unitary
matrices are inner product-invariant. This means that measuring a state in
the original basis and then applying a transformation to the outcome should
give the same result as applying the transformation first and then measuring
the resulting state in the transformed basis.

Second, recall from @Product-of-unitary-matrices-is-unitary that the
product of two unitary matrices is also a unitary matrix. Therefore,
applying more than one quantum transformation to a quantum state, which
is equivalent to applying their function composition, will still result
in a valid quantum state.

Any quantum state transformation that acts on only a small number of qubits
is also referred to a *quantum gate*. Sequences of quantum gates are called
*quantum gate arrays* or *quantum circuits*. Given a basic set of quantum
gates, it is possible to combine them to construct elaborate transformations
of varying complexity. For these reasons, the term "gate" and "transformation"
tend to be used interchangeably.

The term "gate" is used to suggest a similarity with the classical logical
gates, but does not necessarely entail that the physical implementation of
a quantum transformation has to be a gate in the literal sense. Conceiving
a quantum transformation as gates has the added advantage of abstracting the
need to specify a basis when talking about operators. 

It should also be noted that, whereas classical logical circuits can have
loops (outputs that are fed back in the circuit as inputs), quantum circuits
are said to be _acyclic_, meaning that they can't have loops.

Drawing quantum transformations as gates is obiquitous. Transformations
are represented graphically by boxes, labeled by the transformation
performed, that are to be read left-to-right. Boxes are connected with
a line that represents the state of the qubit "flowing" through the circuit.

#figure(
  [#grid(
    columns: (0.5fr, 0.5fr),
    [#quantum-circuit(
      lstick($ket(Psi)$), gate($U_(1)$), gate($U_(2)$), midstick($dots$),
      gate($U_(n)$), rstick($ket(Psi')$)
    )],
    [$ ket(Psi') = U_(n) dots U_(2) U_(1) ket(Psi) $]
  )],
  caption: [On the left, a generic circuit acting on a state $ket(Psi)$ that
  returns a state $ket(Psi')$. On the right, its analogous representation with
  matrix products.]
)

When a new state is reached, there's most likely interest in sampling
its value. Which is why the $ket(Psi')$ symbol is often replaced by
#quantum-circuit(scale: 66%, baseline: 2.5pt, meter()). Also, to denote
a line that represents $n$ states at once the shorthand notation
#quantum-circuit(scale: 66%, baseline: 2.5pt, nwire($n$)) is used.

The simplest operator is the *identity operator*, denoted as $I$, leaves
the state unchanged. With respect to the standard basis, the operator has
this following form:

#align(
  center,
  [#grid(
    columns: (0.5fr, 0.5fr),
    [$ I = ketbra(0, 0) + ketbra(1, 1) = mat(1, 0; 0, 1) $],
    [#quantum-circuit(lstick(""), gate($I$), rstick(""))]
  )]
)

Three matrices, called *Pauli matrices* #footnote[Other sources refer
to the Pauli matrices respectively as $sigma_(x), sigma_(y), sigma_(z)$],
are also obiquitous:

#align(
  center,
  [#grid(
    columns: (0.33fr, 0.33fr, 0.33fr),
    [$ X = ketbra(1, 0) + ketbra(0, 1) = mat(0, 1; 1, 0)  $],
    [$ Y = -ketbra(1, 0) + ketbra(0, 1) = mat(0, -i; i, 0)  $],
    [$ Z = ketbra(0, 0) - ketbra(1, 1) = mat(1, 0; 0, -1) $],
    [#quantum-circuit(lstick(""), gate($X$), rstick(""))],
    [#quantum-circuit(lstick(""), gate($Y$), rstick(""))],
    [#quantum-circuit(lstick(""), gate($Z$), rstick(""))]
  )]
)

Note how:

- $X$ is equivalent to a classical `NOT` gate, since it changes $ket(0)$
  into $ket(1)$ and vice versa. $X$ has no effect on $ket(+)$ and $ket(-)$,
  therefore those states are its eigenvectors;
- $Z$ changes the relative phase of a superposition in the standard basis.
  $Z$ has no effect on $ket(0)$ and $ket(1)$, therefore those states are
  its eigenvectors;
- $Y = Z X$ is a combination of negation and phase change. $Y$ has no effect
  on $ket(arrow.ccw)$ and $ket(arrow.cw)$, therefore those states are its
  eigenvectors.

Another useful operator is the *Hadamard operator*, denoted as $H$:

#grid(
  columns: (0.75fr, 0.25fr),
  [$ H = frac(sqrt(2), 2) (ketbra(0, 0) + ketbra(1, 0) + ketbra(0, 1) - ketbra(1, 1)) =
  frac(sqrt(2), 2) mat(1, 1; 1, -1) $],
  [#quantum-circuit(lstick(""), gate($H$), rstick(""))]
)

#exercise[
  What happens when the Hadamard operator is applied to the states
  $ket(0), ket(1), ket(+), ket(-)$?
]
#solution[
  $ H ket(0) &=
    frac(sqrt(2), 2) (ketbra(0, 0) + ketbra(1, 0) + ketbra(0, 1) - ketbra(1, 1)) ket(0) =
    frac(sqrt(2), 2) (ket(0) + ket(1)) =
    ket(+) \
    H ket(1) &=
    frac(sqrt(2), 2) (ketbra(0, 0) + ketbra(1, 0) + ketbra(0, 1) - ketbra(1, 1)) ket(1) =
    frac(sqrt(2), 2) (ket(0) - ket(1)) =
    ket(-) \
    H ket(+) &=
    frac(sqrt(2), 2) (ketbra(0, 0) + ketbra(1, 0) + ketbra(0, 1) - ketbra(1, 1)) frac(sqrt(2), 2) (ket(0) + ket(1)) =
    frac(1, 2) (2 ket(0)) = ket(0) \
    H ket(-) &=
    frac(sqrt(2), 2) (ketbra(0, 0) + ketbra(1, 0) + ketbra(0, 1) - ketbra(1, 1)) frac(sqrt(2), 2) (ket(0) - ket(1)) =
    frac(1, 2) (2 ket(1)) = ket(1) $
]

//Which produces an even superposition of $ket(0)$ and $ket(1)$ from either
//of the standard basis elements:
//
//#grid(
//  columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
//  [$ H ket(0) = ket(+) $],
//  [$ H ket(1) = ket(-) $],
//  [$ H ket(+) = ket(0) $],
//  [$ H ket(-) = ket(1) $]
//)

The previous quantum transformations acted on single qubits, but
extending the application of quantum transformations to more than
one qubit at once is trivial. Suppose $U$ is a unitary transformation
that acts on a qubit: the unitary transformation $U^(times.circle n) =
U times.circle U times.circle dots times.circle U$ acts on $n$ qubits
at the same.

In general, given $n$ single-qubit transformations $U_(1), U_(2), dots,
U_(n)$, not necessarely identical, the unitary transformation $U_(1)
times.circle U_(2) times.circle dots times.circle U_(n)$ applies $U_(1)$
to the first qubit state, $U_(2)$ to the second qubit state, and so on,
all at the same time. This also allows to have composite transformations
that act on certain qubit states and ignore others, since applying the
identity operator to a qubit state is equivalent to doing nothing.

#exercise[
  Consider a $3$-qubit state. Apply a Hadamard transformation to the first
  qubit state and a $Y$ transformation on the third qubit state. How would
  the resulting matrix look like?
]
#solution[
  $ frac(sqrt(2), 2) mat(1, 1; 1, -1) times.circle
    mat(1, 0; 0, 1) times.circle mat(0, -i; i, 0) =
    frac(sqrt(2), 2) mat(1, 0, 1, 0; 0, 1, 0, 1; 1, 0, -1, 0; 0, 1, 0, -1)
    times.circle mat(0, -i; i, 0) =
    mat(0, -i, 0, 0, 0, -i, 0, 0;
        i, 0, 0, 0, i, 0, 0, 0;
        0, 0, 0, -i, 0, 0, 0, -i;
        0, 0, i, 0, 0, 0, i, 0;
        0, -i, 0, 0, 0, i, 0, 0;
        i, 0, 0, 0, -i, 0, 0, 0;
        0, 0, 0, -i, 0, 0, 0, i;
        0, 0, i, 0, 0, 0, -i, 0
        )
    $
]

Since it's not possible to conceive an entangled state simply as the sum
of its parts, trasformations that act on single qubits cannot influence
(create or destroy) the entanglement of states. Just as entangled states
cannot be factorized into single qubit states, transformations that act
on entangled states cannot be factorized into a tensor product between
single-qubit transformations.

A qubit transformation such as these is the *controlled not gate*, or
$C_("not")$ for short. The gate acts on two qubits as follows:

#align(
  center,
  [#grid(
    columns: (0.66fr, 0.33fr),
    [$ C_("not") =
       ketbra(00, 00) + ketbra(01, 01) + ketbra(11, 10) + ketbra(10, 11) =
       mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0) $],
    [#quantum-circuit(
      lstick(""), ctrl(1), rstick(""), [\ ],
      lstick(""), targ(), rstick(""))]
  )]
)

If the state of the single qubits are thought of as the values of
classical bits, the $C_("not")$ gate can be conceived as "flipping"
the second bit (the state of the second qubit) if the first bit is
$1$ (if the first qubit is in state $ket(1)$) and leave it unchanged
otherwise.

#exercise[
  What is the effect of applying the $C_("not")$ gate to the two-qubit
  state $frac(sqrt(2), 2) (ket(00) + ket(10))$?
]
#solution[
  $ (ketbra(00, 00) + ketbra(01, 01) + ketbra(11, 10) + ketbra(10, 11))
    frac(sqrt(2), 2) (ket(00) + ket(10)) =
    frac(sqrt(2), 2) (ket(00) + ket(11)) $

  The starting state is not entangled; the final state is.
]

For its analogy with classical control gates, the state of the first
qubit (the first bit) is also referred to as the *control bit*, whereas
the state of the second qubit (the second bit) is also referred to as
the *target bit*. However, this terminology might be misleading, since
states expressed in different bases than the standard basis might result
in the control bit becoming the target bit and viceversa, or having both
bits changed.

#exercise[
  What happens when a $C_("not")$ gate is applied to the state $ket(+-)$?
]
#solution[
  Converting $ket(+-)$ to the standard basis gives:

  $ ket(+-) = ket(+) times.circle ket(-) =
    frac(sqrt(2), 2)(ket(0) + ket(1)) times.circle frac(sqrt(2), 2)(ket(0) - ket(1)) =
    frac(1, 2)(ket(00) - ket(01) + ket(10) - ket(11)) $

  Applying $C_("not")$ to this state gives:

  $ (ketbra(00, 00) + ketbra(01, 01) + ketbra(11, 10) + ketbra(10, 11))
    frac(1, 2)(ket(00) - ket(01) + ket(10) - ket(11)) =
    frac(1, 2)(ket(00) - ket(01) - ket(10) + ket(11)) $

  Converting it back:

  $ frac(1, 2)(ket(00) - ket(01) - ket(10) + ket(11)) &= 
    frac(1, 2)(ket(0) times.circle (ket(0) - ket(1)) -
               ket(1) times.circle (ket(0) - ket(1))) =
    frac(1, 2) ((ket(0) - ket(1)) times.circle (ket(0) - ket(1))) = \
    &= frac(1, 2) (sqrt(2) ket(-) times.circle sqrt(2) ket(-)) =
    frac(1, 2) (2 ket(--)) = ket(--) $

  Which means that, in the Hadamard basis, the control bit and the target bit
  are in reversed!
]

Another transformation that acts on two-qubit systems is the *swap gate*,
that changes the state of the first qubit to be equal to the state of the
second qubit and vice versa:

#align(
  center,
  [#grid(
    columns: (0.66fr, 0.33fr),
    [$ "SWAP" =
       ketbra(00, 00) + ketbra(01, 10) + ketbra(10, 01) + ketbra(11, 11) =
       mat(1, 0, 0, 0; 0, 0, 1, 0; 0, 1, 0, 0; 0, 0, 0, 1) $],
    [#quantum-circuit(
      lstick(""), swap(1), rstick(""), [\ ],
      lstick(""), swap(0), rstick(""))]
  )]
)

The controlled not gate and the swap gate are examples of a more general
class of two-qubit controlled gates, where the gate performs a certain
transformation $Q$ on the second qubit when the first qubit is in state
$ket(1)$ and does nothing when the first qubit is in state $ket(0)$. Any
gate in this form can be written as $and.big Q$:

#align(
  center,
  [#grid(
    columns: (0.5fr, 0.5fr),
    [$ and.big Q =
       ketbra(0, 0) times.circle I + ketbra(1, 1) times.circle Q =
       mat(I, 0; 0, Q) $],
    [#quantum-circuit(
      lstick(""), mqgate($Q$, target: 1), rstick(""), [\ ],
      lstick(""), ctrl(0), rstick("")
    )]
  )]
)

For example, the controlled not gate is equivalent to $ketbra(0, 0)
times.circle I + ketbra(1, 1) times.circle X$. Another example is
the *controlled phase shift*, that changes the phase of the second
qubit if the first qubit is in state $ket(1)$ and does nothing
otherwise:

$ and.big e^(i phi) =
  ketbra(0, 0) times.circle I + ketbra(1, 1) times.circle I e^(i phi) =
  mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, e^(i phi), 0; 0, 0, 0, e^(i phi)) $

This gate is interesting because it employs a phase shift that when
applied to single-qubit systems it just changes the global phase, and
therefore is physically meaningless, whereas when applied as part of
a conditional transformation it changes the relative phase between
elements of a superposition, which is physically meaningful.

As a matter of fact, all single-qubit transformations can be reduced to
a combination of three types of transformation: a _phase shift_ $K(delta)$,
a _rotation_ $R(beta)$ and a _phase rotation_ $T(alpha)$:

#grid(
  columns: (0.33fr, 0.33fr, 0.33fr),
  [$ K(delta) = mat(e^(i delta), 0; 0, e^(i delta)) $],
  [$ R(beta) = mat(cos(beta), sin(beta); -sin(beta), cos(beta)) $],
  [$ T(alpha) = mat(e^(i alpha), 0; 0, -e^(i alpha)) $]
)

The transformation $R(alpha)$ and $T(alpha)$ corresponds to rotations
by an angle of $2 alpha$ along the $y$ and $z$ axis of the Bloch sphere
respectively. For this reason, they are also referred to as _zenithal
rotation_ and _azimuthal rotation_.

Phase rotations of $pi slash 2$ radiants and $pi slash 4$ radiants are
quite obiquitous, therefore they have been given proper names: $S$
and $T$ respectively:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ P_(frac(pi, 2)) = S = mat(1, 0; 0, i) $],
  [$ P_(frac(pi, 4)) = T = mat(1, 0; 0, e^(i frac(pi, 4))) $]
)
