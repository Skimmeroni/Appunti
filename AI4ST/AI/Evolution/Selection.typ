#import "../AI_definitions.typ": *

The basic principle of biological selection is that fit individuals
have a better chance to procreate, hence passing their traits to
their offspring. The "willingness" of the evolution process to tolerate
suboptimal individuals is called *selective pressure*. High selective
pressure means that only individuals with a very high fitness will be
(most likely) able to procreate, whereas low selective pressure means
that even individuals with an average or subaverage fitness will (most
likely) manage to procreate.

Of course, if the selective pressure is zero, then there is no evolution
at all, since any individual can procreate regardless of their fitness.
On the other hand, a selective pressure that is as high as possible will
prioritize individuals that are optimals with respect to the initial
population, at the expense of individuals underrepresented in the initial
population which could be more promising.

When designing an evolutionary algorithm and its selection method, one
must balance the *exploration* of the search space (finding promising
individuals across an area as wide as possible) and the *exploitation*
of the fittest individuals (operating on their genotype to yield even
fitter offspring). Clearly, low selective pressure favour exploration,
since many individuals can procreate and, through random mutations,
can reach an area of the search space as wide as possible. On the other
hand, high selective pressure favours exploitation, since only very fit
individuals will be taken into account, restricting the search space to
their neighborhood.

The best strategy to achieve this balance is to tune the selective
pressure with respect to time, starting with low selective pressure
(in order to cover the wides area possible) and then increasing it
further and further along the iterations to restrict the focus on
the most promising candidate solutions.

A very intuitive approach to the selection of individuals is what is
called *Roulette-Wheel Selection* or *Fitness-Proportionate Selection*.
Given a population $P$, for each individual $s$ a relative fitness is
computed as:

$ f_("rel")(s) = frac(f_("abs")(s), sum_(s' in P) f_("abs")(s')) $

That is, as its absolute fitness (its "standard" fitness) weighted by
the fitness of all the other individuals. This relative fitness is then
interpreted as the probability of obtaining said individual when sampling
a random individual in the population to construct the next generation.
This way, the probability of choosing any individual as a member of the
next generation is directly proportional to its fitness (hence the name
fitness-proportionate selection).

Note that this approach requires the problem at hand to be a maximization
problem (higher fitness means better individual), because in a minimization
problem (higher fitness means worse individual) the sampling would pick
unfit individuals with high probability and fit individuals with low
probability. In general this is not an issue, since minimization problems
can be converted into maximization problems. Also, the fitness function
must be non negative, otherwise one might incur in negative probabilities.

A drawback of Roulette-Wheel Selection is that some individuals may
dominate the selection process. If an individual has much higher fitness
that the others, it has a greater chance of being selected, which in turn
means that its offspring will have higher chances, which leads to them
being selected, and so on.

What might happen is what is called *crowding*, that is when the population
is composed of individuals coming from a very small subset of the search
space and the remaining space is underrepresented. Crowding might lead to
*early convergence*, meaning that an optimum can actually be reached, but
such optimum is local with respect to the (narrow) subset represented by
the population.

Another pathological situation as a result of a poor choice of the
selection method is the so-called *vanishing selective pressure*.
This happens when the relative fitnesses of all individuals are too
close to one another, therefore the probabilities of each individual
to be chosen in the selection process are almost identical. In turn,
this results in no individual being able to emerge over the others,
essentially turning the evolutionary algorithm into no better than
a random search.

Since an evolutionary algorithm tends to increase the average fitness
of individuals from one generation to the next, as better individuals
are selected with higher probability, it may even create the problem
of vanishing selective pressure itself. As generations go by and the
average fitness is increased, it might have the side effect of reducing
the range of fitnesses too much (concentrating on the same optimal
neighborhood), creating a bottleneck that lowers the selective pressure.

This issue ought to be mitigated, since an ideal evolutionary algorithm
should do the exact opposite (start with low selective pressure and
increase it over time). A popular solution to preventing both crowding
and vanishing selective pressure is, before computing the relative fitness
function, scaling the (absolute) fitness function. One simple approach is
*linear dynamic scaling*:

$ f_("lds")(s) = alpha dot f(s) - min{f(s') | s' in P} $

Where $alpha > 0$ is a tunable parameter than determines the strength
of the scaling and $P$ is the current population. Another approach is
$sigma$*-scaling*:

#grid(
	columns: (0.3fr, 0.7fr),
	[$ f_(sigma)(s) = f(s) - mu_(f)(t) + beta sigma_(f)(t) $],
	[$ "with" mu_(f)(t) = frac(sum_(s in P(t)) f(s), abs(P))
	   "and" sigma_(f)(t) = sqrt(frac(sum_(s in P(t)) (f(s) - mu_(f)(t))^(2), abs(P) - 1)) $]
)

Where $beta > 0$ is another tunable parameter, $t$ is the index of the
current generation, $mu_(f)$ is the mean value of the distribution of
the fitness functions and $sigma_(f)$ is its standard deviation.

Obviously, these formulas beg the question of how to find suitable values
for $alpha$ and $beta$. One way to do so is to refer to the so-called
*coefficient of variation* $nu$, defined as:

$ nu = frac(sigma_(f), mu_(f)) =
  frac(abs(Omega) sqrt(sum_(s' in abs(Omega)) (f(s') - frac(1, abs(Omega)) sum_(s in abs(Omega)) f(s))^(2)),
  sqrt(abs(Omega) - 1) sum_(s in Omega) f(s)) approx
  frac(sigma_(f)(t), mu_(f)(t)) $

As denoted by the $approx$ sign, this coefficient is rarely computed in
its proper form (that is, by considering the entire search space $Omega$),
because it would be too computationally expensive. Instead, it is estimated
from the population at hand, assuming that the value of such coefficient is
roughly constant across all generations.

Empirical analysis has found that a value of $nu approx 0.1$ yields a
good tradeoff between exploration and exploitation. Therefore, if the
value of $nu$ for the population under consideration deviates significantly
from $0.1$, the fitness function should be tuned so that the coefficient
of variation approaches $0.1$.

An alternative to scaling the fitness function before sampling is to
introduce a *time dependence*. That is, computing the relative fitness
values not from $f(s)$ but from $g(s) = (f(s))^(k(t))$, with $k(t)$ being
an exponent (dependent on $t$) that modulates the selective pressure in
order to obtain a value of the coefficient of variation close to $0.1$.
One possible choice is:

$ k(t) = (frac(nu^(*), nu))^(beta_(1)) (tan(frac(t, T + 1) dot frac(pi, 2)))^(beta_(2) (frac(nu, nu^(*)))^(alpha)) $

Where $nu^(*), alpha, beta_(1), beta_(2)$ are tunable parameters, $t$
is the index of the current generation and $T$ is the maximum number
of generations. To achieve $nu approx 0.1$, many combinations of parameters
can be used: one such combination is known to be $nu^(*) = alpha = beta_(2)
= 0.1$ and $beta_(1) = 0.05$.

$ k(t) = (frac(0.1, nu))^(0.05) (tan(frac(t, T + 1) dot frac(pi, 2)))^(0.1 (frac(nu, 0.1))^(0.1))
       = root(20, frac(1, 10 nu)) (tan(frac(t, T + 1) dot frac(pi, 2)))^(frac(root(10, 10 nu), 10)) $

An alternative choice of time-dependent fitness function is *Boltzmann
selection*, where the relative fitness is computed from $g(s) =
exp(frac(f(s), k T))$, with $k$ being a normalization constant and
$T$ the temperature parameter that tunes the selective pressure. The
idea (similarly to simulated annealing) is to start from a high value
of $T$ in the early iterations, yielding small values of $g(s)$ (being
at the denominator) and hence lowering the selective pressure. The more
iterations are carried out, the more $T$ is lowered, resulting in more
appreciable fitness differences and therefore higher selective pressure.

Even though roulette-wheel selection is vary simple and strives to be
fair, it presents an obvious problem: just because an individual has
higher fitness (meaning an higher chance to be selected to produce the
next generation), it does not mean that it will _certainly_ be selected,
just that it will _more likely_ be selected. Hence, if each individual
is allowed to reproduce the same number of times, it does not matter
how fit an individual is: there will always be a chance that its genetic
traits will be lost in the generations. This is also known as the *variance
problem*.

