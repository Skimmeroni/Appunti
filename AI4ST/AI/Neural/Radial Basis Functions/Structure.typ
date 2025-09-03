#import "../../AI_definitions.typ": *

A *radial basis function network* (*RBF* network) is a type of feed-forward
neural network structured in layers, with the following characteristics:

- Input neurons cannot also be output neurons, and vice versa: $U_("in")
  inter U_("out") = emptyset$;
- It has exactly three layers, an input layer, an output layer and an
  hidden layer;
- The input layer and the hidden layer are fully connected: $C = (U_("in")
  times U_("hidden")) union C'$, $C' subset.eq (U_("hidden") times U_("out"))$;
- The network input function of hidden neurons is a *distance function*. Its
  arguments are the input(s) and the weight(s):

    $ forall u in U_("hidden") union U_("out"), space
      f_("net")^((u))(w_(u_(1)), dots, w_(u_(n)), "in"_(u_(1)), dots, "in"_(u_(n))) =
      d(w_(u_(1)), dots, w_(u_(n)), "in"_(u_(1)), dots, "in"_(u_(n))) $

- The activation function of hidden neurons is a *radial function*, that
  is a monotone nonincreasing function $f : RR_(0)^(+) mapsto [0, 1]$ with
  $f(0) = 1$ and $lim_(x -> infinity) f(x) = 0$;
- The network input function of output neurons is the weighted sum of
  their inputs and the corresponding weights:

  $ forall u in U_("out"), space
    f_("net")^((u))(w_(u_(1)), dots, w_(u_(n)), "in"_(u_(1)), dots, "in"_(u_(n))) =
    f_("net")^((u))(bold(w)_(u), bold("in")_(u)) =
    sum_(v in "pred"(u)) w_(u, v) dot "out"_(v) $

- The activation function of output neurons is a linear function:

  $ forall u in U_("out"), space f_("act")^((u))("net"_(u), theta_(u)) =
    "net"_(u) - theta_(u) $

A distance function is any function $d: RR^(n) times RR^(n) mapsto RR^(+)$
that possesses the following properties:

+ For any $bold(x), bold(y) in RR^(n)$,
  $d(bold(x), bold(y)) = 0$ implies $bold(x) = bold(y)$;
+ For any $bold(x), bold(y) in RR^(n)$,
  $d(bold(x), bold(y)) = d(bold(y), bold(x))$ (*symmetry*);
+ For any $bold(x), bold(y), bold(z) in RR^(n)$,
  $d(bold(x), bold(y)) + d(bold(y), bold(z)) lt.eq
  d(bold(x), bold(z))$ (*triangle inequality*);

One notable family of distance functions is *Minkowski family*, defined as:

$ d_(k)(bold(x), bold(y)) = (sum_(i = 1)^(n) abs(x_(i) - y_(i))^(k))^(frac(1, k)) $

In particular:

- With $k = 1$, one has the *Manhattan distance*, or *city block distance*;
- With $k = 2$, one has the *Euclidean distance*;
- With $k -> infinity$, one has the *maximum distance*,
  that is $d_(infinity)(bold(x), bold(y)) = max_(i = 1)^(n) abs(x_(i) - y_(i))$

A simple way to visualize distances is to consider a two-dimensional
plane and a reference point and plot surfaces of equal distance from
said point. Each surface contains all the points of the plane that have
the same distance from the reference point. Distances in the Minkowski
family always result in regular shapes. 

