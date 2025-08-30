#import "../../AI_definitions.typ": *

Multilayer perceptrons that use non-linear activation functions
are more powerful than any network of TLUs, and can encode a much
wider range of functions. As a matter of fact, it can be proven
that almost all functions can be encoded into a multilayer perceptron
with arbitrary accuracy, but this proof is very convoluted. Nonetheless,
a "relaxed" version of this result, that concerns itself only with
Riemann-integrable functions, is fairly approachable.

Let $f$ be a function that is Riemann-integrable. To prove that there's
at least one multilayer perceptron that can encode $f$, notice how it's
always possible to approximate $f$ with arbitrary precision as a series
of *stepwise functions*. A single stepwise function of extremes $a$ and
$b$ and height $h$ is defined as:

$ S_(a, b, h)(x) = cases(h & "if" a lt.eq x lt.eq b, 0 & "otherwise") $

#figure(
    caption: [Plot of the stepwise function, with three different
              choices for the parameters],
    [#image("stepwise.svg", width: 66%)]
)

To approximate $f$ this way, the domain of the function is first
partitioned into $n$ steps, delimited by the border points $x_(1),
x_(2), dots, x_(n)$. $f$ is then rewritten as a piecewise function,
where each $i$-th piece has $x_(i)$ and $x_(i + 1)$ as extremes and
$f((x_(i) + x_(i + 1)) slash 2)$, the function evaluated at the
midpoint of the two extremes, as height:

$ f(x) approx cases(f(display(frac(x_(1) + x_(2), 2))) & "if" x_(1) lt.eq x < x_(2),
                   f(display(frac(x_(2) + x_(3), 2))) & "if" x_(2) lt.eq x < x_(3),
                   dots.v,
                   f(display(frac(x_(n - 1) + x_(n), 2))) & "if" x_(n - 1) lt.eq x < x_(n)) $

#figure(
    caption: [The function $f(x) = x^(2)$, whose domain is restriced to
              $[0, 6]$, approximated by a series of stepwise functions.
              On the left, a rough approximation. On the right, a refined
              approximation.],
    [#grid(
        columns: (0.5fr, 0.5fr),
        [#image("riemann-raw.svg")],
        [#image("riemann-fine.svg")]
    )]
) <Square-MLP-approximation>

The idea is to first show that a multilayer perceptron can encode
a single stepwise function, then show that it can also encode any
piecewise approximation with arbitrary accuracy. This approach can
be used not only for multilayer perceptrons, but for most neural
networks in general.

