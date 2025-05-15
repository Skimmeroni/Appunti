#import "../AI_definitions.typ": *

A *Threshold Logic Unit* (*TLU*), also known as *perceptron* #footnote[The
original definition of perceptron was more refined than a TLU, but the two
terms are often used interchangeably.] or *McCulloch-Pitts neuron* is a
mathematical structure that models, in a very simplified way, how neurons
operate.

A TLU has $n$ binary inputs $x_(1), x_(2), dots, x_(n)$, each weighted by
a weight $w_(1), w_(2), dots, w_(n)$, that generates a single binary output
$y$. If the sum of all the inputs multiplied by their weights is a value
greater or equal than a given threshold $theta$, the output $y$ is equal
to $1$, otherwise is equal to $0$.

The analogy between TLUs and biological neurons is straightforward. The
output of a TLU is analogous to the firing of a neuron: an output equal
to $1$ corresponds to the firing of a neuron, whereas an output equal to
$0$ corresponds to a neuron insufficiently stimulated to be firing.

#figure(caption: [A common way of representing a TLU. The processing unit
                  is drawn as a circle, with the threshold in its center.
                  Inputs are drawn as arrows entering the TLU from the left,
                  with their respective weights above. The output is an arrow
                  exiting the TLU from the right.])[
	#grid(
		columns: (0.6fr, 0.4fr),
		[#diagram(
			node-stroke: 1.5pt + blue,
			node-fill: aqua,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[n]])),
			node((-1.75, 0), fill: none, stroke: none, text(font: "Noto Sans", [#math.dots.v])),
			node((0, 0), text(font: "Noto Sans", [#math.theta]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label: text(font: "Noto Sans", [w#sub[1]])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label: text(font: "Noto Sans", [w#sub[n]])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [Y]))
		)],
		[$ y = cases(1 & "if" display(sum_(i = 1)^(n) w_(i) x_(i)) gt.eq theta,
		             0 & "otherwise") $]
	)
]

The inputs can be collected into a single input vector $bold(x) = (x_(1),
dots, x_(n))$ and the weights into a weight vector $bold(w) = (w_(1), dots,
w_(n))$. With this formalism, the output $y$ is equal to $1$ if $angle.l
bold(w), bold(x) angle.r gt.eq theta$, where $angle.l angle.r$ denotes the
scalar product.

#exercise[
	Construct a TLU with two inputs whose threshold is $4$ and whose
	weights are $w_(1) = 3$ and $w_(2) = 2$.
]
#solution[
	#grid(
		columns: (0.6fr, 0.4fr),
		[#diagram(
			node-stroke: 1.5pt + blue,
			node-fill: aqua,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [4]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label: text(font: "Noto Sans", [2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label: text(font: "Noto Sans", [3])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [Y]))
		)],
		[
		#table(
			columns: (0.2fr, 0.2fr, 0.3fr, 0.2fr),
			[$x_(1)$], [$x_(2)$], [$3x_(1) + 2x_(2)$], [$y$],
			[$0$], [$0$], [$0$], [$0$],
			[$1$], [$0$], [$3$], [$0$],
			[$0$], [$1$], [$2$], [$0$],
			[$1$], [$1$], [$5$], [$1$]
		)]
	)
]

Intuitively, a negative weight corresponds to an inhibitory synapse: if
the corresponding input becomes active (that is, equal to $1$), it gives
a negative contribution to the overall excitation. On the other hand, a
positive weight corresponds to an excitatory synapse: if the corresponding
input becomes active (that is, equal to $1$), it gives a positive
contribution to the overall excitation.

Note how the weighted summation that discriminates whether the output of
a TLU is $1$ or $0$ is very similar to an $n$-dimensional linear function.
That is, by substituting the $gt.eq$ sign with a $=$ sign, it effectively
turns into an $n$ dimensional straight line:

$ sum_(i = 1)^(n) w_(i) x_(i) = theta =>
  sum_(i = 1)^(n) w_(i) x_(i) - theta = 0 =>
  w_(1) x_(1) + w_(2) x_(2) + dots + w_(n) x_(n) - theta = 0 $

