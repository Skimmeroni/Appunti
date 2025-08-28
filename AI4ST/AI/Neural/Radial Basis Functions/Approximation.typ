#import "../../AI_definitions.typ": *

Approximating functions using radial basis function networks follows
the same logic as multilayer perceptrons. The idea is, again, to
approximate a function as a stepwise function and encode them in a
radial basis function network.

#theorem[
    Any Riemann-integrable function can be approximated with
    arbitrary accuracy by a radial basis function network.
] <RBF-approximates-Riemann>
#proof[
    The easiest way to do so is to use the rectangular function as
    radial basis function, since it has the natural shape of a pulse.
    In particular, a radial basis function network with one input layer
    and one output layer is constructed. The number of hidden layers is
    equal to the number of stepwise functions used for the approximation.

    The weights coming into the hidden layer are the midpoints of the
    step, the $sigma$ parameter is half the width of the step and the
    weights coming into the output layer are the heights of the steps.
    This way, all hidden neurons output $0$ except for a single neuron,
    the one in which the input lies. Its output, which is exactly $1$,
    is then multiplied with which is then multiplied by the height of
    the corresponding step, resulting in the height itself. Since the
    degree of approximation can be increased at will, the result is
    proven.
]

#exercise[
	Construct a $3$-layer radial basis function network that encodes
	@Square-MLP-approximation.
]
#solution[
    Each step has width of $1$, hence $sigma$ is always $0.5$.

    #figure(
        caption: [A radial basis function network that approximates $f(x)$
                  in the $[1, 6]$ interval.],
        [#diagram(
            edge-stroke: 1.5pt,
            spacing: 4em,

            node((0, 0.75), stroke: 1.5pt + blue, radius: 1.5em, name: <I1>),      
            node((2, -0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [0.5]), radius: 1.5em, name: <H1>),
            node((2, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [0.5]), radius: 1.5em, name: <H2>),
            node((2, 0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [0.5]), radius: 1.5em, name: <H3>),
            node((2, 1.5), stroke: 1.5pt + green, text(font: "Noto Sans", [0.5]), radius: 1.5em, name: <H4>),
            node((2, 2.25), stroke: 1.5pt + green, text(font: "Noto Sans", [0.5]), radius: 1.5em, name: <H5>),

            node((4, 0.75), stroke: 1.5pt + fuchsia, radius: 1.5em, name: <O1>),

            edge((-1, 0.75), <I1>, label-pos: 0.1, label-side: center, label: text(font: "Noto Sans", [x]), marks: (none, "latex")),
            edge(<I1>, <H1>, label-angle: auto, label: text(font: "Noto Sans", [+1.5]), marks: (none, "latex")),
            edge(<I1>, <H2>, label-angle: auto, label: text(font: "Noto Sans", [+2.5]), marks: (none, "latex")),
            edge(<I1>, <H3>, label-angle: auto, label: text(font: "Noto Sans", [+3.5]), marks: (none, "latex")),
            edge(<I1>, <H4>, label-angle: auto, label: text(font: "Noto Sans", [+4.5]), marks: (none, "latex")),
            edge(<I1>, <H5>, label-angle: auto, label: text(font: "Noto Sans", [+5.5]), marks: (none, "latex")),

            edge(<H1>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+2.25]), marks: (none, "latex")),
            edge(<H2>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+6.25]), marks: (none, "latex")),
            edge(<H3>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+12.25]), marks: (none, "latex")),
            edge(<H4>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+20.25]), marks: (none, "latex")),
            edge(<H5>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+30.25]), marks: (none, "latex")),

            edge(<O1>, (5, 0.75), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]), marks: (none, "latex")),
        )]
    )
]

As it was the case for multilayer perceptrons, @RBF-approximates-Riemann
does not require the function to be approximated to be continuous. Also,
it is trivial to extend the theorem to functions with any arity, since it
is sufficient to consider multi-dimensional "step functions". In contrast
to multilayer perceptrons, where discontinuous functions required $4$
layers, an RBF network with $3$ layer is always sufficient, because each
neuron carries out its computations independently of the others.

The only caveat of using rectangular functions is that this independence
is true only to some extent. That is, at the border points the value of
the function is not computed correctly, because each region and the next
are placed side-by-side. Note that this does not invalidate the theorem,
because the approximation error is computed as the difference between the
area under the curve and the total area of all the steps. This area is
constituted by infinitely many points, while the "troublesome" points are
finite (exactly two for each step), and therefore do not contribute to the
error in any meaningful capacity.

However, if one desires to improve the accuracy of the model and remove
this spuriousness, it is sufficient to substitute the rectangular function
with another function. For example, using triangular functions or gaussian
functions as radial basis functions gives an approximation that is both
smoother and does not present the overlap problem.

#exercise[
    Approximate the following function with an RBF network, using Gaussian
    functions as activation functions:

    $ g(x) = -frac(1, 3) x^(5) + frac(5, 3) x^(4) - frac(1, 3) x^(3) - frac(23, 3) x^(2) + frac(56, 6) x - 2 $
]
#solution[
    #figure(
        caption: [The given function, approximated by three Gaussian
                  functions.],
        [#image("bell.svg", width: 75%)]
    )

    #figure(
        caption: [A radial basis function network that approximates $g(x)$
                  in the $[0, 4]$ interval.],
        [#diagram(
            edge-stroke: 1.5pt,
            spacing: 4em,

            node((0, 0), stroke: 1.5pt + blue, radius: 1.5em, name: <I1>),      
            node((2, -0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [0.75]), radius: 1.5em, name: <H1>),
            node((2, 0), stroke: 1.5pt + green, text(font: "Noto Sans", [0.75]), radius: 1.5em, name: <H2>),
            node((2, 0.75), stroke: 1.5pt + green, text(font: "Noto Sans", [1]), radius: 1.5em, name: <H3>),

            node((4, 0), stroke: 1.5pt + fuchsia, radius: 1.5em, name: <O1>),

            edge((-1, 0), <I1>, label-pos: 0.1, label-side: center, label: text(font: "Noto Sans", [x]), marks: (none, "latex")),
            edge(<I1>, <H1>, label-angle: auto, label: text(font: "Noto Sans", [+0.75]), marks: (none, "latex")),
            edge(<I1>, <H2>, label-angle: auto, label: text(font: "Noto Sans", [+1.75]), marks: (none, "latex")),
            edge(<I1>, <H3>, label-angle: auto, label: text(font: "Noto Sans", [+3]), marks: (none, "latex")),

            edge(<H1>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+1]), marks: (none, "latex")),
            edge(<H2>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [-1]), marks: (none, "latex")),
            edge(<H3>, <O1>, label-angle: auto, label: text(font: "Noto Sans", [+2]), marks: (none, "latex")),

            edge(<O1>, (5, 0), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]), marks: (none, "latex")),
        )]
    )    
]
