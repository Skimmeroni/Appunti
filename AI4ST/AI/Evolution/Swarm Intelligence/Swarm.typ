#import "../../AI_definitions.typ": *

All the algorithms presented up to now relied on the performances and
fitnesses of single individuals, figthing for survival in their environment.
That is, each individual acts alone in its best interest, there is no form
of communication or "workload sharing" between them. However, a different,
more "collegial" approach for solving optimization problems is possible,
relying on the biological phenomenon called *swarm intelligence*.

Swarm intelligence is a phenomenon present in many species of social
animals, like fishes, birds or ants, where a group of animals (the school,
the flock, the colony, ecc...), even if constituted by individuals having
limited intelligence or capabilities, considered as a whole exhibits a
remarkably complex behaviour. This "distributed" intelligence is not
mediated by a central coordinator: the individuals regulate themseleves
simply by communicating between neighbors. This "whole being greater than
the sum of its parts" aspect is also referred to as _emergence_.

Genetic algorithms inspired by swarm intelligence are still constituted
by populations of individuals, with the goal being solving an optimization
problem, but don't take into account the fitness of the single individuals.
Instead, rely on such individuals to cooperate and share information in
order to achieve a common objective.

#figure(
	caption: [The complex patterns and unison movements of flock of birds
	is an example of swarm intelligence.
	[#link("https://commons.wikimedia.org/wiki/File:Auklet_flock_Shumagins_1986.jpg")[Original image]
	under public domain.]],
	image("Flock.jpg", width: 75%)
)

Such algorithms can be grouped into two broad categories: those that
achieve information sharing between direct communication and those
that do so by manipulating the (ficticious) environment of the individuals.
An example of the former is *Particle Swarm Optimization*, an example of
the latter is *Ant Colony Optimization*.

=== Particle Swarm Optimization

A very generic model of swarm intelligence using direct communication
between individuals to achieve the swarm behaviour is as follows. Consider
a population of $N$ individuals, moving in a $n$-dimensional search space
$Omega in RR^(n)$. Their position and velocity depends both on a time
variable, that can be assumed to be discrete, and on the reciprocal
position between individuals.

$Omega$ represents the possible positions in which an individual can
be found: the position of the $i$-th individual at time $t$ is given
by $(x_(1, i), x_(2, i), dots, x_(n, i))(t) = bold(x)_(i)(t) in Omega$.
The velocity of the $i$-th individual at time $t$ is given by $(v_(1, i),
v_(2, i), dots, v_(n, i))(t) = bold(v)_(i)(t)$.

Individuals travel across the search space, adjusting their position
and/or velocity at each time frame following three behavioural patterns:

- *Cohesion*. If an individual is too far away to its neighbors, will
  try to reach them by moving close by. To accomplish it, the individual
  computes the distance between itself and its neighbors; if this distance
  is greater than a given threshold $d$, it adjusts its position and/or
  velocity to lessen the distance;
- *Separation*. If an individual is too close to its neighbors, will try to
  keep its distance. If the distance between the individual and its neighbors
  is smaller than $d$, it adjusts its position and/or velocity to widen the
  distance;
- *Alignment*. Each individual will try to adjust its direction in order to
  move in the same average direction as its neighbors.

Of course, cohesion and separation are possible only if there's a way to
define a distance for the search space (that is, if $Omega$ is a metric
space);

For simplicity, exclude the alignment behaviour and focus on cohesion and
separation. The equations for position and velocity of the $i$-th individual
of the population are defined as:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ bold(x)_(i)(t) = bold(x)_(i)(t - 1) + bold(v)_(i)(t) $],
	[$ bold(v)_(i)(t) = w(t) dot bold(v)_(i)(t - 1) + bold(g)_(i) $]
)

Where $w$ and $bold(g)_(i)$ are two constants: $w$ indicates the
so-called _inertia weight_, whereas $bold(g)_(i)$ is the (positive
or negative) contribution of the cohesion and separation behaviour
of the individual. While $w$ is the same for all individuals of the
population, $bold(g)_(i)$ can be different for each individual. Many
choices of $bold(g)_(i)$ are possible: for each individual, $bold(g)_(i)$
is given by the sum of all contributions of the function for each other
individual in the swarm.

