#import "../../AI_definitions.typ": *

@Multilayer-perceptron-approximates-Riemann induces a method for
constructing a multilayer perceptron of $4$ layers that can approximate
any function with arbitrary accuracy. However, as already stated this
doesn't mean that said construction is the most efficient. An often
cited example is the $n$-bit even parity function, the binary function
defined as:

$ p_(n)(x_(1), dots, x_(n)) = cases(1 "if an even number of inputs is" 1,
                                    0 "if an odd number of inputs is" 1) $

It is possible to construct a network of TLUs (which is just a
particular declination of a multilayer perceptron) that can encode
this function using the presented algorithm. However, the number of
hidden neurons needed would be $2^(n - 1)$, because $p(n)$ written
in DNF is a disjunction of $2^(n - 1)$ disjunctions. This means that
the total number of neurons would be $2^(n - 1) + n + 1$.

#exercise[
	What would be the DNF for the $n$-bit parity function with $n = 3$?
]
#solution[
	$ (x_(1) and x_(2) and (not x_(3))) or
	  (x_(1) and (not x_(2)) and x_(3)) or
	  ((not x_(1)) and x_(2) and x_(3)) or
	  ((not x_(1)) and (not x_(2)) and (not x_(3))) $
]

There is, however, a cleverer approach to encoding the same function.
The idea is to chain together $n − 1$ simple networks for computing the
biimplication and the exclusive or. The first of these networks combines
two inputs with a biimplication network. Each of the remaining $n − 2$
networks applies the exclusive or to the output of the preceding network
and to another input. Since both the biimplication and the exclusive
or require a total of three neurons, the number of hidden neurons is
$3(n - 1) - 1$. This means that the total number of neurons would be
$n + 3(n - 1) - 1 + 1 = 4n - 3$.

#exercise[
	What would be a multilayer perceptron that encodes the $n$-bit even
	parity function with $n = 3$?
]
#solution[
	The number of neurons needed is $4 dot 3 - 3 = 9$.

	#figure(
		caption: [A multilayer perceptron that encodes the $3$-bit even parity function.],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-2, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((-2, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-2, 1.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[3]])),

			node((-1, 0.5), stroke: 1.5pt + green, radius: 2em, name: <I1>),
			node((-1, -0.5), stroke: 1.5pt + green, radius: 2em, name: <I2>),
			node((-1, 1.5), stroke: 1.5pt + green, radius: 2em, name: <I3>),
			node((0, 0.5), text(font: "Noto Sans", [-1]), radius: 2em, name: <H1>),
			node((0, -0.5), text(font: "Noto Sans", [+1]), radius: 2em, name: <H2>),
			node((1, 0), text(font: "Noto Sans", [+1]), radius: 2em, name: <H3>),
			node((0, 1.5), text(font: "Noto Sans", [-1]), radius: 2em, name: <H4>),
			node((1, 1), text(font: "Noto Sans", [+1]), radius: 2em, name: <H5>),
			node((2, 0.5), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [-1]), radius: 2em, name: <O1>),

			edge((-2, 0.5), <I1>, marks: (none, "latex")),
			edge((-2, -0.5), <I2>, marks: (none, "latex")),
			edge((-2, 1.5), <I3>, marks: (none, "latex")),
			edge(<I1>, <H1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<I2>, <H1>, marks: (none, "latex"), label-pos: 0.25, label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<I1>, <H2>, marks: (none, "latex"), label-pos: 0.25, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<I2>, <H2>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<I3>, <H4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<H1>, <H3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<H2>, <H3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<H3>, <H5>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<H4>, <H5>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<H5>, <O1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-1])),
			edge(<O1>, (3, 0.5), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)]
	)
]

// FIXME: Not exactly the construction espoused by the textbook but correct nonetheless

In the first case, the multilayer perceptron always has $3$ layers
(one input, one hidden, one output) but the total number of neurons 
scales exponentially with the number of inputs. In the second case,
both the number of layers and the total number of neurons scales
linearly. For large values of $n$, the advantage is noticeable: with
$n = 10$, a $3$-layer perceptron would need $2^(10 - 1) + 10 + 1 =
523$ neurons, while a multilayer perceptron build with the second
approach would need $4 dot 10 - 3 = 37$ neurons.

Using more than one hidden layer promises, in many cases, to give the
same result for the same task (if not better) as a $3$-layer of $4$-layer
perceptron. This is the focus of the area of *deep learning*, where the
"depth" of a neural network is the length of the longest path in the
graph underlying the network. In the case of multilayer perceptrons, a
feed-forward neural network where elements of the same layer cannot be
connected, the depth is the number of hidden layers plus one (the output
layer).