#figure(
    caption: [Surfaces of equal distance, with $(0, 0)$ being the
              reference point. From left to right, the Manhattan,
              Euclidean and maximum distance is employed. All shapes
              are regular: a diamond, a circle and a square respectively.],
    [#grid(
        columns: (0.33fr, 0.33fr, 0.33fr),
        [#image("manhattan.svg")],
        [#image("euclidean.svg")],
        [#image("maximal.svg")]
    )]
)

Each hidden neuron induces one of these hypersurfaces. The weights of the
connections from the input layer to the hidden neuron determine the center
of the region, while the $sigma$ parameter determines the radius of this
surface. For this reason, the parameter $sigma$ is also called *reference
radius*. Different choices of activation function give different shapes of
the hypersurfaces; unless specified otherwise, it is assumed that the
employed distance function is the Euclidean distance.

These surfaces form a sort of "capture region": a neuron that is "captured"
by this surface, meaning that it falls inside the defined boundary, will
give a non-zero activation. The closer the input is to the center of this
region, the higher the activation. Indeed, the name radial functions comes
from the fact that they are defined along a radius, the radius of length
$sigma$ of the hypersurface centered in the incoming weights.

Each hidden neuron specifies its own capture region, and different neurons
can specify potentially disjointed regions. These regions are then merged
into one in the output layer, since the activation of its neurons is just
the weighted sum of the activations in the hidden layer.

The simplest radial function is the *rectangular function*:

$ f_("act")("net", sigma) = cases(0 & "if" "net" > sigma,
                                  1 & "otherwise") $

#figure(
    caption: [Plot of the rectangular function, with three different
              choices of $sigma$],
    [#image("rectangular.svg", width: 66%)]
)

The activation inside the capture region is always $1$ (no matter the
distance from the center) and outside the capture region is always $0$.
Being a binary function, the rectangular function is well suited to 
construct radial basis function networks that encode Boolean functions.

For example, the conjunction should be encoded by a network whose circles
capture the point of coordinates $(1, 1)$:

#figure(
	caption: [A radial basis function network for the conjunction.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
		node((-1.25, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
		node((0, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta1>),
		node((0, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta2>),
		node((1, 0), text(font: "Noto Sans", [0.5]), radius: 2em, name: <Theta3>),
		node((2, 0), text(font: "Noto Sans", [0]), stroke: 1.5pt + green, radius: 2em, name: <Theta4>),

		edge((-1, 0.5), <Theta1>, marks: (none, "latex")),
		edge((-1, -0.5), <Theta2>, marks: (none, "latex")),
		edge(<Theta3>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta4>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)]
)

The negation should capture $0$ but not $1$:

#figure(
	caption: [A radial basis function network for the negation.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, 0), fill: none, stroke: none, text(font: "Noto Sans", [x])),
		node((0, 0), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta1>),
		node((1, 0), text(font: "Noto Sans", [0.5]), radius: 2em, name: <Theta2>),
		node((2, 0), text(font: "Noto Sans", [0]), stroke: 1.5pt + green, radius: 2em, name: <Theta3>),

		edge((-1, 0), <Theta1>, marks: (none, "latex")),
		edge(<Theta1>, <Theta2>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [0])),
		edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta3>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)]
)

If the conjunction should only capture $(1, 1)$, the disjunction should
instead capture all points except for $(0, 0)$:

