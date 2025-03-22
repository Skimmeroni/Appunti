#import "../FoundationsQC_definitions.typ": *

Consider any physical system that can be observed in only two possible
states. Systems such as these can be constructed into many different
ways, such as inspecting the spin of the electron (only spin up and
spin down exist, no other spins can be found) or inspecting the energy
levels of the electrons of very simple atoms (only a ground state and
an excited state exist, no other states can be found). Systems such as
these are called *two-state quantum systems*, or just two-state systems.

#figure(
	cetz.canvas({
		import cetz.draw: set-style, line, circle, content, bezier-through

		set-style(stroke: (thickness: 1.5pt),
		          circle: (fill: gradient.radial(white, blue, focal-center: (15%, 30%), focal-radius: 5%)),
		          mark: (end: "triangle", fill: black)
		)

    line((0, -2), (0, 2), name: "upr")
		line((5, 2), (5, -2), name: "downr")

    circle((0, 0), name: "up")
    circle((5, 0), name: "down")

		content("upr.end", anchor: "south", padding: 0.1, text(font: "Noto Sans", "N"))
		content("upr.start", anchor: "north", padding: 0.1, text(font: "Noto Sans", "S"))
		content("downr.end", anchor: "north", padding: 0.1, text(font: "Noto Sans", "N"))
		content("downr.start", anchor: "south", padding: 0.1, text(font: "Noto Sans", "S"))

    bezier-through((-1.5, -0.25), (0, -0.5), (1.5, -0.25))
    bezier-through((6.5, -0.25), (4.5, -0.5), (3.5, -0.25))
	}),
	caption: [The spin is an intrinsic property of fundamental particles.
	          Electrons have a value of spin that is either equal to $1 slash 2$
	          or $-1 slash 2$, also referred to as "up" and "down" respectively.]
)

The term "two-state system" is somewhat misleading. Indeed, until measurement
happens, the number of states in which a physical system can find itself is
infinite; it is only _after_ the measurement is performed that the system
will be found in one of the two states. Therefore, "two-state" refers to the
state of the system after the measurement has taken place.

More precisely, following the principles of quantum mechanics, these two
"special" states, called *base states*, form a basis for the Hilbert space
that contains the possible states in which the system can be _before_
measurement happens. Any of these states can be constructed as a linear
combination of the aforementioned basis, normalized according to Born's
rule. In this respect, the term "two-state" refers to the number of
dimensions of the Hilbert space

Let $ket(phi_(1))$ and $ket(phi_(2))$ be two base states. Any linear
combination of the two is also a legitimate state $ket(Psi)$, as long
as the normalization condition is respected:

$ ket(Psi) = alpha ket(phi_(1)) + beta ket(phi_(2)),
  "with" alpha, beta in CC
  space "such that" abs(alpha)^(2) + abs(beta)^(2) = 1 $

According to Born's rule, the probability of finding $ket(Psi)$ in the
state $ket(phi_(1))$ when measured is given by $abs(alpha)^(2)$, wherease
the probability of finding it in the state $ket(phi_(2))$ when measured
is given by $abs(beta)^(2)$.

A two-state quantum system is also referred to as *qubit*. The name
"qubit" comes from its classical counterpart, the "bit", but while a
bit is either $0$ or $1$, a qubit is in an indeterminate state until
the measurement is performed #footnote[A $n$-state quantum system is
called a *qudit*, and it has the same computational power of a qubit.].

It is therefore valid to refer to a state such as the $ket(Psi)$ described
above as a qubit. In particular, being the result of a linear combination
of basis, any state/qubit $ket(Psi)$ can be entirely represented (with
respect to that basis) as the coefficients of the linear combination itself:

$ ket(Psi) = alpha ket(phi_(1)) + beta ket(phi_(2)) 
  <==> mat(alpha; beta)_(\{ket(phi_(1)), ket(phi_(2))\}) $

