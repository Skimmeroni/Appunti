#import "../Math4AI_definitions.typ": *

Let $underline(a) in RR^(2)$ be a vector, that forms an angle with the
$x$-axis equal to $phi$. Let then $underline(b) in RR^(2)$ be a second
vector, having the same norm as $underline(a)$, that forms an angle
with $underline(a)$ equal to $theta$. The interest is in finding a
linear application that maps $underline(a)$ to $underline(b)$. Since
both vectors have the same norm, this corresponds to a *rotation* of
$underline(a)$ by $theta$ degrees.

#figure(
	caption: [Rotating $underline(a)$ by $theta$ degrees.],
	diagram(
		edge-stroke: 0.75pt,
		spacing: 3em,

		edge((5, 2.5), (0, 2.5), marks: ("stealth", none), label-pos: 0, $x$),
		edge((0, -0.5), (0, 2.5), marks: ("stealth", none), label-pos: 0, $y$),
		edge((0, 2.5), (3.5, 1.5), marks: (none, "stealth"), label-angle: auto, stroke: 1pt + blue, $underline(a)$),
		edge((0, 2.5), (2.5, 0.25), marks: (none, "stealth"), label-angle: auto, stroke: 1pt + fuchsia, $underline(b)$),
		edge((3.5, 1.5), (3.5, 2.5), "dashed"),
		edge((3.5, 1.5), (0, 1.5), "dashed"),
		edge((2.5, 0.25), (2.5, 2.5), "dashed"),
		edge((2.5, 0.25), (0, 0.25), "dashed"),
		node((3.5, 2.75), [$a_(1)$]),
		node((-0.25, 1.5), [$a_(2)$]),
		node((2.5, 2.75), [$b_(1)$]),
		node((-0.25, 0.25), [$b_(2)$]),
		node((0.875, 2), [$theta$]),
		node((1.5, 2.25), [$phi$])
	)
) <Rotation>

In other words, the interest is in finding a matrix $R_(theta)$ which,
with respect to the same basis in which $underline(a)$ and $underline(b)$
are expressed, gives:

$ R_(theta) vec(a_(1), a_(2)) = vec(b_(1), b_(2)) $

Assume (as it is done in @Rotation) that $theta > phi$, meaning that the
rotation is counter-clockwise. Also assume that the basis of choice is the
standard basis. By trigonometry:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ a_(1) = norm(underline(a)) cos(phi) $],
	[$ a_(2) = norm(underline(a)) sin(phi) $]
)

And also:

$ b_(1) &=
  norm(underline(b)) cos(phi + theta) =
  norm(underline(a)) cos(phi + theta) =
  norm(underline(a)) (cos(phi) cos(theta) - sin(phi) sin(theta)) \
  &= norm(underline(a)) cos(phi) cos(theta) - norm(underline(a)) sin(phi) sin(theta) \
  b_(2) &=
  norm(underline(b)) sin(phi + theta) =
  norm(underline(a)) sin(phi + theta) =
  norm(underline(a)) (sin(phi) cos(theta) + cos(phi) sin(theta)) \
  &= norm(underline(a)) sin(phi) cos(theta) + norm(underline(a)) cos(phi) sin(theta) $

Since by definition $underline(a)$ and $underline(b)$ have the same norm.
Substituting the expressions for $a_(1)$ and $a_(2)$:

$ b_(1) =
  norm(underline(a)) cos(phi) cos(theta) - norm(underline(a)) sin(phi) sin(theta) =
  a_(1) cos(theta) - a_(2) sin(theta) \
  b_(2) =
  norm(underline(a)) sin(phi) cos(theta) + norm(underline(a)) cos(phi) sin(theta) =
  a_(2) cos(theta) + a_(1) sin(theta) $

Which is equivalent to the matrix equation:

$ mat(cos(theta), -sin(theta); sin(theta), cos(theta)) vec(a_(1), a_(2)) = vec(b_(1), b_(2)) $

To rotate a vector clockwise, it is sufficient to change the sign of
$theta$, since a counter-clockwise rotation by $-theta$ is equivalent
to a clockwise rotation by $theta$.

Rotations can be extended from the $RR^(2)$ case to the $RR^(3)$ case,
with the difference being that now there are three possible rotations,
one for each axis. The idea is that one of the three coordinates is
kept fixed, while the other are manipulated.

#figure(
	caption: [Rotating a vector $underline(a) in RR^(3)$ along the $z$ axis.
	          By an angle $theta$],
	diagram(
		edge-stroke: 0.75pt,
		spacing: 10em,

		edge((0, 0), (-0.4, 0.2), marks: (none, "stealth"), stroke: 1pt + gray, dash: "dashed"),
		edge((0, 0), (0.3, 0.2), marks: (none, "stealth"), stroke: 1pt + blue, dash: "dashed"),
		edge((0.3, 0.2), (0.3, -0.7), stroke: 1pt + blue, dash: "dashed"),
		edge((-0.4, 0.2), (-0.5, -0.8), stroke: 1pt + gray, dash: "dashed"),
		edge((0, 0), (1.25, 0), marks: (none, "stealth"), stroke: 1pt, label-pos: 1, $x$),
		edge((0, 0), (0.5, -0.5), marks: (none, "stealth"), stroke: 1pt, label-pos: 1, $y$),
		edge((0, 0), (0, -1.25), marks: (none, "stealth"), stroke: 1pt, label-pos: 1, $z$),
		edge((0, 0), (0.3, -0.7), marks: (none, "stealth"), stroke: 1pt + blue, label-pos: 0.5, label-angle: auto, $underline(b)$),
		edge((0, 0), (-0.5, -0.8), marks: (none, "stealth"), stroke: 1pt + gray, label-pos: 0.5, label-angle: auto, $underline(a)$),
		edge((-0.4, 0.2), (0.3, 0.2), marks: (none, "stealth"), stroke: 1pt + red, bend: -45deg, label-pos: 0.5, $theta$)
	)
)

For vectors expressed in the standard basis and for counter-clockwise
rotations, a matrix can be constructed for each axis:

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ R_(x, theta) =
	       mat(1, 0, 0;
	       0, cos(theta), -sin(theta);
	       0, sin(theta), cos(theta)) $],
	[$ R_(y, theta) =
	   mat(cos(theta), 0, sin(theta);
	       0, 1, 0;
	       -sin(theta), 0, cos(theta)) $],
	[$ R_(z, theta) =
	   mat(cos(theta), -sin(theta), 0;
	       sin(theta), cos(theta), 0;
	       0, 0, 1) $],
)

$R_(x, theta)$ rotates a vector counter-clockwise by $theta$ degrees
along the $x$ axis, $R_(y, theta)$ rotates a vector counter-clockwise
by $theta$ degrees along the $y$ axis and $R_(z, theta)$ rotates a
vector counter-clockwise by $theta$ degrees along the $z$ axis.
Notice how each matrix does not change the component of the vector
along its own axis.