A solution that is as simple as questionable to address the variance
problem is to discretize the range of fitness values. Based on the
mean $mu_(f)(t)$ and the standard deviation $sigma_(f)(t)$ of the
fitness values in the population, offspring is created according to
this rule:

- If $f(s) < mu_(f)(t) − sigma_(f)(t)$, then $s$ will have no offspring;
- If $mu_(f)(t) − sigma_(f)(t) lt.eq f(s) lt.eq mu_(f)(t) + sigma_(f)(t)$,
  then $s$ will have one descendant;
- If $f(s) > mu_(f)(t) + sigma_(f)(t)$, then $s$ will have two descendants.

A better approach would be the *expected value model*, generating as many
descendants for a given individual as its expected relative frequency. That
is, for any individual $s$, the size of its offspring is $floor.l f_("rel")
dot abs(P) floor.r$, with $abs(P)$ being the size of the population (of
course this value has to be rounded, since individuals are discrete). The
problem is that the number of individuals generated will most likely be
quite small, since $floor.l f_("rel") dot abs(P) floor.r$ will often be
$0$. To compensate, one would need to apply the expected value model to
obtain a first batch of individuals and then use other selection methods
(like roulette-wheel selection itself) to enlarge the population size
sufficiently.

A very elegant implementation of the expected value model is the
*stochastic universal sampling*, which can be seen as a variant
of roulette-wheel selection. It can still be seen conceptually as
a roulette wheel, but with as many markers as there are individuals
in the population, equally spaced around the wheel. Instead of turning
the roulette wheel once for each individual to be selected (as in
standard roulette-wheel selection), the roulette wheel is turned only
once and each marker gives rise to one selected individual. This way,
individuals with good fitness will certainly have at least one child
(if not more), whereas individual with poor fitness will get no more
than one child (or none at all).

An alternative approach is to employ roulette-wheel selection but
decreasing the fitness of the chosen individual at each extraction
by a certain amount $Delta f$. If the fitness of an individual becomes
negative, it is discarded and forbidden to have offspring for the
upcoming generation. Methods for computing $Delta f$ are:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ Delta f = frac(sum_(s in P(t)) f(s), abs(P(t))) $],
	[$ Delta f = frac(1, k) max{f(s) | s in P(t)} $]
)

*Rank-Based Selection* selects individuals not with respect to their
(relative) fitnesses, but with respect to their _ranks_. The individuals
are sorted with respect to their fitness and thus a rank is assigned to
each. Then, to each rank is assigned a probability, which is then used
to select individuals using roulette-wheel selection (or one of its
variants).

This way, the probability of choosing an individual is not directly related
to the absolute value of their fitness, allowing one to assign probabilities
to the ranks of the individuals in a more "standardized" way, without having
a dependence on the fitnesses. It has the obvious disadvantage of having to
sort the individuals meaning an overhead of (at best) $abs(P) log(abs(P))$.

In *Tournament Selection*, a subset of $k$ individuals from the population
is sampled, and then the fittest individual of the subset (the one that
"wins" the "tournament") is chosen; if there were to be a tie between
two individuals, one of them is chosen at random. The "winning" individual
is allowed to have a descendant in the next generation, whereas the "losing"
individual are shuffled back in the current population. This process is
repeated until the next generation has reached the same size as the current.

In this method, the fitnesses of the individuals are also not directly
coupled to the probability of the individuals to be selected, addressing
the dominance problem. Since all individuals have the same probability of
being chosen, the fitness of an individual only determines the chances of
winning a tournament, not wheter it will be drawn into a tournament in the
first place. This means that even the fittest individual has a reasonable 
chance of never reproducing, simply by never coming up in the samples.

Manipulating parameter $k$, the size of the tournament, allows one to tune
the selective pressure. A large tournament size will increase the selective
pressure, since there's an higher chance that very fit individuals will
take part and hence kicking out unfit ones, whereas a small tournament size
will increase the chances of average individuals to be drawn into tournaments
with even worse ones.

