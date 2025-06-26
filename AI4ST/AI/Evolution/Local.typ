#import "../AI_definitions.typ": *

Among guided search algorithms, particular relevance have the so-called
*local search algorithms*. The ones hereby presented are concerned with
finding a minimum or a maximum of a real-valued function, meaning that
they tackle an optimization problem where the search space is the set of
real numbers and the evaluation function is the function whose optima are
of interest.

Of course, such problems could be solved analitically by computing the
gradient of the evaluation function and setting it equal to $0$, but this
is possible only for very simple functions. This is because such calculation
might be very hard to carry out or, as in the case of polynomial functions
with degree greater than $5$, impossible.

Also, since no local search algorithm is guaranteed to terminate with an
exact result, there is the possibility of getting "stuck" in a neverending
loop. For this reason, it is necessary to introduce a termination criteria
that prevents the algorithm to run indefinitely. For example, the algorithm
can be terminated when a maximum number of iterations has been reached or
when the difference between the results yielded by the evaluation function
for consecutive candidate solutions become negligible.

=== Gradient ascent/descent

*Gradient ascent/descent* is an obiquitous local search algorithm that
explores the search space by relying on the gradient of the evaluation
function. The idea is to start evaluating the gradient of the function
in a random point of the search space, moving to a point in its neighborhood
where the gradient is bigger (ascent) or smaller (descent) and repeating
the process. Over many iterations, as long as the evaluation function is
differentiable everywhere, there's a guarantee to get very close to an
optimum.

To determine where to move after having computed the gradient in the
current iteration, it possible to rely on the properties of the gradient.
By definition, the gradient in a point is a vector that points in the
direction where the function is the steepest. This means that the
direction of the gradient (or the opposite direction) is the direction
where the function, with respect to that point, increases or decreases
the most, and therefore moves closer to an optimum as fast as possible.

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

The parameter $eta$ of the algorithm denotes the size of the step taken
in the direction of the gradient (or in the opposite direction). The
choice of $eta$ is critical because a step size too small can result in
a very slow procedure, whereas a step size too big can result in a process
that oscillates back and forth in the neighborhood of an optimum without
reaching it. A possible refinement of the algorithm would be to adjust
$eta$ in accord to the gradient: making long steps when the gradient is
small, hence the function is almost linear, and making small steps when
the gradient is big, to avoid overstepping.

One noticeable issue with gradient ascent/descent is that it does not
distinguish between a local optimum and a global optimum, since in both
cases the gradient is zero. Once an optimum has been found, gradient
ascent/descent won't take alternative paths. This means that the starting
point chosen to initiate the procedure can determine whether it will
land in a global or local optimum, depending on which is the closest.
The issue can be to some extent mitigated by repeating gradient descent
multiple times with different starting points, and choosing the best
result obtained among each trial

=== Hill climbing

For functions that are not differentiable everywhere it is still possible
to get a rough estimate to where the function grows in a given point by
simply trying random points in its neighborhood. If the new point yields
an higher value for the function to be optimized, meaning that it's closer
to a local optimum, the process restarts with this new point, otherwise
another point in the neighborhood is tried. This approach, which can be
thought of as a "naive" gradient descent, is called *hill climbing*.

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
of getting stuck in local optima. Also, having to try random points means
that some iterations will end up doing nothing, making it much more wasteful
than gradient descent (where each iteration is a guaranteed improvement).

=== Simulated annealing

The issue of getting stuck in local optima can be overcome by allowing
the search algorithm to consider solutions that are suboptimal in the
short run, but that are deemed "promising" enough to lead to even better
solutions in the long rung.

The idea is to start from a random point in the domain of the function
and try points in its neighborhood for improvements, but deliberately
accepting a worse solution as the current solution candidate under certain
circumstances. More specifically, if the newly chosen point yields a better
value for the evaluation function it is chosen as the new candidate solution,
but if it yields a worse value it is accepted anyway as the new candidate
solution with a certain probability, defined by the algorithm.

One local search algorithm that employs such strategy is *simulated
annealing*. The algorithm works like hill climbing, but accepts as
new candidate solution a worse solution with a probability dependent
both on a parameter $T$, called *temperature*, on the difference
between the current and the new candidate solutions and on the range
of possible values $Delta_(max)$ that have been encountered so far.
If the tolerance of accepting a worse solution is zero, simulated
annealing is indistinguishable from hill climbing.

If the new solution candidate is worse than the current solution candidate
but they yield similar values for the evaluation function, the algorithm
will accept the new solution with higher probability. Also, the temperature
parameter is decreased iteration by iteration, meaning that the algorithm
will be more inclined to accept a worse solution in the early iterations
and will become more and more "conservative" as the iterations go by.

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
			$u <-$ a random value sampled from $U ~ (0, 1)$ \
			if ($Delta > 0$ or $p gt.eq u$) #i #comment[New solution is better or just tolerated] \
				$x <- x'$ #d \
			$T <- T - delta(T)$ #d #comment[Decrease temperature by a small amount] \
		while (not($epsilon$)) \
		return $x$ #comment[Return best solution found] \
	]
)

Simulated annealing has shown promising results when adapted to solve
the Travelling Salesman Problem. To adapt simulated annealing to solve
the TSP, it is necessary to define: what constitutes a solution, how
to move in the search space (that is, how to construct a new candidate
solution from the current candidate) and how to compute $Delta_(max)$.

Given a graph, the possible solutions of the TSP for said graph are
all the possible permutations of the set of vertices of the graph.
The evaluation function is the function that has a permutation as
input and returns the sum of all edges that constitute the path
described by the permutation.

Given a permutation $pi$, a new solution can be constructed out of
$pi$ as follows. Pick four distinct vertices in the graph, $A, B, C,
D$, such that $(A, B)$ and $(C, D)$ are pairs of adjacent vertices
in $pi$. A new candidate solution can be obtained by swapping the
order of $B$ and $C$.

The range of qualities $Delta_(max)$ is impossible to compute, but can
be reasonably estimated as follows:

$ Delta_(max) = frac(t + 1, t)(Q_(max, t) - Q_(min, t)) $

With $t$ being the number of the current iteration and $Q_(max, t)$ and
$Q_(min, t)$ being the highest and lowest qualities found so far among
candidate solutions.

=== Threshold accepting

The idea of *threshold accepting* is similar to simulated annealing: a worse
solution can be accepted but only if it's sufficiently similar to the current
one, meaning that their difference is smaller than a given threshold $theta$
that decreases over time.

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
$theta_(0)$ and a scaling factor $eta$.

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
