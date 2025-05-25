#import "../AI_definitions.typ": *

An *artificial neural network*, or simply *neural network*, is a
directed graph $G = (U, C)$, whose vertices $u in U$ are called
*neurons* or *units* and whose edges $c in C$ are called *connections*.

Each connection $(v, u) in C$ carries a *weight* $w_(u, v)$. The set
$U$ of vertices is partitioned into three: a set $U_("in")$ of *input
neurons*, a set $U_("out")$ of *output neurons* and a set $U_("hidden")$
of *hidden neurons*. The set of hidden neurons can be empty, whereas the
set of input and output neurons cannot. The set of input and output
neurons may not be disjoint.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ U = U_("in") inter U_("out") inter U_("hidden") $],
	[$ U_("in") != emptyset,
	   U_("out") != emptyset,
	   U_("hidden") inter (U_("in") inter U_("out")) = emptyset $]
)

The input neurons receive information from the environment in the form of
the external input, whereas the output neurons release the information
processed by the network. The hidden neurons do not communicate with the
environment directly, but only with other neurons, hence the name "hidden".
By extension, the (external) input of a neural network is simply the
external input fed to its input neurons. Similarly, the output of a neural
network is the output of all of its output neurons.

It is customary to denote the ending node of the connection before the
starting node, and not vice versa. That is, a weight $w_(u, v)$ is carried
by a connection ending in $u$ and starting in $v$, not the other way around.
The weights of a neural network are collected into a matrix where all the
weights of connections that lead to the same neuron are arranged into the
same row. This way, the neurons and their outgoing connections are to be
read entrywise. The matrix and the corresponding weighted graph are called
the *network structure*.

#exercise[
	Let $G = (V, E)$ an artificial neural network, where $V = {U_(1), U_(2),
	U_(3), U_(4)}$ and $E = {(U_(1), U_(2), 1), (U_(1), U_(3), 4), (U_(2),
	U_(3), 3), (U_(3), U_(1), -2), (U_(3), U_(4), -2), (U_(4), U_(2), 1)}$.
	$U_(1)$ and $U_(2)$ are input neurons with one input, $x_(1)$ and $x_(2)$
	respectively, whereas $U_(3)$ is an output neuron. Represent it both as
	matrix and as graph.
] <Neural-network>
#solution[
	#set math.mat(delim: "[")

	#grid(
		columns: (0.5fr, 0.5fr),
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
			edge(<U1>, <U2>, marks: (none, "latex"), text(font: "Noto Sans", [1])),
			edge(<U2>, <U3>, marks: (none, "latex"), text(font: "Noto Sans", [3])),
			edge(<U1>, <U3>, marks: (none, "latex"), bend: -20deg, text(font: "Noto Sans", [-2])),
			edge(<U3>, <U1>, marks: (none, "latex"), bend: -20deg, text(font: "Noto Sans", [4])),
			edge(<U3>, <U4>, marks: (none, "latex"), text(font: "Noto Sans", [-2])),
			edge(<U4>, <U2>, marks: (none, "latex"), text(font: "Noto Sans", [1])),
			edge(<U3>, (2.5, -1), marks: (none, "latex")),
		)],
		[$ mat(infinity, infinity, 4, infinity;
		       1, infinity, infinity, 1;
		       -2, 3, infinity, infinity;
		       infinity, infinity, -2, infinity) $]
	)
]

If the graph describing a neural network is acyclic (has no loops and no
directed cycles), it is referred to as a *feed forward neural network*.
If, on the other hand, it is cyclic, it is referred to as a *recurrent
network*. The difference between the two is the flow of information:
in a feed forward neural network, the information can only flow from
the input neurons to the hidden neurons (if any) to the output neurons,
meaning that it can only go "forward", whereas in a recurrent network
the information can be fed back into the network.

To each neuron $u in U$ are assigned three real-valued quantities: the
*network input* $"net"_(u)$, the *activation* $"act"_(u)$, and the *output*
$"out"_(u)$. Each input neuron $u in U_("in")$ has a fourth quantity, the
*external input* $"ext"_(u)$.

