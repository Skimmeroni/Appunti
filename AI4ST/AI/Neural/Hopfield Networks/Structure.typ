#import "../../AI_definitions.typ": *

A *Hopfield network* is a simple recurrent neural network
with the following characteristics:

- There are no hidden neurons, only input and output neurons:
  $U_("hidden") = emptyset$;
- All input neurons are also output neurons:
  $U = U_("in") = U_("out")$;
- The neurons are fully connected, without loops:
  $C = U times U - {(u, u) | u in C}$;
- The connection weights are symmetric:
  $forall u, v in U$ with $u != v$, $w_(u, v) = w_(v, u)$;
- The network input function of all neurons is the weighted sum of the
  outputs of all the other neurons:

  $ forall u in U, f_("net")^((u)) (bold(w)_(u), bold("in")_(u)) =
    bold(w)_(u), bold("in")_(u) = sum_(v in U - {u}) w_(u, v) "out"_(v) $

- The activation function of all neurons is a modified Heaviside function:

  $ forall u in U, f_("act")^((u)) ("net"_(u), theta_(u)) =
    overline(H) ("net"_(u), theta_(u)) =
    cases(+1 & "if" "net"_(u) gt.eq theta_(u),
          -1 & "otherwise") =
    cases(+1 & "if" "net"_(u) - theta_(u) gt.eq 0,
          -1 & "otherwise") $

  Same as the one employed in the ADALINE variant of the TLU;
- The output function of all neurons is the identity.