Particle Swarm Optimization (PSO) is a particular application of swarm
intelligence, where the swarm is instructed to move in the search space
trying to optimize a given function. The approach is inspired by the
collective behaviour of groups of animals, that share information on
the location of food in their vicinities. It combines gradient-based
search with population-based search; for this reason, the function to
be optimized must be $f: RR^(n) -> RR$.

#pseudocode(
	title: "Particle-Swarm-Optimization",
	parameters: ([$f : RR^(n) -> RR$], [$N$], [$w$], [$C_(1)$], [$C_(2)$], [$epsilon$],),
	content: [
		for $i = 1$ to $N$ #i \
			$bold(v)_(i) <- 0$ #comment[Initial velocity] \
			$bold(x)_(i) <-$ a random element of the search space $Omega$ #comment[Initial position] \
			$bold(x)_(i)^(*) <- bold(x)_(i)$ #d #comment[Locally known optimum] \
		opt $<- bold(x)_(1)$ #comment[Globally known optimum] \
		for $i = 2$ to $N$ #i \
			if $f(bold(x)_(i)) gt.eq f("opt")$ then #i \
				opt $<- bold(x)_(i)$ #d#d \
		do #i \
			for $i = 1$ in to $N$ #i \
				if $f(bold(x)_(i)) gt.eq f(bold(x)_(i)^(*))$ then #i \
					$bold(x)_(i)^(*) <- bold(x)_(i)$ #d #comment[Update local optimum] \
				if $f(bold(x)_(i)) gt.eq f("opt")$ then #i \
					opt $<- bold(x)_(i)$ #d #d #comment[Update global optimum] \
			for $i = 1$ to $N$ #i \
				$phi.alt_(1) <-$ a value sampled from $U ~ (0, 1)$ \
				$phi.alt_(2) <-$ a value sampled from $U ~ (0, 1)$ \
				$bold(v)_(i) <- w bold(v)_(i) + phi.alt_(1) C_(1)(bold(x)_(i)^(*) - bold(x)_(i)) + phi.alt_(2) C_(2)("opt" - bold(x)_(i))$ #comment[Update local velocity] \
				$bold(x)_(i) <- bold(x)_(i) + bold(v)_(i)$ #d #d #comment[Update local position] \
		while (not($epsilon$)) \
		return opt \
	]
)

The idea is to have a population (a "swarm") of individuals that move in
the search space and collaborate in finding an optimal solution by sharing
information. Indeed, each $i$-th individual knows both its current position
$bold(x)_(i)$ and its current velocity $bold(v)_(i)$, but also keeps track
of the best solution $bold(x)^(*)$ that he has found so far. Every member
of the population also knows about the global solution $"opt"$, which is
the best solution among the best local solution recorded by each individual:

$ "opt" = bold(x)_(M) space "with" space M = arg max_(i = 1)^(N) f(bold(x)_(i)^(*)) $

The global solution denotes the position of the particle that is the
closest, in the current time frame, to the optimal solution. The global
solution represents the "social" part of the swarm, since to be computed
each individual has to share its local knowledge of the optimality with
the other individuals. In the simplest case (the one presented above) each
individual is able to communicate to all other individuals, but one could
device a more constrained model where, for example, each individual can
communicate with no more than $k < N$ individuals.

The parameters $theta_(1)$ and $theta_(2)$ are chosen at random at every
iteration, and represent the strength of the influence that, respectively,
the personal and global memory exert on the velocity of a particle. The
parameters $C_(1)$ and $C_(2)$, also called *learning factors*, define
the amount of linear attraction and have to be hand-picked instead. The
inertia weight determines the size of the step iterations: small values
induce a quick convergence to a local optima, whereas high values slow
down convergence (or make it impossible). To tackle this exploration versus
exploitation tradeoff, the same approach can be used: starting with large
values of $w$ so that the space is thoroughly explored and slowly decreasing
it over time to close in on an optimum.

PSO can be tuned further by introducing a *turbulence factor*, a mechanism
that attempts to prevent a premature convergence to suboptimal solutions
by forcibly introducing randomness. A very simple turbulence factor consists
in choosing a random particle at each iteration and changing its position
to a random one. A more refined turbulence factor is to change the position
of slow particles (with velocity lower than a given threshold) with a random
position, in the hope that this will speed them up and contribute more
consistently in the exploration of the search space.

=== Ant Colony Optimization