The first concern of deep learning is preventing overfitting. Overfitting
is mainly caused from the fact that, having many hidden layers and hence
many parameters, the network is much more vulnerable to picking up biases
from the training examples. Overfitting can be addressed with *weight
decay*, which prevents overly large weights and thus an overly precise
adaptation to (accidental) properties of the data. Another solution is
introducing sparsity constraints, either in the form of a restricted
number of neurons in the hidden layers or by requiring that only few of
the neurons in the hidden layers should be active (on average). The
latter is usually achieved by adding a regularization term to the error
function, which compares the observed number of activated neurons with
the desired low number and pushes the adaptations into a direction that
tries to match these numbers. A simple yet effective method for taming
overfitting is the so-called *dropout training*, which consists in
disabling some hidden neurons at random during each forward and backward
propagation iteration.

// FIXME: Weight decay and sparsity constraints aren't clear.

Another concern of deep learning is preventing *vanishing gradients*.
The phenomena of vanishing gradients occurr when the first hidden
layers (the ones closer to the input layer) receive an adaptation
from the backpropagation that is much smaller in magnitude than the
adaptation received by the last hidden layers (the ones closer to
the output layer), and hence remain mostly random.

This is a known problem especially when the employed activation
function is the logistic function, since its derivative is bounded
by $1 slash 4$. Vanishing gradient happens because the logistic
function is a _contracting_ function, meaning that for any $x, y$,
$abs(x - y) > abs(f_("act")(x) - f_("act")(y))$. In words, the
distance between the arguments of the logistic function is always
bigger than the distance between the images. Since its derivative
is itself times one minus itself, every time a new derivative is
added to the chain of multiplications, the maximum value that is
can attain becomes smaller and smaller. This is precisely what
happens in the latter stages of backpropagation, where the chain
of multiplications is longer.

A drastic approach to the vanishing gradient problem is to use an
activation function that does not suffer from the contraction problem
as much. These functions aren't necessarely sigmoids, but this is not
an issue as long as they are differentiable everywhere. One class of
such functions is the *rectified linear units* (*ReLU* s), whose most
notable representative is the *rectified maximum*:

#figure(
    caption: [Plot of the rectified maximum, with three different
              choices of $theta$],
    [#image("rectified_maximum.svg", width: 66%)]
)

Another ReLU that is often employed is the *softplus*:

#figure(
    caption: [Plot of the softplus, with three different choices of
              $theta$],
    [#image("softplus.svg", width: 66%)]
)

For many choices of inputs, the derivative of these functions are
actually relatively close to $1$, meaning that it's much more likely
to "ripple back" a sizeable gradient. These can cause the opposite
problem, called *exploding gradient*, meaning that the updates of
the first hidden layers are much bigger in magnitude than the updates
of the last hidden layers.

A completely different approach consists in building the multilayer
perceptron one layer at a time, training only the newly added layer
in each step. A very popular specific procedure for this is to build
the network as *stacked autoencoders*.

An autoencoder is a $3$-layer perceptron that maps its inputs to an
approximation of those same inputs. The hidden layers _encodes_ the
data coming the input into a form internal representation, which is
then _decoded_ by the output layer. Autoencoders can be trained with
standard backpropagation, since there is only one hidden layer and
therefore the vanishing gradient problem does not arise.

