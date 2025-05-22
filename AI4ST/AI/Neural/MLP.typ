#import "../AI_definitions.typ": *

A *multilayer perceptron* (*MLP*) is a particular type of feed-forward
neural network $G = (U, C)$ whose neurons can be partitioned into $r$
layers. An input neuron of a multilayer percepteron cannot also be an
output neurons, and vice versa. That is, the two sets are disjoint:

$ U_("in") inter U_("out") = emptyset $

Hidden neurons of an MLP can be partitioned into $r - 2$ layers, disjointed
with each other:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ U_("hidden") = U_("hidden")^((1)) union dots union U_("hidden")^((r - 2)) = union.big_(i = 1)^(r - 2) U_("hidden")^((i)) $],
  [$ U_("hidden")^((i)) inter U_("hidden")^((j)) = emptyset, space forall i, j in {1, dots, r - 2} $]
)

Connections in an MLP can only exist between nodes of subsequent layers,
not even between nodes of the same layer. The maximum number of connections
is as many connections that can be formed by connecting each neuron with all
the neurons of the subsequent layer:

$ C subset.eq (U_("in") times U_("hidden")^((1))) union
              (union.big_(i = 1)^(r - 3) U_("hidden")^((i)) times U_("hidden")^((i + 1))) union
              (U_("hidden")^((r - 2)) times U_("out")) $

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

Input neurons have their input entirely specified by the external input;
no input comes from other neurons. Their only purpose is to propagate
unchanged the external input to the first hidden layer. In other words,
the network function, the activation function and the output function of
input neurons are the identity function.

Hidden neurons and output neurons have, as network input function, the
weighted sum of their inputs and the corresponding weights:

$ forall u in U_("hidden") union U_("out"), space
  f_("net")^((u))(w_(u_(1)), dots, w_(u_(n)), "in"_(u_(1)), dots, "in"_(u_(n))) =
  f_("net")^((u))(bold(w)_(u), bold("in")_(u)) =
  sum_(v in "pred"(u)) w_(u, v) dot "out"_(v) $

The activation function of hidden neurons is any *sigmoid function*, meaning
a monotonic non-decreasing function of the form:

$ f : RR mapsto [0, 1], space
  "with" lim_(x -> -infinity) f(x) = 0 space
  "and" lim_(x -> +infinity) f(x) = 1 $

Function of this sort have a characteristic S-shape. Examples of this
function are:

- The *Heaviside function*, or *step function*, that returns $1$ for all
  values greater than a given argument $theta$ and $0$ otherwise. It has
  the advantage of being very easy to conceptualize, and it is also very
  efficient to implement it in hardware:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ f_("act")("net", theta) = cases(1 & "if" "net" gt.eq theta, 0 & "otherwise") $],
    [#image("heaviside.svg")]
  )

  This is because, as it was done for the TLUs, it is possible to move
  the threshold into the weighted sum and obtain an equivalent function
  that output $0$ if the weighted sum is negative (less than $0$) and
  outputs $1$ if positive (greater than $0$), and this check can be done
  by simply looking at the most significant bit of the result of the
  weighted sum #footnote[Weighted sums can be computed efficiently by
  GPUs, since they are specifically designed to efficiently compute
  convolutions.]. In particular, since positive numbers are encoded in
  hardware with a most significant bit of $0$ and negative number with
  a most significant bit of $1$, it is sufficient to perform a negation
  on the most significant bit of the weighted sum and read the result.

  The problems of the function line in its abrupt jump, both from a
  mathematical standpoint, since the step renders the function not
  differentiable, and from a logical standpoint, since it models
  neurons that either fire or not fire, without nuances in between.
  Also, this function is not invertible, since it is not injective.
- The *semi-linear function*, that grows linearly inside an interval
  and remains constant outside of those boundaries:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ f_("act")("net", theta) = cases(1 & "if" "net" > theta + frac(1, 2),
                                       0 & "if" "net" < theta - frac(1, 2),
                                       ("net" - theta) + frac(1, 2) & "otherwise") $],
    [#image("semi_linear.svg")]
  )

  This function improves the Heaviside function "smoothing" the transition
  between the two extremes, increasing the expressing power of the model,
  but still presents problems. For example, it is still not injective,
  and therefore not invertible.
