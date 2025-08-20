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
	Construct a network of threshold logic units that encode biimplication.
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
		          fuchsia) and the rest of the plane are now linearly
		          separable.],
		[#image("biimplication.svg", width: 75%)]
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

An *artificial neural network*, or simply *neural network*, is a directed
graph $G = (U, C)$, whose vertices $u in U$ are called *neurons* or *units*
and whose edges $c in C$ are called *connections*. Each connection $(v, u)
in C$ carries a *weight* $w_(u, v)$. The set of vertices is made up of three
subsets: a set $U_("in")$ of *input neurons*, a set $U_("out")$ of *output
neurons* and a set $U_("hidden")$ of *hidden neurons*.

$ U = U_("in") inter U_("out") inter U_("hidden") $

The set of input neurons and the set of output neurons cannot be empty
and may not be disjoint. That is, a neuron can be both an input and an
output neuron at the same time. The set of hidden neurons can be empty
and must be disjoint from the sets of input and output neurons. That is,
a neuron cannot be both a hidden neuron and an input/output neuron at
the same time.

#grid(
	columns: (0.3fr, 0.3fr, 0.4fr),
	[$ U_("in") != emptyset $],
	[$ U_("out") != emptyset $],
	[$ U_("hidden") inter (U_("in") inter U_("out")) = emptyset $]
)

The input neurons receive information from the environment in the
form of the external input, whereas the output neurons release the
information processed by the network. The hidden neurons do not
communicate with the environment directly, but only with other neurons,
hence the name "hidden". By extension, the (external) input of a neural
network is simply the external input fed to its input neurons, and the
output of a neural network is the output of all of its output neurons.

Being a graph, it is natural to represent a neural network either with a
pictorial representation (that is, circles and arrows) or as an adjacency
matrix. These are also referred to as the *network structure* of the neural
network.

In describing the network structure, it is customary to denote the ending
node of the connection before the starting node, and not the other way
around (how it's usually done). That is, a weight $w_(u, v)$ is carried
by a connection _ending_ in $u$ and _starting_ in $v$. This way, each row
contains the weights of the connections leading to the same neuron, not
those coming out of the same neuron.

#exercise[
	Let $G = (V, E)$ an artificial neural network, where $V = {U_(1), U_(2),
	U_(3), U_(4)}$ and $E = {(U_(1), U_(2), 1), (U_(1), U_(3), 4), (U_(2),
	U_(3), 3), (U_(3), U_(1), -2), (U_(3), U_(4), -2), (U_(4), U_(2), 1)}$.
	$U_(1)$ and $U_(2)$ are input neurons with one input, $x_(1)$ and $x_(2)$
	respectively, whereas $U_(3)$ is an output neuron. Represent its network
	structure.
] <Neural-network>
#solution[
	#set math.mat(delim: "[")

	#figure(
		caption: [On the left, the pictorial representation of the neural
		          network. On the right, its adjacency matrix.],
		[#grid(
			columns: (0.75fr, 0.25fr),
			[#diagram(
				edge-stroke: 1.5pt,
				spacing: 4em,

				node((-1.25, -1), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
				node((-1.25, 0), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
				node((2.5, -1), fill: none, stroke: none, text(font: "Noto Sans", [y])),

				node((0, -1), stroke: 1.5pt + blue, text(font: "Noto Sans", [U1]), radius: 2em, name: <U1>),
				node((0, 0), stroke: 1.5pt + blue, text(font: "Noto Sans", [U2]), radius: 2em, name: <U2>),
				node((1.25, -1), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [U3]), radius: 2em, name: <U3>),
				node((1.25, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [U4]), radius: 2em, name: <U4>),

				edge((-1.25, -1), <U1>, marks: (none, "latex")),
				edge((-1.25, 0), <U2>, marks: (none, "latex")),
				edge(<U1>, <U2>, marks: (none, "latex"), label-angle: auto, text(font: "Noto Sans", [1])),
				edge(<U2>, <U3>, marks: (none, "latex"), label-angle: auto, text(font: "Noto Sans", [3])),
				edge(<U1>, <U3>, marks: (none, "latex"), label-angle: auto, bend: -20deg, text(font: "Noto Sans", [-2])),
				edge(<U3>, <U1>, marks: (none, "latex"), label-angle: auto, bend: -20deg, text(font: "Noto Sans", [4])),
				edge(<U3>, <U4>, marks: (none, "latex"), label-angle: auto, text(font: "Noto Sans", [-2])),
				edge(<U4>, <U2>, marks: (none, "latex"), label-angle: auto, text(font: "Noto Sans", [1])),
				edge(<U3>, (2.5, -1), marks: (none, "latex")),
			)],
			[$ mat(infinity, infinity, 4, infinity;
				   1, infinity, infinity, 1;
				   -2, 3, infinity, infinity;
				   infinity, infinity, -2, infinity) $]
		)]
	)
]

