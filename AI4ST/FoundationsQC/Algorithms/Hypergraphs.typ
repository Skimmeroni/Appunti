#import "../FoundationsQC_definitions.typ": *

An interesting use case for quantum circuits is the encoding of graphs.
Consider an undirected graph $G = (V, E)$, with $abs(V)$ nodes and $abs(E)$
edges. A quantum computer that encodes the graph has all qubits prepared in
the state $ket(0)$: the $i$-th qubit represents the $i$-th node of the graph
(given an ordering). The circuit has one Hadamard gate applied to each qubit
and has as many CZ gates as the number of edges. If the graph has an edge
$(i, j)$, then there is a CZ gate with controls in the $i$-th and $j$-th
qubit.

#exercise[
	How would an undirected graph such as this be encoded into a
	quantum circuit?

	$ G = (V, E) = (\{1, 2, 3, 4, 5\}, \{(1, 3), (1, 4), (2, 3), (2, 5)\}) $
]
#solution[
	#align(
		center,
		[#grid(
			columns: (0.5fr, 0.5fr),
			[#quantum-circuit(scale: 125%,
							lstick($ket(0)$), gate($H$), ctrl(1), ctrl(1), 1, 1, 1, [\ ],
							lstick($ket(0)$), gate($H$), 1, 1, ctrl(1), ctrl(1), 1, [\ ],
							lstick($ket(0)$), gate($H$), ctrl(-1), 1, ctrl(0), 1, 1, [\ ],
							lstick($ket(0)$), gate($H$), 1, ctrl(-2), 1, 1, 1, [\ ],
							lstick($ket(0)$), gate($H$), 1, 1, 1, ctrl(-2), 1)
			],
			[#diagram(
				node-stroke: 1.5pt,
				edge-stroke: 1.5pt,
				spacing: 4em,

				node((0, 0), text(font: "Noto Sans", [1]), name: <1>),
				node((0.75, 1), text(font: "Noto Sans", [2]), name: <2>),
				node((2.25, 1), text(font: "Noto Sans", [3]), name: <3>),
				node((3, 0), text(font: "Noto Sans", [4]), name: <4>),
				node((1.5, -0.75), text(font: "Noto Sans", [5]), name: <5>),

				edge(<1>, <3>),
				edge(<1>, <4>),
				edge(<2>, <3>),
				edge(<2>, <5>),
				)
			]
		)]
	)
]

In particular, quantum computers can efficiently encode *hypergraphs*,
graphs where an edge can connect more than one node at the same time.
An hypergraph is encoded in the exact same way: the CZ gates can have
more than one control, one for each node that constitutes the edge.

#exercise[
	How would an undirected hypergraph such as this be encoded into a
	quantum circuit?

	$ G = (V, E) = (\{1, 2, 3, 4, 5, 6, 7\},
	  \{(1, 2, 3), (2, 3), (3, 5, 6), (4)\}) $]
#solution[
	#align(
		center,
		[#grid(
			columns: (0.5fr, 0.5fr),
			[#quantum-circuit(scale: 125%,
							lstick($ket(0)$), gate($H$), ctrl(1), 1, 1, 1, 1, [\ ],
							lstick($ket(0)$), gate($H$), ctrl(0), ctrl(0), 1, 1, 1, [\ ],
							lstick($ket(0)$), gate($H$), ctrl(-1), ctrl(-1), ctrl(1), 1, 1, [\ ],
							lstick($ket(0)$), gate($H$), 1, 1, 1, ctrl(0), 1, [\ ],
							lstick($ket(0)$), gate($H$), 1, 1, ctrl(0), 1, 1, [\ ],
							lstick($ket(0)$), gate($H$), 1, 1, ctrl(-2), 1, 1, [\ ],
							lstick($ket(0)$), gate($H$), 1, 1, 1, 1, 1)
			],
			[#image("Hypergraph.svg")
			 #footnote[By Hypergraph.svg: Kilom691derivative work: Pgdx (talk) -
			           Hypergraph.svg, CC BY-SA 3.0, https://commons.wikimedia.org/w/index.php?curid=10687664]
			]
		)]
	)
]
