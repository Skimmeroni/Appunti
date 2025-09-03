#import "../../AI_definitions.typ": *

A *Threshold Logic Unit* (*TLU*), also known as *perceptron* or
*McCulloch-Pitts neuron* #footnote[The terminology is all over
the place: the three mathematical objects have different degree
of complexity. This is an oversimplification] is a mathematical
structure that models, in a very simplified way, how neurons
operate.

A TLU has $n$ inputs $x_(1), x_(2), dots, x_(n)$, each weighted by
a weight $w_(1), w_(2), dots, w_(n)$, that generates a single binary
output $y$. If the sum of all the inputs multiplied by their weights
is a value greater or equal than a given threshold $theta$, the output
$y$ is equal to $1$, to $0$ otherwise:

$ y = H(sum_(i = 1)^(n) w_(i) x_(i), theta) =
      cases(1 & "if" display(sum_(i = 1)^(n) w_(i) x_(i)) gt.eq theta,
      0 & "otherwise") $

This function is also referred to as the *Heaviside function*, or
*stepwise function*.

#figure(
    caption: [Plot of the Heaviside function, with three different
              choices of $theta$],
    [#image("heaviside.svg", width: 66%)]
)

The inputs can be collected into a single input vector $bold(x) = (x_(1),
dots, x_(n))$ and the weights into a weight vector $bold(w) = (w_(1), dots,
w_(n))$. This way, the output $y$ is equal to $1$ if the scalar product
between $bold(w)$ and $bold(x)$ is greater or equal than $theta$:

$ y = cases(1 & "if" angle.l bold(w)\, bold(x) angle.r gt.eq theta,
		     0 & "otherwise") $

#figure(
	caption: [A common way of representing a TLU. The processing unit
              is drawn as a circle, with the threshold in its center.
              Inputs are drawn as arrows entering the TLU from the left,
              with their respective weights above. The output is an arrow
              exiting the TLU from the right.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
		node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[n]])),
		node((-1.75, 0), fill: none, stroke: none, text(font: "Noto Sans", [#math.dots.v])),
		node((0, 0), text(font: "Noto Sans", [#math.theta]), radius: 2em, name: <Theta>),

		edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [w#sub[1]])),
		edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [w#sub[n]])),
		edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)],	
)

The analogy between TLUs and biological neurons is straightforward. The
output of a TLU is analogous to the firing of a neuron: an output equal
to $1$ corresponds to the firing of a neuron, whereas an output equal to
$0$ corresponds to a neuron insufficiently stimulated to be firing. A
positive weight corresponds to an excitatory synapse, that increases the
amount of stimulation received by the neuron, while a negative weight
corresponds to an inhibitory synapse, that reduces the amount of stimulation.

#exercise[
	Construct a TLU with two inputs whose threshold is $+4$ and whose
	(two) weights are $+3$ and $+2$ respectively.
]
#solution[
	#figure(
		caption: [A TLU with $x_(1), x_(2)$ as inputs, $w_(1) = +3,
		          w_(2) = +2$ as weights and $theta = +4$ as threshold.],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [+4]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+3])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)]
	)
]

It is easy to construct TLUs that can compute all four basic
logical connectives: `AND`, `OR`, `NOT` and `IF...THEN`.

#figure(
	caption: [Going clockwise from top left: a TLU that computes
	          conjunction, disjunction, implication and negation.
	          In this context, the inputs $x_(1)$ and $x_(2)$ are
	          assumed to be either $0$ or $1$. Of course, there
	          are many other choices of weights and thresholds
	          that encode the same functions.],
	[#grid(
		columns: (0.5fr, 0.5fr),
		row-gutter: 30pt,
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [+3]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [+1]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0), fill: none, stroke: none, text(font: "Noto Sans", [x])),
			node((0, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <Theta>),

			edge((-1.5, 0), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-1])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)]
	)]
)

Since the purpose of a TLU is to model the neurons in the brain,
there is clear interest is in understanding if a TLU can encode
any possible function or, if this were not to be the case, which
functions can be encoded.

First of all, notice how the weighted summation that determines its
output is very similar to an $n$-dimensional linear function. That
is, by substituting $gt.eq$ with $=$, one obtains an $n$-dimensional
straight line:

$ sum_(i = 1)^(n) w_(i) x_(i) = theta =>
  sum_(i = 1)^(n) w_(i) x_(i) - theta = 0 =>
  w_(1) x_(1) + w_(2) x_(2) + dots + w_(n) x_(n) - theta = 0 $

As a matter of fact, the line $sum_(i = 1)^(n) w_(i) x_(i) - theta = 0$
acts as a *decision border*, partitioning the $n$-dimensional Euclidean
hyperplane into two half-hyperplanes: one containing $n$-dimensional
points that give an output of $1$ when fed to the TLU and the other
containing points that give an output of $0$.

To deduce which of the two regions of space is which, it suffices
to inspect the coefficients of the line equation. By definition,
the weights $w_(1), dots, w_(n)$ are the coefficients of a vector
that is perpendicular to $sum_(i = 1)^(n) w_(i) x_(i) - theta = 0$.
By traslating said vector onto any point on the line, one obtains
which side of the hyperplane contains the points that give $1$ when
fed to the TLU: the one that the vector is pointing to.

This is easier to visualize if the number of dimensions (the number
of inputs to the TLU) is $3$ or less, since it's possible to graph
the decision border on a cartesian plane.

#figure(
	caption: [Going clockwise from top left: a cartesian plane
			  partitioned by the TLU that computes the conjunction,
			  disjunction, implication and negation.],
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
			edge((1.25, 0), (0.5, 0), marks: (none, "stealth"), stroke: 1pt + blue),
			edge((1.25, -2), (1.25, 2), stroke: 1pt + blue)
		)],
		[#image("IF-THEN.svg")]
	)]
)

More formally, two sets of points are called *linearly separable*
if there exists a linear function, called *decision function*, that
partitions the euclidean hyperplane into two half-planes, each containing
one of the two sets. A set of points is called *convex* if it's possible
to connect each point of the set with straight lines without crossing the
boundaries of the set. The *convex hull* of a set of points is its the
smallest superset that is convex. If two sets of points are both convex
and disjoint, they are linearly separable.

#figure(
	caption: [The two sets of points on the left (drawn with different
	          colors) is linearly separable. The ones on the right are
	          not],
	[#image("separable.svg")]
)

By extension, a binary function (a function that has two possible outputs)
is said to be linearly separable if the set of inputs that give the first
output and the set of inputs that give the second output are linearly
separable sets.

Therefore, a single TLU can only encode linearly separable functions;
indeed, `AND`, `OR`, `NOT` and `IF...THEN` are linearly separable
functions. Unfortunately, not all (binary) functions are linearly
separable: it is trivial to show, for example, that the biimplication
and the logical `XOR` are not linearly separable. This means that a
single TLU has (very) limited capabilities, because it can't encode
all possible functions.