Any pair of states that form a basis for a two-dimensional Hilbert space
and are also orthogonal to each other (in other words, form an orthonormal
basis) can be used as base states. The simplest choice is the pair of
vectors $mat(1; 0)$ and $mat(0; 1)$, commonly denoted as $ket(0)$ and
$ket(1)$ respectively #footnote[The name emphasises the analogy with the
classical bit, but the choice of assigning these vectors to their respective
symbols is completely arbitrary.].

#theorem[
  The set $\{ket(0), ket(1)\}$ forms an orthonormal basis for any
  two-dimensional Hilbert space.
]
#proof[
  The null vector of any two-dimensional Hilbert space is $mat(0; 0)$.
  Constructing the null combination gives:

  $ bold(0) = k_(1) ket(0) + k_(2) ket(1) =>
    mat(0; 0) = k_(1) mat(1; 0) + k_(2) mat(0; 1) =>
    cases(0 = k_(1) dot 1 + k_(2) dot 0,
          0 = k_(1) dot 0 + k_(2) dot 1) =>
    cases(0 = k_(1), 0 = k_(2)) $

  Being linearly independent, they do form a basis. They are also
  orthonormal:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ braket(0, 0) = braket(1, 1) = 1 dot 1 + 0 dot 0 = 1 $],
    [$ braket(0, 1) = braket(1, 0) = 1 dot 0 + 0 dot 1 = 0 $]
  )
]

This basis is used obiquitously, and is therefore reffered to as the
*standard basis*. When the basis at play is not specified, it is assumed
that the basis is the standard basis. Also, since orthonormality is a
necessary condition for being a physically meaningful basis, when talking
about a basis it will be implicitly assumed (unless stated otherwise) that
the basis is orthonormal.

Another useful basis is the one denoted as $\{ket(+), ket(-)\}$:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ ket(+) = frac(sqrt(2), 2) (ket(0) + ket(1)) = mat(frac(sqrt(2), 2); frac(sqrt(2), 2)) $],
  [$ ket(-) = frac(sqrt(2), 2) (ket(0) - ket(1)) = mat(frac(sqrt(2), 2); -frac(sqrt(2), 2)) $]
)

#theorem[
  The set $\{ket(+), ket(-)\}$ forms an orthonormal basis for any
  two-dimensional Hilbert space.
]
#proof[
  The basis $\{ket(0), ket(1)\}$ can be written as a linear combination of
  $\{ket(+), ket(-)\}$:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ ket(0) = frac(sqrt(2), 2) (ket(+) + ket(-)) $],
    [$ ket(1) = frac(sqrt(2), 2) (ket(+) - ket(-)) $]
  )

  Therefore, $\{ket(+), ket(-)\}$ is a basis as well. It's also orthonormal:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ braket(+, +) = braket(-, -) =
       frac(sqrt(2), 2) dot frac(sqrt(2), 2) + frac(sqrt(2), 2) dot frac(sqrt(2), 2) = 1 $],
    [$ braket(+, -) = braket(-, +) =
       frac(sqrt(2), 2) dot frac(sqrt(2), 2) - frac(sqrt(2), 2) dot frac(sqrt(2), 2) = 0 $]
  )
]

Another relevant basis is $\{ket(arrow.ccw), ket(arrow.cw)\}$, defined as:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ ket(arrow.ccw) = frac(sqrt(2), 2) (ket(0) + i ket(1)) = mat(frac(sqrt(2), 2); i frac(sqrt(2), 2)) $],
  [$ ket(arrow.cw) = frac(sqrt(2), 2) (ket(0) - i ket(1)) = mat(frac(sqrt(2), 2); -i frac(sqrt(2), 2)) $]
)

