#import "../../AI_definitions.typ": *

An *r-layer perceptron*, or *multilayer perceptron* (*MLP* for short) is
the most well-known class of feed-forward neural networks, whose neurons
can be arranged into $r$ "stacks", or *layers*. A feed-forward neural
network is classified as a multilayer perceptron if it possesses the
following characteristics:

- Input neurons cannot also be output neurons, and vice versa: $U_("in")
  inter U_("out") = emptyset$;
- Each of the $r - 2$ hidden layers must be disjointed with the others:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ U_("hidden") = U_("hidden")^((1)) union dots union U_("hidden")^((r - 2)) = union.big_(i = 1)^(r - 2) U_("hidden")^((i)) $],
    [$ U_("hidden")^((i)) inter U_("hidden")^((j)) = emptyset, space forall i, j in {1, dots, r - 2} $]
  )

  That is, no hidden neuron can belong to more than one hidden layer at
  the same time;
- Connections can only exist between nodes of subsequent layers. There
  cannot be connections between two layers that aren't adjacent and there
  cannot be connections between nodes of the same layer #footnote[Some
  sources also require that each node of a layer is connected to each
  node of the following layer.]:

  $ C subset.eq (U_("in") times U_("hidden")^((1))) union
                (union.big_(i = 1)^(r - 3) U_("hidden")^((i)) times U_("hidden")^((i + 1))) union
                (U_("hidden")^((r - 2)) times U_("out")) $

- The output function of any neuron is the identity function;
- The network input function and the activation function of input neurons
  are the identity function (input neurons propagate the external input
  unchanged);
- The network input function of hidden neurons is the weighted sum of
  their inputs and the corresponding weights:

  $ forall u in U_("hidden") union U_("out"), space
    f_("net")^((u))(w_(u_(1)), dots, w_(u_(n)), "in"_(u_(1)), dots, "in"_(u_(n))) =
    f_("net")^((u))(bold(w)_(u), bold("in")_(u)) =
    sum_(v in "pred"(u)) w_(u, v) dot "out"_(v) $

- The activation function of hidden neurons is a *sigmoid function*, meaning
  any monotonical non-decreasing function in the form:

  $ f : RR mapsto [0, 1], space
    "with" lim_(x -> -infinity) f(x) = 0 space
    "and" lim_(x -> +infinity) f(x) = 1 $

  These functions have a characteristic S-shape;
- The activation function of output neurons is either a sigmoid function or
  any linear function $f_("act")("net", theta) = alpha "net" - theta$, with
  $alpha in RR$.

Note how a multilayer perceptron is very close to a network of TLUs. As a
matter of fact, the only difference is that the activation function of a
multilayer perceptron is not a binary function.