Ant Colony Optimization is a mathematical optimization technique inspired
by the behaviour of certain species of ants. These ants are blind, but are
still able to communicate with each other if they happen to find a source
of food close to their nest. This is possible because, on their way forward
and backward to the food source, they deposit *pheromones*: when an ant
smells another ant's pheromones, they will be inclined to follow the same
trail, since it's deemed to be "safe". This creates a virtuous cycle: more
ants smell each other's pheronomones, which leads them to follow this path,
depositing even more pheromones, ecc... This behaviour is also called
*stimergy*.

This behaviour can be quickly adapted to solve a mathematical optimization
problem by observing how stimergy allows ants to find the shortest path
in an environment without having any model of it. This is because each
ant deposits pheronomones both on the way to the food source and on the
way back from the food source. Assuming that all ants move at the same
speed, in a given time interval the ants that have gone back and forth
from the nest to the food source following the shortest path (known to
them) will have done so more times than ants that have followed a longer
path. But this means that the shortest path will have more pheromone layed
onto it, which in turn will prompt other hands to follow this path, laying
more pheromones, ecc... This means that, after a given time, the shortest
path from the nest to the food source is the one where the ants have
deposited the greatest amount of pheromone.

Note that the shortest path is found only if the ants deposit pheromone in
both directions, from the nest to the source and from the source to the nest.
This is because all ants move one after the other and the amount of pheromone
deposited in all paths is mostly the same, equalizing each other. This means
that the choice of a path will eventually converge, but not necessarely to
the shortest one. Also, all paths must exist from the beginning, the behaviour
of the ants leads them to find a path that "incidentally" also happens to be
the shortest among the existing ones. If a new path is added, even if shorter
than any existing path, the ants have no interest in trying it out, since the
path that they have traced so far "just works".

Simulating ants and their stimergy can be used to solve graph-related
problems, like the problem of finding the shortest path in a graph: each
simulated ant traverses the graph and increases an attribute (the amount
of pheromone) of the edge they traverse; the probability with which a
certain path is traversed is proportional to the amount of pheromone
that has been deposited on the path so far.

It should be noted, however, that this approach has to take into account
the presence of cycles. A cycle, from the point of view of an ant traversing
the graph, is no different than traversing the entire graph. This issue can
be circumvented by depositing the pheromone only after the entire graph has
been traversed.  In addition, before pheromone is deposited, any cycles that
a path may contain are removed.

Another issue, already hinted at before, is that the ants will try to
stick the first (or one of the first) solution that they find, converging
prematurely to a sub-optimal solution. This can be tackled by letting the
amount of pheromone "decay", or "evaporate" #footnote[Even though, as any
chemical marker, pheromones do evaporate over time, this has little influence
in the real world behaviour of ants.], over time, so that the ants are
incentivised to try other solutions as well. An even more refined approach
could entail tuning the amount of deposited pheromone with respect to the
quality of the solution, or on the weight of the edge.

Ant Colony Optimization can be used to solve the Travelling Salesman
Problem. The two main data structures are the adjacency matrix $D$ of
the graph and a matrix $Phi$, where each entry $Phi_(i, j)$ contains
the amount of pheromone on the $(i, j)$ edge. By default, all $Phi_(i, i)$
are set to $0$ and all other entries are initialized with an arbitrary
starting value.

The graph is traversed by the ants one by one, leaving pheromones on the
path traversed when all nodes have been reached. To avoid having an ant
traverse the same node twice, each ant is endowed with a memory $C$ that
contains all the nodes that have been reached so far #footnote[This has
also no real world counterpart.]. Each ant starts in a random node, then
moves from node to node with a certain probability that (also) depends
on the amount of pheromone in the edges at each until all nodes are reached.
After the entire Hamiltonian cycle is constructed, the pheromone matrix
is updated with the newly deposited pheromone. Each time $mu$ ants have
traversed the graph, the pheromone matrix is evaporated employing an
_evaporation factor_ $eta$.

