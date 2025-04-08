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
as a normalization condition is respected:

$ ket(Psi) = alpha ket(phi_(1)) + beta ket(phi_(2)),
  "with" alpha, beta in CC
  space "such that" abs(alpha)^(2) + abs(beta)^(2) = 1 $

A two-state quantum system is also referred to as *qubit*. The name
"qubit" comes from its classical counterpart, the bit, but while a
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
that the basis is the standard basis. Denoting these two vectors as
$ket(0)$ and $ket(1)$ is helpful because it allows one to intuitively
associate these vectors to the classical bits $0$ and $1$.

Since orthonormality is a necessary condition for being a physically
meaningful basis, when talking about a basis it will be implicitly
assumed (unless stated otherwise) that the basis is orthonormal.

Another useful basis is the one denoted as $\{ket(+), ket(-)\}$:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ ket(+) = frac(sqrt(2), 2) (ket(0) + ket(1)) $],
  [$ ket(-) = frac(sqrt(2), 2) (ket(0) - ket(1)) $]
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
  [$ ket(arrow.ccw) = frac(sqrt(2), 2) (ket(0) + i ket(1)) $],
  [$ ket(arrow.cw) = frac(sqrt(2), 2) (ket(0) - i ket(1)) $]
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

According to Born's rule, the probability of finding $ket(Psi)$ in the
state $ket(phi_(1))$ when measured is given by $abs(alpha)^(2)$, wherease
the probability of finding it in the state $ket(phi_(2))$ when measured
is given by $abs(beta)^(2)$.

As stated, this is an axiom of quantum mechanics, derived from experimental
data and assumed to be true. Also, a measurement induces a wave function
collapse, and the state of the qubit becomes one of the possible basis
states. This means that the measurement process does not exist "in a vacuum",
but is dependent on a chosen basis. This also means that any measurement
performed afterwards will always give the same result with absolute certainty.

Note how:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ abs(braket(phi_(1), Psi))^(2) =
     abs(alpha braket(phi_(1), phi_(1)) + beta braket(phi_(1), phi_(2)))^(2) =
     abs(alpha)^(2) $],
  [$ abs(braket(phi_(2), Psi))^(2) =
     abs(alpha braket(phi_(2), phi_(1)) + beta braket(phi_(2), phi_(2)))^(2) =
     abs(beta)^(2) $]
)

Later chapters will expand on this formalism, but the statement just given
is, for the moment, sufficient.

#exercise[
  Write the state $ket(Psi) = frac(sqrt(2), 2) (ket(0) - ket(1))$ as a
  linear combination of the basis $\{ket(arrow.ccw), ket(arrow.cw)\}$.
  What are the probabilities of obtaining the respective measurements?
]
#solution[
  $ ket(Psi) &=
    frac(sqrt(2), 2) (ket(0) - ket(1)) =
    frac(sqrt(2), 2) (frac(sqrt(2), 2) (ket(arrow.ccw) + i ket(arrow.cw)) -
                     frac(sqrt(2), 2) (ket(arrow.ccw) - i ket(arrow.cw))) = \
    &= frac(1, 2) (ket(arrow.ccw) + i ket(arrow.cw)) -
    frac(1, 2) (ket(arrow.ccw) - i ket(arrow.cw)) =
    cancel(frac(1, 2) ket(arrow.ccw)) + frac(i, 2) ket(arrow.cw) -
    cancel(frac(1, 2) ket(arrow.ccw)) + frac(i, 2) ket(arrow.cw) = \
    &= i ket(arrow.cw) $

  Which means that the probability of getting $ket(arrow.cw)$ is
  $abs(0 + 1i)^(2) = 1$ and the probability of getting $ket(arrow.ccw)$
  is $0$.
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

  $ ket(Psi_(1)) &= frac(sqrt(2), 2) (ket(+) + ket(-)) =
    frac(sqrt(2), 2) (frac(sqrt(2), 2)(ket(0) + ket(1)) + frac(sqrt(2), 2)(ket(0) - ket(1))) =
    frac(1, 2)(ket(0) + ket(1)) + frac(1, 2)(ket(0) - ket(1)) = \
    &= frac(1, 2) ket(0) + cancel(frac(1, 2) ket(1)) + frac(1, 2) ket(0) - cancel(frac(1, 2) ket(1)) =
    ket(0) $

  This means that $ket(Psi_(1))$ is just one of the two elements of
  the standard basis, and therefore there is no superposition. Indeed,
  $ket(Psi_(1))$ written as a linear combination of the standard basis
  would be $ket(Psi_(1)) = 1 ket(0) + 0 ket(1)$, which is a trivial
  combination. On the other hand:

  $ ket(Psi_(2)) &= 
    frac(sqrt(3), 2) ket(+) - frac(1, 2) ket(-) =
    frac(sqrt(3), 2) (frac(sqrt(2), 2)(ket(0) + ket(1))) - frac(1, 2) (frac(sqrt(2), 2)(ket(0) - ket(1))) = \
    &= frac(sqrt(6), 4) (ket(0) + ket(1)) - frac(sqrt(2), 4)(ket(0) - ket(1)) =
    frac(sqrt(6), 4) ket(0) + frac(sqrt(6), 4) ket(1) - frac(sqrt(2), 4) ket(0) + frac(sqrt(2), 4) ket(1) = \
    &= frac(sqrt(6) - sqrt(2), 4) ket(0) + frac(sqrt(6) + sqrt(2), 4) ket(1) $

  Which is a non-trivial combination.
]

When a measurement is not performed, the system is in a superposition
of base states, and the state in which the system is found when measured
can be predicted only within a certain probability. Nevertheless, it is
possible to extract at most a single bit of information from a qubit.
Indeed, the state in which the qubit is prior to measurement is unknown
and unknowable, and when measurement happens the value of the qubit is
always one out of two allowed values. It would therefore be incorrect
to state that a qubit holds an infinite amount of information.

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

Bases can be represented graphically as coordinates on a sphere,
called *Bloch sphere*:

#align( 
	center,
	[#cetz.canvas({
		import cetz.draw: set-style, circle, line, content

		set-style(stroke: (thickness: 1.5pt),
                          mark: (end: "triangle", fill: black))

		circle((0, 0), radius: 2.5)
		circle((0, 0), radius: (2.5, 0.75), stroke: (dash: "loosely-dashed"))

		line((-2.5, 0), (2.5, 0), name: "lr")
		content("lr.end", anchor: "west", padding: 0.25, text(font: "JetBrains Mono", [| i ⟩]))
		content("lr.start", anchor: "east", padding: 0.25, text(font: "JetBrains Mono", [| -i ⟩]))

		line((0, -2.5), (0, 2.5), name: "01")
		content("01.end", anchor: "south", padding: 0.25, text(font: "JetBrains Mono", [| 1 ⟩]))
		content("01.start", anchor: "north", padding: 0.25, text(font: "JetBrains Mono", [| 0 ⟩]))

		line((0.75, 0.75), (-0.75, -0.75), name: "pm")
		content("pm.end", anchor: "north", padding: 0.25, text(font: "JetBrains Mono", [| + ⟩]))
		content("pm.start", anchor: "south", padding: 0.25, text(font: "JetBrains Mono", [| - ⟩]))
	})]
)