#figure(
  caption: "Structure of a generic multilayer perceptron",
  [#diagram(
    edge-stroke: 1.5pt,
    spacing: 4em,

    node((0, -1), stroke: 1.5pt + blue, radius: 2em, name: <I1>),
    node((0, 0), stroke: 1.5pt + blue, radius: 2em, name: <I2>),
    node((0, 1), stroke: 1.5pt + blue, radius: 2em, name: <I3>),

    edge((-1, -1), <I1>, marks: (none, "latex")),
    edge((-1, 0), <I2>, marks: (none, "latex")),
    edge((-1, 1), <I3>, marks: (none, "latex")),

    node((1.5, 1.5), stroke: 1.5pt + green, radius: 2em, name: <H1>),
    node((1.5, 0.5), stroke: 1.5pt + green, radius: 2em, name: <H2>),
    node((1.5, -0.5), stroke: 1.5pt + green, radius: 2em, name: <H3>),
    node((1.5, -1.5), stroke: 1.5pt + green, radius: 2em, name: <H4>),

    edge(<I1>, <H1>, marks: (none, "latex")),
    edge(<I1>, <H2>, marks: (none, "latex")),
    edge(<I1>, <H3>, marks: (none, "latex")),
    edge(<I1>, <H4>, marks: (none, "latex")),
    edge(<I2>, <H1>, marks: (none, "latex")),
    edge(<I2>, <H2>, marks: (none, "latex")),
    edge(<I2>, <H3>, marks: (none, "latex")),
    edge(<I2>, <H4>, marks: (none, "latex")),
    edge(<I3>, <H1>, marks: (none, "latex")),
    edge(<I3>, <H2>, marks: (none, "latex")),
    edge(<I3>, <H3>, marks: (none, "latex")),
    edge(<I3>, <H4>, marks: (none, "latex")),

    node((3, 1.5), stroke: 1.5pt + green, radius: 2em, name: <H5>),
    node((3, 0.5), stroke: 1.5pt + green, radius: 2em, name: <H6>),
    node((3, -0.5), stroke: 1.5pt + green, radius: 2em, name: <H7>),
    node((3, -1.5), stroke: 1.5pt + green, radius: 2em, name: <H8>),

    edge(<H1>, <H5>, marks: (none, "latex")),
    edge(<H1>, <H6>, marks: (none, "latex")),
    edge(<H1>, <H7>, marks: (none, "latex")),
    edge(<H1>, <H8>, marks: (none, "latex")),
    edge(<H2>, <H5>, marks: (none, "latex")),
    edge(<H2>, <H6>, marks: (none, "latex")),
    edge(<H2>, <H7>, marks: (none, "latex")),
    edge(<H2>, <H8>, marks: (none, "latex")),
    edge(<H3>, <H5>, marks: (none, "latex")),
    edge(<H3>, <H6>, marks: (none, "latex")),
    edge(<H3>, <H7>, marks: (none, "latex")),
    edge(<H3>, <H8>, marks: (none, "latex")),
    edge(<H4>, <H5>, marks: (none, "latex")),
    edge(<H4>, <H6>, marks: (none, "latex")),
    edge(<H4>, <H7>, marks: (none, "latex")),
    edge(<H4>, <H8>, marks: (none, "latex")),

    node((4.5, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <O1>),
    node((4.5, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <O2>),

    edge(<H5>, <O1>, marks: (none, "latex")),
    edge(<H5>, <O2>, marks: (none, "latex")),
    edge(<H6>, <O1>, marks: (none, "latex")),
    edge(<H6>, <O2>, marks: (none, "latex")),
    edge(<H7>, <O1>, marks: (none, "latex")),
    edge(<H7>, <O2>, marks: (none, "latex")),
    edge(<H8>, <O1>, marks: (none, "latex")),
    edge(<H8>, <O2>, marks: (none, "latex")),

    edge(<O1>, (5.5, -0.5), marks: (none, "latex")),
    edge(<O2>, (5.5, 0.5), marks: (none, "latex"))
  )]
)

There are many functions that can be classified as sigmoids. The simplest
one is the *Heaviside function*, or *step function*, that returns $1$ for
all values greater than a given argument $theta$ and $0$ otherwise:

$ f_("act")("net", theta) = cases(1 & "if" "net" gt.eq theta, 0 & "otherwise") $

This function is both very easy to conceptualize, and very efficient to
implement in hardware. This is because, as it was done for the TLUs, it
is possible to move the threshold into the weighted sum and obtain an
equivalent function that outputs $0$ if the weighted sum is negative
(less than $0$) and outputs $1$ if positive (greater than $0$), and this
control can be performed simply by looking at the most significant bit of
the result of the weighted sum #footnote[Weighted sums can be computed
efficiently by GPUs, since they are specifically designed to efficiently
compute convolutions.]. In particular, since positive numbers are encoded
in hardware with a most significant bit of $0$ and negative number with
a most significant bit of $1$, the result is just the negation of the 
most significant bit of the weighted sum.

#figure(
    caption: [Plot of the Heaviside function, with three different
              choices of $theta$],
    [#image("heaviside.svg", width: 66%)]
)

The issues of the function lie in its abrupt jump from one value to another.
This is both from a mathematical standpoint, because it renders the function
not differentiable everywhere, and from a logical standpoint, since it models
neurons that either fire or not fire, without nuances in between. Also, since
it's not injective, it is not invertible.

An improvement of the Heaviside function is the *semi-linear function*,
that grows linearly inside an interval and remains constant outside of
those boundaries:

