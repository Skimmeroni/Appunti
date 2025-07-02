#import "../AI_definitions.typ": *

Since evolutionary algorithms operate with entire populations of individuals,
it is no surprise that they are well-suited for tackling multi-criteria
optimization problems. This is because solving such classes of problems
requires to find an entire set of solutions (the Pareto-frontier), not just
one. The basic idea of any evolutionary algorithm that solves multi-criteria
optimization problems is to find a population that covers, or at least gets
close to, the entire Pareto-frontier of the problem.

The simplest evolutionary algorithm that solves multi-criteria optimization
problems is the *Vector Evaluated Genetic Algorithm* (*VEGA*) which works as
follows: for each objective function $f_(1), dots, f_(k)$ of the problem,
the selection method is carried out $k$ times, once with respect to each
objective function. That is, if the population size is $mu$, selection
(using roulette-wheel selection, tournament selection, elitism, ecc...)
is applied once with respect to $f_(1)$, obtaining a batch of $mu slash k$
individuals, then it is applied once with respect to $f_(2)$, obtaining
another batch of $mu slash k$ individuals, ecc... until $(mu slash k) dot
k = mu$ individuals are selected. In some sense, each subpopulation of size
$k$ evolves with respect to a certain function.

Even though the approach is simple and computationally inexpensive, it
has the disadvantage of not being able to have individuals emerge over
the others. That is, a solution that is a valid solution for all the
objective functions at the same time struggles to be selected consistently
across the iterations. This may have the unintended effect of "watering
down" the solution to a single neighborhood of the Pareto-frontier, which
defeats the purpose of the algorithm.

A better approach is to exploit the _dominance_ of some solutions over
others. The idea is to progressively remove from the population the
solutions that are not dominated by any other, until the population
becomes empty, ranking them by how early they were found:

+ Start from the highest rank and the entire population;
+ Find all solutions in the population that are not dominated by any
  other;
+ Assign a rank to this subset of solutions and remove them from the
  population;
+ Decrease the rank;
+ If the population is empty, stop. Otherwise, restart from the second
  step.

Once the partitioning is complete, it then becomes possible to perform
rank-based selection, guaranteeing that the Pareto-frontier is covered
as thoroughly as possible. For example, one could employ power law sharing:
the fitness assigned to an individual is the lower, the more individuals
in the population have similar function values.

An even more refined approach is *Non-dominated Sorting Genetic Algorithm-II*,
based on the same dominance approach but substituting rank-based selection
with tournament selection. That is, the algorithm employs a variant of
tournament selection where the winner of the tournament is not decided based
on its fitness, but based on its non-being-dominated rank. Also, a crowding
distance mechanism is relied upon to ensure that the solutions are properly
spread out along the Pareto-frontier.

The first building block of the algorithm is computing the fitness of each
individual in the population with respect to all $k$ activation functions:

#algo(
	title: "Update-All-Fitnesses",
	parameters: ([$(f_(1), dots, f_(k))$: objective functions, $P$: population],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		for ($i in {1, dots, k}$) #i \
			for ($j in {1, dots, mu}$) #i \
				P[j].fitness-i $<- f_(i)(P[j])$ #d#d \
	]
)

The second building block is constructing the Pareto-frontiers. Given a
population $P$, from the set are repeatedly extracted the Pareto-optimal
solutions, each constituting a frontier. The procedure is repeated until
all frontiers are built:

#algo(
	title: "Construct-Pareto-Frontiers",
	parameters: ([$P$: population],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$i <- 1$ \
		$cal(F) <- emptyset$ \
		while ($P != emptyset$) #i \
			$cal(F)_(i) <-$ the subset of $P$ containing Pareto-optimal solutions \
			$i <- i + 1$ \
			$P <- P - cal(F)_(i)$ \
			#smallcaps("Append") ($cal(F), cal(F)_(i)$) #d \
		return $cal(F)$ #comment[$cal(F) = (cal(F)_(1), cal(F)_(2), dots)$] \
	]
)

Note the use of a `while` loop instead of a `for` loop, since the number
of frontiers is unknown a priori.

Then, each frontier is added to the new population one by one, starting
from the first. Since the population size is $mu = abs(P)$ and the
frontiers $cal(F)_(1), cal(F)_(2), dots$ come from $P union Q$, there
are clearly more individuals than the maximum capacity. Therefore, some
of the frontiers have to be discared.

In particular, there will be a frontier $cal(F)_(i)$ that, when added
to the population, would exceed the maximum capacity, and has to be
"truncated" to reach a size of exactly $mu$. This is done employing
a selection mechanism called _crowding distance mechanism_. As the
solutions in one front have the same quality, one can differentiate
between them by using the so called crowding distance values ($c d$).
The solutions in the crowded areas (in the objective space) get a low
chance (small crowding distance) to survive the selection.

