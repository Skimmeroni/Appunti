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

			line("A", "B", mark: (symbol: "triangle"))
			line("A", "C")
			line("B", "C")
			line("A", "D")
		})
	])],
	[$ mat(delim: "[",
		   , "Alice", "Bob", "Charlie", "Dahlia";
	       "Alice", 0, 1, 1, 1;
	       "Bob", 1, 0, 1, 0;
	       "Charlie", 0, 0, 0, 0;
	       "Dahlia", 0, 0, 0, 0;) $]
	)
]

The *neighborhood* of a node is the set of all nodes that connected
to that node. Given a graph $G = (V, E)$, for any node $v in V$ the
neighborhood $N(v) subset.eq V$ is defined as the set $\{u | (v, u)
in E\}$ or, equivalently with respect to its adjacency matrix $A$,
$\{u | A[v, u] != 0\}$.

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

			line("A", "B")
			line("A", "C")
			line("C", "D")
		})
	])],
	[$ mat(delim: "[",
		   , "Alice", "Bob", "Charlie", "Dahlia";
	       "Alice", 0, 1, 1, 0;
	       "Bob", 1, 0, 0, 0;
	       "Charlie", 1, 0, 0, 1;
	       "Dahlia", 0, 0, 1, 0;) $]
	)
]

A graph $G = (V, E, W)$, that has a function $W : E -> RR - \{0\}$
that associates a real non-zero number to any edge of the graph is
called *weighted graph*. The adjacency matrix of a weighted graph
has $W(i, j)$ instead of $1$ as the value of the $(i, j)$-th cell.
The graphical representation of a weighted graph has the weight of
each edge nenoted on the size of the corresponding arrow and, in
general, the lenght of the arrow is scaled with respect to the weight.

#exercise[
	The town of $A$ dists $10$ from $B$, $6$ from $C$ and $2$ from
	$D$, $B$ dists $4$ from $C$ and $8$ from $D$ and $D$ dists $7$
	from $C$. Represent the relationship with a graph.
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
				fill: black
			)

			circle((0, 0), name: "A")
			circle((6, 0), name: "B")
			circle((3.25, 2), name: "C")
			circle((1.5, -2), name: "D")

			content("A", text(font: "Noto Sans", [A]))
			content("B", text(font: "Noto Sans", [B]))
			content("C", text(font: "Noto Sans", [C]))
			content("D", text(font: "Noto Sans", [D]))

			line("A", "B", name: "AtoB")
			line("A", "C", name: "AtoC")
			line("B", "C", name: "BtoC")
			line("A", "D", name: "AtoD")
			line("D", "B", name: "DtoB")
			line("D", "C", name: "DtoC")

			content("AtoB", anchor: "south", angle: "AtoB.end", padding: 0.1, text(font: "Noto Sans", [10]))
			content("AtoC", anchor: "south", angle: "AtoC.end", padding: 0.1, text(font: "Noto Sans", [6]))
			content("BtoC", anchor: "south", angle: "BtoC.end", padding: 0.1, text(font: "Noto Sans", [4]))
			content("AtoD", anchor: "south", angle: "AtoD.end", padding: 0.1, text(font: "Noto Sans", [2]))
			content("DtoB", anchor: "south", angle: "DtoB.end", padding: 0.1, text(font: "Noto Sans", [8]))
			content("DtoC", anchor: "south", angle: "DtoC.end", padding: 0.1, text(font: "Noto Sans", [7]))
		})
	])],
	[$ mat(delim: "[",
		   , "A", "B", "C", "D";
	       "A", 0, 10, 6, 2;
	       "B", 10, 0, 4, 8;
	       "C", 6, 4, 0, 7;
	       "D", 2, 8, 7, 0;) $]
	)
]

A graph can represent more than one relationship with the same entities
at once; a graph with this characteristic is called a *multirelational
graph*. Formally, a graph $G = (V, E, T)$ is a multirelational graph if
each edge $e$ is defined as a tuple $e = (u, v, tau)$, where $u, v in V$
and $tau in T$ is the type of the relationship. A multirelational graph
is encoded as $abs(T)$ adjacency matrices, each representing one type of
relation. Said matrices can be combined into a single tensor, an *adjacency
tensor* $A in RR^(abs(V) times abs(V) times abs(T))$.

#exercise[
	Drugs can interact with each other, inducing certain side effects when
	taken together. Suppose that:

	- Drug $A$ induces headache when taken with drug $B$ or with drug $C$,
	  and vice versa;
	- Drug $B$ induces tachychardia when taken with drug $D$, and vice versa;
	- Drug $C$ induces both tachychardia and headache when taken with drug $D$
	  and vice versa.

	Represent this relationship in a multirelational graph.
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
				fill: black
			)

			circle((0, 0), name: "A")
			circle((3, 1.5), name: "B")
			circle((3, -1.5), name: "C")
			circle((6, 0), name: "D")

			content("A", text(font: "Noto Sans", [A]))
			content("B", text(font: "Noto Sans", [B]))
			content("C", text(font: "Noto Sans", [C]))
			content("D", text(font: "Noto Sans", [D]))

			line("A", "B", name: "AtoB")
			line("A", "C", name: "AtoC")
			line("D", "B", name: "DtoB", stroke: (dash: "dashed"))
			line("D.210deg", "C.30deg", name: "DtoC")
			line("D.240deg", "C.east", name: "DtoC2", stroke: (dash: "dashed"))
		})
	])],
	[$ mat(delim: "[",
		   , "A", "B", "C", "D";
	       "A", 0, 1, 1, 0;
	       "B", 1, 0, 0, 0;
	       "C", 1, 0, 0, 1;
	       "D", 0, 0, 1, 0;) $
	 $ mat(delim: "[",
		   , "A", "B", "C", "D";
	       "A", 0, 0, 0, 0;
	       "B", 0, 0, 0, 1;
	       "C", 0, 0, 0, 1;
	       "D", 0, 1, 1, 0;) $]
	)
]