$ f_("act")("net", theta) = cases(1 & "if" "net" > theta + frac(1, 2),
                                  0 & "if" "net" < theta - frac(1, 2),
                                  ("net" - theta) + frac(1, 2) & "otherwise") $

#figure(
    caption: [Plot of the semi-linear function, with three different
              choices of $theta$],
    [#image("semi_linear.svg", width: 66%)]
)

The semi-linear function "smooths" the transition between the two
extremes, giving a more nuanced and accurate model of a firing neuron.
It is still problematic, however, since for example it is still not
injective.

An even smoother function is the *sine up to saturation function*:

$ f_("act")("net", theta) = cases(1 & "if" "net" > theta + frac(pi, 2),
                                  0 & "if" "net" < theta - frac(pi, 2),
                                  frac(1, 2) (sin("net" - theta) + 1) & "otherwise") $

#figure(
    caption: [Plot of the sine up to saturation function, with three
              different choices of $theta$],
    [#image("sine_up_to_saturation.svg", width: 66%)]
)

The first historic example of a widely deployed activation function is
the *logistic function* #footnote[This function is sometimes referred
to, improperly, as the _sigmoid_ function. This is due to the fact that,
out of all the sigmoids, the logistic function is the most known.]:

$ f_("act")("net", theta) = frac(1, 1 + e^(-("net" - theta))) $

#figure(
    caption: [Plot of the logistic function, with three
              different choices of $theta$],
    [#image("logistic.svg", width: 66%)]
)

This function is not only continuous everywhere, but also invertible
and differentiable everywhere. Furthermore, its derivative is very
easy to compute:

$ frac(d, d "net") f_("act")("net", theta) &=
  frac(d, d "net") (frac(1, 1 + e^(-("net" - theta)))) = \
  &= frac(frac(d, d "net") (1) dot (1 + e^(-("net" - theta))) -
       frac(d, d "net") (1 + e^(-("net" - theta))) dot 1,
       (1 + e^(-("net" - theta)))^(2)) = \
  &= (frac(1, 1 + e^(-("net" - theta))))^(2)
     (0 dot (1 + e^(-("net" - theta))) -
     frac(d, d "net") (1) + frac(d, d "net") (e^(-("net" - theta)))) = \
  &= f_("act")^(2)("net", theta) ((e^(-("net" - theta))) frac(d, d "net")("net" - theta)) =
     f_("act")^(2)("net", theta) (e^(-("net" - theta))) = \
  &= f_("act")^(2)("net", theta) (-1 + 1 + e^(-("net" - theta))) =
     f_("act")^(2)("net", theta) (f_("act")^(-1)("net", theta) - 1) = \
  &= f_("act")("net", theta) (1 - f_("act")("net", theta)) $

Sigmoid functions having $[0, 1]$ as codomain are called *unipolar
sigmoid functions*. Functions having all the traits of a sigmoid
function whose codomain is $[-1, 1]$ are called *bipolar sigmoid
functions*. Any bipolar sigmoid function can be converted into
a (unipolar) sigmoid function by adding $1$ and dividing by $2$.

One example of bipolar sigmoid function is the *hyperbolic tangent*,
closely resembling the logistic function:

$ f_("act")("net", theta) = tanh("net") $

#figure(
    caption: [Plot of the hyperbolic tangent, with three different
              choices of $theta$],
    [#image("hyperbolic_tangent.svg", width: 66%)]
)

A clear advantage of having a weighted summation as the network input
function of a multilayer perceptron is that it translates naturally
into a matrix multiplication. Let $U_(1) = (v_(1), dots, v_(m))$ and
$U_(2) = (u_(1), dots, u_(n))$ be two adjacent layers (assume $U_(2)$
is right after $U_(1)$) in a multilayer perceptron. The network input
of the $U_(2)$ layer as a whole can be written as:

$ bold("net")_(U_(2)) =
  vec("net"_(u_(1)), "net"_(u_(2)), dots, "net"_(u_(m))) =
  W_(U_(2), U_(1)) bold("in")_(U_(2)) =
  mat(w_(u_(1), v_(1)), w_(u_(1), v_(2)), dots, w_(u_(1), v_(m));
      w_(u_(2), v_(1)), w_(u_(2), v_(2)), dots, w_(u_(2), v_(m));
      dots.v, dots.v, dots.down, dots.v;
      w_(u_(n), v_(1)), w_(u_(n), v_(2)), dots, w_(u_(n), v_(m)))
  vec("in"_(u_(1)), "in"_(u_(2)), dots, "in"_(u_(m))) $

