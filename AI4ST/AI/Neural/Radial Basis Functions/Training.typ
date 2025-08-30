#import "../../AI_definitions.typ": *

Even though RBF networks have a more rigid structure than multilayer
perceptron, their training has to be performed with care. This is
because the neurons of each of the three layers have different functions,
hence have to be treated separately. Even the way in which the parameters
of an RBF are initialized is to be done with care.

Consider the case of a *simple radial basis function network*, where
each training example is covered by its own radial basis function. That
is, the number of hidden neurons is equal to the size of the training
dataset and each hidden neuron "takes care" of representing a single
training pattern. In particular, the weights coming into a hidden neuron
are initialized with the values of the inputs of a single training pattern.

More formally, consider a fixed learning task $L_("fixed") = {l_(1),
dots, l_(m)}$ of $m$ training patterns. The simple RBF network that
is to learn $L_("fixed")$ has exactly $m$ hidden neurons $v_(1),
dots, v_(m)$. For each hidden neuron $v_(k)$, the incoming weights
$bold(w)_(v)_(k)$ are initialized precisely to $bold(i)^((l_(k)))$,
the input contained in the $k$-th training pattern $l_(k) =
(bold(i)^((l_(k))), bold(o)^((l_(k))))$.

If the Gaussian activation function is chosen, the $sigma$ parameter
(the radius of the "circle") is often initialized according to the
heuristic:

$ sigma_(k) =
  frac(d_(max), sqrt(2m)) =
  frac(max_(l_(j), l_(k) in L_("fixed")) {d(bold(i)^((l_(j))), bold(i)^((l_(k))))}, sqrt(2m)) space
  forall k in {1, dots, m} $

Where $d_(max)$ is the maximum distance that occurs between any two
inputs of the training pattern (using the same distance as the one
used in the network). This way, the Gaussian curves are neither too
narrow nor too wide.

// FIXME: Why?

After having initialized the weights and the $sigma$ parameter of the
hidden layer, it is necessary to initialize the weights and the $theta$
parameter of the output layer. The idea is very simple: the output neurons
have to be adapted in such a way that the output coming from the hidden
neurons precisely results in the output of the training examples. This
can be done easily because the weights coming into the hidden layer have
been initialized precisely with the training inputs, hence their output
is entirely known.

Since the network input function of the output neurons is a weighted sum
of their inputs and their activation and output functions are both linear,
each training example $l$ yields for each output neuron $u$ one linear
equation:

$ sum_(k = 1)^(m) w_(u, v_(k)) "out"_(v_(k))^((l)) - theta_(u) =
  w_(u, v_(1)) "out"_(v_(1))^((l)) + dots + w_(u, v_(m)) "out"_(v_(m))^((l)) - theta_(u) =
  o_(u)^((l)) $

Where $v_(1), dots, v_(m)$ are the hidden layers. All $o_(u)^((l))$
are known for all $l in L_("fixed")$, since they come directly from
the given training examples. All $"out"_(v_(m))^((l))$ are also known
for all $l in L_("fixed")$, since they're the output of the hidden
neurons, whose parameters have been fixed. On the other hand, $theta_(u)$
and $sum_(k = 1)^(m) w_(u, v_(k))$ are not known, and are the parameters
to be determined.

Therefore, the expression results in a system of $m$ equations, one for
each training pattern, of $m + 1$ unkowns ($theta_(u)$ and $sum_(k = 1)^(m)
w_(u, v_(k))$). Since there are more unknown than equations, to have a
solvable system it is necessary to reduce the degrees of freedom by (at
least) $1$. This is easily done by setting $theta_(u) = 0$. The resulting
system of equations is:

$ cases(sum_(k = 1)^(m) "out"_(v_(k))^((l_(1))) w_(u, v_(k)) =
        "out"_(v_(1))^((l_(1))) w_(u, v_(1)) + dots + "out"_(v_(m))^((l_(1))) w_(u, v_(m)) = o_(u)^((l_(1))),
        sum_(k = 1)^(m) "out"_(v_(k))^((l_(2))) w_(u, v_(k))=
        "out"_(v_(1))^((l_(2))) w_(u, v_(1)) + dots + "out"_(v_(m))^((l_(2))) w_(u, v_(m)) = o_(u)^((l_(2))),
        dots.v,
        sum_(k = 1)^(m) "out"_(v_(k))^((l_(m))) w_(u, v_(k)) =
        "out"_(v_(1))^((l_(m))) w_(u, v_(1)) + dots + "out"_(v_(m))^((l_(m))) w_(u, v_(m)) = o_(u)^((l_(m)))) $