#theorem[
    Any Riemann-integrable function can be encoded with arbitrary
    accuracy into a multilayer perceptron of four layers.
] <Multilayer-perceptron-approximates-Riemann>
#proof[
    A single stepwise function $S_(a, b, h)(x)$ can be encoded into
    a multilayer perceptron in the following way:

    #figure(
        caption: [A multilayer perceptron that encodes a stepwise function
                of extremes $a$ and $b$ and of height $h$.],
        [#diagram(
            edge-stroke: 1.5pt,
            spacing: 4em,

            node((0, 0), stroke: 1.5pt + blue, radius: 2em, name: <I1>),
            node((1, -0.5), stroke: 1.5pt + green, text(font: "Noto Sans", [a]), radius: 2em, name: <H1>),
            node((1, 0.5), stroke: 1.5pt + green, text(font: "Noto Sans", [b]), radius: 2em, name: <H2>),
            node((2, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [+1]), radius: 2em, name: <H3>),
            node((3, 0), stroke: 1.5pt + fuchsia, radius: 2em, name: <O1>),

            edge((-1, 0), <I1>, label-pos: 0.1, label-angle: auto, label-side: center, label: text(font: "Noto Sans", [x#sub[1]]), marks: (none, "latex")),
            edge(<I1>, <H1>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
            edge(<I1>, <H2>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
            edge(<H1>, <H3>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),
            edge(<H2>, <H3>, label-angle: auto, label: text(font: "Noto Sans", [-2]), marks: (none, "latex")),
            edge(<H3>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [h]), marks: (none, "latex")),
            edge(<O1>, (4, 0), label-pos: 1.1, label-angle: auto, label-side: center, label: text(font: "Noto Sans", [y]), marks: (none, "latex")),
        )],
    )

    If the input is smaller than $a$, then both hidden layers output $0$,
    which is fed into the second hidden layer outputting $0$ as well. If
    the input lies between $a$ and $b$, the hidden neuron at the top of
    the first hidden layer outputs $1$, the bottom one $0$. The hidden
    neuron in the second hidden layer receives as input $(2 dot 1) +
    (0 dot 1) = 2$, hence it outputs $1$. The output neuron then outputs
    $1 dot h = h$. If the input is bigger than $b$, then the output of
    the two hidden layers cancel out, and the final output is $0$.

    The entire $4$-layer perceptron is a generalized form of this
    perceptron. The input layer has a single neuron, whose external
    input is the point in the domain of the function that one wishes
    to approximate. The output layer is also single neuron, receiving
    the input and transmitting it unchanged. All hidden neurons have
    a step function as activation function, whereas the input and
    output neuron have the identity function.

    A neuron in the first hidden layer of the perceptron is added for
    each border point $x_(1), dots, x_(n)$. The weights of the incoming
    connections of said nodes are set to $1$, and the parameter $theta$
    of these nodes is the border point itself. This way, only neurons
    whose $theta$ parameter is smaller than the output of the input
    layer (the external input, that is) will output $1$.

    A neuron is added to the second hidden layer for each step $[x_(1),
    x_(2)], [x_(2), x_(3)], dots, [x_(n - 1), x_(n)]$. The output of each
    of these neurons will be $1$ if the external input is greater than
    $x_(i)$, but less than $x_(i + 1)$. This way, there is one and only
    neuron in the second hidden layer whose output is $1$: the one that
    lies in the interval approximating its evaluation.

    Let $overline(x)$ be the external input fed into the network, and
    let the cutoff points of the steps be $x_(1), x_(2), dots, x_(n)$.
    Suppose that:

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
    the function in each interval. Since only one input to the output neuron
    is not null, its output will precisely be the approximation of the value
    of the function with the given (external) input.

    Increasing the number of neurons (of step functions) give a better and
    better approximation. If the step sizes were to become infinitesimally
    small, the approximation would be perfect. Since there is no (theoretical)
    limit on the number of neurons that could be added, the function can be
    encoded with any degree of approximation, and therefore the result is
    proven.

    // FIXME: Correct, but messy
]

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

@Multilayer-perceptron-approximates-Riemann does not restrict itself to
continuous functions, since the definition of a Riemann-integrable does
not require continuity #footnote[Riemann-integrable but discontinuous
functions are said to be _continuous almost everywhere_. This is because,
despite not being continuous, they still behave "nicely enough" to be
integrated.]. However, if the function is continuous, the same result
can be achieved with just $3$ layers instead of $4$ by using a slightly
different approach.

#theorem[
    Any continuous Riemann-integrable function can be approximated with
    arbitrary accuracy by a multilayer perceptron of three layers.
] <Multilayer-perceptron-approximates-Riemann-continuous>
#proof[
    This is done by taking into account not the absolute height of a step,
    but its relative height: the difference between the current step and
    the previous step.

    A $3$-layer perceptron of this kind is very similar to the previous
    $4$-layer perceptron. The only differences are that the second hidden
    layer is removed and that the weights coming into the output layer
    are the relative step heights. This way, the first part of the
    computation behaves as in the previous case: only the neurons whose
    $theta$ parameter is smaller than the external input will output $0$.
    Now, however, the height differences of the steps are summed directly,
    "reconstructing" the desired height #footnote[This "shortcut" would
    not work for non-continuous functions, since there is no guarantee
    that summing all relative heights up to a given point is actually
    the desired height]. Since, again, the accuracy of the approximation
    can be increased at will, the result is proven.
]

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

@Multilayer-perceptron-approximates-Riemann has been stated for
functions with a single argument, but can be readily extended to
functions having arity $k > 1$. Instead of approximating the function
with one-dimensional stepwise functions, it is approximated with
$k$-dimensional "step functions" by partitioning the input space
into $k$-dimensional hypercubes. This isn't transferred that easily
to @Multilayer-perceptron-approximates-Riemann-continuous, because
the dependency between the arguments has to be taken into account.

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

#figure(
    caption: [Plot of the function $x + exp(1 - (10x - 41)^(2))$,
              approximated with a series of stepwise functions of
              width $1 slash 4$. The spike in the middle is not
              truly captured by any step, hence the local error
              is greater than the average error.],
    [#image("spike.svg", width: 66%)]
)