#figure(
	caption: [A radial basis function network for the disjunction.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
		node((-1.25, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
		node((0, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta1>),
		node((0, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta2>),
		node((1, 0), text(font: "Noto Sans", [1.25]), radius: 2em, name: <Theta3>),
		node((2, 0), text(font: "Noto Sans", [0]), stroke: 1.5pt + green, radius: 2em, name: <Theta4>),

		edge((-1, 0.5), <Theta1>, marks: (none, "latex")),
		edge((-1, -0.5), <Theta2>, marks: (none, "latex")),
		edge(<Theta3>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta4>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)]
)

Similarly, the implication should capture all points except
for $(1, 0)$:

#figure(
	caption: [A radial basis function network for the implication.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
		node((-1.25, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
		node((0, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta1>),
		node((0, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta2>),
		node((1, 0), text(font: "Noto Sans", [1.25]), radius: 2em, name: <Theta3>),
		node((2, 0), text(font: "Noto Sans", [0]), stroke: 1.5pt + green, radius: 2em, name: <Theta4>),

		edge((-1, 0.5), <Theta1>, marks: (none, "latex")),
		edge((-1, -0.5), <Theta2>, marks: (none, "latex")),
		edge(<Theta3>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [0])),
		edge(<Theta4>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)]
)

The graphical representation, on its own, does not specify which activation
function and network input function has been chosen for the hidden layer.
It must either be stated explicitly or known from context.

#figure(
	caption: [Going clockwise from top left: a cartesian plane
			  partitioned by a radial basis function that computes
			  the conjunction, disjunction, implication and negation.],
	[#grid(
		columns: (0.5fr, 0.5fr),
		row-gutter: 30pt,
		[#image("AND.svg")],
		[#image("OR.svg")],
		[#diagram(
			edge((-1, 0), (4, 0), stroke: 0.75pt),
			node((2.5, 0), fill: blue, "", radius: 2pt),
			node((0, 0), fill: blue, "", radius: 2pt),
			node((0, -0.25), "0"),
			node((2.5, -0.25), "1"),
			edge((-0.5, 0), (0.5, 0), stroke: 1pt + blue)
		)],
		[#image("IF-THEN.svg")]
	)]
)

Note that centering the circle precisely in the points of interest is
just a matter of clarity. As long as the capture region only includes
the points for which the output should be $1$ any choice of coordinates
for the center (that is, the weights coming into the hidden neuron) is
valid. The same goes for the radius (the $sigma$ parameter of the hidden
neuron); as long as the radius is small enough for the capture region to
include the wrong points, but big enough for the capture region to enclose
the correct points, any choice is valid.

These constructions are "additive", meaning that the area of interest is
pieced together by summing smaller disjointed areas (only one, in these
cases). It is also possible to work "by subtraction", that is by defining
the area where the output should be $0$ and then complementing it, by
negating the $sigma$ parameter in the output layer.

For example, an alternative construction for the conjunction is the following:

#figure(
	caption: [A different radial basis function network for the conjunction.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
		node((-1.25, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
		node((0, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta1>),
		node((0, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta2>),
		node((1, 0), text(font: "Noto Sans", [1.25]), radius: 2em, name: <Theta3>),
		node((2, 0), text(font: "Noto Sans", [-1]), stroke: 1.5pt + green, radius: 2em, name: <Theta4>),

		edge((-1, 0.5), <Theta1>, marks: (none, "latex")),
		edge((-1, -0.5), <Theta2>, marks: (none, "latex")),
		edge(<Theta3>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-1])),
		edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [0])),
		edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [0])),
		edge(<Theta4>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)]
)

Where the circle envelopes the area that should _not_ result in a $1$;
the output layer negates the input, effectively complementing the area. 

#figure(
	caption: [Geometrical representation of the computations the radial
	          basis function network for the conjunction (new version).],
	[#image("complement.svg", width: 66%)]
)

More complex functions are constructed from these simple building blocks.
For example, the biimplication is as follows:

#figure(
	caption: [A radial basis function network for the biimplication.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
		node((-1.25, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
		node((0, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta1>),
		node((0, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta2>),
		node((1, 0.5), text(font: "Noto Sans", [0.5]), radius: 2em, name: <Theta3>),
		node((1, -0.5), text(font: "Noto Sans", [0.5]), radius: 2em, name: <Theta4>),
		node((2, 0), text(font: "Noto Sans", [0]), stroke: 1.5pt + green, radius: 2em, name: <Theta5>),

		edge((-1, 0.5), <Theta1>, marks: (none, "latex")),
		edge((-1, -0.5), <Theta2>, marks: (none, "latex")),
		edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [0])),
		edge(<Theta1>, <Theta4>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [0])),
		edge(<Theta2>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta3>, <Theta5>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta4>, <Theta5>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta5>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)]
)

An RBF network that encodes the exclusive or can be built directly or,
since the exclusive or and the biimplication are the opposite of each
other, simply by complementing the previous network:

#figure(
	caption: [A radial basis function network for the exclusive or.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
		node((-1.25, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
		node((0, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta1>),
		node((0, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta2>),
		node((1, 0.5), text(font: "Noto Sans", [0.5]), radius: 2em, name: <Theta3>),
		node((1, -0.5), text(font: "Noto Sans", [0.5]), radius: 2em, name: <Theta4>),
		node((2, 0), text(font: "Noto Sans", [-1]), stroke: 1.5pt + green, radius: 2em, name: <Theta5>),

		edge((-1, 0.5), <Theta1>, marks: (none, "latex")),
		edge((-1, -0.5), <Theta2>, marks: (none, "latex")),
		edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [0])),
		edge(<Theta1>, <Theta4>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [0])),
		edge(<Theta2>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
		edge(<Theta3>, <Theta5>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-1])),
		edge(<Theta4>, <Theta5>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-1])),
		edge(<Theta5>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)]
)

