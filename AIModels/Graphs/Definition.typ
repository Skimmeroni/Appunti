#import "../AIModels_definitions.typ": *

A *graph* $G$ is defined as an ordered couple $(V, E)$, where $V$ is
the set of *vertices* or *nodes* and $E$ is the set of *edges*. Each
edge represents the existence of a relationship betweeen two vertices.
An edge $e in E$ is therefore defined as an ordered couple $(u, v) in
V times V$.

A graph is graphically represented using circles as nodes and using
arrows as edges, whose tip is oriented in the direction of the edge.
If the relationship holds both ways for a certain pair of nodes, the
arrow is double-tipped.

A graph is matematically encoded in an *adjacency matrix*, a matrix that
contains information concerning the existence of its edges. Formally, for
a graph $G = (V, E)$ it is possible to construct an adjacency matrix $A in
RR^(abs(V) times abs(V))$ such that each entry $(i, j)$ has the value $1$
if $(i, j) in E$ and $0$ otherwise. Of course, the adjacency matrix of a
graph can be constructed only if its edges can be enumerated.

#exercise[
	Alice knows Bob, Charlie and Dahlia, whereas Bob knows Alice
	and Charlie. Represent the relationship with a graph.
]
#solution[
	#grid(
	columns: (0.5fr, 0.5fr),
	[#align(center, [
		#cetz.canvas({
			import cetz.draw: *

			set-style(
				stroke: (thickness: 1.5pt),
				circle: (fill: aqua, radius: 0.75, stroke: (paint: blue)),
				fill: black,
				mark: (end: "triangle")
			)

			circle((0, 0), name: "A")
			circle((6, 0), name: "B")
			circle((3, 2), name: "C")
			circle((3, -2), name: "D")

			content("A", text(font: "Noto Sans", [Alice]))
			content("B", text(font: "Noto Sans", [Bob]))
			content("C", text(font: "Noto Sans", [Charlie]))
			content("D", text(font: "Noto Sans", [Dahlia]))

			line("A.east", "B.west", mark: (symbol: "triangle"))
			line("A.60deg", "C.210deg")
			line("B.120deg", "C.330deg")
			line("A.300deg", "D.150deg")
		})
	])],
	[$ mat(delim: "[", , "Alice", "Bob", "Charlie", "Dahlia";
	       "Alice", 0, 1, 1, 1;
	       "Bob", 1, 0, 1, 0;
	       "Charlie", 0, 0, 0, 0;
	       "Dahlia", 0, 0, 0, 0;) $]
	)
]

A graph is said to be *connected* if every node appears in at least one
edge, except for *loops* (an edge connecting a node to itself). Formally,
a graph $G = (V, E)$ is connected if, for any $v in V$, exists $u in
V - \{v\}$ such that $(u, v) in E$ or $(v, u) in E$.

A graph is said to be *undirected* if the relationship between the nodes
is symmetric, and holds both ways for every node. Formally, a graph $G =
(V, E)$ is undirected if, for any $(u, v) in E$, it is also true that
$(v, u) in E$. For clarity, the edges of an undirected graph are often
drawn tipless. The adjacency matrix of an undirected graph will clearly
be symmetric. If a graph is not undirected, it is said to be *directed*.

If a graph is connected, undirected and has no loops, it is called *simple*.
It is easy to see that the adjacency matrix of a simple graph has $0$ as
each element of the diagonal.

#exercise[
	Alice is a friend of Bob and Charlie, whereas Dahlia is a friend of
	Charlie. Represent the relationship with a graph; is the graph simple?
]
#solution[
	Yes, the graph would be simple. This is because the "is a friend of"
	relationship is (assumed to be) symmetric, non reflexive and every
	person appears at least once as friend of someone else.

	#grid(
	columns: (0.5fr, 0.5fr),
	[#align(center, [
		#cetz.canvas({
			import cetz.draw: *

			set-style(
				stroke: (thickness: 1.5pt),
				circle: (fill: aqua, radius: 0.75, stroke: (paint: blue)),
				fill: black
			)

			circle((0, 0), name: "A")
			circle((6, 0), name: "B")
			circle((3, 2), name: "C")
			circle((3, -2), name: "D")

			content("A", text(font: "Noto Sans", [Alice]))
			content("B", text(font: "Noto Sans", [Bob]))
			content("C", text(font: "Noto Sans", [Charlie]))
			content("D", text(font: "Noto Sans", [Dahlia]))

			line("A.east", "B.west")
			line("A.60deg", "C.210deg")
			line("C.south", "D.north")
		})
	])],
	[$ mat(delim: "[", , "Alice", "Bob", "Charlie", "Dahlia";
	       "Alice", 0, 1, 1, 0;
	       "Bob", 1, 0, 0, 0;
	       "Charlie", 1, 0, 0, 1;
	       "Dahlia", 0, 0, 1, 0;) $]
	)
]
