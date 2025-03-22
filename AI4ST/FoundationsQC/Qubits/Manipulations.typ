#import "../FoundationsQC_definitions.typ": *

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
