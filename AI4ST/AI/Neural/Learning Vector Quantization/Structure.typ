#import "../../AI_definitions.typ": *

A *learning vector quantization network* (*LQV* network) is a layered
feed-forward neural network with the following characteristics:

- There are only input and output neurons, no hidden neurons:
  $U_("hidden") = emptyset$;
- no input neuron can also be an output neuron, and vice versa:
  $U_("in") inter U_("out") = emptyset$;
- The input layer is fully connected to the output layer:
  $C = U_("in") times U_("out")$;
- The network input function of the output neurons is a distance function;
- The activation function of the output neurons is a radial function;

In some sense, a self-organizing map is similar to a radial basis
function network where the output layer and the hidden layer have
been merged into one.

The weights coming into the output layer determine the coordinates of a
center, from which the distance of the input is measured; in the context
of LVQ networks, this center is called *reference vector*. The closer the
input to a reference vector, the higher the activation of the corresponding
neuron. In general, the $sigma$ parameter of all output neurons (the radius
of the capture region) is always the same.

A notable difference with the previous neural network models is that
the outputs neurons don't operate "in a vacuum", but instead depend
upon each other. In particular, the output of the output neurons is
computed following a "winner-takes-all" principle: the output neuron
with the highest activation has output $1$, any other neuron has output
$0$ (ties are broken at random):

$ f_("out")^((u)) ("act"_(u)) = cases(1 & "if" "act"_(u) = max_(v in U_("out")) "act"_(v),
                                      0 & "otherwise") $

An alternative clustering algorithm is *learning vector quantization*
(*LVQ*). The idea behind LVQ is the same as $k$-means clustering:
partitioning the space into clusters, each represented by a reference
vector (or centroid). The difference between is that in $k$-means
the two updates in each iteration (assigning points to clusters and
recomputing the centroids) are performed by considering all points
at the same time. In LVQ, each iteration performs the updates one
point at a time.

This procedure is referred to as *competitive learning*. For each point,
the reference vectors "compete" with the others to become the reference
vector representing its cluster. The competition is "won" by the reference
vector that is the closest to the point. Since each reference vector is
the center of an output neuron, this is equivalent to stating that the
competition is "won" by the output neuron with the highest activation.
The reference vector/output neuron that won the competition is adapted,
moving it slightly closer to the given point.

Let $bold(p)$ be the training pattern, $bold(r)$ the reference vector that
"won" the "competition" for $bold(p)$ and $eta in (0, 1)$ a learning rate.
The adaptation rule is given by:

$ bold(r) <- bold(r) + eta (bold(p) - bold(r)) $

#figure(
    caption: [On the left, two reference vector and five training patterns
              for LVQ. The leftmost reference vector is closer to the green
              and red points, while the rightmost reference vector is closer
              to the yellow, purple and blue points. On the right, the two
              reference vectors have been moved closer to the points in their
              vicinity.],
    [#grid(
        columns: (0.5fr, 0.5fr),
        stroke: 1pt,
        inset: 10pt,
        [#diagram(
            edge-stroke: 1pt,
            spacing: 4em,

            node((1, -1), stroke: 1.5pt + red, radius: 0.5em, name: <P1>),
            node((0, 0), stroke: 1.5pt + green, radius: 0.5em, name: <P2>),
            node((2, 1.5), stroke: 1.5pt + yellow, radius: 0.5em, name: <P3>),
            node((3, 0), stroke: 1.5pt + blue, radius: 0.5em, name: <P4>),
            node((3, -1.5), stroke: 1.5pt + fuchsia, radius: 0.5em, name: <P5>),
            node((1, 0), fill: black, radius: 0.5em, name: <R1>),
            node((2, 0.5), fill: black, radius: 0.5em, name: <R2>),

            edge(<R1>, <P1>, "dashed"),
            edge(<R1>, <P2>, "dashed"),
            edge(<R2>, <P3>, "dashed"),
            edge(<R2>, <P4>, "dashed"),
            edge(<R2>, <P5>, "dashed")
        )],
        [#diagram(
            edge-stroke: 1pt,
            spacing: 4em,

            node((1, -1), stroke: 1.5pt + red, radius: 0.5em, name: <P1>),
            node((0, 0), stroke: 1.5pt + green, radius: 0.5em, name: <P2>),
            node((2, 1.5), stroke: 1.5pt + yellow, radius: 0.5em, name: <P3>),
            node((3, 0), stroke: 1.5pt + blue, radius: 0.5em, name: <P4>),
            node((3, -1.5), stroke: 1.5pt + fuchsia, radius: 0.5em, name: <P5>),
            node((0.75, -0.25), fill: black, radius: 0.5em, name: <R1>),
            node((2.5, 0.25), fill: black, radius: 0.5em, name: <R2>),

            edge(<R1>, <P1>, "dashed"),
            edge(<R1>, <P2>, "dashed"),
            edge(<R2>, <P3>, "dashed"),
            edge(<R2>, <P4>, "dashed"),
            edge(<R2>, <P5>, "dashed")
        )],
    )]
)