Each neuron $u in U$ also possesses three functions:

- *network input function* $f_("net")^((u)): RR^(2|"pred"(u)| + sigma(u)) -> RR$;
- *activation function* $f_("act")^((u)): RR^(theta(u)) -> RR$;
- *output function* $f_("out")^((u)): RR -> RR$.

Where $sigma(u)$ and $theta(u)$ are generic (real) parameters that
depend on the type and on the number of arguments of the function.

#figure(
	caption: "Structure of a neuron",
	[#diagram(
		node-stroke: 1.5pt,
		node-shape: rect,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.25, -0.75), fill: none, stroke: none, text(font: "Noto Sans", [out#sub[v1] = in#sub[u, v1]]), name: <in1>),
		node((-1.25, 0), fill: none, stroke: none, text(font: "Noto Sans", [#math.dots.v])),
		node((-1, -0.25), fill: none, stroke: none, text(font: "Noto Sans", [w#sub[u, v1]]), name: <w1>),
		node((-1, 0.25), fill: none, stroke: none, text(font: "Noto Sans", [w#sub[u, vn]]), name: <wn>),
		node((-1, 0), fill: none, stroke: none, text(font: "Noto Sans", [#math.dots.v])),
		node((-1.25, 0.75), fill: none, stroke: none, text(font: "Noto Sans", [out#sub[vn] = in#sub[u, vn]]), name: <inn>),

		node((0, 0), text(font: "Noto Sans", [f#sub[net]#super[(u)]]), radius: 2em, name: <N1>),
		node((1.5, 0), text(font: "Noto Sans", [f#sub[act]#super[(u)]]), radius: 2em, name: <N2>),
		node((3, 0), text(font: "Noto Sans", [f#sub[out]#super[(u)]]), radius: 2em, name: <N3>),

		edge(<N1>, <N2>, marks: (none, "latex"), text(font: "Noto Sans", [net#sub[u]])),
		edge(<N2>, <N3>, marks: (none, "latex"), text(font: "Noto Sans", [act#sub[u]])),
		edge(<N2>, <N2>, bend: 130deg, marks: (none, "latex"), dash: "dashed", text(font: "Noto Sans", [f#sub[act]#super[(u)]])),
		edge(<N3>, (4.5, 0), marks: (none, "latex"), text(font: "Noto Sans", [out#sub[u]])),
		edge((1.5, 0.875), <N2>, marks: (none, "latex"), dash: "dashed", text(font: "Noto Sans", [#math.theta#sub[1], #math.dots, #math.theta#sub[k]])),
		edge((0, 0.875), <N1>, marks: (none, "latex"), dash: "dashed", text(font: "Noto Sans", [#math.sigma#sub[1], #math.dots, #math.sigma#sub[l]])),
		edge((0.5, -0.75), <N2>, marks: (none, "latex"), dash: "dashed", text(font: "Noto Sans", [ext#sub[u]])),
		edge(<in1>, <N1>, marks: (none, "latex")),
		edge(<w1>, <N1>, marks: (none, "latex")),
		edge(<wn>, <N1>, marks: (none, "latex")),
		edge(<inn>, <N1>, marks: (none, "latex")),
	)]
)

The network input function process the inputs $"in"_(u, v_(1)), dots,
"in"_(u, v_(n))$ of the neuron $u$, which are themselves the output
$"out"_(v_(1)), dots, "out"_(v_(n))$ of other neurons, and the weights
$w_(u, v_(1)), dots, w_(u, v_(n))$, merging the result into the network
input $"net"_(u)$. The simplest formulation of the network input function
is a weighted summation of the products of each weight and each input.

The network input is then fed into the activation function, that processes
the "raw" network input into a degree of solicitation of the neuron. In some
models of neurons, the activation is fed back to the activation function
itself. In the case of input neurons, the external input is merged with the
activation. A notable example of parameter for activation functions is, as
is the case for TLUs, a threshold.

The output function decides, based on the activation value it has been fed,
what the output will be (whether the neuron will fire or not). In general,
functions of this sort "quash" the network input in a "nicer" interval, and
many functions with these traits exist (stepwise functions, logaritmic
functions, ecc...). The simplest formulation of an output function is the
identity function.

#exercise[
	Consider @Neural-network. Write a network input function, an activation
	function and an output function for all neurons.
] <Neural-network-2>
#solution[
	Using the weighted sum of the output of their predecessors as inputs,
	the network input function can be written as:

	$ f_("net")^((u))(w_(u, v 1), dots, w_(u, v n), "in"_(u, v 1), dots, "in"_(u, v n)) =
	  w_(u, v 1) dot "in"_(u, v 1) + dots + w_(u, v n) dot "in"_(u, v n) =
	  sum_(v in "pred"(u)) w_(u, v) dot "in"_(u, v) $

	Given a threshold $theta$, the activation function can be written as:

	$ f_("act")^((u)) ("net"_(u), theta) =
	  cases(1 & "if" "net"_(u) gt.eq theta,
	        0 & "otherwise") $

	Using the identity function as output function:

	$ f_("out")^((u))("act"_(u)) = "act"_(u) $
]

A single neuron can operate "in a vacuum", meaning that it can receive
input and deliver output without interfering with the operation of other
neurons. On the other hand, the neurons in a neural network depend on
each other for their input and output. For this reason, it is important
to distinguish the operational state of a neural network into an *input
phase*, in which external input is fed into the neural network, and a
*work phase*, in which the output of the neural network is computed.

In the input phase, neurons have their network input function bypassed
completely: the activation of input neurons is entirely given by the
external input fed from outside, whereas other neurons have their
activation set to an arbitrary value. In addition, the output function
is applied to the activations, so that all neurons produce initial
outputs, even if not necessarely meaningful. The neural network does
not move from the input phase until all external input has been received
by all input neurons.

In the work phase, the external inputs of the input neurons are blocked
and the activations and outputs of the neurons are (re)computed, applying
the network input function, the activation function and the output function
in the described order. Input neurons that have no input from other neurons,
but only from outside, simply maintain the value of their activation. The
recomputations are terminated either if the network reaches a stable state,
that is, if further recomputations do not change the outputs of the neurons
anymore, or if a predetermined number of recomputations has been carried out.

The order is which recomputations are carried out varies from neural network
to neural network. All neurons might recompute their outputs at the same time
(*synchronous update*), drawing on the old outputs of their predecessors, or
it might be possible to define an update order in which neurons compute their
outputs one after another (*asynchronous update*), so that the new outputs of
other neurons may already be used as inputs for subsequent computations.

For a feed forward network the computations usually follow a *topological
ordering* of the neurons, as no redundant computations are carried out in
this way. Note that for recurrent networks the final output may depend on
the order in which the neurons recompute their outputs as well as on how
many recomputations are carried out.

#exercise[
	Consider @Neural-network-2. Let the initial output be $x_(1) = 1$,
	$x_(2) = 0$. Does the neural network reach a stable state if employing
	the ordering $u_(4), u_(3), u_(1), u_(2)$? And how about the ordering
	$u_(4), u_(3), u_(2), u_(1)$?
]
// #solution[
//
// ]

Like TLUs, neural networks can also be trained, by tuning its weights and
its parameters so that a certain criterion is optimized (that is, an error
function of sort is minimized). The way a neural network is trained depends
on the optimization criteria and on the type of the training data, but all
training tasks can be distinguished into two types: fixed learning tasks
and free learning tasks.

A *fixed learning task* $L_("fixed")$ for a neural network with $n$
input neurons $U_("in") = {u_(1), dots, u_(n)}$ and $m$ output neurons
$U_("out" = {v_(1), dots, v_(m)}$ is a set of training patterns $l =
bold(i)^((l)), bold(o)^((l))$, each consisting of an *input vector*
$bold(i)^((l)) = "ext"^((l))_(u 1), dots, "ext"^((l))_(u n)$ and an
*output vector* $bold(o)^((l)) = o^((l))_(v 1), dots, o^((l))_(v m)$.

A fixed learning task prescribes training a neural network such that
its output (the output of its output neurons) is, for all training
patterns $l in L_("fixed")$, as close as possible to the output vector
$bold(o)^((l))$ when fed $bold(i)^((l))$ as external input.

Unlike TLUs, training neural networks almost surely necessitates some
degree of approximation. This is quantified by an error function, an
estimate of the average deviation between the outputs of the network
(the "estimated" outputs) and the outputs from the data (the "actual"
outputs). The error function should not be computed from pattern to
pattern, but instead after all the patterns are presented to the network,
so that the result takes all of them into account and the result does
actually converge.

A fixed learning task is considered complete when the value of the
error function is sufficiently small. This is done by repeating the
input and work phase of the neural network over and over. Fixed learning
tasks are also referred to as *supervised learning*, where the term
"supervised" hints at the fact that the values of the weights and
parameters of the neural network are tuned under the "guidance" of
the output vector.

Of course, simply taking the difference between the outputs of the network
and the outputs from the data does not make a good error function, since
positive and negative errors may even each other out. A common choice for
the error function for fixed learning tasks is the *Mean Squared Error
function* (*MSE*):

$ e = sum_(l in L_("fixed")) e^((l))
    = sum_(l in L_("fixed")) (o_(v 1)^((l)) - "out"_(v 1)^((l)))^(2) + dots + (o_(v m)^((l)) - "out"_(v m)^((l)))^(2) 
    = sum_(l in L_("fixed")) sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l)))^(2) $

That is, the sum over all training examples of the squared difference
between the outputs in the given data and the outputs of the network.
This type of error function has the advantage of being differentiable
everywhere, which means that it is easy to optimize (computing its
derivative and setting it to $0$).

A *free learning task* $L_("free")$ for a neural network with $n$ input
neurons $U_("in") = {u_(1), dots, u_(n)}$ is a set of training patterns
$l = bold(i)^((l)), bold(o)^((l))$, each consisting of an *input vector*
$bold(i)^((l)) = "ext"^((l))_(u 1), dots, "ext"^((l))_(u n)$.

In free learning tasks, the network does not have a output vector to
compare its output with, and has some degree of freedom (hence the name
"free") in choosing its outputs. However, this does not means that said
outputs should be random; instead, a neural network should strive to
produce similar outputs for similar inputs. Ideally, similar outputs
should be clustered into highly coese groups, with little distance between
its members.

Free learning tasks are also referred to as *unsupervised learning* since,
unlike supervised learning, there is no counterexample (no "guidance") to
test whether the output of the neural network is desireable or not.

It is advisable to normalize the inputs of a neural network, especially
with respect to the way neural networks are trained: if some of the inputs
are order of magnitude bigger than the others, those inputs will skew the
training of the network in their favour. Normalizing the inputs of a neural
network entails, as expected, dividing each input by the mean of the input
and dividing the result by the standard deviation:

$ "ext"_(u k)^((l) ("new")) =
  frac("ext"_(u k)^((l) ("old")) - mu_(k), sigma_(k)) =
  frac("ext"_(u k)^((l) ("old")) - frac(1, abs(L)) sum_(l in L) "ext"_(u k)^((l)),
       sqrt(frac(1, abs(L)) sum_(l in L) ("ext"_(mu_(k))^((l)) - mu_(k)))) $

This way, the arithmetic mean of the input will be $1$ and the variance
will be $0$. This normalization can be carried out as a preprocessing
step or (in a feed forward network) by the output function of the input
neurons.

It is reasonable to deal with neural networks having (real) numbers
as input and output. However, it is possible to have neural networks
manipulate nominal attributes. A reasonable assumption would be to
associate an integer to each possible value of the attribute, but
this is a poor choice, because it makes little sense to use an encoding
implying an order when the attribute does not. A better approach is what
is called *1-in-n encoding*, where each value of the attribute is assigned
a binary string of length equal to the number of possible attributes
constituted of all $0$ except for a single $1$. This way, all possible
values are equally taken into account.