#figure(
    caption: [A simple Hopfield network with three neurons: from left to
              right, $u_(1), u_(2), u_(3)$],
    diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((0, -1.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((1, -1.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((2, -1.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[3]])),

			node((0, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <N1>),
			node((1, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <N2>),
			node((2, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <N3>),

			node((0, 1.5), fill: none, stroke: none, text(font: "Noto Sans", [y#sub[1]])),
			node((1, 1.5), fill: none, stroke: none, text(font: "Noto Sans", [y#sub[2]])),
			node((2, 1.5), fill: none, stroke: none, text(font: "Noto Sans", [y#sub[3]])),

			edge(<N1>, <N2>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [+1])),
			edge(<N2>, <N1>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [+1])),
			edge(<N1>, <N3>, marks: (none, "latex"), label-angle: auto, label-pos: 0.75, bend: -60deg, label: text(font: "Noto Sans", [+2])),
			edge(<N3>, <N1>, marks: (none, "latex"), label-angle: auto, label-pos: 0.75, bend: -60deg, label: text(font: "Noto Sans", [+2])),
			edge(<N2>, <N3>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [+1])),
			edge(<N3>, <N2>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [+1])),

			edge((0, -1.5), <N1>, marks: (none, "latex")),
			edge((1, -1.5), <N2>, marks: (none, "latex")),
			edge((2, -1.5), <N3>, marks: (none, "latex")),
			edge(<N1>, (0, 1.5), marks: (none, "latex")),
			edge(<N2>, (1, 1.5), marks: (none, "latex")),
			edge(<N3>, (2, 1.5), marks: (none, "latex"))
    )
) <Hopfield-Network-Example>

In a Hopfield network, all neurons have each other's output as one of
their inputs. This means that a single weight matrix can describe the
entire network connections of a Hopfield network. Since all connections
are symmetric and no neuron is connected to itself, the weight matrix
$W$ of the connections of a Hopfield network with $n$ neurons has the
following structure:

// Sometimes, a different representation is employed, where there
// are no input and output and arrows are doubled.

$ W = mat(0, w_(u_(1), u_(2)), dots, w_(u_(1), u_(n));
          w_(u_(1), u_(2)), 0, dots, w_(u_(2), u_(n));
          dots.v, dots.v, dots.down, dots.v;
          w_(u_(1), u_(n)), w_(u_(2), u_(n)), dots, 0) $

#exercise[
    What would be the weight matrix of the connections of
    @Hopfield-Network-Example?
]
#solution[
    $ W = mat(0, 1, 2; 1, 0, 1; 2, 1, 0) $
]

The neural network models so far explored were all feed-forward neural
networks, meaning that the order in which the neurons carry out their
computations is irrelevant. This is because no output of the network is
ever fed back in as output. Hopfield networks are, on the other hand,
recurrent neural networks, which means that their computations have to
be taken into account with extra care.

As a matter of fact, the input phase of a Hopfield network is no
different than any feed-forward neural network: the network input
of all input neurons is deactivated and the external input is drawn
in as the only input. The only difference is that not all neurons
of most feed-forward neural networks are input neurons, while an
Hopfield network is entirely constituted by input neurons, meaning
that all neurons are involved in the input phase.

The real distinction between Hopfield networks and feed-forward networks
is the work phase. The issue arises on when exactly the recomputations of
the neuron activation should be performed. If the neurons are updated
*synchronously*, meaning all at the same time, there is no guarantee that
a stable state will be reached. That is, the neural network can oscillate
between different possible states without ever settling on one.

If the neurons are instead updated *asynchronously*, meaning that the
neurons are updated one at a time for each training passage, immediately
using their new output as input for the not-yet-trained neurons, then a
stable state can be reached. Note that a different order for the update
of the neurons can lead to completely different states.

#exercise[
	Suppose that the external input $(-1, 1, 1)$ is fed to the Hopfield
	network in @Hopfield-Network-Example. If the network is updated
	synchronously and asynchronously, what happens?
]
#solution[
	With synchronous updates, the network is "stuck" between the states
	$(-1, 1, 1)$ and $(1, 1, -1)$:

	#table(
		columns: 3,
		table.header(
			[*Output of* $bold(u_(1))$],
			[*Output of* $bold(u_(2))$],
			[*Output of* $bold(u_(3))$]),
		[$overline(H) (-1, 0) = -1$],
		[$overline(H) (1, 0) = 1$],
		[$overline(H) (1, 0) = 1$],
		[$overline(H) (1 dot 1 + 2 dot 1, 0) = 1$],
		[$overline(H) (1 dot (-1) + 1 dot 1, 0) = 1$],
		[$overline(H) (2 dot (-1) + 1 dot 1, 0) = -1$],
		[$overline(H) (1 dot 1 + 2 dot (-1), 0) = -1$],
		[$overline(H) (1 dot 1 + 1 dot (-1), 0) = 1$],
		[$overline(H) (2 dot 1 + 1 dot 1, 0) = 1$],
		[$overline(H) (1 dot 1 + 2 dot 1, 0) = 1$],
		[$overline(H) (1 dot (-1) + 1 dot 1, 0) = 1$],
		[$overline(H) (2 dot (-1) + 1 dot 1, 0) = -1$]
	)

	With asynchronous updates and update order $u_(1), u_(2), u_(3)$,
	the stable state $(1, 1, 1)$ is reached:

	#table(
		columns: 3,
		table.header(
			[*Output of* $bold(u_(1))$],
			[*Output of* $bold(u_(2))$],
			[*Output of* $bold(u_(3))$]),
		[$overline(H) (-1, 0) = -1$],
		[$overline(H) (1, 0) = 1$],
		[$overline(H) (1, 0) = 1$],
		[$overline(H) (1 dot 1 + 2 dot 1, 0) = 1$],
		[$overline(H) (1 dot 1 + 1 dot 1, 0) = 1$],
		[$overline(H) (2 dot 1 + 1 dot 1, 0) = 1$],
		[$overline(H) (1 dot 1 + 2 dot 1, 0) = 1$],
		[$overline(H) (1 dot 1 + 1 dot 1, 0) = 1$],
		[$overline(H) (2 dot 1 + 1 dot 1, 0) = 1$]
	)

	Notice how the ouput of the neuron changes mid-process.

	With asynchronous updates and update order $u_(3), u_(2), u_(1)$,
	the stable state $(-1, -1, -1)$ is reached:

	#table(
		columns: 3,
		table.header(
			[*Output of* $bold(u_(1))$],
			[*Output of* $bold(u_(2))$],
			[*Output of* $bold(u_(3))$]),
		[$overline(H) (-1, 0) = -1$],
		[$overline(H) (1, 0) = 1$],
		[$overline(H) (1, 0) = 1$],
		[$overline(H) (1 dot (-1) + 2 dot (-1), 0) = -1$],
		[$overline(H) (1 dot (-1) + 1 dot (-1), 0) = -1$],
		[$overline(H) (2 dot (-1) + 1 dot 1, 0) = -1$],
		[$overline(H) (1 dot (-1) + 2 dot (-1), 0) = -1$],
		[$overline(H) (1 dot (-1) + 1 dot (-1), 0) = -1$],
		[$overline(H) (2 dot (-1) + 1 dot (-1), 0) = -1$]
	)

	It is easy to show that any other choice of update order results in
	either the stable state $(-1, -1, -1)$ or the stable state $(1, 1, 1)$.
]

To describe how the state of a Hopfield network changes and (eventually)
settles, compiling the tabulated list of all possible states for the update
steps is not particularly informative. Also, a different table would have
to be constructed for each possible choice of update order. A more effective
representation is an automata, the so-called *state graph*.

Each node of a state graph represents a state of a Hopfield network.
The labels of the nodes are the activations of the neurons in the
corresponding state, written from left to right. Since the activations
are always $plus.minus 1$, it is more common to just write $+$ for $+1$
and $-$ for $-1$. Each edge represents a state transition, and is labeled
with a neuron. This neuron is the neuron that needs to be updated in order
to trigger the transition between the states labeling the nodes. The nodes
representing stable states are often drawn with different colors.

To know which stable state is reached when feeding a certain input,
it is sufficient to chose an update order and to traverse the graph
starting from the state corresponding to the external input. Since
the state graph represents all possible states that a Hopfield
network can reach, the total number of its nodes is $2^(n)$, with
$n$ being the number of neurons.

#exercise[
	Construct a state graph for @Hopfield-Network-Example.
]
#solution[
	#figure(
		caption: [A state graph for @Hopfield-Network-Example. The two
		          stable states are highlighted in gray.],
		diagram(
			node-stroke: 1.5pt,
			edge-stroke: 1.5pt,
			spacing: 2em,

			node((1.5, 0), $- + +$, radius: 2em, name: <MPP>),
			node((3, 1.5), $+ + +$, fill: gray, radius: 2em, name: <PPP>),
			node((-4.5, 1.5), $+ - +$, radius: 2em, name: <PMP>),
			node((1.5, -1.5), $- + -$, radius: 2em, name: <MPM>),
			node((-3, -1.5), $- - -$, fill: gray, radius: 2em, name: <MMM>),
			node((-3, 0), $- - +$, radius: 2em, name: <MMP>),
			node((3, -3), $+ + -$, radius: 2em, name: <PPM>),
			node((-4.5, -3), $+ - -$, radius: 2em, name: <PMM>),

			edge(<MPP>, <PPP>, marks: (none, "latex"), label-angle: auto, label: $u_(1)$),
			edge(<MPP>, <MPP>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 45deg, label: $u_(2)$),
			edge(<MPP>, <MPM>, marks: (none, "latex"), label-angle: auto, label: $u_(3)$),
			edge(<PPP>, <PPP>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 135deg, label: $u_(1), u_(2), u_(3)$),
			edge(<MPM>, <MPM>, marks: (none, "latex"), label-angle: auto, bend: 135deg, loop-angle: 135deg, label: $u_(1), u_(3)$),
			edge(<MPM>, <MMM>, marks: (none, "latex"), label-angle: auto, label: $u_(2)$),
			edge(<MMM>, <MMM>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 45deg, label: $u_(1), u_(2), u_(3)$),
			edge(<PPM>, <MPM>, marks: (none, "latex"), label-angle: auto, label: $u_(1)$),
			edge(<PPM>, <PPM>, marks: (none, "latex"), label-angle: auto, bend: 135deg, loop-angle: 45deg, label: $u_(2)$),
			edge(<PMP>, <PMP>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 45deg, label: $u_(1), u_(3)$),
			edge(<PPM>, <PPP>, marks: (none, "latex"), label-angle: auto, label: $u_(3)$),
			edge(<PMP>, <PPP>, marks: (none, "latex"), label-angle: auto, label: $u_(2)$),
			edge(<MMP>, <MMM>, marks: (none, "latex"), label-angle: auto, label: $u_(3)$),
			edge(<MMP>, <MPP>, marks: (none, "latex"), label-angle: auto, label: $u_(2)$),
			edge(<MMP>, <PMP>, marks: (none, "latex"), label-angle: auto, label: $u_(1)$),
			edge(<PMM>, <MMM>, marks: (none, "latex"), label-angle: auto, label: $u_(1)$),
			edge(<PMM>, <PPM>, marks: (none, "latex"), label-angle: auto, label: $u_(2)$),
			edge(<PMM>, <PMP>, marks: (none, "latex"), label-angle: auto, label: $u_(3)$),
		)
	)
]