Learning vector quantization exists in both online learning and batch
learning. In online learning, the position of the reference vector is
updated immediately after each point is evaluated. In batch learning,
the updates are "stashed" and then summed at the end of each training
epoch, that is when each point has been evaluated once.

A constant learning rate can prevent, in some situations, the learning
process to converge, especially with online learning. For this reason,
it is actually preferable to have a learning rate that scales with time,
becoming smaller and smaller as the number of iterations increases. For
example:

#grid(
    columns: (0.5fr, 0.5fr),
    [$ eta(t) = eta_(0) alpha^(t), space 0 < alpha < 1 $],
    [$ eta(t) = eta_(0) t^(kappa), space kappa < 0 $]
)

With $eta_(0)$ being the fixed initial rate. Even though a time-dependent
learning rate improves convergence, attention should be paid to the speed
of decrease. If the learning rate decreases too quickly, the step width
might be so small that an optimal situation cannot be reached.

Learning vector quantization, as used so far, solved a free learning
task (unsupervised learning): finding a pattern in a set of data without
a counterexample. However, it is also possible to use learning vector
quantization to solve a fixed learning task (supervised learning).

The idea is to assign a label to each training pattern, the class to which
it belongs, as the output of the pattern. Phrased as such, learning vector
quantization allows to predict, given an unknown point, which label should
receive (to which class should belong). This is done by adding at least as
many reference vectors as there are labels, with the goal of having each
reference vector closer to the points in the training dataset sharing its
label.

The learning process functions in the same way as before, the only difference
is the adaptation rule. Instead of always updating a reference vector moving
it closer to the closest points, two different updates can be performed
depending on the label of the reference vector and on the label of the under
consideration point. If the point and the closest reference vector have the
same label, the reference vector is moved closer (as before). If the point
and the closest reference vector have different labels, the reference vector
is pushed away. These are referred to as the *attraction rule* and the
*repulsion rule*, respectively:

#grid(
    columns: (0.5fr, 0.5fr),
    [$ bold(r) <- bold(r) + eta (bold(p) - bold(r)) $],
    [$ bold(r) <- bold(r) - eta (bold(p) - bold(r)) $]
)

When the model is asked to predict a new (unlabelled) input, its result is
the label of the reference vector closest to the input.

A simple improvement in the training process for fixed learning tasks
relies on considering not the reference vector closest to the given
point, but the two closest reference vectors. Let $bold(r)$ and $bold(r)'$
be these two reference vectors, and let $bold(p)$ be the point under
examination. If $bold(r)$ and $bold(r)'$ have different labels and
$bold(r)$ shares its label with $bold(p)$, then $bold(r)$ is moved
closer to $bold(p)$ and $bold(r)'$ is pushed away from $bold(p)$:

#grid(
    columns: (0.5fr, 0.5fr),
    [$ bold(r) <- bold(r) + eta (bold(p) - bold(r)) $],
    [$ bold(r)' <- bold(r) - eta (bold(p) - bold(r)') $]
)

If $bold(r)$ and $bold(r)'$ have different labels and $bold(r)'$ shares
its label with $bold(p)$, then $bold(r)$ is moved closer and $bold(r)'$
is pushed away:

#grid(
    columns: (0.5fr, 0.5fr),
    [$ bold(r) <- bold(r) - eta (bold(p) - bold(r)) $],
    [$ bold(r)' <- bold(r) + eta (bold(p) - bold(r)') $]
)

From empirical observations, it was observed how this version of
learning vector quantization tends, in certain situations, to drive
the reference vectors further and further apart, instead of having
them converging. One solution is to introduce a so-called *window
rule* into the adaptation formula: the reference vectors $bold(r)$
and $bold(r)'$ are adapted only if the data point $bold(p)$ lies
close to the hyper-surface that separates different clusters (the
classification border). This "closeness" is quantified by requiring
that:

$ min(frac(d(bold(p), bold(r)), d(bold(p), bold(r)')),
      frac(d(bold(p), bold(r)'), d(bold(p), bold(r)))) >
  frac(1 - xi, 1 + xi) $

With $xi$ being a user-chosen parameter that specifies the "breadth"
or "width" of the window adaptation. The idea is that a point lying
too close to the classification border is poorly classified, hence
it's reasonable to adapt the reference vector. On the other hand,
if the point is already far from the border, then there's no need
to adapt the reference vector. This way, an indefinite "pushing away"
of reference vectors is prevented.
