#import "../../AI_definitions.typ": *

A *radial basis function network* (*RBF* network) is a type of feed-forward
neural network structured in layers, with the following characteristics:

- Input neurons cannot also be output neurons, and vice versa: $U_("in")
  inter U_("out") = emptyset$;
- It has exactly three layers, an input layer, an output layer and an
  hidden layer;
- The input layer and the hidden layer are fully connected: $C = (U_("in")
  times U_("hidden")) union C'$, $C' subset.eq (U_("hidden") times U_("out"))$;
- The network input function of hidden neurons is a distance function:

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

The network input function and the activation functions of a hidden neuron
describe a kind of "catchment region" of this neuron. The weights of the
connections from the input layer to a neuron of the hidden layer state
the center of this region, since the distance (network input function) is
measured between the weight vector and the input vector. The type of
distance function determines the shape of the catchment region; for example,
a Euclidean distance gives a circular shape, since a circle is defined as
the set of points having equal Euclidean distance from a given center.

Intuitively, the activation function of a hidden neuron and its parameters
determine the "size" of the catchment region of the neuron by specifying
how strong the influence of an input vector is depending on its distance
from the weight vector. The name radial functions comes from the fact that
they are defined along a from a center, which is described by the weight
vector and thus assigns to each radius (that is, to each distance from
the center) an activation. The disjointed catchment regions of the hidden
neurons are then merged into one in the output layer.

All radial functions have a dependence on a parameter $sigma$ called
the *reference radius* The simplest radial function is the *rectangular
function*:

$ f_("act")("net", sigma) = cases(0 & "if" "net" > sigma,
                                  1 & "otherwise") $

#figure(
    caption: [Plot of the rectangular function, with three different
              choices of $sigma$],
    [#image("rectangular.svg", width: 66%)]
)

Using the Euclidean distance as network input function and the rectangular
function as activation function gives a nice geometrical interpretation of
the computations of a radial basis function networks. The weights coming
into the hidden layer represent the coordinates of circle(s), having the
$sigma$ parameter as their radius. The area inside the circle(s) describes
the set of points where the activation of the hidden neuron(s) is $1$, the
area outside where is $0$.

The Euclidean distance and the rectangular function are sufficient to
construct radial basis function networks that encode basic Boolean
functions. For example, the conjunction should be encoded by a network
whose circles capture the point of coordinates $(1, 1)$:

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

The graphical representation, on its own, does not specify which activation
function and network input function has been chosen for the hidden layer.
It must be stated explicitly or known from context.

#figure(
	caption: [Geometrical representation of the computations the radial
	          basis function network for the conjunction.],
	[#image("AND.svg", width: 50%)]
)

Note that centering the circle in the $(1, 1)$ coordinates is just a
matter of clarity. As long as the capture region only includes $(1, 1)$,
any choice of coordinates for the center (that is, the weights coming
into the hidden neuron) is valid. The same goes for the radius (the
$sigma$ parameter of the hidden neuron); as long as the radius is small
enough that the circle only encloses $(1, 1)$, any choice is valid.

This construction is "additive", meaning that the area of interest is
pieced together by summing smaller disjointed areas (only one, in this
case). It is also possible to work "by subtraction", that is by defining
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
	[#image("complement.svg", width: 50%)]
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

#figure(
	caption: [Geometrical representation of the computations the radial
	          basis function network for the disjunction.],
	[#image("OR.svg", width: 50%)]
)

In a similar fashion, the implication should capture all points except
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

#figure(
	caption: [Geometrical representation of the computations the radial
	          basis function network for the implication.],
	[#image("IF-THEN.svg", width: 50%)]
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
	          basis function network for the biimplication.],
	[#image("IFF.svg", width: 50%)]
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

#figure(
	caption: [Geometrical representation of the computations the radial
	          basis function network for the exclusive or.],
	[#image("XOR.svg", width: 50%)]
)

The rectangular function isn't the only radial function. A similar choice
is the *triangular function*:

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

The three aforementioned functions evaluate to $0$ over a given treshold.
This isn't a necessary condition for a radial functions; indeed, there are
radial functions with no boundary at all. One example is the *gaussian
function*:

$ f_("act")("net", sigma) = e^(-display(frac("net"^(2), 2 sigma^(2)))) $

#figure(
    caption: [Plot of the gaussian function, with three different
              choices of $sigma$],
    [#image("gaussian.svg", width: 66%)]
)

Where an activation is always non-zero for all inputs, but becomes
smaller and smaller as the input moves away from the center, until
it becomes negligible.
