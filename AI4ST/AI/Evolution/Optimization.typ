#import "../AI_definitions.typ": *

An *optimization problem* is defined as a pair $(Omega, f)$. $Omega$ is a
set called *search space* that contains all the potential solutions (the
"candidates") whereas $f: Omega mapsto RR$ is a function called *evaluation
function*, that assigns a (real) number to each potential solution $omega
in Omega$, representing "how good" said solution is. The "best" solutions,
also called *exact solutions*, are those that return the highest value when
fed as input to the evaluation function.

An element $omega^(*) in Omega$ is an exact solution of the optimization
problem $(Omega, f)$ if and only if it is an *optimum* for the evaluation
function, either a minimum ($forall omega in Omega, f(omega^(*)) lt.eq
f(omega)$) or a maximum ($forall omega in Omega, f(omega^(*)) gt.eq
f(omega)$). If the search space contains more than one optima, any choice
of optima can be chosen as exact solution. In general, the search space is
not the set of all real numbers, but a subset of reals that satisfy some
conditions, or *constraints*.

#exercise[
	Consider the problem of finding the lengths of a tridimensional box
	with fixed surface area $S$ such that its volume is as big as possible.
	How can it be formulated into an optimization problem? Does it have
	an exact solution?
]
#solution[
	The search space of the problem is the set of all triples of positive
	real numbers, representing all the possible values for the three lengths,
	constrained by forming a box having area equal to $S$. The evaluation
	function is simply the volume of the box:

	$ (Omega, f) = ({(x, y, z) in RR^(+) | 2 x y + 2 x z + 2 y z = S}, f(x, y, z) = x y z) $

	The problem can be solved, for example using the method of Lagrange
	multipliers. Constructing the Lagrangian:

	$ cal(L) = f(x, y, z) + lambda dot g(x, y, z) =
	  x y z + lambda (2 x y + 2 x z + 2 y z - S) =
	  x y z + 2 lambda x y + 2 lambda x z + 2 lambda y z - lambda S $

	Computing its gradient:

	#set math.mat(column-gap: 1.5em)
	$ nabla(cal(L)) = mat(y z + 2 lambda (y + z),
	                      x z + 2 lambda (x + z),
	                      x y + 2 lambda (x + y),
	                      2 x y + 2 x z + 2 y z - S)^(T) $

	Setting it to $0$ and solving (done automatically in Python):

	```python
	from sympy import solve
	from sympy.abc import x, y, z, L, S
	eq1 = y * z + 2 * L * (y + z)
	eq2 = x * z + 2 * L * (x + z)
	eq3 = y * x + 2 * L * (y + x)
	eq4 = 2 * x * y + 2 * x * z + 2 * y * z - S
	solve([eq1, eq2, eq3, eq4], [x, y, z, L])
	```

	Gives the exact solution $x = y = z = sqrt(S slash 6)$.
]

The approaches to solve optimization problems fall into four broad
categories:

- *Analytical Solution*: finding an optimum of the evaluation function
  by computing it directly, such as employing the _Method of Lagrange
  Multipliers_. This is the "obvious" way of solving an optimization
  problem, but it's hardly applicable, either because an analytical
  solution does not exist or because it's too computationally expensive
  to retrieve it;
- *Complete/Exhaustive Exploration*: finding the optimum of the evaluation
  function by trying every possible solution in the search space. Even
  though this guarantees to find an exact solution sooner or later, if the
  search space is too big the approach quickly becomes inefficient. Also,
  the approach is only applicable to search spaces that are discrete.
- *(Blind) Random Search*: finding the optimum of the evaluation function
  by trying random values of the search space, keeping track of the best
  solution found so far, and stopping when a "satisfactory" solution is
  found or when a given number of attempts is reached. The approach is
  hardly promising;
- *Guided (Random) Search*: finding the optimum of the evaluation
  function by trying out solutions in the search space, not randomly
  (like random search) but by "steering" the exploration of the search
  space by gathering information on the previous attempts. The idea is
  to start with a (mostly) random solution, observing how to change the
  solution in order to obtain a better one, and repeating the process
  until a "satisfactory" result is obtained. This approach relies on
  a (generally not too far-fetched) assumption: the result of evaluating
  similar elements of the search space must yield similar results. This
  is also referred to as the *principle of small improvements*.

Optimization problems are ubiquitous in fields where the goal is to
maximize the efficiency/performance/return of a process. Examples include:

- Routing problems: finding the smallest route to take when moving from
  a start to a destination;
- Packing problems: finding out how to store as many objects as possible
  in a given container;
- Scheduling problems: determining how to arrange jobs or tasks in such a
  way that they do not overlap and they yield the best result (such as air
  traffic coordination).

A well-known example of routing problem is the *Travelling Salesman Problem*
(*TSP*), that can be formulated as an analogy: how can a traveller reach all
cities of their planned trip by taking the shortest possible path?

Formally, the problem is understood in terms of a graph, where the cities
are the nodes, the edges are the roads connecting the cities and the weights
are the lenghts of the distance between two cities (or the time needed to
get from one to the other). Phrased this way, the TSP amounts to find an
*Hamiltonian cycle* of the graph: a path that starts and ends in the same
node, that reaches all of its nodes exactly once and whose cumulative weight
is the smallest (of course, a graph can have more than one Hamiltonian cycle).

Let $G = (V, E, W)$ be a graph, with $V = {v_(1), dots, v_(n)}$ a set of
vertices, $E subset.eq V times V - {(v, v) | v in V}$ a set of edges (having
no loops) and $W: E -> RR^(+)$ a function that assigns a (positive) weight
to each edge. The Travelling Salesman Problem is the optimization problem
$(Omega, f)$, where $Omega$ is the set of all possible permutations of
indices of the vertices that, two by two, have an edge that connects them:

$ Omega = {pi(n) | forall k in [1, n], (v_(pi(k)), v_(pi((k + 1) mod n))) in E} $

And where the function $f$ is the sum of all the weights of a member in $Omega$:

$ f(pi) = -sum_(k = 1)^(n) W((v_(pi(k)), v_(pi((k + 1) mod n)))) $

The $mod n$ is just to ensure that the last vertex "loops back" and connects
to the first.

The TSP is an NP-complete problem, therefore there is no way of computing
a solution of the problem within an reasonable time bound, unless the
dimension of the problem (the number of nodes in the graph) is very small.

For simplicity, the graph of the problem can be assumed to be complete,
meaning that any node is connected to any other. If this is not the
case, it is sufficient to add edges where are missing whose weight
is so big that it's guaranteed to not be included in the solution. To
simplify it further, the graph is assumed to be undirected, therefore
the direction chosen to move from node to node is irrelevant.

