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
one is the Heaviside function, already employed in TLUs:

$ f_("act")("net", theta) =
  H("net", theta) =
  cases(1 & "if" "net" gt.eq theta, 0 & "otherwise") $

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
  frac(d, d "net") (frac(1, 1 + e^(-("net" - theta)))) =
  frac(d, d "net") ((1 + e^(-("net" - theta)))^(-1)) = \
  &= -(1 + e^(-("net" - theta)))^(-2) frac(d, d "net") (1 + e^(-("net" - theta))) = \
  &= -frac(1, (1 + e^(-("net" - theta)))^(2)) (frac(d, d "net") 1 + frac(d, d "net") e^(-("net" - theta))) = \
  &= -f_("act")^(2)("net", theta) (0 - e^(-("net" - theta)) frac(d, d "net") ("net" - theta)) = \
  &= f_("act")^(2)("net", theta) (e^(-("net" - theta))) = 
  f_("act")^(2)("net", theta) (1 + e^(-("net" - theta)) - 1) = \
  &= f_("act")^(2)("net", theta) (f_("act")^(-1)("net", theta) - 1) =
  f_("act")("net", theta) (1 - f_("act")("net", theta)) $

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
      vec(H(0, -1), H(0, -1)) =
      vec(1, 1) $

    And the output is left unchanged by the output function. The input of
    the output layer is:

    $ bold("net")_(U_("out")) =
      W_(U_("out"), U_("hidden")) bold("in")_(U_("out")) =
      mat(2, 2) vec(1, 1) = 2 dot 1 + 2 dot 1 = 4 $

    Which means that the output of the multilayer perceptron is, as expected:

    $ bold("out")_(U_("out")) =
      bold("act")_(U_("out")) =
      H(4, 3) = 1 $
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
wider range of functions.

Consider an arbitrary function $f$ that is Riemann-integrable.
This function can be approximated with arbitrary precision by
a series of stepwise functions. The domain of the function can
be partitioned into $n$ steps delimited by the border points
$x_(1), x_(2), dots, x_(n)$.

#figure(
    caption: [The function $f(x) = x^(2)$, whose domain is restriced to
              $[0, 6]$, approximated by a series of stepwise functions.],
    [#image("riemann.svg", width: 75%)]
) <Square-MLP-approximation>

A $4$-layer perceptron (one input layer, one output layer, two hidden
layers) that encodes said function is constructed as follows.

The input layer has a single neuron, whose external input is the
point in the domain of the function that one wishes to approximate.
The output layer is also single neuron, receiving the input and
transmitting it unchanged. All hidden neurons have a step function
as activation function, whereas the input and output neuron have the
identity function.

A neuron in the first hidden layer of the perceptron is added for each
border point $x_(1), dots, x_(n)$. The weights of the incoming connections
of said nodes are set to $1$, and the parameter $theta$ of these nodes is
the border point itself. This way, only neurons whose $theta$ parameter is
smaller than the output of the input layer (the external input, that is)
will output $1$.

Each pair of adjacent border points induces $n - 1$ steps $[x_(1), x_(2)],
[x_(2), x_(3)], dots, [x_(n - 1), x_(n)]$. Evaluating the function in one
of these steps will yield a (more or less accurate) approximation for the
true value of the function in said step. A neuron is added to the second
hidden layer for each of these steps. Their parameters are chosen in such
a way that, for each $i$-th neuron in the second hidden layer, its output
will be $1$ if the external input is greater than $x_(i)$, but less than
$x_(i + 1)$. Since the outputs of the first hidden layer are binary (the
activation function is the stepwise function), choosing $theta$ equal to
$1$ and the weights equal to $plus.minus 2$ suffices.

This way, there is one and only neuron in the second hidden layer
whose output is $1$: the one that lies in the interval approximating
its evaluation. Let $overline(x)$ be the external input fed into the
network, and let the cutoff points of the steps be $x_(1), x_(2),
dots, x_(n)$. Suppose that:

$ x_(1) < x_(2) < dots < x_(i) lt.eq overline(x) lt.eq x_(i + 1) < dots < x_(n) $

