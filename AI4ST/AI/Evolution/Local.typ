#import "../AI_definitions.typ": *

In classical mathematical optimization, many techniques and algorithms
have been developed that are fairly closely related to evolutionary
computing. Such methods are sometimes called *local search methods*,
because they explore the search space in small steps, carrying out a
local search for better solutions.

Like evolutionary algorithms, these techniques are based on the
assumption that similar solution candidates also yield similar
values of the function to optimize. The main difference to evolutionary
algorithms is that local search methods inspect one solution at a time,
instead of an entire population (in some sense, they can be thought of
as evolutionary algorithms with population size equal to $1$). They are
often employed to improve solutions candidates locally or as a final
optimization step for the output of an evolutionary algorithm.

=== Gradient ascent and gradient descent

*Gradient ascent/descent* is an optimization technique focusing on
optimizing real-valued functions, meaning locally optimal points of
functions when an analytical solution (that is, computing the gradient
and setting it equal to $0$) is either impractical or impossible to
compute. The idea is to evaluate the gradient of the function in a
random point, moving to a point in its neighborhood where the gradient
is bigger (ascent) or smaller (descent) and repeating the process. This
way, over many iterations, there's a guarantee to reach, if not a optimum,
at least getting very close.

To determine where to move after having computed the gradient in the
current point, it possible to rely on the properties of the gradient.
By definition, the gradient in a point is a vector that points in the
direction where the function is the steepest. This means that the
direction of the gradient (or the opposite direction) is the direction
where the function, with respect to that point, increases or decreases
the most, and therefore moves closer to an optimum as fast as possible.

Even though the choice of the direction to take is clear, the choice
of "how much" to move in said direction is trickier. Moving in steps
that are too small can result in a very slow procedure, whereas moving
in steps that are too big can result in a process that oscillates back
and forth in the neighborhood of an optimum without actually reaching
it. A possible solution would be to move in steps whose size depend on
the gradient: making long steps when the gradient is small (hence the
function is almost linear) and making small steps when the gradient is
big.

Since it's not guaranteed that gradient descent will actually find an
exact solution, it is necessary to introduce some termination criteria.
For example, the process can be terminated when a maximum number of
iterations is reached or when the difference between the current and
previous solution is smaller than a given difference (that is, there
is negligible improvement).

The gradient descent procedure can be stated as follows:

#algo(
	title: "Gradient-Ascent/Descent",
	parameters: ([$f : RR^(n) -> RR$: function, $eta$: integer, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$x = (x_(1), dots, x_(n)) <-$ A random initial solution \
		do #i \
			$nabla = (nabla_(1), dots, nabla_(n)) <- (frac(partial, partial x_(1))(f(x)), dots, frac(partial, partial x_(n))(f(x)))$ #comment[Compute gradient] \
			$x <- x plus.minus eta nabla$ #comment[Update candidate solution] #d\
		while (not($epsilon$)) \
		return $x$ #comment[Return best solution found] \
	]
)

Note that the choice of a starting point for the procedure noteably
influences its outcome since, clearly, gradient ascent/descent will
take longer when choosing a point that is far from an optimum. Also,
choosing a different starting point can result in finding a local or
a global optimum, (unless the function is either concave or convex).
The only countermeasure is to execute the process multiple times 
with different starting points and choosing the best result obtained.

=== Hill climbing

For gradient ascent/descent to be applicable, it is necessary that the
function to be optimized is differentiable everywhere, otherwise the
gradient cannot be computed.

For functions that are not differentiable everywhere it is still possible
to get a rough estimate to where the function grows in a given point by
simply trying random points in its neighborhood. If the new point yield
an higher value for the function to be optimized, meaning that it's closer
to a local optimum, the process restarts with this new point, otherwise
another point in the neighborhood is tried. The process is repeated until
a termination criterion is reached.

This approach, which can be thought of as a "naive" gradient descent, is
called *Hill climbing*. The algorithm is as follows:

#algo(
	title: "Hill-Climbing",
	parameters: ([$f : RR^(n) -> RR$: function, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$x = (x_(1), dots, x_(n)) <-$ A random initial solution \
		do #i \
			$x' = (x'_(1), dots, x'_(n)) <-$ A random point near $x$ \
			if ($f(x') > f(x)$) #i \
				$x <- x'$ #d#d #comment[Update if there is improvement] \
		while (not($epsilon$)) \
		return $x$ #comment[Return best solution found] \
	]
)