Or, in matrix form:

$ mat("out"_(v_(1))^((l_(1))), "out"_(v_(2))^((l_(1))), dots, "out"_(v_(m))^((l_(1)));
      "out"_(v_(1))^((l_(2))), "out"_(v_(2))^((l_(2))), dots, "out"_(v_(m))^((l_(2)));
      dots.v, dots.v, dots.down, dots.v;
      "out"_(v_(1))^((l_(m))), "out"_(v_(2))^((l_(m))), dots, "out"_(v_(m))^((l_(m))))
  vec(w_(u, v_(1)), w_(u, v_(2)), dots.v, w_(u, v_(m))) =
  vec(o_(u)^((l_(1))), o_(u)^((l_(2))), dots.v, o_(u)^((l_(m)))) =>
  bold(A) bold(w)_(u) = bold(o)_(u) $

Since it's actually $bold(w)_(u)$ the vector of interest, it's
convenient to rewrite the expression as:

$ bold(w)_(u) = bold(A)^(-1) bold(o)_(u) $

Which is then solved as a standard product between two matrices,
assuming that $bold(A)$ is invertible. If it's not, weights have
to be chosen randomly until the remaining equation system is uniquely
solvable.

Note how a simple RBF network requires no training at all: the weights
coming into the output neuron are defined so that they exactly match the
outputs, and it's always possible to compute them with the aforementioned
formula, hence the error is always zero.

#exercise[
    Construct a simple RBF network for the biimplication, using the
    Euclidean distance as distance function and the Gaussian function
    as radial basis function.
] <Simple-RBF-biimplication>
#solution[
    The biimplication of two propositions is true if both are true or both
    are false. Hence, the training patterns are:

    $ L_("fixed") = {((0, 0), 1), ((1, 0), 0), ((0, 1), 0), ((1, 1), 1)} $

    Which gives a total of $4$ hidden neurons. The maximum distance is
    between $(0, 0)$ and $(1, 1)$, which is $sqrt(2)$, therefore the
    $sigma$ parameter is initialized to $sqrt(2) slash sqrt(2 dot 4) =
    1 slash 2$.

    Since the output function of the hidden neurons is the identity, their
    output is directly known from their activation. The output of the hidden
    neuron $u$ for the training pattern $l$ is:

    $ "out"_(u)^((l)) = f_("out")("act"_(u)^((l))) =
      "act"_(u)^((l)) = f_("act")("net"_(u)^((l))) =
      e^(-display(frac(("net"_(u)^((l)))^(2), 2 (1 slash 2)^(2)))) =
      e^(-2("net"_(u)^((l)))^(2)) $

    Where $"net"_(u)^((l))$ is the distance between the two inputs. The
    distance between two identical inputs is $0$, the distance between
    two inputs that have one input in common is $1$, the distance between
    two inputs that have nothing in common is $sqrt(2)$. This gives the
    following matrix:

    #grid(
        columns: (0.4fr, 0.6fr),
        [$ bold(A) = mat(1, e^(-2), e^(-2), e^(-4);
                         e^(-2), 1, e^(-4), e^(-2);
                         e^(-2), e^(-4), 1, e^(-2);
                         e^(-4), e^(-2), e^(-2), 1) $],
        [$ bold(A)^(-1) = mat(1.0378, -0.1404, -0.1404, 0.0190;
                              -0.1404, 1.0378, 0.0190, -0.1404;
                              -0.1404, 0.0190, 1.0378, -0.1404;
                              0.0190, -0.1404, -0.1404, 1.0378) $]
    )

    The vector of weights for one and only output neuron is:

    $ bold(w)_(u) =
      bold(A)^(-1) bold(o)_(u) =
      mat(1.0378, -0.1404, -0.1404, 0.0190;
          -0.1404, 1.0378, 0.0190, -0.1404;
          -0.1404, 0.0190, 1.0378, -0.1404;
          0.0190, -0.1404, -0.1404, 1.0378)
      vec(1, 0, 0, 1) approx
      vec(1.0567, -0.2809, -0.2809, 1.0567) $

    #figure(
        caption: [A simple radial basis function network for the biimplication.],
        [#diagram(
            node-stroke: 1.5pt + blue,
            edge-stroke: 1.5pt,
            spacing: 4em,

            node((-1.75, -1), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
            node((-1.75, 0), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
            node((-0.5, -1), stroke: 1.5pt + fuchsia, radius: 2em, name: <I1>),
            node((-0.5, 0), stroke: 1.5pt + fuchsia, radius: 2em, name: <I2>),
            node((1, -2), text(font: "Noto Sans", [0.5]), radius: 2em, name: <H1>),
            node((1, -1), text(font: "Noto Sans", [0.5]), radius: 2em, name: <H2>),
            node((1, 0), text(font: "Noto Sans", [0.5]), radius: 2em, name: <H3>),
            node((1, 1), text(font: "Noto Sans", [0.5]), radius: 2em, name: <H4>),
            node((2.5, -0.5), text(font: "Noto Sans", [0]), stroke: 1.5pt + green, radius: 2em, name: <O1>),

            edge((-1.75, -1), <I1>, marks: (none, "latex")),
            edge((-1.75, 0), <I2>, marks: (none, "latex")),
            edge(<I1>, <H1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [0])),
            edge(<I2>, <H1>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [0])),
            edge(<I1>, <H2>, marks: (none, "latex"), label-pos: 0.35, label-angle: auto, label: text(font: "Noto Sans", [0])),
            edge(<I2>, <H2>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [+1])),
            edge(<I1>, <H3>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [+1])),
            edge(<I2>, <H3>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [0])),
            edge(<I1>, <H4>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [+1])),
            edge(<I2>, <H4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
            edge(<H1>, <O1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1.0567])),
            edge(<H2>, <O1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-0.2809])),
            edge(<H3>, <O1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-0.2809])),
            edge(<H4>, <O1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1.0567])),
            edge(<O1>, (3.5, -0.5), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
        )]
    )
]