The neurons of the first hidden layer that will output $1$ are those
having as $theta$ parameter $x_(1), x_(2), dots, x_(i)$, whereas those
having $x_(i + 1), dots, x_(n)$ will output $0$. As for the second
hidden layer, the first $i - 1$ neurons will output $0$, because the
incoming weight of a neuron is cancelled by the incoming weight of
the following neuron. However, also the last $i + 1$ neurons will
output $0$, because their incoming inputs are all $0$. The only neuron
that will output $1$ is the $i$-th, because it receives a positive weight
with a positive output and a negative weight with a null output; it's
total incoming input is $+2$ and $H(2, 1) = 1$.

The weights of the output layer are the approximated values of evaluating
the function in each interval (the most obvious choice is the midpoint).
Since only one input to the output neuron is not null, its output will
precisely be the approximation of the value of the function with the
given (external) input.

// Correct, but messy

#exercise[
    Refer to @Square-MLP-approximation and construct a $4$-layer
    perceptron that can approximate $f(x) = x^(2)$.
] <MLP-parabola>
#solution[
    Evaluating the function at the midpoints of the intervals gives
    $2.25, 6.25, 12.25, 20.25, 30.25$. Therefore:

    #figure(
        caption: [A $4$-layer perceptron that approximates $f(x)$ in the
                  $[0, 6]$ interval.],
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

Increasing the number of neurons (of step functions) give a better and
better approximation. If the step sizes were to become infinitesimally
small, the approximation would be perfect. Since there is no limit on
the number of neurons that could be added, the following theorem can
be stated:

#theorem[
    Any Riemann-integrable function can be approximated with arbitrary
    accuracy by a multilayer perceptron of four layers.
] <Multilayer-perceptron-approximates-Riemann>

Note that the degree of approximation in @Multilayer-perceptron-approximates-Riemann
is given by the area between the function to approximate and the output of the
multilayer perceptron. However, even though this area can be reduced at will,
this does not mean that the difference between its output and the function to
approximate is less than a certain error bound everywhere. That is, this area
can only give an average measure of the quality of approximation.

For example, consider a case in which a function possesses a very thin spike
(like a very steep gaussian curve) which is not captured by any stair step.
In such a case the area between the function to represent and the output of
the multilayer perceptron might be small (because the spike is thin), but at
the location of the spike the deviation of the output from the true function
value can nevertheless be considerable.

There are ways, however, to improve the degree of approximation without
resorting exclusively to reducing the step size. For example, choosing
an activation function for the hidden layers that is not the Heaviside
function (like, say, the logistic function) might better model the shape
of the function at hand. A complementary approach would be to use step
widths that aren't uniform, but that scale with the skewdness of the
function. That is, using many steps where the function is heavily curved
(and thus a linear approximation is poor) and little steps where it is
almost linear.

Also note that @Multilayer-perceptron-approximates-Riemann can also be
applied to functions having more than one argument. Instead of approximating
the function with one-dimensional step functions, it is approximated with
$k$-dimensional "step functions" (with $k$ being the arity of the function)
by partitioning the input space into $k$-dimensional hypercubes.

Finally, @Multilayer-perceptron-approximates-Riemann does not restrict
itself to continuous functions, since the definition of a Riemann-integrable
does not require continuity #footnote[Riemann-integrable but discontinuous
functions are said to be _continuous almost everywhere_. This is because,
despite not being continuous, they still behave "nicely enough" to be
integrated.]. However, if the function is continuous, the same result can
be achieved with just $3$ layers instead of $4$. This is done by taking
into account not the absolute height of a step, but its relative height:
the difference between the current step and the previous step.

A $3$-layer perceptron of this kind is very similar to the previous
$4$-layer perceptron. The only differences are that the second hidden
layer is removed and that the weights coming into the output layer are
the relative step heights. This way, the first part of the computation
behaves as in the previous case: only the neurons whose $theta$ parameter
is smaller than the external input will output $0$. Now, however, the
height differences of the steps are summed directly, "reconstructing"
the desired height. This shortcut would not work for non-continuous
functions, since there is no guarantee that summing all relative heights
up to a given point is actually the desired height.

#exercise[
    Construct a $3$-layer perceptron equivalent to the one in @MLP-parabola.
]
#solution[
    The relative heights of the step are $2.25 - 0 = 2.25, 6.25 - 2.25 = 4,
    12.25 - 6.25 = 6, 20.25 - 12.25 = 8, 30.25 - 20.25 = 10$. This gives:

    #figure(
        caption: [A $3$-layer perceptron that approximates $f(x)$ in the
                  $[0, 6]$ interval.],
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