Even though this approach can be applied to more classes of functions, it
inherits the same issues of gradient ascent/descent, mainly the tendency
of getting stuck in local optima.

=== Simulated annealing

The issue of getting stuck in local optima can be overcome by allowing
the process to accept solutions that are suboptimal on the short term,
but with the intent of moving towards an even better solution. This is
exploited in a local search algorithm called *Simulated annealing*.

The idea is to start from a random point in the domain of the function
and try points in its neighborhood for improvements, like hill climbing,
but introducing a probability of accepting a worse solution as the current
solution candidate. Even though this does not guarantee to actually land
in the vicinity of a better solution, there is still a possibility of this
to happen.

More specifically, if the point in the vicinity of the current solution
yields a better value for the function to optimize, this point is chosen
as the new candidate solution. On the other hand, if the point in the
vicinity of the current solution yields a worse value, this point is
chosen as the new candidate solution with a certain probability.

This probability depends both on the difference of the value of the
function to optimize yielded by the current candidate and the new
candidate and on a parameter, called *temperature*, that decreases
iteration by iteration. If the difference between the current and
the new candidate is small, the algorithm will be more inclined to
tolerate a worse solution. On the other hand, the tolerance of the
algorithm to accept a worse solution will be higher in the earlier
iterations, when the temperature is high, and becomes more and more
"conservative" as the iterations progress.

The algorithm for simulated annealing is as follows:

#algo(
	title: "Simulated-Annealing",
	parameters: ([$f : RR^(n) -> RR$: function, $T$: float, $delta$: float, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$x = (x_(1), dots, x_(n)) <-$ A random initial solution \
		$Delta_(max) <- 0$ #comment[Variability across solutions] \
		do #i \
			$x' = (x'_(1), dots, x'_(n)) <-$ A random point near $x$ \
			$Delta <- f(x') - f(x)$ #comment[Improvement size] \
			if ($abs(Delta) > Delta_(max)$) #i \
				$Delta_(max) <- abs(Delta)$ #d \
			$p <- e^(Delta slash Delta_(max) T)$ #comment[Tolerance to worse solutions] \
			if ($Delta > 0$ or $p gt.eq$ #smallcaps("Sample") ($U(0, 1)$) #i #comment[New solution is better or just tolerated] \
				$x <- x'$ #d \
			$T <- T - delta(T)$ #d #comment[Decrease temperature by a small amount] \
		while (not($epsilon$)) \
		return $x$ #comment[Return best solution found] \
	]
)

Note how, when a small value of the temperature is chosen, the algorithm
is pretty much identical to hill climbing, since the probability of the
algorithm to accept a worse solution is almost zero.

=== Threshold accepting

The idea of *threshold accepting* is similar to simulated annealing: a worse
solution can be accepted but only if it's sufficiently similar to the current
one, meaning that their difference is smaller than a given threshold $theta$
that decreases over time. The algorithm as follows:

#algo(
	title: "Threshold-accepting",
	parameters: ([$f : RR^(n) -> RR$: function, $theta$: float, $delta$: float, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$x = (x_(1), dots, x_(n)) <-$ A random initial solution \
		do #i \
			$x' = (x'_(1), dots, x'_(n)) <-$ A random point near $x$ \
			if ($f(x) - f(x') < theta$) #i #comment[New solution is better or just tolerated] \
				$x <- x'$ #d \
			$theta <- theta - delta(theta)$ #d #comment[Decrease threshold by a small amount] \
		while (not($epsilon$)) \
		return $x$ #comment[Return best solution found] \
	]
)

=== Great Deluge Algorithm

The *Great Deluge Algorithm* is similar to threshold accepting, but the
tolerance of accepting worse solutions depends only on the initial choice
of parameters for the threshold and on the number of the iteration, not on
the current solution candidate. Such parameters are an initial threshold
$theta_(0)$ and a scaling factor $eta$. The algorithm is as follows:

#algo(
	title: "Great-Deluge",
	parameters: ([$f : RR^(n) -> RR$: function, $theta_(0)$: float, $eta$: float, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$x = (x_(1), dots, x_(n)) <-$ A random initial solution \
		$t <- 0$ #comment[Initialize iteration counter] \
		do #i \
			$x' = (x'_(1), dots, x'_(n)) <-$ A random point near $x$ \
			if ($f(x') gt.eq theta_(0) + t dot eta$) #i #comment[New solution is better or just tolerated] \
				$x <- x'$ #d \
			$t <- t + 1$ #d #comment[Increase iteration counter] \
		while (not($epsilon$)) \
		return $x$ #comment[Return best solution found] \
	]
)

=== Record-to-Record Travel

*Record-To-Record Travel* uses a lower bound for tolerating worse solutions,
similar to Great Deluge, but such threshold also depends on the value yielded
by the best solution found so far and, like threshold accepting, is decreased
over time.

#algo(
	title: "Record-To-Record-Travel",
	parameters: ([$f : RR^(n) -> RR$: function, $theta$: float, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$x = (x_(1), dots, x_(n)) <-$ A random initial solution \
		$x_("best") <- x$ #comment[Initialize best solution] \
		do #i \
			$x' = (x'_(1), dots, x'_(n)) <-$ A random point near $x$ \
			if ($f(x') gt.eq f(x_("best")) - theta$) #i #comment[New solution is better or just tolerated] \
				$x <- x'$ #d \
			if ($f(x') > f(x_("best"))$) #i #comment[New solution better than the best one] \
			$x_("best") <- x'$ #d#d #comment[Increase iteration counter] \
		while (not($epsilon$)) \
		return $x_("best")$ #comment[Return best solution found] \
	]
)

=== Case study: the Traveling Salesman Problem

A *Eulerian cycle* of a connected weighted graph is a path that starts and
ends in the same node of the graph and that reaches all of its nodes exactly
once. The Eulerian cycles having the smallest cumulative weight are called
*Hamiltonian cycles*.

One of the most famous problems in mathematical optimization, the *Travelling
Salesman Problem* (*TSP*), requires to find, for a given weighted connected
graph, an Hamiltonian cycle. The name of the problem comes from the analogy
of a traveller that has interest in reaching all cities of their trip (the
nodes of the graph) moving from city to city along the roads (the edges on
the graph) whose time needed to be moved along is cumulatively the smallest
(an Hamiltonian cycle).

More formally, let $G = (V, E, W)$ be a graph, with $V = {v_(1), dots, v_(n)}$
a set of vertices, $E subset.eq V times V - {(v, v) | v in V}$ a set of edges
(having no loops) and $W: E -> RR^(+)$ a function that assigns a (positive)
weight to each edge. The Travelling Salesman Problem is the optimization
problem $(Omega, f)$, where $Omega$ is the set of all possible Eulerian
cycles, that is, the set of all possible permutations of indices of the
vertices that, two by two, have an edge that connects them:

$ Omega = {pi(n) | forall k in [1, n], (v_(pi(k)), v_(pi((k + 1) mod n))) in E} $

And where the function $f$ is the sum of all the weights of an Eulerian
cycle in $Omega$:

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

Under these assumptions, an approximate solution of the TSP can be obtained
by applying local search algorithms, such as simulated annealing. To employ
such algorithm, it is sufficient to define how to construct an "neighboring"
solution (since the input is graphs, the notion of neighborhood is spurious)
and how to define the probability of accepting a worse solution.

Given a permutation $pi$, a neighboring solution can be constructed as
follows. Pick four distinct vertices in the graph, $A, B, C, D$, such
that $(A, B)$ and $(C, D)$ are pairs of adjacent vertices in $pi$. A new
candidate solution can be obtained by swapping the order of $B$ and $C$.

As always, a new solution is to be accepted as new candidate either if it's
better than the current candidate (yields a greater value of the objective
function) or, if worse, with probability $e^(Delta slash Delta_(max) T)$.
The range of qualities $Delta_(max)$ can be estimated as:

$ Delta_(max) = frac(t + 1, t)(Q_(max, t) - Q_(min, t)) $

With $t$ being the number of the current iteration and $Q_(max, t)$
and $Q_(min, t)$ being the highest qualities found so far among candidate
solutions. The temperature can be decreased just as $T = 1 slash t$.