- The *sine up to saturation function*, that grows trigonometrically inside
  an interval and remains constant outside of those boundaries:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ f_("act")("net", theta) = cases(1 & "if" "net" > theta + frac(pi, 2),
                                       0 & "if" "net" < theta - frac(pi, 2),
                                       frac(sin("net" - theta) + 1, 2) & "otherwise") $],
    [#image("sine_up_to_saturation.svg")]
  )

  The growth of the function is even smoother, and the derivative grows
  smoothly as well, but it is still not invertible.
- The *logistic function* #footnote[This function is sometimes referred to,
  improperly, as the sigmoid function. This is due to the fact that, out of
  all the sigmoids, the logistic function is the most known.], which was the
  first historic example of a widely deployed activation function:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ f_("act")("net", theta) = frac(1, 1 + e^(-("net" - theta))) $],
    [#image("logistic.svg")]
  )

  This function is not only continuous everywhere, but also differentiable
  everywhere. In particular, its derivative is particularly easy to compute:

  $ frac(d, d "net") f_("act")("net", theta) &=
    frac(d, d "net") (frac(1, 1 + e^(-("net" - theta)))) =
    frac(frac(d, d "net") (1) dot (1 + e^(-("net" - theta))) -
         frac(d, d "net") (1 + e^(-("net" - theta))) dot 1,
         (1 + e^(-("net" - theta)))^(2)) = \
    &= frac(0 dot (1 + e^(-("net" - theta))) -
         frac(d, d "net") (1) + frac(d, d "net") (e^(-("net" - theta))),
         (1 + e^(-("net" - theta)))^(2)) =
       frac((e^(-("net" - theta))) frac(d, d "net")("net" - theta),
           (1 + e^(-("net" - theta)))^(2)) = \
    &= frac(e^(-("net" - theta)), (1 + e^(-("net" - theta)))^(2)) =
       frac(1 - 1 + e^(-("net" - theta)), (1 + e^(-("net" - theta)))^(2)) =           
       frac(cancel(1 + e^(-("net" - theta))), (1 + e^(-("net" - theta)))^(cancel(2))) -
       frac(1, (1 + e^(-("net" - theta)))^(2)) = \
    &= frac(1, 1 + e^(-("net" - theta))) -
       (frac(1, 1 + e^(-("net" - theta))))^(2) =
       f_("act")("net", theta) - (f_("act")("net", theta))^(2) $

  That is, it is just itself minus itself squared. Being injective, it is
  also invertible:

  $ & f_("act")("net", theta) = frac(1, 1 + e^(-("net" - theta))) =>
    (1 + e^(-("net" - theta))) f_("act")("net", theta) = 1 => \
    & e^(-("net" - theta)) f_("act")("net", theta) + f_("act")("net", theta) = 1 =>
    e^(-("net" - theta)) f_("act")("net", theta) = 1 - f_("act")("net", theta) => \
    & ln(e^(-("net" - theta)) f_("act")("net", theta)) = ln(1 - f_("act")("net", theta)) =>
    theta - "net" + ln(f_("act")("net", theta)) = ln(1 - f_("act")("net", theta)) => \
    & theta - "net" = ln(1 - f_("act")("net", theta)) - ln(f_("act")("net", theta)) =>
    "net" = theta - ln(frac(1 - f_("act")("net", theta), f_("act")("net", theta))) $

Sigmoid functions having $[0, 1]$ as codomain are called *unipolar
sigmoid functions*. Functions having all the traits of a sigmoid
function but having codomain $[-1, 1]$ instead are still considered
sigmoids, and are called *bipolar sigmoid functions*. One notable
example is the *hyperbolic tangent*, conceptually similar to the
logistic function:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ f_("act")("net", theta) = tanh("net") $],
  [#image("hyperbolic_tangent.svg")]
)

Any unipolar function can be converted into a bipolar functions simply
by multiplying by $2$ and subtracting $1$. As a matter fact, the codomain
can be shifted and scaled as will, as long as its extremes are finite and
as longs as the weights are tuned in accord. The only thing that matters
is modelling a threshold that, until reached, blocks the stimulation of
the neuron.

The activation function of output neurons is either a sigmoid function or
any linear function $f_("act")("net", theta) = alpha "net" - theta$, with
$alpha in RR$.

A clear advantage of having a weighted summation as the network input
function of a multilayer perceptron is that it translates naturally to
matrix multiplication. Let $U_(1) = (v_(1), dots, v_(m))$ and $U_(2) =
(u_(1), dots, u_(n))$ be two subsequent layers ($U_(2)$ is right after
$U_(1)$). It is possible to write the network input function for this
layer as:

$ W_(U_(2), U_(1)) bold("in")_(U_(2)) =
  mat(w_(u_(1), v_(1)), w_(u_(1), v_(2)), dots, w_(u_(1), v_(m));
      w_(u_(2), v_(1)), w_(u_(2), v_(2)), dots, w_(u_(2), v_(m));
      dots.v, dots.v, dots.down, dots.v;
      w_(u_(n), v_(1)), w_(u_(n), v_(2)), dots, w_(u_(n), v_(m)))
  vec("in"_(u_(1)), "in"_(u_(2)), dots, "in"_(u_(m))) =
  W bold("out")_(U_(1)) $

Where $w_(u_(i), v_(j))$ is the weight of the connection between the $j$-th
node of $U_(1)$ and the $i$-th node of $U_(2)$. If such connection does not
exist, $w_(u_(i), v_(j)) = 0$.

#exercise[
  Construct a multilayer perceptron that computes the Boolean expression
  $A <==> B$, rewriting the network of threshold logic units.
]
#solution[
  It is sufficient to write the activation function as the identity function.

  #grid(
    columns: (0.75fr, 0.25fr),
    [#diagram(
      edge-stroke: 1.5pt,
      spacing: 4em,

      node((0, -1), stroke: 1.5pt + blue, text(font: "Noto Sans", [0]), radius: 2em, name: <I1>),
      node((0, 0), stroke: 1.5pt + blue, text(font: "Noto Sans", [0]), radius: 2em, name: <I2>),
      node((1, -1), stroke: 1.5pt + green, text(font: "Noto Sans", [-1]), radius: 2em, name: <H1>),
      node((1, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [-1]), radius: 2em, name: <H2>),
      node((2, -0.5), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [3]), radius: 2em, name: <O1>),

      edge((-1, -1), <I1>, label-pos: 0.1, label-side: center, label: text(font: "Noto Sans", [x#sub[1]]), marks: (none, "latex")),
      edge((-1, 0), <I2>, label-pos: 0.1, label-side: center, label: text(font: "Noto Sans", [x#sub[2]]), marks: (none, "latex")),
      edge(<I1>, <H1>, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
      edge(<I1>, <H2>, label-pos: 0.65, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
      edge(<I2>, <H1>, label-pos: 0.35, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
      edge(<I2>, <H2>, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
      edge(<H1>, <O1>, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
      edge(<H2>, <O1>, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
      edge(<O1>, (3, -0.5), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]), marks: (none, "latex")),
    )],
    [$ W_(U_("hidden"), U_("in")) = mat(-2, 2; 2, -2) $
     $ W_(U_("out"), U_("hidden")) = mat(2, 2) $ ]
  )
]

/* Why are non-linear function necessary?
   Linear functions can approximate only linear functions */

Multilayer perceptrons allow one to approximate functions that aren't binary,
but are real-valued. In particular:

#theorem[
  Any Riemann-integrable function can be approximated with arbitrary
  accuracy by a multilayer perceptron of four layers.
] <Multilayer-perceptron-approximates-Riemann>
// #proof[
//
// ]

A perceptron of this kind can be constructed as follows.
The four layers are the input layer, the output layer and two hidden
layers. The first layer (the input layer) is a layer consisting of a
single neuron, receiving the point of the function that one wishes to
approximate. The fourth layer (the output layer) is also single neuron,
receiving the input and transmitting it unchanged. All hidden neurons
have a step function as activation function, whereas the input and
output neuron have the identity function.

Consider an arbitrary function $f$. It is possible to partition its domain
into $n$ steps, delimited by the values $x_(1), x_(2), dots, x_(n)$ along
the $x$ axis. For each of these cutoff points, a node in the first layer
of the perceptron is added. The weights of the incoming connections of said
nodes are set to $1$, and the threshold of these nodes is the cutoff point
itself.

This way, only neurons having as threshold the cutoff points that are
smaller than the given input will fire. Suppose $overline(x)$ is fed
into the network, and suppose that $x_(1) lt.eq x_(2) lt.eq dots lt.eq
x_(i) lt.eq overline(x)$. The neurons of the first layer that will fire
are the ones having as threshold $x_(1), x_(2), dots, x_(i)$.

Each pair of adjacent cutoff points induces $n - 1$ intervals $[x_(1),
x_(2)], [x_(2), x_(3)], dots, [x_(n - 1), x_(n)]$. Each of these intervals
will (more or less accurately) give an approximation for all the values
of the true function in said range (the most natural choice of this
approximation is the middle point of the interval). For each of these
intervals, the second hidden layers contains a neuron; the incoming
weights and their thresholds are chosen so that a single neuron of the
layer will be firing.

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
        node((1.5, -0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [1]), radius: 1.5em, name: <H1>),
        node((1.5, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [2]), radius: 1.5em, name: <H2>),
        node((1.5, 0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [3]), radius: 1.5em, name: <H3>),
        node((1.5, 1.5), stroke: 1.5pt + green, text(font: "Noto Sans", [4]), radius: 1.5em, name: <H4>),
        node((1.5, 2.25), stroke: 1.5pt + green, text(font: "Noto Sans", [5]), radius: 1.5em, name: <H5>),
        node((1.5, 3), stroke: 1.5pt + green, text(font: "Noto Sans", [6]), radius: 1.5em, name: <H6>),

        node((3, -0.5), stroke: 1.5pt + green, text(font: "Noto Sans", [1]), radius: 1.5em, name: <H11>),
        node((3, 0.25), stroke: 1.5pt + green, text(font: "Noto Sans", [1]), radius: 1.5em, name: <H12>),
        node((3, 1), stroke: 1.5pt + green, text(font: "Noto Sans", [1]), radius: 1.5em, name: <H13>),
        node((3, 1.75), stroke: 1.5pt + green, text(font: "Noto Sans", [1]), radius: 1.5em, name: <H14>),
        node((3, 2.5), stroke: 1.5pt + green, text(font: "Noto Sans", [1]), radius: 1.5em, name: <H15>),
        node((4.5, 1.125), stroke: 1.5pt + fuchsia, radius: 1.5em, name: <O1>),

        edge((-1, 1.125), <I1>, label-pos: 0.1, label-side: center, label: text(font: "Noto Sans", [x]), marks: (none, "latex")),
        edge(<I1>, <H1>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H2>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H3>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H4>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H5>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H6>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),

        edge(<H1>, <H11>, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
        edge(<H2>, <H11>, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
        edge(<H2>, <H12>, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
        edge(<H3>, <H12>, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
        edge(<H3>, <H13>, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
        edge(<H4>, <H13>, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
        edge(<H4>, <H14>, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
        edge(<H5>, <H14>, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
        edge(<H5>, <H15>, label: text(font: "Noto Sans", [2]), marks: (none, "latex")),
        edge(<H6>, <H15>, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),

        edge(<H11>, <O1>, label: text(font: "Noto Sans", [2.25]), marks: (none, "latex")),
        edge(<H12>, <O1>, label: text(font: "Noto Sans", [6.25]), marks: (none, "latex")),
        edge(<H13>, <O1>, label: text(font: "Noto Sans", [12.25]), marks: (none, "latex")),
        edge(<H14>, <O1>, label: text(font: "Noto Sans", [20.25]), marks: (none, "latex")),
        edge(<H15>, <O1>, label: text(font: "Noto Sans", [30.25]), marks: (none, "latex")),

        edge(<O1>, (5.5, 1.125), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]), marks: (none, "latex")),
    )]
  )
]

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
// #proof[
//
// ]

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
        node((2, -0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [1]), radius: 1.5em, name: <H1>),
        node((2, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [2]), radius: 1.5em, name: <H2>),
        node((2, 0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [3]), radius: 1.5em, name: <H3>),
        node((2, 1.5), stroke: 1.5pt + green, text(font: "Noto Sans", [4]), radius: 1.5em, name: <H4>),
        node((2, 2.25), stroke: 1.5pt + green, text(font: "Noto Sans", [5]), radius: 1.5em, name: <H5>),

        node((4, 0.75), stroke: 1.5pt + fuchsia, radius: 1.5em, name: <O1>),

        edge((-1, 0.75), <I1>, label-pos: 0.1, label-side: center, label: text(font: "Noto Sans", [x]), marks: (none, "latex")),
        edge(<I1>, <H1>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H2>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H3>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H4>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),
        edge(<I1>, <H5>, label: text(font: "Noto Sans", [1]), marks: (none, "latex")),

        edge(<H1>, <O1>, label: text(font: "Noto Sans", [2.25]), marks: (none, "latex")),
        edge(<H2>, <O1>, label: text(font: "Noto Sans", [4]), marks: (none, "latex")),
        edge(<H3>, <O1>, label: text(font: "Noto Sans", [6]), marks: (none, "latex")),
        edge(<H4>, <O1>, label: text(font: "Noto Sans", [8]), marks: (none, "latex")),
        edge(<H5>, <O1>, label: text(font: "Noto Sans", [10]), marks: (none, "latex")),

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