Since, again, the accuracy of the prediction can be increased at will,
the following theorem can be stated:

#theorem[
    Any continuous Riemann-integrable function can be approximated with
    arbitrary accuracy by a multilayer perceptron of three layers.
] <Multilayer-perceptron-approximates-Riemann-continuous>

Even though it has been proven that any Riemann-integrable function can be
encoded into a multilayer perceptron (@Multilayer-perceptron-approximates-Riemann),
this result is not very useful on its own. This is because it does not
specify how many neurons ought to be added: if the number of neurons
necessary to achieve a satisfactory approximation is infinitely large,
such a perceptron cannot be constructed in practice.

Also, the fact that a function can be approximated with a $4$-layer
perceptron does not imply that said construction is the only possible,
neither that it is the most efficient (giving the best approximation
with the least effort). There may be a perceptron with a different
network structure that encodes the same function and whose approximation
is just as "good" (if not better), but the theorem cannot prove its
existence.

As it was the case for a single TLU, there is interest in having
the neural network _learn_ from examples which are the best choice
of parameters and weights in order to approximate a given function,
rather than fixing them by hand. TLUs employed a non-differentiable
function (the stepwise function) as their "activation function",
which meant that their error function had to be engineered in a
very specific way. However, multilayer perceptrons don't abide
by this restriction, and can have activation functions that are
differentiable.

The central idea is to deduce the direction in which the weights
and the parameters have to be changed at every step from the gradient
of the error function. Since the gradient gives the direction of
steepest descent, the correct direction is the opposite of the
gradient (minimizing the error instead of maximising it). At each
step, the gradient is computed, a small adjustment to the weights
and the parameters is made and the process is repeated until the
degree of approximation is satisfactory.

Consider a multilayer perceptron with $r$ layers: let $U_(0)$ be the
layer of input neurons, $U_(1)$ to $U_(r - 2)$ the layers of hidden
neurons and $U_(r - 1)$ the layer of output neuron. Let $e$ be the
total error for a fixed learning task $L_("fixed")$. To understand
how to the weights with respect to this function, it is necessary
to explicitly rewrite the error in term of the weights. Assume that
the multilayer perceptron has the logistic function as activation
function for its neurons and the identity function as output function.

Consider a single neuron $u$ belonging either to an hidden layer
or to the output layer, that is $u in U_(k)$ with $0 < k lt.eq
r - 1$. Its predecessors are given by $"pred"(u) = {p_(1), dots,
p_(n)} in U_(k - 1)$. The corresponding vector of weights, also
embedding the $theta$ parameter to ease calculations, is $bold(w)_(u)
= (-theta_(u), w_(u, p_(1)), dots, w_(u, p_(n)))$. The gradient of
the total error function with respect to these weights is:

$ nabla_(bold(w)_(u)) e =
  frac(partial e, partial bold(w)_(u)) = 
  (-frac(partial e, partial theta_(u)),
   frac(partial e, partial w_(u, p_(1))),
   dots, frac(partial e, partial w_(u, p_(n)))) $

Explicitly substituting the expression for $e$:

$ nabla_(bold(w)_(u)) e =
  frac(partial e, partial bold(w)_(u)) = 
  frac(partial, partial bold(w)_(u)) sum_(l in L_("fixed")) e^((l)) =
  sum_(l in L_("fixed")) frac(partial e^((l)), partial bold(w)_(u)) =
  sum_(l in L_("fixed")) nabla_(bold(w)_(u)) e^((l)) $

Consider a single training pattern $l$ and its error $e^((l)) =
sum_(v in U_("out")) e^((l))_(v)$. The error depends on the value
of the output of the layer, which in turn depends (also) on the
network input. However, the network input depends on the weights:

$ "net"_(u)^((l)) =
  bold(w)_(u) bold("in")_(u)^((l)) =
  bold(w)_(u) (1, "out"_(p_(1))^((l)), dots, "out"_(p_(n))^((l))) $

Which means that there's a dependency between the error and the
weights. Applying the chain rule:


$ nabla_(bold(w)_(u)) e^((l)) =
  frac(partial e^((l)), partial bold(w)_(u)) =
  frac(partial e^((l)), partial "net"_(u)^((l)))
  frac(partial "net"_(u)^((l)), partial bold(w)_(u)) =
  frac(partial e^((l)), partial "net"_(u)^((l)))
  frac(partial bold(w)_(u) bold("in")_(u)^((l)), partial bold(w)_(u)) =
  frac(partial e^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

Expanding the error $e^((l))$ in the first factor:

$ frac(partial e^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) &=
  frac(partial sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l)))^(2), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  sum_(v in U_("out")) frac(partial (o_(v)^((l)) - "out"_(v)^((l)))^(2), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

Simplifying the expression:

$ frac(partial e^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) &= 
  sum_(v in U_("out")) 2 (o_(v)^((l)) - "out"_(v)^((l))) frac(partial (o_(v)^((l)) - "out"_(v)^((l))), partial "net"_(u)^((l))) bold("in")_(u)^((l)) = \
  &= 2 sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) (cancel(frac(partial o_(v)^((l)), partial "net"_(u)^((l)))) - frac(partial "out"_(v)^((l)), partial "net"_(u)^((l)))) bold("in")_(u)^((l)) = \
  &= -2 underbrace(sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) frac(partial "out"_(v)^((l)), partial "net"_(u)^((l))), delta_(u)^((l))) bold("in")_(u)^((l)) = 
  -2 delta_(u)^((l)) bold("in")_(u)^((l)) $

Where the shorthand $delta_(u)^((l))$ is introduced for clarity. Note
that $partial o_(v)^((l)) slash partial "net"_(u)^((l))$ is $0$ because,
by definition, the output in the training pattern does not depend on the
network input function.

To compute $delta_(u)^((l))$, first consider the particularly favourable
case in which $u$ is an output neuron. Since the neurons in the output
layer (or in any layer, for that matter), are not connected to each other,
there is no dependency between the output of one and the network input of
another. This means that all terms of the sum except for $v = u$ are null,
because $partial "out"_(v)^((l)) slash partial "net"_(u)^((l))$ is $0$:

$ nabla_(bold(w)_(u)) e^((l)) =
  frac(partial e^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  -2 sum_(v = u) (o_(v)^((l)) - "out"_(v)^((l))) frac(partial "out"_(v)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  -2 (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

This means that the weights coming into the output neuron $u$ should
be shifted:

$ Delta_(w_(bold(u))^((l))) =
  -frac(eta, 2) (-2 (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l))) =
  eta (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

Where the minus signs cancel, because the interest is in going in the
direction opposite to the gradient of the error function. The parameter
$eta$ is called the *learning rate*, and represents the lenght of the
step taken in one iteration of gradient descent. Popular choices for
$eta$ are $0.1$ and $0.2$, but in general the best choice is domain
specific.

The above expression was referring to the weight change that results
from a single training pattern $l$. That is, this is how weights are
adapted in online training, where the weights are adapted immediately
after each example is presented to the perceptron. In the case of
batch learning the idea is the same, the difference being that one
would have to sum all partial updates over all training patterns
and then applying the resulting change at the end of each epoch,
not immediately after each evaluation.

The derivative of $partial "out"_(u)^((l)) slash partial "net"_(u)^((l))$
cannot be calculated in the general case, since the output depends on the
choice of the activation function. Suppose that the logistic function has
been chosen, and that the output function is the identity function (as it
is the case, in general). Then:

$ frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) &=
	frac(partial f_("out")("act"_(u)^((l))), partial "net"_(u)^((l))) =
	frac(partial "act"_(u)^((l)), partial "net"_(u)^((l))) =
	frac(partial f_("act")("net"_(u)^((l))), partial "net"_(u)^((l))) =
	f'_("act")("net"_(u)^((l))) = \
	&= f_("act")("net"_(u)^((l))) (1 - f_("act")("net"_(u)^((l)))) =
	"act"_(u)^((l)) (1 - "act"_(u)^((l))) = "out"_(u)^((l)) (1 - "out"_(u)^((l))) $

Which means that the adaptation should be:

$ Delta_(w_(bold(u))^((l))) =
	eta (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
	eta (o_(u)^((l)) - "out"_(u)^((l))) "out"_(u)^((l)) (1 - "out"_(u)^((l))) bold("in")_(u)^((l)) $
