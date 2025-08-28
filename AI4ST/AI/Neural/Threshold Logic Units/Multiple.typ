#import "../../AI_definitions.typ": *

Even though a single TLU can do little, it is possible to connects more
TLUs together, creating a _network_ of threshold logic units. This can
be done by breaking down a complicated boolean function into approachable
functions, each representable by a TLU, and using the outputs of TLUs as
inputs of other TLUs. This way, each subsection of the network partitions
the (hyper)plane into sub-(hyper)planes that are then recollected together.
More formally: by applying a coordinate transformation, moving from the
original domain to the image domain, the set of points become linearly
separable again.

#exercise[
	Construct a network of threshold logic units that encodes biimplication.
] <Neural-biimplication>
#solution[
	One possibility is as follows:

	#figure(
		caption: [A network of TLUs that encodes the biimplication.],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.5, 0.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((-1.5, -0.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((0, 0.75), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta1>),
			node((0, -0.75), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta2>),
			node((1, 0), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [+3]), radius: 2em, name: <Theta3>),

			edge((-1.25, 0.75), <Theta1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge((-1.25, -0.75), <Theta1>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.25, 0.75), <Theta2>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.25, -0.75), <Theta2>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta3>, (2, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)]
	)

	The idea is to deconstruct the biimplication $A <-> B$ as
	$(A -> B) and (B -> A)$. Each of the three functions (two
	single implications and one conjunction) is, when considered
	on its own, linearly separable.

	#figure(
		caption: [The euclidean plane partitioned by the two implications
		          are in blue and in red. The strip in the middle (in
		          purple) and the rest of the plane are now linearly
		          separable.],
		[#image("biimplication.svg", width: 75%)]
	)
]

#exercise[
	Construct a network of threshold logic units that encodes the exclusive or.
] <Neural-exclusive-or>
#solution[
	One possibility is as follows:

	#figure(
		caption: [A network of TLUs that encodes the exclusive or.],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.5, 0.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((-1.5, -0.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((0, 0.75), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta1>),
			node((0, -0.75), text(font: "Noto Sans", [+1]), radius: 2em, name: <Theta2>),
			node((1, 0), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [+1]), radius: 2em, name: <Theta3>),

			edge((-1.25, 0.75), <Theta1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge((-1.25, -0.75), <Theta1>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge((-1.25, 0.75), <Theta2>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.25, -0.75), <Theta2>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta3>, (2, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)]
	)

	This is done by rewriting $A xor B$ as $(A or B) and
	(not A or not B)$.

	#figure(
		caption: [The euclidean plane partitioned by the two disjunctions
		          are in blue and in red. The strip in the middle (in
		          purple) and the rest of the plane are now linearly
		          separable.],
		[#image("xor.svg", width: 75%)]
	)
]

To further investigate the capabilities of a network of TLUs, recall
that it's always possible to rewrite a boolean function in the so called
*disjunctive normal form*, or *DNF* for short. A boolean function in DNF
is constituted by a disjunction of many composite propositions; each of
these propositions is a conjunction of (potentially negated) atomic
propositions. That is:

$ K_(1) or dots or K_(m) =
  (l_(1, 1) and dots and l_(1, n)) or dots or (l_(m, 1) and dots and l_(m, n)) =
  or.big_(j = 1)^(m) (and.big_(i = 1)^(n) l_(j, i)) $

Where each $l_(j, i)$ can be either non-negated (*positive literal*) or
negated (*negative literal*).

There also exists the *conjunctive normal form*, or *CNF*, which is a
conjunction of many disjunctions. The two forms are equivalent, since,
any formula written in DNF can be converted into an equivalent expression
in CNF, and vice versa.

Note that the individual components of a boolean expression in CNF or DNF
are linearly separable. Therefore, any boolean expression in CNF or DNF can
be encoded into a network of TLUs. Since any boolean expression can always
be rewritten in such forms, this is tantamount to stating that a network of
TLUs can encode any boolean expression.

Let $y = f(x_(1), dots, x_(n))$ be a boolean function of $n$ variables.
The following algorithm constructs a network of TLUs that encodes $y$:

+ Rewrite $y$ in disjunctive normal form;
+ For each $K_(j)$ construct a TLU having $n$ inputs (one input for each
  variable) and the following weights and threshold:

  #grid(
	columns: (0.6fr, 0.4fr),
	[$ w_(j, i) = cases(+2 "if the j,i-th literal is a positive literal",
	                    -2 "if the j,i-th literal is a negative literal") $],
	[$ theta_(j) = n - 1 + frac(1, 2) sum_(i = 1)^(n) w_(j, i) $])
+ Create one more TLU, whose $m$ inputs are the outputs of the $m$ TLUs
  so-far constructed. Its weights are all equal to $+2$ and its threshold
  to $+1$.

#exercise[
	Construct a TLU network for the boolean function:

	$ F(A, B, C, D) =
	  (A and B and C) or
	  (overline(A) and B and D) or
	  (A and B and overline(C) and overline(D)) $
]
#solution[
	#figure(
		caption: [A network of TLUs that computes the given function,
		          constructed employing the aforementioned algorithm.],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-4, +1.5), name: <D>, fill: none, stroke: none, text(font: "Noto Sans", [D])),
			node((-4, +0.5), name: <C>, fill: none, stroke: none, text(font: "Noto Sans", [C])),
			node((-4, -0.5), name: <B>, fill: none, stroke: none, text(font: "Noto Sans", [B])),
			node((-4, -1.5), name: <A>, fill: none, stroke: none, text(font: "Noto Sans", [A])),

			node((0, 1), text(font: "Noto Sans", [+6]), radius: 2em, name: <Theta1>),
			node((0, 0), text(font: "Noto Sans", [+4]), radius: 2em, name: <Theta2>),
			node((0, -1), text(font: "Noto Sans", [+3]), radius: 2em, name: <Theta3>),
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

			node((2, 0), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [+1]), radius: 2em, name: <Theta4>),
			edge(<Theta1>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta2>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta3>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta4>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [Y]))
		)]
	)
]

The idea of the algorithm is to partition the space in which the output
is expected to be $1$ going one (hyper)side at a time. Each term each
conjunction defines one area in which the output is $1$ and then these
disconnected areas are merged together with a disjunction. Different
choices of weights and thresholds could be made: the one here given is
simply one that results in integer values.

/* This is somewhat of a lackluster justification */

Having devised a training method for single TLUs, it would be interesting
to engineer a training method for networks of TLUs. This would allow one
to encode any kind of boolean function, not just linearly separable
functions. Unfortunately, transferring the training process one-to-one
from single TLUs to multiple TLUs is not possible. For example, the updates
carried out by the delta rule are computed from the difference between the
output of the original function and the output of the TLU. However, the
tuned output becomes available only to the current TLU, while the others
are oblivious to the changes. This means that, to train a network of TLUs,
a completely different approach is required. Despite its shortcomings, this
network structure points in the right direction.