As a matter of fact, the line $sum_(i = 1)^(n) w_(i) x_(i) - theta = 0$
acts as a *decision border*, partitioning the $n$-dimensional Euclidean
hyperplane into two half-planes: one containing $n$-dimensional points
that give an output of $1$ when fed the TLU and the other containing
points that give an output of $0$.

To deduce which of the two regions of space is which, it suffices to inspect
the coefficients of the line equation. Indeed, the coefficients $x_(1), dots,
x_(n)$ are the elements of a normal vector of the line: the half-plane that
contains points that give the TLU an output of $1$ is the one to which this
vector points to.

/*
Omissis

#grid(
	columns: (0.5fr, 0.5fr),
	[
	// Bidimensional plane
	],
	[
	// Vectors
	]
)
*/

Unfortunately, not all linear functions can be represented by a TLU.
More formally, two sets of points are called *linearly separable* if
there exists a linear function, called *decision function*, that
partitions the Euclidean hyperplane into two half-planes, each
containing one of the two sets.

A set of points in the plane is called *convex* if connecting each point
of the set with straight lines does not require to go outside of the set.
The *convex hull* of a set of points is its the smallest superset that is
convex. If two sets of points are both convex and disjoint, they are
linearly separable.

A TLU is capable of representing only functions such as these, but for
two sets of points a decision function might not exist, and therefore
not all sets of points are linearly separable.

#exercise[
	Is the function $A <-> B$ linearly separable?
]
#solution[
	No, and it can be proven.

	/*
	Assume that there exists a TLU with two
	inputs having weights $w_(1)$ and $w_(2)$ and threshold $theta$
	that computes the biimplication. Then...
	*/

	#grid(
		columns: (0.3fr, 0.7fr),
		[
		#table(
			columns: (0.2fr, 0.2fr, 0.2fr),
			[$x_(1)$], [$x_(2)$], [$y$],
			[$0$], [$0$], [$1$],
			[$1$], [$0$], [$0$],
			[$0$], [$1$], [$0$],
			[$1$], [$1$], [$1$])
		],
		[#align(center,
			[#cetz.canvas({
				import cetz.draw: set-style, circle, line, content

				set-style(stroke: (thickness: 1.5pt),
								mark: (end: "triangle", fill: black))

				line((0.5, 0), (0, 0), (0, 0.5), (2, 2.5), (2.5, 2), (0.5, 0),
				     close: true, fill: gray, stroke: (thickness: 0pt), mark: (end: none))

				line((0, 0), (3, 0))
				line((0, 0), (0, 3))
				line((0.5, 0), (2.5, 2), mark: (end: none))
				line((0, 0.5), (2, 2.5), mark: (end: none))
			})])
		]
	)
]

Even though single TLPs are fairly limited, it is possible to chain more
TLPs together, creating a _network_ of threshold logic units. This can
be done by breaking down a complicated boolean function into approachable
functions, each representable by a TLU, and using the outputs of TLUs as
inputs of other TLUs. Since both the inputs and the outputs of a TLP are
binary values, this doesn't pose a problem. By applying a coordinate
transformation, moving from the original domain to the image domain, the
set of points become linearly separable.

#exercise[
	Is it possible to construct a network of threshold logic units that
	can represent $A <-> B$?
]
#solution[
	Yes. Note how $A <-> B$ can be rewritten as $(A -> B) and (B -> A)$.
	Each of the three functions (two single implications and one logical
	conjunction) is linearly separable.

	#grid(
		columns: (0.5fr, 0.5fr),
		[#diagram(
			node-stroke: 1.5pt + blue,
			node-fill: aqua,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.5, 0.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((-1.5, -0.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((0, 0.75), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta1>),
			node((0, -0.75), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta2>),
			node((1, 0), text(font: "Noto Sans", [3]), radius: 2em, name: <Theta3>),

			edge((-1.25, 0.75), <Theta1>, marks: (none, "latex"), label: text(font: "Noto Sans", [-2])),
			edge((-1.25, -0.75), <Theta1>, marks: (none, "latex"), label: text(font: "Noto Sans", [2])),
			edge((-1.25, 0.75), <Theta2>, marks: (none, "latex"), label: text(font: "Noto Sans", [2])),
			edge((-1.25, -0.75), <Theta2>, marks: (none, "latex"), label: text(font: "Noto Sans", [-2])),
			edge(<Theta1>, <Theta3>, marks: (none, "latex"), label: text(font: "Noto Sans", [2])),
			edge(<Theta2>, <Theta3>, marks: (none, "latex"), label: text(font: "Noto Sans", [2])),
			edge(<Theta3>, (2, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [Y]))
		)],
		[#align(center,
			[#cetz.canvas({
				import cetz.draw: set-style, circle, line, content

				set-style(stroke: (thickness: 1.5pt),
								mark: (end: "triangle", fill: black))

				line((1.5, 0), (0, 1.5), (0, 3), (3, 3), (3, 0), (1.5, 0),
				     close: true, fill: gray, stroke: (thickness: 0pt), mark: (end: none))
				line((0, 0), (3, 0))
				line((0, 0), (0, 3))
				line((1.5, 0), (0, 1.5), mark: (end: none))
			})])
		]
	)
]