The fact that the Hopfield network @Hopfield-Network-Example settled to
a stable state when updated asynchronously is no coincidence. It can be
proven that any Hopfield network that is updated asynchronously is
_guaranteed_ to settle to a stable state, no matter the update order.

The proof relies on constructing a function, called *energy function*,
that maps each possible state of the Hopfield network to a real number,
the *energy* #footnote[The name comes from the fact that a Hopfield
network has a strong connection to the Ising model, a physical model
of magnetism.] of said state. The energy of a certain state configuration
is given by:

$ E = -frac(1, 2) bold("act")^(T) W bold("act") + bold(theta)^(T) bold("act")
    = -frac(1, 2) sum_(u, v in U) "act"_(u) w_(u, v) "act"_(v) + sum_(u in U) theta_(u) "act"_(u) $

With $bold("act") = ("act"_(u_(1)), dots, "act"_(u_(n)))^(T)$ being
the activation of the neurons, $bold(theta) = (theta_(u_(1)), dots,
theta_(u_(n)))^(T)$ their $theta$ parameters and $W$ the weight
matrix. Since all weights are symmetric, every term in the first
sum occurs twice: this explains the $frac(1, 2)$ factor.

#exercise[
	What is the energy function of @Hopfield-Network-Example? What are
	the energies of its possible states?
]
#solution[
	$ E &= -frac(1, 2) bold("act")^(T) W bold("act") + bold(theta)^(T) bold("act") = \
	    &= -frac(1, 2) mat("act"_(u_(1)), "act"_(u_(2)), "act"_(u_(3)))
	       mat(0, 1, 2; 1, 0, 1; 2, 1, 0) vec("act"_(u_(1)), "act"_(u_(2)), "act"_(u_(3))) +
	       mat(0, 0, 0) vec("act"_(u_(1)), "act"_(u_(2)), "act"_(u_(3))) = \
	    &= -mat("act"_(u_(1)), "act"_(u_(2)), "act"_(u_(3)))
	       mat(0, frac(1, 2), 1; frac(1, 2), 0, frac(1, 2); 1, frac(1, 2), 0)
	       vec("act"_(u_(1)), "act"_(u_(2)), "act"_(u_(3))) = \
	    &= -mat(frac(1, 2) "act"_(u_(2)) + "act"_(u_(3)),
	           frac(1, 2) "act"_(u_(1)) + frac(1, 2) "act"_(u_(3)),
	           "act"_(u_(1)) + frac(1, 2) "act"_(u_(2)))
	       vec("act"_(u_(1)), "act"_(u_(2)), "act"_(u_(3))) = \
	    &= -"act"_(u_(1)) (frac(1, 2) "act"_(u_(2)) + "act"_(u_(3))) 
	       -frac(1, 2) "act"_(u_(2)) ("act"_(u_(1)) + "act"_(u_(3)))
	       -"act"_(u_(3)) ("act"_(u_(1)) + frac(1, 2) "act"_(u_(2))) = \
	    &= -"act"_(u_(1)) "act"_(u_(2))
	       -"act"_(u_(2)) "act"_(u_(3))	       
	       -2 "act"_(u_(1)) "act"_(u_(3)) $

	From the energy function, it is possible to compute the energy levels:

	#set math.mat(delim: none)

	$ mat("act"_(u_(1)), "act"_(u_(2)), "act"_(u_(3)), "energy level";
          -1, -1, -1, -(-1) dot (-1) -(-1) dot (-1) - 2 dot (-1) dot (-1) &= -4;
          +1, -1, -1, -1 dot (-1) -(-1) dot (-1) - 2 dot 1 dot (-1) &= 2;
          -1, +1, -1, -(-1) dot 1 -1 dot (-1) - 2 dot (-1) dot (-1) &= 0;
          -1, -1, +1, -(-1) dot (-1) -(-1) dot 1 - 2 dot (-1) dot 1 &= 2;
          +1, +1, -1, -1 dot 1 -1 dot (-1) - 2 dot 1 (-1) &= 2;
          +1, -1, +1, -1 dot (-1) -(-1) dot 1 - 2 dot 1 dot 1 &= 0;
          -1, +1, +1, -(-1) dot 1 -1 dot 1 - 2 dot (-1) dot 1 &= 2;
          +1, +1, +1, -1 dot 1 -1 dot 1 - 2 dot 1 dot 1 &= -4;
	      augment: #(hline: 1)) $
]