#theorem[
  The set $\{ket(arrow.ccw), ket(arrow.cw)\}$ forms an orthonormal basis for any
  two-dimensional Hilbert space.
]
#proof[
  This set is indeed a basis since the basis $\{ket(0), ket(1)\}$ can be
  written as a linear combination of $\{ket(arrow.ccw), ket(arrow.cw)\}$:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ ket(0) = frac(sqrt(2), 2) (ket(arrow.ccw) + i ket(arrow.cw)) $],
    [$ ket(1) = frac(sqrt(2), 2) (ket(arrow.ccw) - i ket(arrow.cw)) $]
  )

  Therefore, $\{ket(arrow.ccw), ket(arrow.cw)\}$ is a basis as well. It's also orthonormal:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ braket(arrow.ccw, arrow.ccw) = braket(arrow.cw, arrow.cw) =
       frac(sqrt(2), 2) dot frac(sqrt(2), 2) - i frac(sqrt(2), 2) dot i frac(sqrt(2), 2) = 1 $],
    [$ braket(arrow.ccw, arrow.cw) = braket(arrow.cw, arrow.ccw) =
       frac(sqrt(2), 2) dot frac(sqrt(2), 2) + i frac(sqrt(2), 2) dot i frac(sqrt(2), 2) = 0 $]
  )
]

#exercise[
  Write the state $ket(Psi) = frac(sqrt(2), 2) (ket(0) - ket(1))$ as a
  linear combination of the basis $\{ket(arrow.ccw), ket(arrow.cw)\}$.
  What are the probabilities of obtaining the respective measurements?
]
#solution[
  There must exist two coefficents, $alpha$ and $beta$, such that:

  $ alpha ket(arrow.ccw) + beta ket(arrow.cw) =
    ket(Psi) =
    frac(sqrt(2), 2) (ket(0) - ket(1)) =
    frac(sqrt(2), 2) (mat(1; 0) - mat(0; 1)) =
    frac(sqrt(2), 2) mat(1; -1) =
    mat(frac(sqrt(2), 2); -frac(sqrt(2), 2)) $

  That is:

  $ mat(frac(sqrt(2), 2); -frac(sqrt(2), 2)) = alpha 
    mat(frac(sqrt(2), 2); i frac(sqrt(2), 2)) + beta
    mat(frac(sqrt(2), 2); -i frac(sqrt(2), 2)) =>
    cases(frac(sqrt(2), 2) = alpha frac(sqrt(2), 2) + beta frac(sqrt(2), 2),
          -frac(sqrt(2), 2) = alpha i frac(sqrt(2), 2) - beta i frac(sqrt(2), 2)) =>
    cases(1 = alpha + beta, i = alpha - beta) =>
    cases(alpha = frac(1 + i, 2), beta = frac(1 - i, 2)) $

  Which gives:

  $ ket(Psi) = frac(1 + i, 2) ket(arrow.ccw) + frac(1 - i, 2) ket(arrow.cw) $

  The probabilities of getting each result when measured is given by:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ P_(ket(arrow.ccw)) =
       abs(frac(1 + i, 2))^(2) =
       (frac(1, 2))^(2) + (frac(1, 2))^(2) =
       frac(1, 2) $],
    [$ P_(ket(arrow.cw)) =
       abs(frac(1 - i, 2))^(2) =
       (frac(1, 2))^(2) + (-frac(1, 2))^(2) =
       frac(1, 2) $]
  )
]

Any vector that results from a non-trivial linear combination of a basis,
that is, when both coefficients of the linear combination are not zero,
is said to be in a *superposition* of the states that comprise the basis.
A basis is always necessary to be specified when talking about superposition:
a state can be the result of a superposition with respect to a certain basis
but not with respect to another basis.