It can be shown that all Boolean functions with an arbitrary number of
inputs can be computed by networks of TLUs, since any Boolean function
can be rearranged in the disjunctive normal form (or conjunctive normal
form). A Boolean function in disjunctive normal form is only constituted
by a streak of `or` each constituted by `and` (potentially negated),
which are all linearly separable.

In particular, a TLU network of two layers will suffice: let $y = f(x_(1),
dots, x_(n))$ be a Boolean function of $n$ variables. It is possible to
construct a network of threshold logic units that represents $y$ applying
this algorithm:

+ Rewrite the function $y$ in disjunctive normal form:

  $ D_(f) = K_(1) or dots or K_(m) =
    (l_(1, 1) and dots and l_(1, n))
    or dots or
    (l_(m, 1) and dots and l_(m, n)) =
    or.big_(j = 1)^(m) (and.big_(i = 1)^(n) l_(j, i)) $

  Where each $l_(j, i)$ can be either non-negated (positive literal) or
  negated (negative literal)
+ For each $K_(j)$ construct a TLU having $n$ inputs (one input for each
  variable) and the following weights and threshold:

  #grid(
	columns: (0.5fr, 0.5fr),
	[$ w_(j, i) = cases(+2 "if" l_(j, i) "is a positive literal",
	                    -2 "if" l_(j, i) "is a negative literal") $],
	[$ theta_(j) = n - 1 + frac(1, 2) sum_(i = 1)^(n) w_(j, i) $]
  )
+ Create one output neuron, having $m$ inputs (equal to the number of TLUs
  created in the previous steps), threshold equal to $1$ and all weights
  equal to $2$.

/*
Intuitively, the neurons in the first layer describe an hyperplane that 
cuts the first hypercube... To then compute the disjunction...
*/

#exercise[
	Construct a TLU network for the boolean function:

	$ F(A, B, C, D) =
	  (A and B and C) or
	  (overline(A) and B and D) or
	  (A and B and overline(C) and overline(D)) $
]
#solution[
	#align(
		center,
		[#diagram(
			node-stroke: 1.5pt + blue,
			node-fill: aqua,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-4, +1.5), name: <D>, fill: none, stroke: none, text(font: "Noto Sans", [D])),
			node((-4, +0.5), name: <C>, fill: none, stroke: none, text(font: "Noto Sans", [C])),
			node((-4, -0.5), name: <B>, fill: none, stroke: none, text(font: "Noto Sans", [B])),
			node((-4, -1.5), name: <A>, fill: none, stroke: none, text(font: "Noto Sans", [A])),

			node((0, 1), text(font: "Noto Sans", [6]), radius: 2em, name: <Theta1>),
			node((0, 0), text(font: "Noto Sans", [4]), radius: 2em, name: <Theta2>),
			node((0, -1), text(font: "Noto Sans", [3]), radius: 2em, name: <Theta3>),
			edge(<A>, <Theta1>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<B>, <Theta1>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<C>, <Theta1>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<A>, <Theta2>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<B>, <Theta2>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<D>, <Theta2>, marks: (none, "latex"), label-pos: 0.5, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<A>, <Theta3>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<B>, <Theta3>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<C>, <Theta3>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<D>, <Theta3>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [-2])),

			node((2, 0), text(font: "Noto Sans", [1]), radius: 2em, name: <Theta4>),
			edge(<Theta1>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta2>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta3>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta4>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [Y]))
	)])
]