Simple RBF networks have the advantage that don't need to be trained,
since all parameters are fixed by hand and give solutions that will
always perfectly match the examples. However, they cannot be used in
practice, because in general the size of the training dataset is too
large to feasibly assign a single hidden neuron to each example.

This is why (not simple) RBF networks are much more useful. To construct
an RBF network, the idea is start from a simple RBF network that encodes
a subset of the examples, initialize its parameters in the standard way
and then train the network with the entire set of examples.

Consider a fixed learning task $L_("fixed")$ of $m$ examples. Take
a subset of size $t < m$ of the training examples and construct a
simple RBF network out of this subset. The patterns in the subset
should capture the general trend of the data, in order to be as
representative as possible. This can be done, for example, by
performing $k$-means on the training dataset with $k = t$ and
constructing the subset out of the $t$ centroids.

As expected, the weights coming into said neurons are initialized with the
values of the possible inputs in the subset, and the $sigma$ parameters as
$d_("max") slash sqrt(2 m)$. The difference is that now the expression:

$ sum_(k = 1)^(t) w_(u, v_(k)) "out"_(v_(k))^((l)) - theta_(u) =
  o_(u)^((l)) $

Leads to a system of equations that has $m$ equations (one for each example
of the whole set) and $t + 1$ unknowns (the weights of the $t$ neurons and
the $theta$ parameter). Since $m < t$, the $theta$ parameter(s) are not set
to $0$, but are instead embed into the weights, in order to obtain an extra
degree of freedom. This gives:

$ mat(1, "out"_(v_(1))^((l_(1))), "out"_(v_(2))^((l_(1))), dots, "out"_(v_(t))^((l_(1)));
      1, "out"_(v_(1))^((l_(2))), "out"_(v_(2))^((l_(2))), dots, "out"_(v_(t))^((l_(2)));
      dots.v, dots.v, dots.v, dots.down, dots.v;
      1, "out"_(v_(1))^((l_(m))), "out"_(v_(2))^((l_(m))), dots, "out"_(v_(t))^((l_(m))))
  vec(-theta_(u), w_(u, v_(1)), w_(u, v_(2)), dots.v, w_(u, v_(t))) =
  vec(o_(u)^((l_(1))), o_(u)^((l_(2))), dots.v, o_(u)^((l_(m)))) =>
  bold(A) bold(w)_(u) = bold(o)_(u) $