#pseudocode(
	title: "Ant-Colony-Optimization",
	parameters: ([$Q$], [$W$], [$mu$], [$eta$], [$c$], [$epsilon$],),
	content: [
		$n <- abs(W)$ \
		$Phi <-$ empty $n times n$ matrix \
		$s <-$ a generic starting value \
		for $i = 1$ to $n$ #i \
			for $j = 1$ to $n$ #i \
				$Phi_(i, j) <- s$ #d #d \
		$pi^(*) <- (1, dots, n)$ \
		$Q(pi^(*)) = c dot (sum_(i = 1)^(n) W_(pi^(*)(i), pi^(*)((i mod n) + 1)))^(-1)$ \
		iteration $<- 0$ \
		do #i \
			iteration $<-$ iteration $+ 1$ \
			$C <- {1, dots, n}$ \
			$t <- $ a random element in $C$ \
			$pi <- (t)$ \
			$C <- C \\ {t}$ \
			while $C != emptyset$ #i \
				$P <-$ empty array of $abs(C)$ elements \
				for $i = 1$ to $n$ #i \
					$P_(i) <- Phi_(t, i) slash sum_(j in C) Phi_(t, j)$ #d \
				$t' <- $ next node chosen at random weighted by $P$ \
				$pi$.append($t'$) \
				$C <- C \\ {t'}$ \
				$t <- t'$ #d \
			$Q(pi) = c dot (sum_(i = 1)^(n) W_(pi(i), pi((i mod n) + 1)))^(-1)$ \
			for $i = 1$ to $n$ #i \
				$Phi_(pi(i), pi((i mod n) + 1)) <- Phi_(pi(i), pi((i mod n) + 1)) + Q(pi)$ #d \
			if ($Q(pi) > Q(pi^(*))$) #i \
				$pi^(*) <- pi$ \
				$Q(pi^(*)) <- Q(pi)$ #d \
			if (iteration $mod mu = 0$) #i \
				for $i = 1$ to $n$ #i \
					for $j = 1$ to $n$ #i \
						$Phi_(i, j) <- (1 - eta) dot Phi_(i, j)$ #d #d #d #d \
		while (not ($epsilon$)) \
		return $pi^(*)$ \
	]
)

The basic algorithm can be extended in several ways. For example, the
probabilities with which the next node is selected could be weighted
by the weight of the edge leading to said node, using the weight as a
heuristic. Furthermore, one could employ a form of elitism augmenting
the amount of pheromone layed on the path that was found to be the most
promising in the current $mu$ iterations (in addition to the normal
update).

Further variants include rank-based updating, in which pheromone is
deposited only on the edges of the best m solution candidates of the
last iteration (consisting of the runs of $mu$ ants), and maybe also
on the best solution candidate found so far. This approach can be seen
as analogous to rank-based selection whereas the standard approach is
analogous to fitness proportionate selection.

Strict elite principles are extreme forms of rank-based updating: pheromone
is deposited only on the best solution candidate of the last iteration or
even only on the best solution found so far. However, this approach carries
the risk of premature convergence and thus of getting stuck in a local optimum.

In order to avoid extreme values of the pheromone deposits, it can be
advisable to introduce lower and upper bounds for the amount of pheromone
on an edge. They correspond to lower and upper bounds for the probability
of selecting an edge and thus help to enforce a better exploration of the
search space (though at the price of slower convergence). A similar effect
can be achieved by restricted evaporation: pheromone evaporates only from
edges that have been traversed in the last iteration.

Improvements of the standard approach, which are meant to lead to better
solution candidates, are local improvements of the round trip (like removing
edge crossings, which obviously cannot be optimal). More generally, we may
consider simple operations as they could be used in a hill climbing approach
and thus try (in a limited number of steps) to optimize solution candidates
locally. Among such operations are: exchange of cities that are visited in
consecutive steps, permutation of adjacent triplets, “inverting” a part of
a round trip, etc. More costly local optimization should only be considered
to improve the best solution candidate before it is returned from the search
procedure.

In order to apply ant colony optimization to other optimization
problems, the problem has to be formulated as a search in a graph.
In particular, it must be possible to describe a solution candidate
as a set of edges. However, these edges need not form a path. As
long as there is an iterative procedure with which the edges of the
set can be chosen, ant colony optimization is applicable. Even more
generally, ant colony optimization is applicable if solution candidates
are constructed with the help of a series of (random) decisions, where
every decision extends a (partial) solution. The reason is that the
sequence of decisions can be interpreted as a path in a *decision graph*
(also called *construction graph*). The ants explore paths in this decision
graph and try to find the best (shortest, cheapest) path, which yields a
best set or sequence of decisions.
