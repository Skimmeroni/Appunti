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
		import cetz.draw: *

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
combination of the two is also a legitimate state, as long as the
normalization condition is respected:

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
#solution[
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
    columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
    [$ braket(0, 0) = 1 dot 1 + 0 dot 0 = 1 $],
    [$ braket(0, 1) = 1 dot 0 + 0 dot 1 = 0 $],
    [$ braket(1, 0) = 0 dot 1 + 1 dot 0 = 0 $],
    [$ braket(1, 1) = 0 dot 0 + 1 dot 1 = 1 $]
  )
]

This basis is used obiquitously, and is therefore reffered to as the
*standard basis*. When the basis at play is not specified, it is assumed
that the basis is the standard basis. Also, since orthonormality is a
necessary condition for being a physically meaningful basis, when talking
about a basis it will be implicitly assumed (unless stated otherwise) that
the basis is orthonormal.

Any vector that results from a non-trivial linear combination of a basis,
that is, when both coefficients of the linear combination are not zero,
is said to be in a *superposition* of the states that comprise the basis.
A basis is always necessary to be specified when talking about superposition:
a state can be the result of a superposition with respect to a certain basis
but not with respect to another basis.

When a measurement is not performed, the system is in a superposition of 
base states, and the state in which the system is found when measured can
be predicted only within a certain probability. When the system _is_
measured, there is no ambiguity, because any repeated measurement will
always give the same result.

Another useful basis is $\{ket(+), ket(-)\}$:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ ket(+) = frac(sqrt(2), 2) (ket(0) + ket(1)) $],
  [$ ket(-) = frac(sqrt(2), 2) (ket(0) - ket(1)) $]
)

This set is indeed a basis since the basis $\{ket(0), ket(1)\}$ can be
written as a linear combination of $\{ket(+), ket(-)\}$:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ ket(0) = frac(sqrt(2), 2) (ket(+) + ket(-)) $],
  [$ ket(1) = frac(sqrt(2), 2) (ket(+) - ket(-)) $]
)

This basis is also orthonormal since $braket(+, -) = 0$

Another relevant basis is $\{ket(arrow.ccw), ket(arrow.cw)\}$, defined as:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ ket(arrow.ccw) = frac(sqrt(2), 2) (ket(0) + i ket(1)) $],
  [$ ket(arrow.cw) = frac(sqrt(2), 2) (ket(0) - i ket(1)) $]
)

This set is indeed a basis since the basis $\{ket(0), ket(1)\}$ can be
written as a linear combination of $\{ket(+), ket(-)\}$:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ ket(0) = frac(sqrt(2), 2) (ket(arrow.ccw) + i ket(arrow.cw)) $],
  [$ ket(1) = frac(sqrt(2), 2) (ket(arrow.ccw) - i ket(arrow.cw)) $]
)

This basis is also orthonormal since $braket(arrow.ccw, arrow.cw) = 0$

These bases can be represented graphically as coordinates on a sphere,
called *Bloch sphere*:

#align( 
	center,
	[#cetz.canvas({
		import cetz.draw: *

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

Applying a transformation by means of any physical process can be modelled
as a rotation along the Bloch sphere. In particular, any rotation can be
broken down in two components: one zenithal and one azimuthal.

A zenithal rotation of a state $ket(Psi)$ changes its longitude by an angle
$theta slash 2$ without changing its latitute. Applied to the standard basis
gives:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ hat(R)_(theta) ket(0) = display(cos(frac(theta, 2))) ket(0) +
                             display(sin(frac(theta, 2))) ket(1) $],
  [$ hat(R)_(theta) ket(1) = display(cos(frac(theta, 2))) ket(0) -
                             display(sin(frac(theta, 2))) ket(1) $]
)

Which is equivalent to the following matrix multiplication:

$ hat(R)_(theta) =
  mat(braket(0|hat(R)_(theta), 0), braket(0|hat(R)_(theta), 1);
      braket(1|hat(R)_(theta), 0), braket(1|hat(R)_(theta), 1)) =
  mat(display(cos(frac(theta, 2))), -display(sin(frac(theta, 2)));
      display(sin(frac(theta, 2))), display(cos(frac(theta, 2)))) $