It should be noted, however, that even if an fit individual manages to
produce offspring, there is no guarantee that there will always be an
improvement. That is, if all of its descendants (generated from applying
genetic operators) have a worse fitness than their parent, then it would
be little to no different than to having chosen unfit individuals in the
first place.

Since evolution in evolutionary computing can at least be "tamed" (unlike
biological evolution, which is unpredictable), it is possible to introduce
some "protections" for fit individuals, guaranteeing that their fitness
is not worsened by mutations. A very simple yet effective way to do so is
what's called *elitism*: when a new generation is created, some of the
fittest individuals in the current generation are transferred unchanged.
This way, one has both gradual improvements that don't get lost (the best
individuals found so far) and genetic diversity (the offspring of the
previous population).

This form of elitism is what's called *global elitism*, to distinguish
it from another form of elitism called *local elitism*. In non-elitist
evolutionary algorithms, individuals in a generation are always
superseded by their offspring, no matter their fitness. In local elitism,
what enters in the next generation depends on the fitness of the resulting
individual. That is, if the descendant(s) has better fitness that their
parent(s), the descendant(s) is/are kept, whereas if the descendant(s)
has worse fitness than its parent(s), the parent(s) is/are kept.

Elitism (local or glocal) ensures that an optimal solution is approached
gradually and consistently, but has a downside: achieving a global optimum
might actually require to discard the current population entirely and start
from a completely different gene pool, but since some individuals are
always kept, this might actually reduce the variability and result in early
convergence to a local optimum.

Another approach for tackling crowding is given by the umbrella of
*niche techniques*. One such example is *deterministic crowding*,
the idea that generated offspring should always replace those individuals
in the population that are most similar. As a consequence, the local
density of individuals in the search space can be limited. Of course,
calculating the degree of similarity between two individuals requires
a notion of distance.

A variant of deterministic crowding, which includes ideas of elitism
is the following approach: in a crossover, the two parents and two
children are grouped into two pairs, each consisting of one parent
and one child. The guiding principle is that a child is assigned to
the parent to which it is more similar. If both children happen to
be assigned to the same parent, the child that is less similar is
reassigned to the other parent. Ties are broken arbitrarily. From
each pair the better individual is selected and passed on into the
next generation. The advantage of this variant is that much fewer
similarity computations are needed than in a global approach that
finds the most similar individuals in the population as a whole.

Another approach is what is called *sharing*. The idea of sharing is
to reduce the fitness of an individual if there are other individuals
in its neighborhood. Intuitively, the individuals share the resources
of a niche, that is, a region in the search space, which has a negative
effect on their fitness. A possible choice for the fitness reduction is:

$ f_("share")(s) = frac(f(s), sum_(s' in P(t)) g(d(s, s'))) $

where $d$ is a distance measure between individuals and $g$ is a function
that defines the shape of the niche. One such example is the so-called
power law sharing:

$ g(x) = cases(1 - frac(x, rho)^(alpha) & "if" x < rho, 0 & "otherwise") $

where $rho$ is the radius of the niche and $alpha$ controls the strength
of the influence that individuals in the niche have on each other.

The traits of selections methods are grouped below:

- *Static* or *Dynamic*. In the first case, the probability of
  selection remains constant across the generations. In the second
  case, the probability of selection changes (ideally, increasing)
  from generation to generation;
- *Extinguishing* or *Preservative*. In the first case, probabilities
  of selection may be $0$. In the second case, all probabilities of
  selection must be greater than $0$ (note that this does not mean
  that no individual can go exstinct, just that there's at least a
  chance of it not happening);
- *Pure-bred* or *Under-bred*. In the first case, individuals can only
  have offspring in one generation (hence lower crowding). In the second
  case, individuals are allowed to have offspring in more than one
  generation (hence higher crowding);
- *Right* or *Left*. In the first case, all individuals of a population
  may reproduce (higher exploitation). In the second case, the best
  individuals of a population may not reproduce (higher exploration,
  since premature converge is mitigated);
- *Generational* or *On the fly*. In the first case, each generation is
  created in batches. In the second case, offspring continuously replaces
  individuals in the population as long as they are created.