Where $w_(u_(i), v_(j))$ is the weight of the connection coming
into the $i$-th neuron of $U_(2)$ and going out of the $j$-th
neuron of $U_(1)$.

#exercise[
    Rewrite the network of TLUs in @Neural-biimplication as a
    multilayer perceptron.
]
#solution[
    An equivalent construction is as follows:

    #figure(
        caption: [A multilayer perceptron equivalent to the network of
                  TLUs in @Neural-biimplication],
        [#diagram(
            edge-stroke: 1.5pt,
            spacing: 4em,

            node((0, -1), stroke: 1.5pt + blue, text(font: "Noto Sans", [0]), radius: 2em, name: <I1>),
            node((0, 0), stroke: 1.5pt + blue, text(font: "Noto Sans", [0]), radius: 2em, name: <I2>),
            node((1.5, -1), stroke: 1.5pt + green, text(font: "Noto Sans", [-1]), radius: 2em, name: <H1>),
            node((1.5, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [-1]), radius: 2em, name: <H2>),
            node((3, -0.5), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [+3]), radius: 2em, name: <O1>),

            edge((-1, -1), <I1>, label-pos: 0.1, label-angle: auto, label-side: center, label: text(font: "Noto Sans", [x#sub[1]]), marks: (none, "latex")),
            edge((-1, 0), <I2>, label-pos: 0.1, label-angle: auto, label-side: center, label: text(font: "Noto Sans", [x#sub[2]]), marks: (none, "latex")),
            edge(<I1>, <H1>, label-angle: auto, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
            edge(<I1>, <H2>, label-angle: auto, label-pos: 0.65, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
            edge(<I2>, <H1>, label-angle: auto, label-pos: 0.35, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
            edge(<I2>, <H2>, label-angle: auto, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
            edge(<H1>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
            edge(<H2>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
            edge(<O1>, (4, -0.5), label-pos: 1.1, label-angle: auto, label-side: center, label: text(font: "Noto Sans", [y]), marks: (none, "latex")),
        )],
    )

    Where two extra neurons on the left are added. These accomodate
    the fact that the external input of the input layers of a multilayer
    perceptron cannot be weighted (a network of TLUs did not have this
    restriction). The $theta$ parameter equal to $0$ ensures that the
    input flows in unchanged.

    The output function can be set to be the identity function for any
    neuron. The activation function is the Heaviside function, using as
    parameter $theta$ the threshold of the TLU. The network input function
    for the hidden layer (in green) and the output layer (in red) can be
    written in matrix form:

    #grid(
        columns: (0.5fr, 0.5fr),
        [$ W_(U_("hidden"), U_("in")) = mat(-2, 2; 2, -2) $],
        [$ W_(U_("out"), U_("hidden")) = mat(2, 2) $]
    )

    For example, suppose that the external input is $x_(1) = 1$ and
    $x_(2) = 1$. The input of the hidden layer is:

    $ bold("net")_(U_("hidden")) =
      W_(U_("hidden"), U_("in")) bold("in")_(U_("hidden")) =
      mat(-2, 2; 2, -2) vec(1, 1) =
      vec(-2 dot 1 + 2 dot 1, 2 dot 1 + (-2) dot 1) =
      vec(0, 0) $

    The activation of the hidden layer is given by applying the Heaviside
    function to both entries of the vector, having $-1$ as the $theta$
    parameter:

    $ bold("act")_(U_("hidden")) =
      vec(f_("act")(0, -1), f_("act")(0, -1)) =
      vec(1 "if" 0 gt.eq -1\, 0 "otherwise", 1 "if" 0 gt.eq -1\, 0 "otherwise") =
      vec(1, 1) $

    And the output is left unchanged by the output function. The input of
    the output layer is:

    $ bold("net")_(U_("out")) =
      W_(U_("out"), U_("hidden")) bold("in")_(U_("out")) =
      mat(2, 2) vec(1, 1) = 2 dot 1 + 2 dot 1 = 4 $

    Which means that the output of the multilayer perceptron is, as expected:

    $ bold("out")_(U_("out")) =
      bold("act")_(U_("out")) =
      cases(1 & "if" 4 gt.eq 3, 0 & "otherwise") =
      1 $
]

The matrix notation for multilayer perceptrons can shed light on why
it's better to have non-linear activation functions. This is because
a multilayer perceptron that has linear activation functions has very
limited expressiveness.

#theorem[
    Any $r$-layer perceptron whose neurons employ linear activation
    functions and linear output functions can always be reduced to
    an equivalent $2$-layer perceptron.
]
#proof[
    Consider a multilayer perceptron whose neurons have linear
    activation functions and linear output functions. Both functions
    are in the form $f_("act")("net", theta) = alpha "net" - theta$.
    Let $U_(a)$, $U_(b)$ and $U_(c)$ be three consecutive layers
    ($U_(c)$ comes after $U_(b)$ and $U_(b)$ comes after $U_(a)$)
    of the perceptron.

    The network input vector of the $U_(b)$ layer is $bold("net")_(U_(b))
    = W_(U_(b), U_(a)) dot bold("in")_(U_(b)) = W_(U_(b), U_(a)) dot
    bold("out")_(U_(a))$. The activation vector of the $U_(b)$ layer is
    given by applying the (linear, in this case) function
    $f_("act")("net", theta)$ to each entry:

    $ bold("act")_(U_(b)) =
      vec("act"_(u_(1)), "act"_(u_(2)), dots.v, "act"_(u_(n))) =
      bold(D)_("act") dot bold("net")_(U_(b)) - bold(theta) =
      mat(alpha_(u_(1)), 0, dots, 0;
          0, alpha_(u_(2)), dots, 0;
          dots.v, dots.v, dots.down, dots.v;
          0, 0, dots, alpha_(u_(n)))
      W_(U_(b), U_(a))
      vec("in"_(u_(1)), "in"_(u_(2)), dots.v, "in"_(u_(n)))
      - vec(theta_(u_(1)), theta_(u_(2)), dots.v, theta_(u_(n))) $

    Where the $u_(1), dots, u_(n)$ neurons are neurons of the $U_(b)$
    layer. Since the output functions are also linear:

    $ bold("out")_(U_(b)) =
      vec("out"_(u_(1)), "out"_(u_(2)), dots.v, "out"_(u_(n))) =
      bold(D)_("out") dot bold("act")_(U_(b)) - bold(xi) =
      mat(beta_(u_(1)), 0, dots, 0;
          0, beta_(u_(2)), dots, 0;
          dots.v, dots.v, dots.down, dots.v;
          0, 0, dots, beta_(u_(n)))
      vec("act"_(u_(1)), "act"_(u_(2)), dots.v, "act"_(u_(n)))
      - vec(xi_(u_(1)), xi_(u_(2)), dots.v, xi_(u_(n))) $

    Substituting the expression for $bold("act")_(U_(b))$ into the
    expression for $bold("out")_(U_(b))$:

    $ bold("out")_(U_(b)) &=
      bold(D)_("out") dot bold("act")_(U_(b)) - bold(xi) = \
      &= bold(D)_("out") dot (bold(D)_("act") dot bold("net")_(U_(b)) - bold(theta)) - bold(xi) = \
      &= bold(D)_("out") dot (bold(D)_("act") dot (W_(U_(b), U_(a)) dot bold("in")_(U_(b))) - bold(theta)) - bold(xi) = \
      &= bold(D)_("out") dot (bold(D)_("act") dot (W_(U_(b), U_(a)) dot bold("out")_(U_(a))) - bold(theta)) - bold(xi) = \
      &= (bold(D)_("out") dot bold(D)_("act") dot W_(U_(b), U_(a))) dot bold("out")_(U_(a)) + (-bold(D)_("out") dot bold(theta) - bold(xi)) = \
      &= bold(L)_(a, b) dot bold("out")_(U_(a)) + bold(R)_(a, b) $

    If the same process were to be applied to the third layer, one would get:

    $ bold("out")_(U_(c)) = bold(L)_(b, c) dot bold("out")_(U_(b)) + bold(R)_(b, c) $

    Substituting the expression for $bold("out")_(U_(b))$ in the expression
    for $bold("out")_(U_(c))$:

    $ bold("out")_(U_(c)) &=
      bold(L)_(b, c) dot bold("out")_(U_(b)) + bold(R)_(b, c) =
      bold(L)_(b, c) dot (bold(L)_(a, b) dot bold("out")_(U_(a)) + bold(R)_(a, b)) + bold(R)_(b, c) = \
      &= (bold(L)_(b, c) dot bold(L)_(a, b)) dot bold("out")_(U_(a)) + (bold(L)_(b, c) dot bold(R)_(a, b) + bold(R)_(b, c)) =
      bold(L')_(a, c) dot bold("out")_(U_(a)) + bold(R')_(a, c) $

    This means that the three layers $U_(a)$, $U_(b)$ and $U_(c)$ can
    be "compressed" into the two layers $U_(a)$ and $U_(c)$ without any
    loss of precision. Since $U_(a)$, $U_(b)$ and $U_(c)$ were chosen
    arbitrarely, it's always possible to choose any triplet of layers
    and "compress" them into two. The same process could be applied to
    the network as many times as desired, which means that the number
    of layers can be arbitrarely decreased.
]

// The proof is correct, but it's not clear where linearity comes into place.

Multilayer perceptrons that use non-linear activation functions
are more powerful than any network of TLUs, and can encode a much
wider range of functions. Consider an arbitrary function $f$ that
is Riemann-integrable. A $4$-layer perceptron (one input layer,
one output layer, two hidden layers) that encodes said function
is constructed as follows.

The input layer has a single neuron, whose external input is the
point of the function that one wishes to approximate. The output
layer is also single neuron, receiving the input and transmitting
it unchanged. All hidden neurons have a step function as activation
function, whereas the input and output neuron have the identity function.

The domain of the function can be partitioned into $n$ steps delimited
by the values $x_(1), x_(2), dots, x_(n)$. For each cutoff point a node
in the first hidden layer of the perceptron is added. The weights of the
incoming connections of said nodes are set to $1$, and the threshold of
these nodes is the cutoff point itself.

This way, only neurons whose $theta$ parameter is smaller than
the external input will fire. Suppose $overline(x)$ is fed into
the network, and suppose that $x_(1) lt.eq x_(2) lt.eq dots lt.eq
x_(i) lt.eq overline(x)$. The neurons of the first layer that will
fire are the ones having as threshold $x_(1), x_(2), dots, x_(i)$.

Each pair of adjacent cutoff points induces $n - 1$ intervals $[x_(1),
x_(2)], [x_(2), x_(3)], dots, [x_(n - 1), x_(n)]$. Each of these intervals
will yield an approximation for all the values of the true function in said
range (the most natural choice of this approximation is the middle point of
the interval). For each of these intervals, the second hidden layer contains
a neuron; the incoming weights and their thresholds are chosen so that a
single neuron of the layer will be firing. Since the activation function is
the Heaviside function, the inputs of the second hidden layer are binary,
which means that using $plus.minus 2$ as weights for the second hidden
layer will suffice.

This neuron will be the one associated to the interval that contains
the given input to approximate. Suppose $overline(x)$ is fed as input,
and the firing neurons of the first hidden layer are the ones having
as threshold $x_(1), x_(2), dots, x_(i)$. The first, second, ..., up
to $i - 1$-th neuron of the second hidden layer will not fire, because
the incoming weights cancel out. The $i + 1$-th up to $n - 1$-th neuron
of the second hidden layer will also not fire, since their inputs is $0$.
The only neuron that will fire is the $i$-th, because the neuron of the
first hidden layer having $x_(i)$ as threshold will give a positive
contribution, whereas the neuron of the first hidden layer having $x_(i + 1)$
as threshold will not give any contribution.

From the output of the network it is possible to know which is the best
approximation for a given input, since each of the incoming weights of
the input neuron is set to the chosen approximations of the function
evaluated at the given input, and only one neuron of the second hidden
layer will fire.

#exercise[
  Consider the function $f(x) = x^(2)$. Construct a multilayer perceptron
  that can approximate said function.
] <MLP-parabola>
#solution[
    Suppose $6$ steps going from $0$ to $6$ of uniform size. Evaluating the
    function at the midpoints gives: $2.25, 6.25, 12.25, 20.25, 30.25$. 

    #align(center, [#image("riemann.svg", width: 75%)])

    Which is equivalent to the following multilayer perceptron:

    #align(
    center,
      [#diagram(
        edge-stroke: 1.5pt,
        spacing: 4em,

        node((0, 1.125), stroke: 1.5pt + blue, radius: 1.5em, name: <I1>),      
        node((1.5, -0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [+1]), radius: 1.5em, name: <H1>),
        node((1.5, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [+2]), radius: 1.5em, name: <H2>),
        node((1.5, 0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [+3]), radius: 1.5em, name: <H3>),
        node((1.5, 1.5), stroke: 1.5pt + green, text(font: "Noto Sans", [+4]), radius: 1.5em, name: <H4>),
        node((1.5, 2.25), stroke: 1.5pt + green, text(font: "Noto Sans", [+5]), radius: 1.5em, name: <H5>),
        node((1.5, 3), stroke: 1.5pt + green, text(font: "Noto Sans", [+6]), radius: 1.5em, name: <H6>),

        node((3, -0.5), stroke: 1.5pt + green, text(font: "Noto Sans", [+1]), radius: 1.5em, name: <H11>),
        node((3, 0.25), stroke: 1.5pt + green, text(font: "Noto Sans", [+1]), radius: 1.5em, name: <H12>),
        node((3, 1), stroke: 1.5pt + green, text(font: "Noto Sans", [+1]), radius: 1.5em, name: <H13>),
        node((3, 1.75), stroke: 1.5pt + green, text(font: "Noto Sans", [+1]), radius: 1.5em, name: <H14>),
        node((3, 2.5), stroke: 1.5pt + green, text(font: "Noto Sans", [+1]), radius: 1.5em, name: <H15>),
        node((4.5, 1.125), stroke: 1.5pt + fuchsia, radius: 1.5em, name: <O1>),

        edge((-1, 1.125), <I1>, label-pos: 0.1, label-side: center, label: text(font: "Noto Sans", [x]), marks: (none, "latex")),
        edge(<I1>, <H1>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H2>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H3>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H4>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H5>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H6>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),

        edge(<H1>, <H11>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
        edge(<H2>, <H11>, label-angle: auto, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
        edge(<H2>, <H12>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
        edge(<H3>, <H12>, label-angle: auto, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
        edge(<H3>, <H13>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
        edge(<H4>, <H13>, label-angle: auto, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
        edge(<H4>, <H14>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
        edge(<H5>, <H14>, label-angle: auto, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
        edge(<H5>, <H15>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
        edge(<H6>, <H15>, label-angle: auto, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),

        edge(<H11>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+2.25]), marks: (none, "latex")),
        edge(<H12>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+6.25]), marks: (none, "latex")),
        edge(<H13>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+12.25]), marks: (none, "latex")),
        edge(<H14>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+20.25]), marks: (none, "latex")),
        edge(<H15>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+30.25]), marks: (none, "latex")),

        edge(<O1>, (5.5, 1.125), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]), marks: (none, "latex")),
    )]
  )
]