The problem is that, even with this embedding, $m$ is still larger than
the number of unknowns ($t + 1$). This means that $A$ is not a square
matrix, and therefore cannot be moved to the right hand side it was the
case for simple RBF networks. Nevertheless, a satisfactory approximation
is given by the pseudoinverse $bold(A)^(+) = (bold(A)^(T) bold(A))^(-1)
bold(A)^(T)$. This gives:

$ bold(w)_(u) approx bold(A)^(+) bold(o)_(u) =
  (bold(A)^(T) bold(A))^(-1) bold(A)^(T) bold(o)_(u) $

#exercise[
    Consider @Simple-RBF-biimplication. Write an equivalent RBF network.
]
#solution[
    Suppose that, out of all input combinations in $L_("fixed")$,
    only $((0, 0), 1)$ and $((1, 1), 1)$ are chosen. This gives
    the following $4 times 3$ (two patterns plus one extra input
    to accomodate $theta$) matrix:

    #grid(
        columns: (0.35fr, 0.65fr),
        [$ bold(A) =
           mat(1, 1, e^(-4);
               1, e^(-2), e^(-2);
               1, e^(-2), e^(-2);
               1, e^(-4), 1) $],
        [$ bold(A)^(+) =
           mat(-0.1810,  0.6810,  0.6810, -0.1810;
               1.1780, -0.6687, -0.6687,  0.1594;
               0.1594, -0.6687, -0.6687,  1.1780) $]
    )

    Where the distances and the $sigma$ parameter are taken directly
    from @Simple-RBF-biimplication. This gives:

    $ bold(w)_(u) approx bold(A)^(+) bold(o)_(u) =
      mat(-0.1810,  0.6810,  0.6810, -0.1810;
          1.1780, -0.6687, -0.6687,  0.1594;
          0.1594, -0.6687, -0.6687,  1.1780)
      vec(1, 0, 0, 1) =
      vec(-0.3620, 1.3375, 1.3375) $

    #figure(
        caption: [A radial basis function network for the biimplication.],
        [#diagram(
            node-stroke: 1.5pt + blue,
            edge-stroke: 1.5pt,
            spacing: 4em,

            node((-1.25, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
            node((-1.25, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
            node((0, 0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta1>),
            node((0, -0.5), stroke: 1.5pt + fuchsia, radius: 2em, name: <Theta2>),
            node((1.5, 0.5), text(font: "Noto Sans", [0.5]), radius: 2em, name: <Theta3>),
            node((1.5, -0.5), text(font: "Noto Sans", [0.5]), radius: 2em, name: <Theta4>),
            node((3, 0), text(font: "Noto Sans", [-0.362]), stroke: 1.5pt + green, radius: 2em, name: <Theta5>),

            edge((-1, 0.5), <Theta1>, marks: (none, "latex")),
            edge((-1, -0.5), <Theta2>, marks: (none, "latex")),
            edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [0])),
            edge(<Theta1>, <Theta4>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [+1])),
            edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-pos: 0.65, label-angle: auto, label: text(font: "Noto Sans", [0])),
            edge(<Theta2>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1])),
            edge(<Theta3>, <Theta5>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1.3375])),
            edge(<Theta4>, <Theta5>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+1.3375])),
            edge(<Theta5>, (4, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
        )]
    )
]

Now that the RBF network has been initialized, it has to be trained.
The training process follows the same approach for the training of
a multilayer perceptron, applying the backpropagation algorithm.

Training an RBF network is actually easier than training a multilayer
perceptron. This is because while the latter has to account for an
arbitrary number of layers, an RBF network always has three. This
means that each training run has exactly three steps: training the
weights coming into the output layer, training the $sigma$ parameters
of the hidden layer, training the weights coming into the hidden layer.

Training the weights coming into the hidden layer can be borrowed
one-for-one from the training of a multilayer perceptron. This is
because the network input function, activation function and output
function of the output layer of an RBF are identical to those of a
multilayer perceptron. The gradient for a single output neuron $u$
and a single training pattern $l$ is therefore:

$ nabla bold(w)_(u) e_(u)^((l)) =
  frac(partial e_(u)^((l)), partial bold(w)_(u)) =
  -2(o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

For a fixed learning task $L_("fixed") = {(bold(i)^((l)), bold(o)^((l)))}$.
Note that the $theta$ parameter of the output layer, as it was the case
for the multilayer perceptron, has been embed into the weights to simplify
calculations.

Assuming, as it is generally the case, that the output function of
the output layer is the identity:

$ nabla bold(w)_(u) e_(u)^((l))
  &= -2(o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  -2(o_(u)^((l)) - "out"_(u)^((l))) frac(partial "act"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) = \
  &= -2(o_(u)^((l)) - "out"_(u)^((l))) cancel(frac(partial "net"_(u)^((l)), partial "net"_(u)^((l)))) bold("in")_(u)^((l)) =
  -2(o_(u)^((l)) - "out"_(u)^((l))) bold("in")_(u)^((l)) $

Which gives the adaptation rule:

$ Delta bold(w)_(u)^((l)) =
  -frac(eta, 2) nabla bold(w)_(u) e_(u)^((l)) =
  eta_(3) (o_(u)^((l)) - "out"_(u)^((l))) bold("in")_(u)^((l)) $

Note the presence of a pedix in the learning rate. This is because each
of the three steps should use its own learning rate.

The training of the weights coming into the hidden layers cannot be
borrowed from the training of multilayer perceptrons, because the are
different types of functions at play. In particular, the network input
function of the hidden layer is not a weighted sum, but a distance
function. This means that it's not possible to embed the $sigma$
parameter into the weights, and the training of the weights and of
the $sigma$ parameters has to be carried out separately.

Consider an neuron $v$ belonging to the hidden layer $U_("hidden")$
Its predecessors, which are just a subset of the input neurons, are
given by $"pred"(v) = {p_(1), dots, p_(n)} subset.eq U_("in")$. The
corresponding vector of weights is $bold(w)_(v) = (w_(v, p_(1)), dots,
w_(v, p_(n)))$. The gradient of the total error function with respect
to these weights is:

$ nabla_(bold(w)_(v)) e =
  frac(partial e, partial bold(w)_(v)) = 
  (-frac(partial e, partial theta_(v)),
   frac(partial e, partial w_(v, p_(1))),
   dots, frac(partial e, partial w_(v, p_(n)))) $

Explicitly substituting the expression for $e$:

$ nabla_(bold(w)_(v)) e =
  frac(partial e, partial bold(w)_(v)) = 
  frac(partial, partial bold(w)_(v)) sum_(l in L_("fixed")) e^((l)) =
  sum_(l in L_("fixed")) frac(partial e^((l)), partial bold(w)_(v)) =
  sum_(l in L_("fixed")) nabla_(bold(w)_(v)) e^((l)) $

Consider a single training pattern $l$ and its error $e^((l)) =
sum_(u in U_("out")) e^((l))_(u)$. The error depends on the value
of the output of the layer, which in turn depends (also) on the
network input. However, the network input depends on the weights:

$ "net"_(v)^((l)) =
  d(bold(w)_(v), bold("in")_(v)^((l))) =
  d(bold(w)_(v), ("out"_(p_(1))^((l)), dots, "out"_(p_(n))^((l)))) $

Which means that there's a dependency between the error and the
weights. Applying the chain rule:

$ nabla_(bold(w)_(v)) e^((l)) =
  frac(partial e^((l)), partial bold(w)_(v)) =
  frac(partial e^((l)), partial "net"_(v)^((l)))
  frac(partial "net"_(v)^((l)), partial bold(w)_(v)) =
  frac(partial e^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) $

Expanding the error $e^((l))$ in the first factor:

$ nabla_(bold(w)_(v)) e^((l)) &=
  frac(partial e^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) =
  frac(partial sum_(u in U_("out")) (o_(u)^((l)) - "out"_(u)^((l)))^(2), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) = \
  &= sum_(u in U_("out")) frac(partial (o_(u)^((l)) - "out"_(u)^((l)))^(2), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) = \
  &= sum_(u in U_("out")) 2(o_(u)^((l)) - "out"_(u)^((l)))
  frac(partial (o_(u)^((l)) - "out"_(u)^((l))), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) = \
  &= sum_(u in U_("out")) 2(o_(u)^((l)) - "out"_(u)^((l)))
  (cancel(frac(partial o_(u)^((l)), partial "net"_(v)^((l)))) -
  frac(partial "out"_(u)^((l)), partial "net"_(v)^((l))))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) = \
  &= -2 sum_(u in U_("out")) (o_(u)^((l)) - "out"_(u)^((l)))
  frac(partial "out"_(u)^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) $

Where $partial o_(u)^((l)) slash partial "net"_(v)^((l))$ is $0$ since
$o_(u)^((l))$ is a known constant.

Let $"succ"(v) = {s_(1), dots, s_(n)} subset.eq U_("out")$ be the successors
of the hidden neuron $v$, which are a subset of the output neurons.
The output of an output neuron $u$ depends on (the network input of)
$v$ only if there is a connection from $v$ to $u$. If there is no connection,
meaning that $u in.not "succ"(v)$, the term $partial "out"_(u)^((l)) slash
partial "net"_(v)^((l))$ is just $0$. Therefore, it is justified to rewrite
the expression above as:

$ nabla_(bold(w)_(v)) e^((l)) =
  -2 sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l)))
  frac(partial "out"_(s)^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) $