If the network structure of a neural network is acyclic graph (no loops
and no directed cycles), the neural network is said to be a *feed forward
neural network*. If instead it has at least one loop and/or one cycle,
it is referred to as a *recurrent network*. The difference between the
two is in how the information flows: in the former, information can only
flow from the input neurons to the hidden neurons (if any) to the output
neurons, meaning that it can only go "in one direction". In the latter,
information can be fed back into the network from its own output to its
own input (the neural network in @Neural-network would be a recurrent
neural network).

To understand how a neural network operates, it is necessary to
start from single neurons. To each neuron $u in U$ are assigned
three real-valued quantities: the *network input* $"net"_(u)$,
the *activation* $"act"_(u)$, and the *output* $"out"_(u)$. Each
input neuron $u in U_("in")$ has a fourth quantity, the *external
input* $"ext"_(u)$. Each neuron $u in U$ also possesses three
functions:

- The *network input function*
  $f_("net")^((u)): RR^(2|"pred"(u)| + p_(l)(u)) -> RR$;
- The *activation function*
  $f_("act")^((u)): RR^(p_(k)(u)) -> RR$;
- The *output function*
  $f_("out")^((u)): RR -> RR$.

Where $p_(l)(u) = sigma_(1), dots, sigma_(l)$ and $p_(k)(u) = theta_(1),
dots, theta_(k)$ are two lists of (real) parameters that depend on the
type and on the number of arguments of the function.

The network input function $f^((u))_("net")$ computes the network
input $"net"_(u)$ from the inputs $"in"_(u, v_(1)), dots, "in"_(u,
v_(n))$, the weights $w_(u, v_(1)), dots, w_(u, v_(n))$ and the
parameters (if any) in $p_(l)(u)$. Each input is itself the output
of a preceding neuron, meaning that $"in"_(u, v_(1)) = "out"_(v_(1)),
dots, "in"_(u, v_(n)) = "out"_(v_(n))$. The network input function is
often written with vector arguments:

$ f^((u))_("net")(bold(w)_(u), bold("in")_(u)) =
  f^((u))_("net")(w_(u, v_(1)), dots, w_(u, v_(n)), "in"_(u, v_(1)), dots, "in"_(u, v_(n))) =
  f^((u))_("net")(w_(u, v_(1)), dots, w_(u, v_(n)), "out"_(v_(1)), dots, "out"_(v_(n))) $

The activation function $f^((u))_("act")$ computes the new *activation*
$"act"_(u)$ of the neuron $u$, representing the "stimulation" that a
neuron receives. The value of this computation depends on the network
input, on the parameters (if any) in $p_(k)(u)$ and, in the case of a
recurrent neural network, on a feedback of the current activation. If
the neuron is an input neuron, its initial activation is given by the
external input $"ext"_(u)$. The value of the activation is then used
by the output function $f^((u))_("out")$ to compute the output of the
neuron.