#theorem[
  Any Riemann-integrable function can be approximated with arbitrary
  accuracy by a multilayer perceptron of four layers.
] <Multilayer-perceptron-approximates-Riemann>

Note that @Multilayer-perceptron-approximates-Riemann does not restrict
itself to continuous functions; there exist Riemann-integrable functions
that present discontinuities #footnote[Riemann-integrable but discontinuous
functions are said to be _continuous almost everywhere_. This is because,
despite not being continuous, they still behave "nicely enough" to be
integrated.], but a multilayer perceptron will still be able to approximate
it. However, a continuous function is easier to approximate:

#theorem[
  Any continuous Riemann-integrable function can be approximated with
  arbitrary accuracy by a multilayer perceptron of three layers.
] <Multilayer-perceptron-approximates-Riemann-continuous>

This can be done by encoding into the multilayer perceptron not the
absolute height of a step, but the relative height: the difference
between the current step and the previous step. This perceptron is
analogous to the previous one, except for the second hidden layer,
which is removed, connecting the hidden layer directly to the output
neuron. The ouputs of the hidden layer are the relative height of
the steps.

This way, the first part of the computation behaves just as in the
previous case, only the neurons having as threshold a value smaller
than the given input will fire. But now, the differences in height
are added directly, reconstructing the height of the correct step.
Clearly, applying this shortcut to non-continuous functions would
not work, because there is no guarantee that the relative height
at a certain step is actually the sum of the previous relative
heights.

