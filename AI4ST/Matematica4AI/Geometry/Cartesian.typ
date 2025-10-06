#import "../Math4AI_definitions.typ": *

The fact that many mathematical structures (matrices, polynomials,
$n$-tuples, ecc...) can be reduced to vectors means that one can be
converted into another. An interesting one is mapping vectors from
any vector space to coordinates on the $n$-dimensional Cartesian
system of coordinates.

Consider a vector $underline(v) = mat(v_(1), v_(2), dots, v_(n))^(T)$,
with $n$ components, coming from any vector space. $underline(v)$ can
be mapped to the $n$-tuple $(v_(1), v_(2), dots, v_(n))$. This $n$-tuple
identifies a point in the $n$-dimensional Cartesian plane, where the
placement of the axes depends on the basis used for the representation. 

If $n = 2$, it becomes possible to draw this representation in the
Cartesian plane: the $x$ axis represents the value of the first component,
while the $y$ axis represents the value of the second component. Any
vector $underline(v) = mat(v_(1), v_(2))^(T)$ is represented by an arrow
that starts in the origin $(0, 0)$ and ends in $(v_(1), v_(2))$.

#figure(
	caption: [Any vector with two components can be mapped to a
	          vector in the two-dimensional Cartesian plane.],
	diagram(
		edge-stroke: 0.75pt,
		spacing: 3em,

		for i in (-2, -1.5, -1, -0.5, 0.5, 1, 1.5, 2) {
			edge((i, -2), (i, 2), stroke: 0.5pt + gray)
			edge((-2, i), (2, i), stroke: 0.5pt + gray)
		},
		edge((-2, 0), (2, 0), marks: (none, "stealth"), label-pos: 0.95, $x$),
		edge((0, 2), (0, -2), marks: (none, "stealth"), label-pos: 0.95, $y$),
		edge((0, 0), (1.5, -1), marks: (none, "stealth"), label-pos: 0.95, label-angle: auto, stroke: 1pt + blue, $underline(v)$)
	)
)

If $n = 3$, the drawing is done on the Cartesian space: on the $x$ axis
lie the value of the first component, on the $y$ axis the value of the
second component and on the $z$ axis the value of the third component.

#figure(
	caption: [Any vector with three components can be mapped to a
	          vector in the three-dimensional Cartesian space.],
	diagram(
		edge-stroke: 0.75pt,
		spacing: 3em,
		edge((0, 0), (4, 0), marks: (none, "stealth"), stroke: 1pt, label-pos: 0.9, $x$),
		edge((0, 0), (0, -4), marks: (none, "stealth"), stroke: 1pt, label-pos: 0.9, $y$),
		edge((0, 0), (2, -2), marks: (none, "stealth"), stroke: 1pt, label-pos: 0.9, $z$),
		edge((0, 0), (3, -1), marks: (none, "stealth"), label-pos: 1, label-angle: auto, stroke: 1pt + blue, $underline(v)$),

		edge((4, 0), (4, -4), stroke: 1pt, dash: "dashed"),
		edge((0, -4), (4, -4), stroke: 1pt, dash: "dashed"),
		edge((2, -2), (6, -2), stroke: 1pt, dash: "dashed"),
		edge((0, -4), (2, -6), stroke: 1pt, dash: "dashed"),
		edge((4, -4), (6, -6), stroke: 1pt, dash: "dashed"),
		edge((2, -6), (6, -6), stroke: 1pt, dash: "dashed"),
		edge((4, 0), (6, -2), stroke: 1pt, dash: "dashed"),
		edge((6, -2), (6, -6), stroke: 1pt, dash: "dashed"),
		edge((2, -2), (2, -6), stroke: 1pt, dash: "dashed"),
	)
)

Notice the difference between $mat(v_(1), v_(2), dots, v_(n))^(T)$ and
$(v_(1), v_(2), dots, v_(n))$. The first is the vector itself, the second
is the point in the $n$-dimensional space whose coordinates are the
components of $underline(v)$, read in order.