#theorem("Convergence Theorem for Hopfield Networks")[
	If the activation of the $n$ neurons of a Hopfield network are
	updated asynchronously, always updating all neurons one by one
	with no repeats, a stable state is reached in at most $n dot
	2^(n)$ steps.
] <Hopfield-Networks-Converge>
#proof[
	Consider what happens when, in a given update step, the neuron $p$
	is updated. Before the update, the energy of the state is:

    $ E = -frac(1, 2) sum_(u, v in U) "act"_(u) w_(u, v) "act"_(v) + sum_(u in U) theta_(u) "act"_(u) $

	After the update has been carried out, the energy of the (new) state is:

	$ E' = -frac(1, 2) sum_(u, v in U) "act"'_(u) w_(u, v) "act"_(v) + sum_(u in U) theta_(u) "act"'_(u) $

	This is because in the work phase the weights and the parameters
	of the network are left untouched, and at each update step all
	neurons that aren't involved retain the same activation.

	Subtracting $E'$ from $E$ gives the energy difference between the
	previous and the current state:

	$ Delta E &=
	  -frac(1, 2) sum_(u, v in U) "act"_(u) w_(u, v) "act"_(v) + sum_(u in U) theta_(u) "act"_(u)
	  - (-frac(1, 2) sum_(u, v in U) "act"'_(u) w_(u, v) "act"_(v) + sum_(u in U) theta_(u) "act"'_(u)) = \
	  &= frac(1, 2) sum_(u, v in U) "act"'_(u) w_(u, v) "act"_(v) -
	  frac(1, 2) sum_(u, v in U) "act"_(u) w_(u, v) "act"_(v) +
	  sum_(u in U) theta_(u) "act"_(u) - sum_(u in U) theta_(u) "act"'_(u) = \
	  &= frac(1, 2) sum_(u, v in U) "act"'_(u) w_(u, v) "act"_(v) - "act"_(u) w_(u, v) "act"_(v) -
	  sum_(u in U) theta_(u) "act"'_(u) + theta_(u) "act"_(u) = \
	  &= frac(1, 2) sum_(u, v in U) ("act"'_(u) - "act"_(u)) w_(u, v) "act"_(v) -
	  sum_(u in U) theta_(u) ("act"'_(u) - "act"_(u)) $

	Since no neuron other than $p$ is involved during the update of $p$,
	the activations $"act"_(u)$ and $"act"'_(u)$ are always equal, except
	when $u = p$, where it may have changed due to the update. Therefore:

	$ Delta E &=
	  frac(1, 2) sum_(u, v in U) ("act"'_(u) - "act"_(u)) w_(u, v) "act"_(v) -
	  sum_(u in U) theta_(u) ("act"'_(u) - "act"_(u)) = \
	  &= sum_(v in U) ("act"'_(p) - "act"_(p)) w_(p, v) "act"_(v) -
	  theta_(p) ("act"'_(p) - "act"_(p)) \
	  &= ("act"'_(p) - "act"_(p))
	  (-theta_(p) + sum_(v in U) w_(p, v) "act"_(v)) $

	// FIXME: the 1/2 factor disappears with no reason

	Notice how $sum_(v in U) w_(p, v) "act"_(v)$ is, by definition, the
	network input function of $p$ _before_ its update. Then:

	$ Delta E &=
	  ("act"'_(p) - "act"_(p))
	  (-theta_(p) + sum_(v in U) w_(p, v) "act"_(v)) =
	  ("act"'_(p) - "act"_(p)) ("net"_(p) - theta_(p)) $

	Suppose that the update process did not result in a new state being
	reached. If that is the case, then the activations $"act"_(p)$ (before)
	and $"act"'_(p)$ (after) are equal, meaning that $Delta E = 0$. That
	is, if the transition does not result in a different state, the energy
	remains the same.

	Suppose instead that a new state is reached, meaning that the
	activation of $p$ has changed. Since the activation of any neuron
	is either $+1$ or $-1$, it would mean that it is either $"act"'_(p)
	= +1$ and $"act"_(p) = -1$ or $"act"'_(p) = -1$ and $"act"_(p) = +1$,
	but in any case $"act"'_(p) = -"act"_(p)$. This gives:

	$ Delta E =
	  ("act"'_(p) - "act"_(p)) ("net"_(p) - theta_(p)) =
	  (- "act"_(p) - "act"_(p)) ("net"_(p) - theta_(p)) =
	  -2 "act"_(p) ("net"_(p) - theta_(p)) $

	Recall that $"act"_(p) = overline(H) ("net"_(p), theta_(p))$, and that
	$overline(H) ("net"_(p), theta_(p))$ is $-1$ if $"net"_(p) - theta_(p)
	< 0$ or $+1$ if $"net"_(p) - theta_(p) gt.eq 0$. There are three cases
	to consider:

	+ If $"net"_(p) - theta_(p) < 0$, by definition it would mean
	  $"act"_(p) = -1$, and therefore all three factors in the product
	  are negative. This means that their product must be negative,
	  hence $Delta E < 0$;
	+ If $"net"_(p) - theta_(p) > 0$, then $"act"_(p) = +1$, which
	  results in a product with two positive terms and a negative
	  terms. This would also result in a negative number, meaning
	  $Delta E < 0$ again;
	+ If $"net"_(p) - theta_(p) = 0$, the third term is $0$, hence
	  $Delta E = 0$.

	To sum up: the energy of a Hopfield network can, after an update,
	either remain the same or decrease, but never increase. If the state
	changes and $"net"_(p) - theta_(p) != 0$, the energy decreases, if
	either the state does not change or the state changes and $"net"_(p)
	- theta_(p) = 0$, the energy remains the same.

	If a state transition results in an energy decrease, then the original
	state cannot be reached anymore, because it would require the energy
	to increase. If instead the state transition results in a different
	state without the energy decreasing ($"net"_(p) - theta_(p) = 0$), then
	the original state is also unreachable. This is because $"net"_(p) -
	theta_(p) = 0$ results in one of the activations changing from $-1$ to
	$+1$.

	// FIXME: not clear

	This means that, after an update that results in a different state
	being reached, the original state becomes unreachable. Being the
	number of possible states finite ($2^(n)$), the update process is
	guaranteed to reach a point where no more new states are available,
	and has therefore to settle to the current one indefinitely. Since
	the neurons are updated once for each transition, the maximum number
	of steps needed for the update process to stop is $n dot 2^(n)$. 
]

Note how @Hopfield-Networks-Converge does not prove that the reached stable
state is the one with the lowest energy: a different choice of update order
can result in a different stable state with even lower energy. However, the
reached stable state is guaranteed to be the one that, for the given update
order, is the one with the lowest energy out of all those reached in the
process. In this sense, a stable state is a local minima of the energy
function. This is true under the assumption that all neurons are updated,
and updated only once: if the same neuron were to be updated over and over
while excluding others, then a stable state would be reached, but not all
(reachable) states would have been explored.

The energy of the states of a Hopfield network is reflected in the state
graph. Indeed, it is always possible to rearrange the state graph into
levels, such that each level contains states of equal energy. This is
generally done top to bottom, with high energy states above and low
energy states below. State transitions can only occur between states that
are on the same level (left or right) or between a higher energy state and
a lower energy state (up to down).

#exercise[
	Rearrange the states in the state graph for @Hopfield-Network-Example
	in accord to their energy levels
]
#solution[
	#figure(
		caption: [A state graph for @Hopfield-Network-Example, with states
		          ordered from high energy to low energy. The two stable
		          states are highlighted in gray.],
		diagram(
			node-stroke: 1.5pt,
			edge-stroke: 1.5pt,
			spacing: 2em,

			node((-3, -2), $+ - -$, radius: 2em, name: <PMM>),
			node((-1, -2), $- - +$, radius: 2em, name: <MMP>),
			node((1, -2), $- + +$, radius: 2em, name: <MPP>),
			node((3, -2), $+ + -$, radius: 2em, name: <PPM>),
			node((-2, -0.5), $+ - +$, radius: 2em, name: <PMP>),
			node((2, -0.5), $- + -$, radius: 2em, name: <MPM>),
			node((-2, +4), $- - -$, fill: gray, radius: 2em, name: <MMM>),
			node((2, +4), $+ + +$, fill: gray, radius: 2em, name: <PPP>),

			edge(<PMM>, <MMM>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: $u_(1)$),
			edge(<PMM>, <PPM>, marks: (none, "latex"), label-angle: auto, bend: 30deg, label: $u_(2)$),
			edge(<PMM>, <PMP>, marks: (none, "latex"), label-angle: auto, label: $u_(3)$),
			edge(<MMP>, <MMM>, marks: (none, "latex"), label-pos: 0.75, label-angle: auto, label: $u_(3)$),
			edge(<MMP>, <MPP>, marks: (none, "latex"), label-angle: auto, label: $u_(2)$),
			edge(<MMP>, <PMP>, marks: (none, "latex"), label-angle: auto, label: $u_(1)$),
			edge(<MPP>, <PPP>, marks: (none, "latex"), label-pos: 0.75, label-angle: auto, label: $u_(1)$),
			edge(<MPP>, <MPP>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 45deg, label: $u_(2)$),
			edge(<MPP>, <MPM>, marks: (none, "latex"), label-angle: auto, label: $u_(3)$),
			edge(<PPM>, <MPM>, marks: (none, "latex"), label-angle: auto, label: $u_(1)$),
			edge(<PPM>, <PPM>, marks: (none, "latex"), label-angle: auto, bend: 135deg, loop-angle: 45deg, label: $u_(2)$),
			edge(<PPM>, <PPP>, marks: (none, "latex"), label-angle: auto, bend: 30deg, label: $u_(3)$),
			edge(<PMP>, <PMP>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 45deg, label: $u_(1), u_(3)$),
			edge(<PMP>, <PPP>, marks: (none, "latex"), label-pos: 0.75, label-angle: auto, label: $u_(2)$),
			edge(<MPM>, <MMM>, marks: (none, "latex"), label-pos: 0.75, label-angle: auto, label: $u_(2)$),
			edge(<MPM>, <MPM>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 135deg, label: $u_(1), u_(3)$),
			edge(<MMM>, <MMM>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 45deg, label: $u_(1), u_(2), u_(3)$),
			edge(<PPP>, <PPP>, marks: (none, "latex"), label-angle: auto, bend: -135deg, loop-angle: 135deg, label: $u_(1), u_(2), u_(3)$),
		)
	)
]