An *eterogeneous graph* is a multirelational graph where nodes have a type,
partitioning the set of nodes. Formally, a (multirelational) graph $G =
(V, E, T)$ is an eterogeneous graph where the set $V$ is constructed as
the union of $n$ sets $V_(i)$, with $i in {1, dots, n}$, such that:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ V = union.big_(i) V_(i) $],
	[$ V_(i) inter V_(j) = emptyset, forall i, j "when" i != j $]
)

An eterogeneous graph whose edges can only connect nodes of different types
is called a *multipartite graph*. Formally, an eterogeneous graph $G = (V,
E, T)$ is a multipartite graph if, for any edge $e = (u, v, tau) in E$,
it follows that $u in V_(i), v in V_(j), i != j$.

#exercise[
	Certain illnesses are treated using certain drugs. Drugs can be
	incompatible with each other and influence the behaviour of certain
	proteins. Suppose that:

	- Illness $I_(1)$ is treated using either drug $D_(1)$ or drug $D_(2)$;
	- Illness $I_(2)$ is treated using drug $D_(3)$;
	- Drug $D_(1)$ is incompatible with drug $D_(2)$ (and vice versa);
	- Drug $D_(2)$ is incompatible with drug $D_(3)$ (and vice versa);
	- Protein $P_(1)$ is influenced by drug $D_(1)$ and drug $D_(2)$;
	- Protein $P_(2)$ is influenced by drug $D_(2)$;
	- Protein $P_(3)$ is influenced by drug $D_(3)$.

	Represent this relationship in a multirelational graph. Is it a
	multipartite graph?
]
#solution[
	No, because the relationship "being incompatible with" relates entities
	of the same type (drugs).

	#grid(
	columns: (0.6fr, 0.4fr),
	[#align(center, [
		#cetz.canvas({
			import cetz.draw: *

			set-style(
				stroke: (thickness: 1.5pt),
				fill: black
			)

			set-style(
				circle: (fill: aqua, radius: 0.75, stroke: (paint: blue))
			)

			circle((0, 0), name: "I1")
			circle((0, -3), name: "I2")

			set-style(
				circle: (fill: lime, radius: 0.75, stroke: (paint: green))
			)

			circle((3.5, 1.5), name: "D1")
			circle((3.5, -1.5), name: "D2")
			circle((3.5, -4.5), name: "D3")

			set-style(
				circle: (fill: fuchsia, radius: 0.75, stroke: (paint: purple))
			)

			circle((7, 1.5), name: "P1")
			circle((7, -1.5), name: "P2")
			circle((7, -4.5), name: "P3")

			content("I1", text(font: "Noto Sans", [I1]))
			content("I2", text(font: "Noto Sans", [I2]))
			content("D1", text(font: "Noto Sans", [D1]))
			content("D2", text(font: "Noto Sans", [D2]))
			content("D3", text(font: "Noto Sans", [D3]))
			content("P1", text(font: "Noto Sans", [P1]))
			content("P2", text(font: "Noto Sans", [P2]))
			content("P3", text(font: "Noto Sans", [P3]))

			line("I1", "D1")
			line("I1", "D2")
			line("I2", "D3")
			line("D1", "D2", stroke: (dash: "loosely-dotted"))
			line("D2", "D3", stroke: (dash: "loosely-dotted"))
			line("D1", "P1", stroke: (dash: "dashed"))
			line("D2", "P1", stroke: (dash: "dashed"))
			line("D3", "P2", stroke: (dash: "dashed"))
			line("D3", "P3", stroke: (dash: "dashed"))
		})
	])],
	[$ mat(delim: "[",
		   , "I1", "I2", "D1", "D2", "D3";
		   "I1", 0, 0, 1, 1, 0;
		   "I2", 0, 0, 0, 0, 1;
	       "D1", 1, 0, 0, 0, 0;
	       "D2", 1, 0, 0, 0, 0;
	       "D3", 0, 1, 0, 0, 0;) $
	 $ mat(delim: "[",
		   , "D1", "D2", "D3";
	       "D1", 0, 1, 0;
	       "D2", 1, 0, 1;
	       "D3", 0, 1, 0;) $
	 $ mat(delim: "[",
		   , "D1", "D2", "D3", "P1", "P2", "P3";
		   "D1", 0, 0, 0, 1, 0, 0;
		   "D2", 0, 0, 0, 1, 0, 0;
		   "D3", 0, 0, 0, 0, 1, 1;
	       "P1", 1, 1, 0, 0, 0, 0;
	       "P2", 0, 0, 1, 0, 0, 0;
	       "P3", 0, 0, 1, 0, 0, 0;) $]
	)
]

// *Attributes* or *features* are real numbers associated to the nodes of a
// graph. For a graph of $abs(V)$ nodes, a node with an attribute is in the
// form $X in RR^(abs(V) times m)$, with $m$ being the cardinality of the
// features, respecting the ordering of the adjacency matrix $A$.