Note how the issue of separability is here present in a different
form: there is no regular single shape that can enclose both $(0, 0)$
and $(1, 1)$, the only way is to sum two regular shapes. This is why
the number of hidden neurons has to be two #footnote[The fact that
the capture region is always a regular shape is a byproduct of using
a distance function of the Minkowski family. There are distance functions
that do not belong to this family, such as the *Mahalanobis distance*,
that can create shapes that aren't regular. It is therefore possible to
encode a biimplication into an RBF network with a single hidden neuron
by employing distance functions such as these.].

#figure(
	caption: [Geometrical representation of the computations the radial
	          basis function network for the biimplication (left) and
	          the exclusive or (right).],

	[#grid(
		columns: (0.5fr, 0.5fr),
		[#image("IFF.svg")],
		[#image("XOR.svg")]
	)]
)

Different activation functions have their output scale with the input.
An example is the *triangular function*:

$ f_("act")("net", sigma) = cases(0 & "if" "net" > sigma,
                                  1 - display(frac("net", sigma)) & "otherwise") $

#figure(
    caption: [Plot of the triangular function, with three different
              choices of $sigma$],
    [#image("triangular.svg", width: 66%)]
)

A smoother alternative is the *cosine down to zero*:

$ f_("act")("net", sigma) = cases(0 & "if" "net" > 2 sigma,
                                  display(frac(1, 2)) (cos(display(frac(pi, 2 sigma)) "net") + 1) & "otherwise") $

#figure(
    caption: [Plot of the cosine down to zero function, with three different
              choices of $sigma$],
    [#image("cosine_down_to_zero.svg", width: 66%)]
)

The rectangular function, the triangular function and the cosine
down to zero define a crisp boundary that separates an area where
the activation is not $0$ from an area where is $0$. The difference
is in how the activation scales with the distance from the center.

#figure(
    caption: [Plot of the value of the triangular function with
              $sigma = 0.5$ for each point in the $[-1, 1] times
              [-1, 1]$ plane, computed on the distance from the
              center $(0, 0)$ . The value decreases as the point
              is further from the center, until becoming $0$ when
              sufficiently far away],
    [#image("triangular-radius.svg", width: 66%)]
)

There are radial functions that have no boundary at all, meaning that
they always assign a non-zero activation to any point of the domain.
One example is the *Gaussian function*:

$ f_("act")("net", sigma) = e^(-display(frac("net"^(2), 2 sigma^(2)))) $

#figure(
    caption: [Plot of the gaussian function, with three different
              choices of $sigma$],
    [#image("gaussian.svg", width: 66%)]
)

The activation is the highest in the center of the capture region
and becomes smaller and smaller as the input is far away from the
center, without ever going to $0$. This makes it harder to give a
visual representation of the function, since the capture region is,
technically, the entire space, but has better approximation power.

#figure(
    caption: [Plot of the value of the Gaussian function with
              $sigma = 0.5$ for each point in the $[-1, 1] times
              [-1, 1]$ plane, computed on the distance from the
              center $(0, 0)$ . The value decreases as the point
              is further from the center, but never vanishes.],
    [#image("gaussian-radius.svg", width: 66%)]
)
