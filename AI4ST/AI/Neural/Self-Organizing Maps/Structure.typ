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

The output may be discretized according to the "winner takes all"
principle: the neuron with the highest activation produces the
output $1$, all other neurons produce the output $0$

// What is that supposed to mean?

In some sense, a self-organizing map is similar to a radial basis
function network where the output layer and the hidden layer have
been merged into one.

In the same fashion, the weights coming into the output layer determine
the coordinates of a center, from which the distance of the input is
measured; in the context of self-organizing maps, this center is called
*reference vector*. The closer the input to a reference vector, the
higher the activation of the corresponding neuron. In general, the
$sigma$ parameter of all output neurons (the radius of the capture
region) is always the same.

One notable feature of self-organizing maps is that the neurons in the
output layer don't necessarely operate in a vacuum. In particular, a
*neighborhood relationship* forms between the output neurons, described
by a distance function:

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

The neighborhood relationship may also be missing, which is formally
represented by an extreme distance measure for the neurons: each neuron
has distance $0$ to itself and infinite distance to all other neurons.
By choosing this distance measure, the neurons become effectively independent.

If a neighborhood relationship is missing and the output is discretized,
a self-organizing map describes a so-called *vector quantization* of the
input space: the input space is divided into as many regions as there are
output neurons. This is achieved by assigning to an output neuron all
points of the input space for which the neuron yields the highest
activation.

Since all output neurons have the same functions, to an output neuron
all points of the input space are assigned that are closer to the neuron's
reference vector than to the reference vector of any other output neuron.
This tessellation can be represented by a so-called *Voronoi diagram*,
that shows the way in which the input space is partitioned into regions.

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