#exercise[
  Consider the states $ket(Psi_(1))$ and $ket(Psi_(2))$. Are they
  in a superposition with respect to the basis $\{ket(0), ket(1)\}$?

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ ket(Psi_(1)) = frac(sqrt(2), 2) (ket(+) + ket(-)) $],
    [$ ket(Psi_(2)) = frac(sqrt(3), 2) ket(+) - frac(1, 2) ket(-) $]
  )
]
#solution[
  Note how:

  $ ket(Psi_(1)) = frac(sqrt(2), 2) (ket(+) + ket(-)) =
    frac(sqrt(2), 2) (mat(frac(sqrt(2), 2); frac(sqrt(2), 2)) +
                      mat(frac(sqrt(2), 2); -frac(sqrt(2), 2))) =
    frac(sqrt(2), 2) mat(sqrt(2); 0) = mat(1; 0) = ket(0) $

  This means that the state is one of the base states that consitutes
  the bases, and therefore there is no superposition. Indeed, trying
  to write it as a linear combination of the vectors that constitute
  the basis would give:

  $ ket(Psi_(1)) = 1 ket(0) + 0 ket(1) $

  Which is trivial. On the other hand:

  $ ket(Psi_(2)) = 
    frac(sqrt(3), 2) ket(+) - frac(1, 2) ket(-) =
    frac(sqrt(3), 2) mat(frac(sqrt(2), 2); frac(sqrt(2), 2)) -
    frac(1, 2) mat(frac(sqrt(2), 2); -frac(sqrt(2), 2)) =
    mat(frac(sqrt(6), 4); frac(sqrt(6), 4)) - mat(frac(sqrt(2), 4); -frac(sqrt(2), 4)) =
    mat(frac(sqrt(6) - sqrt(2), 4); frac(sqrt(6) + sqrt(2), 4)) =
    mat(frac(sqrt(3) - 1, 2 sqrt(2)); frac(sqrt(3) + 1, 2 sqrt(2))) $

  Which gives a non-trivial combination:

  $ ket(Psi_(2)) = frac(sqrt(3) - 1, 2 sqrt(2)) ket(0) + frac(sqrt(3) + 1, 2 sqrt(2)) ket(1) $
]

When a measurement is not performed, the system is in a superposition of 
base states, and the state in which the system is found when measured can
be predicted only within a certain probability. When the system _is_
measured, there is no ambiguity, because any repeated measurement will
always give the same result.

It should also be noted that, despite the existence of superpositions,
a qubit still holds a single bit of information. Indeed, the state in
which the qubit is prior to measurement is unknown and unknowable, and
when measurement happens the value of the qubit is always one out of
two allowed values. It would therefore be incorrect to state that a
qubit holds an infinite amount of information.

That the same quantum state is represented by more than one vector means
that there is a critical distinction between the complex vector space in
which qubit values are written and the quantum state space itself. In
particular, any unit vector multiplied by a phase factor is equivalent
to the original vector, and therefore represents the same state.

The multiple by which two vectors representing the same quantum state
differ is called the *global phase* and has no physical meaning. The
notation $ket(v) tilde ket(v')$ denotes the fact that the two vectors
are equivalent up to a global phase $e^(i phi)$, that is $ket(v) =
e^(i phi) ket(v')$. The space in which two two-dimensional complex
vectors are considered equivalent if they are multiples of each other
is called *complex projective space* of dimension one.

Two complex vectors that differ from a phase factor belong to the same
equivalence class with respect to the aforementioned relation. Each of
these equivalence classes are the members of a quotient space, denoted
as $bold(C P)^(1)$:

$ bold(C P)^(1) = \{alpha ket(phi_(1)) + beta ket(phi_(2))\} slash tilde $

Therefore, the quantum state space for a single-qubit system is in
one-to-one correspondence with the points of the complex projective
space $bold(C P)^(1)$.

A physical quantity that, unlike the global phase, is _not_ irrelevant,
is the *relative phase* of a single-qubit state. The relative phase of
a superposition $alpha ket(v_(1)) + beta ket(v_(2))$ is a measure of the
angle in the complex plane between the two complex numbers $alpha$ and
$beta$. More precisely, the relative phase is the complex number $e^(i phi)$
(that is, having modulus equal to one) such that:

$ frac(alpha, beta) = e^(i phi) frac(abs(alpha), abs(beta)) =>
  e^(i phi) = frac(alpha abs(beta), abs(alpha) beta) $

Two superpositions $alpha ket(v_(1)) + beta ket(v_(2))$ and $alpha'
ket(v_(1)) + beta' ket(v_(2))$ whose amplitudes have the same magnitudes
but that differ in a relative phase represent different states. On the
other hand, if two superpositions (with respect to the same basis) have
the same relative phase, they represent the same state.