#algo(
	title: "NSGA-II",
	parameters: ([$(f_(1), dots, f_(k))$: objective functions, $mu$: integer,
	              $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
    $P <-$ an initial population of $mu$ individuals \
	do #i \
	  #smallcaps("Update-All-Fitnesses") ($f_(1), dots, f_(k), P$) \
	  $cal(F) <-$ #smallcaps("Construct-Pareto-Frontiers") ($P$) \
      $Q <-$ produce offspring from ($P, cal(F)$) with tournament selection w.r.t. rank \
	  #smallcaps("Update-All-Fitnesses") ($f_(1), dots, f_(k), Q$) \
      $P <- P union Q$ \
	  $cal(F) <-$ #smallcaps("Construct-Pareto-Frontiers") ($P$) \
      $P' <- emptyset$ \
      $i <- 1$ \
      while ($abs(P') + abs(cal(F)_(i)) lt.eq mu$) #i \
		$P' <- P' union cal(F)_(i)$ \
		$i <- i + 1$ #d \
	  #smallcaps("Sort") ($cal(F)_(i), c d$) \
	  $P' <- P' union cal(F)_(i)[1 : mu - abs(P')]$ #d \
    while(not($epsilon$)) \
    $S <-$ the subset of $P$ containing Pareto-optimal solutions \
    return $S$ \
	]
)

Another approach is called *strength Pareto evolutionary algorithm 2*
(*SPEA2*), which is a standard evolutionary algorithm extended to
work with more than one evaluation function. The algorithm stores
the non-dominated individuals separately in an _archive_ of finite
size, where elements can be added only if older elements are removed.
The algorithm strives to fill it with as many non-dominated individuals
as possible; if there aren't enough, it resorts to the best dominated
individuals.

The idea of the archive is similar to the tabu list, but the admission
criteria works the other way around: instead of filling the archive with
the already attempted and therefore "banished" solutions, it is filled
with the promising solutions.

#algo(
	title: "SPEA2",
	parameters: ([$(f_(1), dots, f_(k))$: objective functions, $mu, tilde(mu)$: integer,
	              $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$P <-$ an initial population of $mu$ individuals \
		$R <- emptyset$ #comment[Archive] \
		do #i \
			#smallcaps("Update-All-Fitnesses") ($f_(1), dots, f_(k), P$) \
			for $A in P union R$ #i \
				NoDom($A$) $<- abs({B in P union R | A "dominates" B})$ #d \
			for $A in P union R$ #i \
				$d <-$ distance from $A$ to its $sqrt(mu + tilde(mu))$ nearest individuals in $P union R$ \
				$A.F <- frac(1, d + 2) sum_(B in P union R, B "dominates" A)$ noDom($B$) #d \
			$R' <- {A in P union R | A "is Pareto-optimal"}$ \
			while ($abs(R') > tilde(mu)$) #i \
				$R' <- R' -$ {the individual $A in R'$ with smallest $A.F$} #d \
			if ($abs(R') < tilde(mu)$) #i \
				while ($abs(R') < tilde(mu)$) #i \
					$R' <- R' union $ {the individual $A in P union R$ with smallest $A.F$} #d#d \
			if (not($epsilon$)) #i \
				$P' <-$ offspring from $P$ with tournament selection w.r.t. rank \
				$P <- $ apply recombination, mutation to $P$ #d#d \
		while(not($epsilon$)) \
		$S <-$ the subset of $P$ containing Pareto-optimal solutions \
		return $S$ \
	]
)

The last example is *Pareto-archived evolutionary strategy* (*PAES*).
This approach is based on a (1 + 1)-ES an also relies on an archive in
the form of a multi-dimensional table.

#algo(
	title: "PAES",
	parameters: ([$(f_(1), dots, f_(k))$: objective functions, $tilde(mu)$: integer,
	              $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$A <- $ a random individual
		$R <- {A}$ #comment[Multi-dimensional hash-table] \
		do #i \
			$B <- $ a mutation of $A$ \
			Evaluate $B$ with $f_(1), dots, f_(k)$ \
			if ($not (C "dominates" B) forall C in R union {A}$) #i \
				if ($exists C in R "s.t." B "dominates" C$) #i \
					remove all individuals from $R$ that are dominated by $B$ \
					$R <- R union B$ \
					$A <- B$ #d \
				else if ($abs(R) = tilde(mu)$) #i 
					$g^(*) <-$ hash entry with most entries \
					$g <-$ hash entry of $B$ \
					if (entries in $g <$ entries in $g^(*)$) #i \
						remove one entry from $g^(*)$ \
						$R <-$ add $B$ to $R$ #d \
					else #i \
						$R <-$ add $B$ to $R$ #d \
						$g_(A) <-$ hash entry for $A$ \
						$g_(B) <-$ hash entry for $B$ \
						if (entries in $g_(A) <$ entries in $g_(B)$) #i \
							$A <- B$ #d#d#d#d \
		while(not($epsilon$)) \
		$S <-$ subset of $R$ containing Pareto-optimal solutions \
		return $S$ \
	]
)

Unless the archive is full, new solution candidates are added to it.
If it is full, all dominated solution candidates are removed from it.
If there are no dominated solution candidates, one of the individuals
in the hash entry with the most members is removed.