#figure(
	caption: [A very generic depiction of the structure of a single neuron.],
	[#diagram(
		node-stroke: 1.5pt,
		node-shape: rect,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, -0.75), fill: none, stroke: none, text(font: "Noto Sans", [in#sub[u, v1]]), name: <in1>),
		node((-1.25, 0), fill: none, stroke: none, text(font: "Noto Sans", [#math.dots.v])),
		node((-1, -0.25), fill: none, stroke: none, text(font: "Noto Sans", [w#sub[u, v1]]), name: <w1>),
		node((-1, 0.25), fill: none, stroke: none, text(font: "Noto Sans", [w#sub[u, vn]]), name: <wn>),
		node((-1, 0), fill: none, stroke: none, text(font: "Noto Sans", [#math.dots.v])),
		node((-1.25, 0.75), fill: none, stroke: none, text(font: "Noto Sans", [in#sub[u, vn]]), name: <inn>),

		node((0, 0), text(font: "Noto Sans", [f#sub[net]#super[(u)]]), radius: 2em, name: <N1>),
		node((1.5, 0), text(font: "Noto Sans", [f#sub[act]#super[(u)]]), radius: 2em, name: <N2>),
		node((3, 0), text(font: "Noto Sans", [f#sub[out]#super[(u)]]), radius: 2em, name: <N3>),

		edge(<N1>, <N2>, marks: (none, "latex"), text(font: "Noto Sans", [net#sub[u]])),
		edge(<N2>, <N3>, marks: (none, "latex"), text(font: "Noto Sans", [act#sub[u]])),
		edge(<N2>, <N2>, bend: 130deg, marks: (none, "latex"), dash: "dashed", text(font: "Noto Sans", [f#sub[act]#super[(u)]])),
		edge(<N3>, (4.5, 0), marks: (none, "latex"), text(font: "Noto Sans", [out#sub[u]])),
		edge((1.5, 0.875), <N2>, marks: (none, "latex"), dash: "dashed", text(font: "Noto Sans", [#math.theta#sub[1], #math.dots, #math.theta#sub[k]])),
		edge((0, 0.875), <N1>, marks: (none, "latex"), dash: "dashed", text(font: "Noto Sans", [#math.sigma#sub[1], #math.dots, #math.sigma#sub[l]])),
		edge((0.5, -0.75), <N2>, marks: (none, "latex"), dash: "dashed", label-angle: auto, text(font: "Noto Sans", [ext#sub[u]])),
		edge(<in1>, <N1>, marks: (none, "latex")),
		edge(<w1>, <N1>, marks: (none, "latex")),
		edge(<wn>, <N1>, marks: (none, "latex")),
		edge(<inn>, <N1>, marks: (none, "latex")),
	)]
)

This structure should hint at the fact that a neural network is simply a
more generalized network of TLUs. In particular, it's possible to construct
a TLU from a neural network with the following choices of network input
function, activation function and output function for all of its neurons:

#grid(
	columns: (0.4fr, 0.3fr, 0.3fr),
	[$ f^((u))_("net")(bold(w)_(u), bold("in")_(u)) = sum_(v in "pred"(u)) w_(u, v) "in"_(u, v) $],
	[$ f_("act")^((u))("net"_(u), theta) = H("net"_(u), theta) $],
	[$ f_("out")^((u))("act"_(u)) = "act"_(u) $],
)

A single neuron can operate "in a vacuum", meaning that it can receive
input and deliver output without interfering with the operation of other
neurons. On the other hand, the neurons in a neural network depend on
each other for their input and output. For this reason, it is important
to distinguish the operational state of a neural network into an *input
phase*, in which external input is fed into the neural network, and a
*work phase*, in which the output of the neural network is computed.

In the input phase, neurons have their network input function bypassed
completely: the activation of input neurons is entirely given by the
external input, whereas other neurons have their activation set to an
arbitrary value. In addition, the output function is applied to the
activations, so that all neurons produce initial outputs, even if
meaningless. The neural network does not transition from the input
phase until all external input has been received by all input neurons.

In the work phase, the external inputs of the input neurons are
ignored and the activations and outputs of the neurons are (re)computed,
possibly multiple times, applying the network input function, the
activation function and the output function. Input neurons that have
no input from other neurons, but only from outside, simply maintain
the value of their activation. The recomputations are terminated either
if the network reaches a stable state, that is, if further recomputations
do not change the outputs of the neurons anymore, or if a predetermined
number of recomputations has been carried out.

The neural network architecture does not specify a precise order in which
the computations are to be carried out. All neurons might recompute their
outputs at the same time (*synchronous update*), drawing on the old outputs
of their predecessors, or it might be possible to define an update order
in which neurons compute their outputs one after another (*asynchronous
update*), so that the new outputs of other neurons may already be used as
inputs for subsequent computations.

For a feed forward network the computations usually follow a *topological
ordering* of the neurons. A topological ordering is an enumeration of the
vertices of a directed graph such that all edges are directed from a vertex
with a lower number to a vertex with a higher number. A topological ordering
is possible only if the graph is acyclic, which for feed forward networks
is indeed the case. Updating a feed forward network employing topological
ordering ensures that all inputs of a neuron have already been computed,
before it (re)computes its own activation and output.

/* It could be reasonable to add an example */

Note that for recurrent networks the final output may depend on the
order in which the neurons recompute their outputs as well as on how
many recomputations are carried out. This is because the number of
recomputations influences how many times (and how much) of its output
is fed back as input.

Unlike a network of TLUs, neural networks can be trained. The process is
similar to the training of a single TLU: presenting the network a set of
input-output pairs and tuning its weights and its parameters step-by-step
while minimizing an error function. Most training tasks fall into two
categories: fixed learning tasks and free learning tasks.

A *fixed learning task* $L_("fixed")$ for a neural network with $n$
input neurons $U_("in") = {u_(1), dots, u_(n)}$ and $m$ output neurons
$U_("out") = {v_(1), dots, v_(m)}$ is a set of training patterns $l =
(bold(i)^((l)), bold(o)^((l)))$, each consisting of an *input vector*
$bold(i)^((l)) = "ext"^((l))_(u_(1)), dots, "ext"^((l))_(u_(n))$ and an
*output vector* $bold(o)^((l)) = o^((l))_(v_(1)), dots, o^((l))_(v_(m))$.
_Solving_ a fixed learning task means training a neural network such that,
for all training patterns $l in L_("fixed")$, when fed $bold(i)^((l))$
as external input its output is $bold(o)^((l))$, or at least as close
as possible.

In order to determine how well a neural network solves a fixed learning
task, an error function is employed, which measures how well the outputs
of the network match the outputs in the training patterns. The cumulative
error has the following expression:

$ e = sum_(l in L_("fixed")) e^((l)) =
      sum_(v in U_("out")) e_(v) =
      sum_(l in L_("fixed")) sum_(v in U_("out")) e^((l))_(v) $

Which is the sum of the errors of each neuron with the corresponding
output in a training pattern, summed over all training patterns.

As for the choice of the error function, simply taking the difference
between the outputs of the network and the outputs in the patterns
is not a good idea, since positive and negative errors may cancel
out. A common choice of error function for fixed learning tasks is
the *Mean Squared Error function* (*MSE*):

$ e = sum_(l in L_("fixed")) (o_(v_(1))^((l)) - "out"_(v_(1))^((l)))^(2) + dots + (o_(v_(m))^((l)) - "out"_(v_(m))^((l)))^(2) 
    = sum_(l in L_("fixed")) sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l)))^(2) $

That is, the sum over all training examples of the squared difference
between the outputs in the given patterns and the outputs of the network.
This type of error function has the advantage of being differentiable
everywhere, which means that it is easy to optimize (zeroing its
gradient).

A fixed learning task is considered solved when the value of the error
function is sufficiently small (or, ideally, $0$). Note how the error
function is not computed one pattern at a time, but instead after all
patterns have been presented to the network. This is necessary to guarantee
that the training process actually converges.

A *free learning task* $L_("free")$ for a neural network with $n$ input
neurons $U_("in") = {u_(1), dots, u_(n)}$ is a set of training patterns
$l = (bold(i)^((l)), bold(o)^((l)))$, each consisting of an *input vector*
$bold(i)^((l)) = "ext"^((l))_(u_(1)), dots, "ext"^((l))_(u_(n))$. Solving
a free learning task is trickier, because there are no outputs in the
training pattern to which the output of the neural network can be compared.
Informally speaking, a free learning task is solved when similar inputs are
consistently mapped to similar outputs. This is often done with the help of
so-called *distance functions*.

Fixed learning tasks are also referred to as *supervised learning*,
where the term "supervised" hints at the fact that the values of
the weights and parameters of the neural network are tuned under
the "guidance" of the output vector. On the other hand, free learning
tasks are also referred to as *unsupervised learning*, because there
is no counterexample (no "guidance") that can test the quality of the
output of the neural network.

It is advisable to normalize the external inputs of a neural network
to prevent biases during the training session. If the inputs have
very different orders of magnitude, the training process will be
skewed. Given the mean and standard deviation of the external input
of each $k$-th (input) neuron:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ mu_(k) = frac(1, abs(L)) sum_(l in L) "ext"_(u_(k))^((l)) $],
	[$ sigma_(k) = sqrt(frac(1, abs(L)) sum_(l in L) ("ext"_(mu_(k))^((l)) - mu_(k))^(2)) $]
)

The normalized external input is given by:

$ overline("ext")_(u_(k))^((l)) = frac("ext"_(u_(k))^((l)) - mu_(k), sigma_(k)) $

This normalization can be carried out as a preprocessing step (before
feeding it to the network) or, in a feed forward network, by the output
function of the input neurons.

The artificial neural network architecture has been constructed with
real numbers in mind (all three functions have the real numbers as
both domain and codomain). However, it is possible to have neural
networks manipulate nominal attributes as long as they can be encoded
into numbers.

The most intuitive way to do so would be to take the different
modes of the attribute and assign to each one of them an integer
value. The problem of this approach is that it makes little sense
to use an encoding implying an order when the attribute does not.
A better solution is what is called *1-in-n encoding*, where to
each mode of the attribute is assigned a binary string of length
equal to the number of possible modes. Such strings are all $0$
except for a single $1$, different from mode to mode. This way,
all possible values are equally taken into account in a completely
unbiased way.