The rationale of training an autoencoder is that the hidden layer is
expected to construct features (that capture the information contained
in the input data in a compressed form, so that the input can be well
reconstructed from it. As a matter of fact, an autoencoder is analogous
to applying a dimensionality reduction technique, having "raw" data as
input and extracting the most relevant features from said input.

#figure(
	caption: [Structure of a generic autoencoder. The output is a
	          reconstructed version of the input.],
	[#diagram(
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((0, -1.5), stroke: 1.5pt + blue, radius: 2em, name: <I1>),
		node((0, -0.5), stroke: 1.5pt + blue, radius: 2em, name: <I2>),
		node((0, 0.5), stroke: 1.5pt + blue, radius: 2em, name: <I3>),
		node((0, 1.5), stroke: 1.5pt + blue, radius: 2em, name: <I4>),

		edge((-1, -1.5), <I1>, marks: (none, "latex")),
		edge((-1, -0.5), <I2>, marks: (none, "latex")),
		edge((-1, 0.5), <I3>, marks: (none, "latex")),
		edge((-1, 1.5), <I4>, marks: (none, "latex")),

		node((1.5, 1), stroke: 1.5pt + green, radius: 2em, name: <H1>),
		node((1.5, 0), stroke: 1.5pt + green, radius: 2em, name: <H2>),
		node((1.5, -1), stroke: 1.5pt + green, radius: 2em, name: <H3>),

		edge(<I1>, <H1>, marks: (none, "latex")),
		edge(<I1>, <H2>, marks: (none, "latex")),
		edge(<I1>, <H3>, marks: (none, "latex")),
		edge(<I2>, <H1>, marks: (none, "latex")),
		edge(<I2>, <H2>, marks: (none, "latex")),
		edge(<I2>, <H3>, marks: (none, "latex")),
		edge(<I3>, <H1>, marks: (none, "latex")),
		edge(<I3>, <H2>, marks: (none, "latex")),
		edge(<I3>, <H3>, marks: (none, "latex")),
		edge(<I4>, <H1>, marks: (none, "latex")),
		edge(<I4>, <H2>, marks: (none, "latex")),
		edge(<I4>, <H3>, marks: (none, "latex")),

		node((3, 1.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <O1>),
		node((3, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <O2>),
		node((3, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <O3>),
		node((3, -1.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <O4>),

		edge(<H1>, <O1>, marks: (none, "latex")),
		edge(<H1>, <O2>, marks: (none, "latex")),
		edge(<H1>, <O3>, marks: (none, "latex")),
		edge(<H1>, <O4>, marks: (none, "latex")),
		edge(<H2>, <O1>, marks: (none, "latex")),
		edge(<H2>, <O2>, marks: (none, "latex")),
		edge(<H2>, <O3>, marks: (none, "latex")),
		edge(<H2>, <O4>, marks: (none, "latex")),
		edge(<H3>, <O1>, marks: (none, "latex")),
		edge(<H3>, <O2>, marks: (none, "latex")),
		edge(<H3>, <O3>, marks: (none, "latex")),
		edge(<H3>, <O4>, marks: (none, "latex")),

		edge(<O1>, (4, 1.5), marks: (none, "latex")),
		edge(<O2>, (4, 0.5), marks: (none, "latex")),
		edge(<O3>, (4, -0.5), marks: (none, "latex")),
		edge(<O4>, (4, -1.5), marks: (none, "latex"))
	)]
)

The number of neurons in the hidden layer of an autoencoder is a crucial
choice for its effectiveness. If the number of neurons is equal or larger
than the input neurons, it is much more likely that the reconstructed input
won't be that different from the original input, because the entirety of
the contained information is kept.

The first approach is simply to choose less hidden neurons than input
neurons, in order to purposefuly loose part of the information and force
the network to learn only what's relevant. This shifts the question to
how many hidden neurons should be chosen. Using cross-validation to find
the optimal number of neurons would be misleading, because the number of
neurons that gives the smallest error is most likely the one that matches
the number of inputs: this is precisely not what is desired, because a
certain discrepancy between the encoded data and the decoded data is
actually desireable.

A second commonly used approach is a sparse activation scheme, as it
was done to avoid overfitting. The number of hidden neurons with a high
activation is restricted to a small number, which is enforced by either
adding a regularization term to the error function that punishes a larger
number of active hidden neurons or by explicitly deactivating all but a
few neurons with the highest activations.

A third approach is to purposefully add noise to the input (only to the
input of the autoencoder, not to the input used to evaluate its encoding
and decoding at the end of the process). These are called *denoising
autoencoders*, because the autoencoder to be trained is expected to map
the input with noise to (a copy of) the input without noise, "cleaning"
the data and only keeping what's needed. Noise can also help prevent
overfitting, especially if the added noise is different from training
epoch to training epoch, so that the network cannot become acquainted
to a specific noise.

A multilayer perceptron made of stacked autoencoders is constructed
as follows. First, an autoencoder is built and trained with standard
backpropagation on the given training data (the one intended for the
perceptron as a whole). The output layer is discarded and only the
hidden layer is kept, together with its incoming weights. A new
dataset is produced by feeding the input data through this layer and
using the activation of the neurons as a the new data.

The process is then repeated, training a new autoencoder on this data,
keeping only the hidden layer and the incoming weights, producing new
data from its activation, ecc... at each step, the goal is for the
autoencoders to extract more and more relevant and high-level features.
Training these single autoencoders in isolation circumvents the vanishing
gradient problem because they have only $3$ layers.

Finally, all hidden layers and incoming weights constructed so far
are chained together ("stacked", hence the name) in the same order
as they were created. The final touch is to add an output layer and
train the entire network on the original data: in this final training
run the vanishing gradient problem is less severe, because only the
output layer needs to be tuned. The earlier hidden layers have been
trained already, and even if the gradient vanishes this is not a much
of an issue because their optimal parameters have most likely been
found already.

// FIXME: add convolutional neural network