#exercise[
  Consider @MLP-parabola and construct an equivalent three layer perceptron.
]
#solution[
    Computing the relative heights of the steps gives: $2.25 - 0 = 2.25,
    6.25 - 2.25 = 4, 12.25 - 6.25 = 6, 20.25 - 12.25 = 8, 30.25 - 20.25
    = 10$.

    #align(
    center,
      [#diagram(
        edge-stroke: 1.5pt,
        spacing: 4em,

        node((0, 0.75), stroke: 1.5pt + blue, radius: 1.5em, name: <I1>),      
        node((2, -0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [+1]), radius: 1.5em, name: <H1>),
        node((2, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [+2]), radius: 1.5em, name: <H2>),
        node((2, 0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [+3]), radius: 1.5em, name: <H3>),
        node((2, 1.5), stroke: 1.5pt + green, text(font: "Noto Sans", [+4]), radius: 1.5em, name: <H4>),
        node((2, 2.25), stroke: 1.5pt + green, text(font: "Noto Sans", [+5]), radius: 1.5em, name: <H5>),

        node((4, 0.75), stroke: 1.5pt + fuchsia, radius: 1.5em, name: <O1>),

        edge((-1, 0.75), <I1>, label-pos: 0.1, label-side: center, label: text(font: "Noto Sans", [x]), marks: (none, "latex")),
        edge(<I1>, <H1>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H2>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H3>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H4>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
        edge(<I1>, <H5>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),

        edge(<H1>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+2.25]), marks: (none, "latex")),
        edge(<H2>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+4]), marks: (none, "latex")),
        edge(<H3>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+6]), marks: (none, "latex")),
        edge(<H4>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+8]), marks: (none, "latex")),
        edge(<H5>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+10]), marks: (none, "latex")),

        edge(<O1>, (5, 0.75), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]), marks: (none, "latex")),
    )]
  )
]