An azimuthal rotation of a state $ket(Psi)$, also called *phase rotation*,
changes its latitute by an angle $theta$ without changing its longitude.
Applied to the basis $\{ket(+), ket(-)\}$ gives #footnote[Applying an
azimuthal rotation on the basis $\{ket(0), ket(1)\}$ would make no sense,
since it would be left unchanged.]:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ hat(P)_(theta) ket(+) =
     display(frac(sqrt(2), 2)) (ket(0) + e^(i theta) ket(1)) $],
  [$ hat(P)_(theta) ket(-) =
     display(frac(sqrt(2), 2)) (ket(0) + e^(i (theta + pi)) ket(1)) $]
)

Which is equivalent to the following matrix multiplication:

$ hat(R)_(theta) =
  mat(braket(0|hat(P)_(theta), 0), braket(0|hat(P)_(theta), 1);
      braket(1|hat(P)_(theta), 0), braket(1|hat(P)_(theta), 1)) =
  mat(1, 0; 0, e^(i theta)) $

Phase rotations of $pi slash 2$ radiants and $pi slash 4$ radiants are
quite obiquitous, therefore they have been given proper names: $hat(S)$
and $hat(T)$ respectively:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ hat(P)_(frac(pi, 2)) = hat(S) = mat(1, 0; 0, i) $],
  [$ hat(P)_(frac(pi, 4)) = hat(T) = mat(1, 0; 0, e^(i frac(pi, 4))) $]
)

Another useful operator is the *Hadamard operator*, denoted as $hat(H)$
and given by the following matrix:

$ hat(H) = frac(sqrt(2), 2) mat(1, 1; 1, -1) $

Note how:

#grid(
  columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
  [$ hat(H) ket(0) = ket(+) $], [$ hat(H) ket(0) = ket(-) $],
  [$ hat(H) ket(+) = ket(0) $], [$ hat(H) ket(-) = ket(1) $]
)

The identity operator, denoted as $attach(perp, tl: 1)$, leaves the state unchanged:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ attach(perp, tl: 1) = mat(1, 0; 0, 1) $],
  [$ attach(perp, tl: 1) ket(Psi) = ket(Psi), space forall Psi $]
)

Three matrices, called *Pauli matrices*, are also obiquitous:

#grid(
  columns: (0.33fr, 0.33fr, 0.33fr),
  [$ hat(sigma)_(x) = hat(x) = mat(0, 1; 1, 0)  $],
  [$ hat(sigma)_(y) = hat(y) = mat(0, -i; i, 0)  $],
  [$ hat(sigma)_(z) = hat(z) = mat(1, 0; 0, -1) $]
)

$ket(+)$ and $ket(-)$ are the eigenvalues of $hat(sigma)_(x)$,
$ket(arrow.ccw)$ and $ket(arrow.cw)$ are the eigenvalues of $hat(sigma)_(y)$
and $ket(0)$ and $ket(1)$ are the eigenvalues of $hat(sigma)_(z)$:

#grid(
  columns: (0.33fr, 0.33fr, 0.33fr),
  [$ hat(sigma)_(x) ket(+) = ket(+) $
   $ hat(sigma)_(x) ket(-) = ket(-) $],
  [$ hat(sigma)_(y) ket(arrow.ccw) = ket(arrow.ccw) $
   $ hat(sigma)_(y) ket(arrow.cw) = ket(arrow.cw) $],
  [$ hat(sigma)_(z) ket(0) = ket(0) $
   $ hat(sigma)_(z) ket(1) = ket(1) $]
)

$hat(sigma)_(x)$ is equivalent to a classical `NOT` gate, since it changes
each $0$ input into $1$ and vice versa. Also note how $hat(sigma)_(z)$
corresponds to a phase rotations of $pi$ radiants.

Iterated applications of operators to a quantum state is equivalent to a gate,
read in reverse order:

#grid(
  columns: (0.5fr, 0.5fr),
  [#quantum-circuit(
    lstick($ket(Psi)$), gate($H$), gate($P_(theta)$), gate($Z$), rstick($ket(Psi')$)
  )],
  [$ ket(Psi') = hat(Z) hat(P)_(theta) hat(H) ket(Psi) $]
)

When a new state is reached, there's most likely interest in sampling
its value. Which is why the $ket(Psi')$ symbol is often replaced by
#quantum-circuit(scale: 66%, baseline: 2.5pt, meter()).