That is, by removing all the terms that give no contribution to the
summation.

Since the neurons $s$ and $v$ are by definition adjacent, the output of
of $s$ is dependent on the network input of $v$ only with respect to the
network input of $s$. Applying the chain rule:

$ nabla_(bold(w)_(v)) e^((l)) &=
  -2 sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l)))
  frac(partial "out"_(s)^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) = \
  &= -2 sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l)))
  cancel(frac(partial "out"_(s)^((l)), partial "net"_(s)^((l))))
  frac(partial "net"_(s)^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) = \
  &= -2 sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l)))
  frac(partial "net"_(s)^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) $

Where $partial "out"_(s)^((l)) slash partial "net"_(s)^((l))$
is $1$ because $s$ is an output neuron, and therefore its output
function is the identity. As for $partial "net"_(s)^((l)) slash
partial "net"_(v)^((l))$, since $s$ is an output neuron, its
network input functon is a weighted summation. In particular:

$ frac(partial "net"_(s)^((l)), partial "net"_(v)^((l))) &=
  frac(partial (bold(w)_(s) bold("in")_(s)^((l)) - theta_(s)), partial "net"_(v)^((l))) =
  frac(partial (-theta_(s) + sum_(p in "pred"(s)) w_(s, p) "out"_(p)^((l))), partial "net"_(v)^((l))) = \
  &= frac(partial sum_(p in "pred"(s)) w_(s, p) "out"_(p)^((l)), partial "net"_(v)^((l))) - frac(partial theta_(s), partial "net"_(v)^((l))) =
  sum_(p in "pred"(s)) frac(partial w_(s, p) "out"_(p)^((l)), partial "net"_(v)^((l))) - cancel(frac(partial theta_(s), partial "net"_(v)^((l)))) = \
  &= sum_(p in "pred"(s)) w_(s, p) frac(partial "out"_(p)^((l)), partial "net"_(v)^((l))) $

// FIXME: why is theta cancelled?

Out of all neurons $p in "pred"(s)$ there is precisely the neuron $v$,
since $s$ is one of its successors. This means that the only term of
$partial "net"_(s)^((l)) slash partial "net"_(v)^((l))$ that is not
null is the one where $p = v$, because it's the only dependency between
$"net"_(s)^((l))$ and $"net"_(v)^((l))$:

$ frac(partial "net"_(s)^((l)), partial "net"_(v)^((l))) =
  sum_(p in "pred"(s)) w_(s, p) frac(partial "out"_(p)^((l)), partial "net"_(v)^((l))) =
  sum_(p = v) w_(s, p) frac(partial "out"_(p)^((l)), partial "net"_(v)^((l))) =
  w_(s, v) frac(partial "out"_(v)^((l)), partial "net"_(v)^((l))) $

Substituting in the previous expression:

$ nabla_(bold(w)_(v)) e^((l)) &=
  -2 sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l)))
  frac(partial "net"_(s)^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) = \
  &= -2 sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l)))
  w_(s, v) frac(partial "out"_(v)^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) $

Which gives the following adaptation rule:

$ Delta bold(w)_(v)^((l)) =
  -frac(eta_(1), 2) nabla_(bold(w)_(v)) e^((l)) =
  eta_(1) sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l)))
  w_(s, v) frac(partial "out"_(v)^((l)), partial "net"_(v)^((l)))
  frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) $

An explicit expression of the adaptation depends on the choice of the
distance function and on the choice of the radial basis function. Assuming,
as it is often the case, that the distance is the Euclidean distance, the
last factor becomes:

$ frac(partial d(bold(w)_(v), bold("in")_(v)^((l))), partial bold(w)_(v)) =
  frac(sqrt(sum_(i = 1)^(n) (w_(v, p_(i)) - "out"_(p_(i))^((l)))^(2)), partial bold(w)_(v)) =
  (sum_(i = 1)^(n) (w_(v, p_(i)) - "out"_(p_(i))^((l)))^(2))^(-frac(1, 2)) (bold(w)_(v) - bold("in")_(v)^((l))) $

Assuming then (again, as it is often the case) that the radial basis
function is the Gaussian function, the butlast factor becomes:

$ frac(partial "out"_(v)^((l)), partial "net"_(v)^((l))) &=
  frac(partial f_("act")("net"_(v)^((l)), sigma_(v)), partial "net"_(v)^((l))) =
  frac(partial e^(-display(frac(("net"_(v)^((l)))^(2), 2 sigma^(2)_(v)))), partial "net"_(v)^((l))) =
  e^(-display(frac(("net"_(v)^((l)))^(2), 2 sigma^(2)_(v)))) frac(partial, partial "net"_(v)^((l))) (-frac(("net"_(v)^((l)))^(2), 2 sigma^(2)_(v))) = \
  &= e^(-display(frac(("net"_(v)^((l)))^(2), 2 sigma^(2)_(v)))) frac(-1, 2 sigma^(2)_(v)) frac(partial ("net"_(v)^((l)))^(2), partial "net"_(v)^((l)))  = 
  e^(-display(frac(("net"_(v)^((l)))^(2), 2 sigma^(2)_(v)))) frac(-cancel(2) "net"_(v)^((l)), cancel(2) sigma^(2)_(v)) =
  -frac("net"_(v)^((l)), sigma^(2)_(v)) e^(-display(frac(("net"_(v)^((l)))^(2), 2 sigma^(2)_(v)))) $

Substituting both factors:

$ Delta bold(w)_(v)^((l)) =
  -eta_(1) sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l))) w_(s, v) 
  frac(display(frac("net"_(v)^((l)), sigma^(2)_(v))) e^(-display(frac(("net"_(v)^((l)))^(2), 2 sigma^(2)_(v)))), display(sum_(i = 1)^(n)) sqrt((w_(v, p_(i)) - "out"_(p_(i))^((l)))^(2)))
  (bold(w)_(v) - bold("in")_(v)^((l))) $

The last training step is the update of the $sigma$ parameters. The
derivation follows the same steps as the derivation of the adaptation
of the weights:

$ frac(partial e^((l)), partial sigma_(v)) =
  -2 sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l))) w_(s, v) frac(partial "out"_(v)^((l)), partial sigma_(v)) $

Which gives the adaptation:

$ Delta sigma_(v)^((l)) =
  -frac(eta_(2), 2) frac(partial e^((l)), partial sigma_(v)) =
  eta_(2) sum_(s in "succ"(v)) (o_(s)^((l)) - "out"_(s)^((l))) w_(s, v) frac(partial "out"_(v)^((l)), partial sigma_(v)) $

As stated, three different learning rates are here at play: one
for the weights coming into the output layer ($eta_(3)$), one for
the weights coming into the hidden layer ($eta_(1)$) and one for
the $sigma$ parameters of the hidden layer ($eta_(2)$). This is
because it has been shown empirically that the weights coming into
the output layer have a much stronger influence on the final output
than any other parameter of the network. For this reason, it should
be adapted much more slowly than the rest.

// FIXME: clarify the distinction between online learning and batch learning