Even though @Multilayer-perceptron-approximates-Riemann guarantees that
any function can be approximated by a multilayer perceptron, the theorem
itself isn't really useful. Clearly, the accuracy of the prediction of
can be increased arbitrarely by increasing the number of neurons (that
is, the number of steps) used in the hidden layers. The issue is that,
to get a satisfying degree of approximation, it is necessary to construct
a multilayer perceptron with many neurons (which means, choosing many
steps), and this effort might outvalue the purpose.

There are ways, however, to improve the degree of approximation without
resorting exclusively to reducing the step size. For example, choosing
an activation function for the hidden layers that is not the Heaviside
function (like, say, the logistic function) might better model the shape
of the function at hand. A complementary approach would be to use step
widths that aren't uniform, but that scale with the skewdness of the
function. That is, using many steps where the function is heavily curved
(and thus a linear approximation is poor) and little steps where it is
almost linear.

Note that the degree of approximation in @Multilayer-perceptron-approximates-Riemann
is given by the area between the function to approximate and the output of the
multilayer perceptron. However, even though this area can be reduced at will
as stated, this does not mean that the difference between its output and the
function to approximate is less than a certain error bound everywhere. That is,
this area can only give an average measure of the quality of approximation.

For example, consider a case in which a function possesses a very thin spike
(like a very steep gaussian curve) which is not captured by any stair step.
In such a case the area between the function to represent and the output of
the multilayer perceptron might be small (because the spike is thin), but at
the location of the spike the deviation of the output from the true function
value can nevertheless be considerable.

/*
The process can be extended to functions of varying arity, both in the
non continuous case and in the continuous case
*/
