#import "../../AI_definitions.typ": *

A *self-organizing map* (*SOM*) or *Kohonen feature map* is a layered
feed-forward neural network with the following characteristics:

- There are only input and output neurons, no hidden neurons:
  $U_("hidden") = emptyset$;
- no input neuron can also be an output neuron, and vice versa:
  $U_("in") inter U_("out") = emptyset$;
- The input layer is fully connected to the output layer:
  $C = U_("in") times U_("out")$;
- The network input function of the output neurons is a distance function;
- The activation function of the output neurons is a radial function;
- The output function of the output neurons is the identity function.

A self-organizing map is a generalization of the LVQ network, where the
relationship between output neurons is more elaborate. In particular,
the *neighborhood relationship* that exists between the output neurons
is described by a distance function:

$ d_("neurons"): U_("out") times U_("out") mapsto RR_(0)^(+) $

This is why it is common to represent the output layer of a self-organizing
map as a (usually two-dimensional) grid.

#figure(
    caption: [A self-organizing map with one input neuron and seven
              output neurons. The output layer is arranged into an
              honeycomb structure.],
    [#cetz.canvas({
        import cetz.draw: *
        set-style(stroke: (thickness: 2pt))

        circle((-4, -0.875), radius: 2em, stroke: (paint: blue), name: "I")
        line((-6.5, -0.875), "I", mark: (end: "stealth"), fill: black)

		for i in ((1.5, 0.875), (0, 0), (3, 0), (1.5, -0.875), (0, -1.75), (3, -1.75), (1.5, -2.625)) {
            polygon(i, 6, stroke: (paint: fuchsia))
            line("I", i, mark: (end: "stealth"), fill: black)
        }
	})]
)

The goal of having a self-organizing map learn is to have reference
vectors that are close to each other in the input space relate to output
neurons that are close to each other as well. Even if the distance between
the neurons is not identical to the distance between the inputs, the way
in which the inputs are "arranged", their topology, is preserved. If this
is the case, a self-organizing map describes a *topology preserving map*.

This is particularly enticing because, in general, the dimensionality of
the ouputs of a self-organizing map is much lower than the dimensionality
of its inputs. This means that it's possible to operate dimensionality
reduction on a dataset, giving it a visual representation, while at the
same time maintaining the arrangement of the inputs.
