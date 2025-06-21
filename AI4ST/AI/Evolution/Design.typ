#import "../AI_definitions.typ": *

Evolutionary algorithms encompass a very broad spectrum of procedures,
and each component of each algorithm has to be adapted to the optimization
problem at hand. In particular, the components that have to be chosen with
most care are: the encoding of the solutions, the selection method and the
genetic operators. Even though there are no "silver bullets", it is still
possible to trace out some guidelines.

=== Choice of the solution encoding

A good choice of the solution encoding can significantly speed up the
process of finding an optimum, restricting the search space excluding
unneeded subdomains. On the other hand, a poor choice of the encoding
can result in an algorithm that has to navigate through many unfruitful
solutions or, even worse, that does not find an optimum at all.

First off, it is important to pay attention to the interplay between
the chosen encoding and the genetic operators. If a certain encoding
reduces the search space but becomes hard to find genetic operators
that are closed under said space, it is necessary to handle such edge
cases. If this is not possible, it may be better to fall back to a
looser encoding (incorporating fewer constraints) but that allows
for simpler choices of genetic operators.

In general, there are three desirable properties for an encoding to
have. The first one can be summarized as: _similar phenotypes should
be represented by similar genotypes_. A very intuitive way to quantify
the similarity between two genotypes is through *edit distance*, that
is, the minimum number of mutations necessary to completely convert 
the first genotype into the second (or vice versa): the more mutations
are needed, the less similar they are.

However, what is evaluated by the fitness function is the phenotype of
the individual, not the genotype. It is reasonable to assume that similar
phenotypes will yield similar values of the evaluation function, since this
allows the search space to be explored using said fitness as a guidance.
Since evolutionary algorithms only modify the genotype of individuals,
not their phenotype, similar modifications of the genotype should be
reflected in similar modifications of the phenotype, because otherwise
it might be impossible to obtain a similar phenotype by small genetic
modifications.

Even though this might seem unlikely at first hand, there are "problematic"
encodings where completely different genotypes, under the effect of the same
genetic operators, will yield similar phenotypes. Such encodings ought to be
avoided.

To give an instructive example, suppose there's the need to encode the
numbers inside a real-valued interval $[a, b]$ as binary numbers. Since
such interval is not discrete, it is impossible to have a one-to-one
mapping between $[a, b]$ and the set of binary numbers.

A possible way to circumvent the problem would be to fix a certain precision
$epsilon$, to partition $[a, b]$ into smaller intervals of size greater or
equal than $epsilon$ and then map a binary number to each of these intervals.
That is, one creates $2^(k)$ smaller intervals out of $[a, b]$, with $k =
ceil.l log_(2)(frac(b - a, epsilon)) ceil.r$, mapped to the (binary) numbers
$0_(2), 1_(2), (2^(k) - 1)_(2)$. Therefore, the binary number:

$ z = floor.l frac(x - a, b - a) (2^(k) - 1) floor.r $

Differs from $x$ by at most $epsilon$. The opposite operation can also be
performed, reconstructing an approximation $x'$ of the original value $x$ as:

$ x' = a + z (frac(b - a, 2^(k) - 1)) $

The difference between two binary numbers is given by their *Hamming
distance*, the number of bits (digits) of the two in the same position
having different values. It is easy to see that close numbers might be
encoded into binary numbers that aren't close at all, meaning that they
have a large Hamming distance.

#exercise[
	Suppose one wants to encode the real numbers in $[0, 1]$ onto $4$
	bits. What is the Hamming distance between the encoding of $0.5326$
	and $0.5400$?
] <Exercise-Hamming>
#solution[
	This results into the encoding:

	$ z = floor.l frac(x - 0, 1 - 0) (2^(4) - 1) floor.r =
	      floor.l x (16 - 1) floor.r = floor.l 15x floor.r $

	This gives:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ floor.l 15 dot 0.5326 floor.r = floor.l 7.9890 floor.r = 7_(10) = 0111_(2) $],
		[$ floor.l 15 dot 0.5400 floor.r = floor.l 8.1000 floor.r = 8_(10) = 1000_(2) $]
	)

	Even though the two original numbers are very close, their encoding
	have completely different bits, hence their Hamming distance ($4$)
	is maximal.
]

This isn't necessarely a problem _per se_, but it might very well be if
such encoding were to be employed in a genetic algorithm. Even if the
"phenotypical distance" between two individuals (the original numbers)
might be small, their "genotypical distance" (the Hamming distance
of their encodings) might as well be huge. This means that even if the
algorithm were to find a solution with high fitness, it would have little
use for it, since manipulating its genotype will most likely result in
individuals whose encoding is completely different, hence having completely
different fitness.

Conversely, to actually obtain a phenotype similar to the one of the
current solution, it might be necessary to employ a huge amount of
mutations (and luck) in order to cope with the very large Hamming
distance between the two. For this reason, these distances are also
called *Hamming cliffs*, stressing the difficulty in "climbing" such
obstacles in the path of a better solution.

This problem can be solved by using a different encoding, for example
*Gray codes*, an encoding where the representations of numbers that are
next to each other always have Hamming distance equal to $1$. This way,
a genotypical difference would be better reflected into a phenotypical
difference, and vice versa. The most common form of Gray encoding and
decoding is, respectively:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ g = z plus.circle floor.l frac(z, 2) floor.r $],
	[$ z = plus.circle.big_(i = 0)^(k - 1) floor.l frac(g, 2^(i)) floor.r $]
)

Where $plus.circle$ is the bitwise XOR and $z$ is the number encoded as
it was done previously. Note that dividing a binary number by $2$ amounts
to shifting its digits by one position to the right (inserting a $0$ as
most significant digit).

#exercise[
	What would be the Gray encodings of the two numbers in @Exercise-Hamming?
]
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ 0111_(2) plus.circle frac(0111_(2), 2) = 
		   0111_(2) plus.circle 0011_(2) = 0100_(2) $],
		[$ 1000_(2) plus.circle frac(1000_(2), 2) = 
		   1000_(2) plus.circle 0100_(2) = 1100_(2) $],
	)

	Their Hamming distance is indeed $1$.
]

Another principle of evolutionary algorithm design can be syntetized as:
_similarly encoded candidate solutions should have a similar fitness_. In
biology, the term *epistasis* refers to alleles of genes that are capable
of shutting down completely the expression of other alleles of the same
gene. In the context of evolutionary computing, epistasis refers to how
much influence a gene has on the value of the fitness function.

A solution encoding is said to manifest high epistasis if a small
modification on a gene produces a considerable difference in the
fitness of the solution. On the other hand, an encoding manifests
low epistasis if a small modification on a gene produces differences
of comparable orders of magnitude.

#exercise[
	Consider the Travelling Salesman Problem, and two possible encodings
	for a solution:

	- A permutation of the nodes, meaning that the $i$-th node of the
	  permutation is the $i$-th visited;
	- A list of numbers, each specifying the node to be visited in that
	  time frame as the index of a sorted list of all non visited nodes.
	  That is, if a gene has value $i$, it means that the node to be
	  visited in that time frame is the $i$-th not yet visited node.

	Which one has the smallest epistasis?
]
#solution[
	The first one (and is also both simpler an more intuitive). This is
	because introducing a mutation, such as swapping the values of two
	genes, will produce a comparable result, no matter which genes are
	chosen. On the other hand, if in the second encoding two genes are
	exchanged, the sequence of visited nodes can change drastically,
	as the value of the fitness.
]

Having high epistasis is undesirable, since it becomes very hard to
use an evolutionary algorithm effectively. One reason is that if small
phenotypical variations result in huge fitness variations destroys the
assumption that a small "nudge" to the genotype is reflected in an
equally small "nudge" to the genotype, hence making it impossible to
use the fitness function to aid the search.

The third staple of solution encoding is: _the search space should
be closed under the used genetic operators_. Indeed, if a genetic
operator mutates an individual into an new individual that is not
a member of the search space, by definition it cannot be a solution.

In the best case scenario, this just results in wasting computational
time. This happens when a genetic operator produces individuals that
aren't valid solutions and also having very poor fitness, hence they
will be (hopefully) discarded in the next generations. However, such
individuals may pollute the seach space with their offspring, preventing
the evolution process to converge. In the worst case scenario, non
conforming individuals might actually have very good fitness, tricking
the algorithm into choosing them as solution, hence rendering it incorrect.

Generally, an individual created by a genetic operator is said to lie
outside of the search space if:

- Its chromosome cannot be meaningfully interpreted or decoded;
- The represented candidate solution does not fulfill certain
  basic requirements;
- The represented candidate solution is evaluated incorrectly
  by the fitness function.

It is clearly better to not have to deal with such unwanted
individuals in the first place. However, if a very promising
choice of genetic operators and/or solution encoding has the
side effect of potentially producing individuals outside of
the search space, those can be tolerated as long as their
presence is properly addressed. The main not mutually exclusive
options to do so are:

- Choosing a different solution encoding (at the potential cost
  of enlarging the search space);
- Choosing a different set of genetic operators such that they are
  closed under the search space;
- Introduce repair mechanisms that "patch" individuals that fall out
  of the search space so that they are brought back in;
- Introduce a fitness penalty for non conforming individuals, so that
  they are guaranteed to be discarded in the evolution process.

#exercise[
	Suppose that a new encoding is chosen for the $n$-queens problem.
	Instead of $n$ numbers from $0$ to $n - 1$, the encoding consists
	of a permutation of the numbers in the interval ${0, 1, dots, n - 1}$,
	where the $i$-th element still represents the position in the row
	for the $i$-th queen. What would happen if the same genetic operators
	(one-point crossover, standard mutation) are chosen?
]
#solution[
	It is evident that both operators can produce individuals that are not
	solutions anymore, since resulting individuals might have duplicates.
	This issue can be addressed in the following ways:

	- Reverting back to the previous encoding, which does not have this
	  problem but results in a larger search space;
	- Using pairwise swaps as genetic operator, which is actually close
	  under this search space;
	- Check individuals that contain duplicates and substitute such
	  duplicate with the missing numbers (very expensive);
	- Set all individuals that contain duplicates as having infinite
	  fitness, so that they will be discarded in the upcoming generation
	  (quite expensive).

	Clearly, the second choice is the best choice, since it keeps the
	benefit of having a smaller search space while also preventing, with
	little cost, unwanted individuals to appear in the first place.
]

It should be noted that, in certain cases, encoding-specific genetic
operators or repair mechanism may actually complicate the search. This
happens, for example, if the search space is _disconnected_, meaning
that it's a union of dijoint subsets. Suppose that an algorithm is
exploring one of these subdomains, but an optimal solution is in another
subdomain. For the algorithm to reach it, it might be necessary to explore
parts of such "forbidden" areas to go from one subdomain to the other.

However, if a repair mechanism is introduced, an individual that falls
into one such forbidden area might be "brought back" to the subdomain
of its parents, hence making it impossible for the algorithm to cross
subdomains (unless making very long "jumps"). In such cases, it would
be better to employ fitness penalties instead of repair mechanisms, so
that an algorithm can tolerate individuals in "forbidden" regions as
long as they can lead to unexplored search space subdomains.

=== Choice of the fitness function

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

=== Choice of the selection method

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

Tournament selection has another edge over rank-based selection: the fact
that it's trivially parallelizable. This is because rank-based selection
requires computing and normalizing the relative fitnesses, whereas as many
tournaments can be carried out in parallel as one whishes, since all
tournaments are independent and do not influence the original population.

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

=== Choice of the genetic operators

*Genetic operators* introduce variability into the genetic pool of
the population, with individuals with a genotype that (potentially)
has never been seen so far that allow the algorithm to move around
in the search space. The simplest genetic operators are *mutation
operators* (also called *variation operators*), that generate a new
individual from a single individual.

Mutation operators that rely on substituting one or more alleles of
an individual with random (compatible) alleles are called *standard
mutations*. The simplest standard mutation operator is the *bit mutation*,
that operates on solution encodings of binary strings (arrays of $0$s
and $1$s). For each bit of the encoding, the bit mutation flips its
value (from $0$ to $1$ or from $1$ to $0$) with a given probability
$p_(m)$:

#algo(
	title: "Bit-Mutation",
	parameters: ([$S$: binary string, $p_(m)$: real value in $[0, 1]$],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		for $i = 1$ to $abs(S)$ #i \
			$u <-$ a random value sampled from $U ~ (0, 1)$ \
			if ($u lt.eq p_(m)$) #i \
				$S_(i) <- 1 - S_(i)$ #d#d \
	]
)

Empirically, choosing $p_(m) = 1 slash abs(s)$ has been shown to give the
most promising results.

A variant of bit mutation is *n-bit mutation*, where instead of bit
flipping each value with a certain probability, $1 lt.eq n lt.eq abs(s)$
bits are chosen at random and flipped:

#algo(
	title: "N-Bit-Mutation",
	parameters: ([$S$: binary string, $n$: integer],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$X <- $ an empty array \
		for $i = 1$ to $abs(s)$ #i \
			$X_(i) = i$ #d \
		$X <- $ the first $n$ elements of $X$ \
		$X <- $ a random permutation of $X$ \
		for $x_(i) in X$ #i \
			$S_(x_(i)) <- 1 - S_(x_(i))$ #d \
	]
)

In particular, when $n = 1$, the operator is referred to as *one-bit
mutation*.

When the encoding of the solution is an array of real numbers instead
of bits, *Gaussian mutation* is often employed. In Gaussian mutation,
each element of the array (of the solution) is shifted by a random
different value sampled from a normal distribution $N ~ (0, sigma)$,
with $sigma$ parameter to be chosen:

#algo(
	title: "Gaussian-Mutation",
	parameters: ([$S$: array of real numbers, $sigma$: real number],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		for $i = 1$ to $abs(S)$ #i \
			$nu <-$ a random value sampled from $N ~ (0, sigma)$ \
			$S_(i) <- S_(i) + nu$ \
			$S_(i) <- max{S_(i), l_(i)}$ \
			$S_(i) <- min{S_(i), h_(i)}$ \
	]
)

Where $l_(i)$ and $h_(i)$ are, respectively, the lower and higher bound
(if they exist) of the allowed range of values for $S_(i)$. These ensure
that Gaussian mutation is closed under the search space.

Gaussian mutation employs the same parameter $sigma$ for all chromosomes
of the search space. A more refined variant of Gaussian mutation is
*Self-adaptive Gaussian mutation*, where each chromosome $S$ has its
own standard deviation parameter $S_(sigma)$ and, with each mutation,
the parameter itself is tuned:

#algo(
	title: "Self-Adaptive-Gaussian-Mutation",
	parameters: ([$S$: array of real numbers, $sigma_(S)$: real number],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$u <-$ a random value sampled from $U ~ (0, 1)$ \
		$sigma_(S) <- sigma_(S) dot exp(u slash sqrt(abs(S)))$ \
		for $i = 1$ to $abs(S)$ #i \
			$nu <-$ a random value sampled from $N ~ (0, sigma_(S))$ \
			$S_(i) <- S_(i) + nu$ \
			$S_(i) <- max{S_(i), l_(i)}$ \
			$S_(i) <- min{S_(i), h_(i)}$ \
	]
)

In this way, the parameter $sigma_(S)$ is itself subject to evolutionary
pressure. In other words, the individuals with a "good" value of $sigma_(S)$,
meaning a value that causes suitable "jumps" across the search space, will
outmatch those with a "bad" value of $sigma_(S)$, and the distance travelled
in the search space adapts itself (hence the name).

A different class of mutation operators are the so-called *transposition
operators*, that rely not on substituting alleles with new values, but
instead on rearranging the position of the alleles without changing their
values. Among those are:

- The *swap operator*, that exchanges the position of two alleles
  (placing the value of the first as the value of the second and
  vice versa);
- The *inversion operator*, that reverses the order of a subset of
  contiguous alleles;
- The *shift operator*, that moves an entire list of genes into an
  insertion point;
- The *arbitray permutation*, where a subset of alleles are shuffled
  at random.

Clearly, such operators can be applied safely only if the exchanged
alleles can have the same values, otherwise the resulting individual
would fall outside the search space and appropriate countermeasures
would have to be taken. In particular, they should be considered when
the solution encodings are permutations of numbers (like the Travelling
Salesman Problem), since rearranging any permutation still gives a
permutation, and therefore said operators will certainly be closed
under the search space.

Genetic operators that involve two parents are referred to as *crossover
operators*. The simplest crossover operator is *one-point crossover*,
where a random cut point is chosen and the first section of the two
operators are exchanged. That is, given two chromosomes $S_(1)$ and
$S_(2)$, the first $c$ alleles of $S_(1)$ are swapped with the first
$n$ alleles of $S_(2)$, with $c$ chosen randomly:

#algo(
	title: "One-Point-Crossover",
	parameters: ([$S_(1), S_(2)$: chromosome (array of alleles)],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$c <-$ a random value in ${1, 2, dots, abs(S_(1)) - 1}$ \
		for ($i in {0, 1, dots, c - 1}$) #i \
			$t <- S_(1, i)$ \
			$S_(1, i) <- S_(2, i)$ \
			$S_(2, i) <- t$ #d\
	]
)

One-point crossover is an example of a genetic operator that suffers
from what's referred to as *positional bias*. A genetic operator is
said to possess positional bias if the way that the genes are arranged
in the chromosome influences the probability of them being inherited by
the offspring. That is, even if single genes have a random chance of
being inherited, groups of genes may be more or less likely to be
inherited "in batch" depending on the position that they occupy in the
chromosome. Positional bias is problematic because particular combinations
of genes that could be valuable can be lost in the generations simply due
to their reciprocal position.

The reason why one-point crossover exhibits positional bias is obvious:
even though the cutting point is chosen at random, hence all genes taken
by themselves have the same probability to be exchanged, the probability
of two or more genes to be exchanged together depends on how close they
are. This is because for two or more genes to undergo exchange together
the cutoff point must not be between them, but to the left or to the
right of both, and this depends on how much far apart they are. In the
extreme case of two genes being at the opposite side of the chromosome,
it is guaranteed that they will never undergo exchange together, since
any cutoff point will separate them. On the other hand, two neighboring
genes will undergo exchange together for all choices of cutoff points
except one, making such event very likely.

A straightforward extension of one-point crossover is *two-point
crossover*, where the section between two points is exchanged.
That is, given two chromosomes $S_(1)$ and $S_(2)$ and two random
cutoff points $a$ and $b$ (with $a < b$), the alleles $S_(1, a),
S_(1, a + 1), dots, S_(1, b)$ are swapped with the alleles $S_(2, a),
S_(2, a + 1), dots, S_(2, b)$; the first $a - 1$ and the last $b + 1$
alleles are left intact.

Even more generally, one-point crossover is extended to *n-point
crossover*, where $n$ cutoff points are chosen and the $n - 1$
subsequences are alternatingly exchanged and not exchanged. That
is, given $n$ cutoff points $c_(1), c_(2), dots, c_(n)$, the first
$c_(1)$ alleles are exchanged, the alleles between $c_(1)$ and $c_(2)$
are kept intact, the alleles between $c_(2)$ and $c_(3)$ are exchanged,
ecc...

Instead of randomly choosing cutoff points, *uniform crossover* follows
another approach: each gene $x$ of the pair of chromosomes is swapped
with a probability $p_(x)$.

#algo(
	title: "Uniform-Crossover",
	parameters: ([$S_(1), S_(2)$: chromosome (array of alleles), $(p_(1), dots, p_(n))$: real values],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		for ($i in {0, 1, dots, abs(S)}$) #i \
			$u <-$ a random value sampled from $U ~ (0, 1)$ \
			if $(u < p_(i))$ #i \
				$t <- S_(1, i)$ \
				$S_(1, i) <- S_(2, i)$ \
				$S_(2, i) <- t$ #d#d \
	]
)

Uniform crossover suffers from what's called *distributional bias*,
which means that the probability that a certain number of genes will
undergo exchange depends on the number itself. Distributional bias is
an undesirable property (even though not as much as positional bias)
because it means that subchromosomes of certain lengths will undergo
exchange more or less likely. 

Uniform crossover exhibits distributional bias because each gene is
exchanged with a given probability $p_(x)$ (dependent on the gene)
and each choice is independent of the others. This means that the
number of exchanged genes is binomially distributed, and a binomial
distribution has a probability mass function that yields higher values
for low and high inputs. That is, under uniform crossover, it is much
more likely that either very small or very large portions of the
chromosome(s) undergo exchange, whereas exchanges of moderate length
are less likely.

Interestingly, even though it suffers from positional bias, one-point
crossover does not suffer from distributional bias. This is because
the choice of any cutoff point is equally likely and the entire
subchromosome is exchanged, so all lengths are equally likely.

A slightly different operator is *shuffle crossover*, where the two
chromosomes are shuffled at random, any crossover operator is applied
and then they are shuffled again. The difference between the two lies
in the fact that, while in uniform crossover the number of exchanged
genes is binomially distributed (depending on $p_(x)$), in shuffle
crossover the choice of any number of exchanged genes is equally likely.
Shuffle crossover is an interesting choice, since it exhibits neither
positional bias nor distributional bias.

All of the crossover operators presented so far could not be employed if,
for example, the solution is encoded as a permutation, since merging two
permutations does not guarantee to result in a permutation. There are
crossover operators that are indeed closed under the search space of
permutations, such as *uniform order-based crossover*.

This operator determines, like uniform crossover, for each allele whether
it should be exchanged with a given probability $p_(x)$. However, instead
of exchanging the designated alleles with their counterpart in the other
chromosome, the designated alleles in a chromosome are exchanged with the
alleles in the other chromosome that in the first chromosome are missing,
and vice versa:

#algo(
	title: "Uniform-Order-Based-Crossover",
	parameters: ([$S_(1), S_(2)$: chromosome (array of alleles), $(p_(1), dots, p_(n))$: real values],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
	]
)

As the name hints, uniform-order-based-crossover is order-preserving,
since the ordering in which the values of the original alleles are
found is the same. Specifically, the alleles that are not exchanged
remain in the same place (hence trivially preserving their order)
whereas the new values for the exchanged alleles are ordered in the
same way as in the original chromosome.

A different permutation-preserving crossover operator is the so-called
*edge recombination*. In this method, designed specifically for tackling
the Travelling Salesman Problem, the alleles are interpreted as a graph,
where each allele is connected to its neighbors by an edge, including
the first and the last.

The first step in applying edge recombination is constructing a table,
called *edge table*. The $i$-th entry of the table contains the neighbors
of the $i$-th allele (the first and last allele are connected, so they do
count as neighbors), taking both chromosomes into account. If a value in
an entry happens to appear twice, meaning that the allele has the same
neighbor in both chromosome, it is listed only once, but "marked" to
denote that is has to be treated specially. The order of the neighbors
in each entry is not relevant, but they are often sorted for readability.

The second step is to employ the edge table to construct a new individual
out of the original two. This is done as follows:

+ If this is the first iteration, pick the value of the first allele in
  any of the two parents;
+ If this is not the first iteration, pick an allele in one of the following
  methods out of the neighbor list at hand, ordered by preference:
  - Marked neighbors;
  - Neighbors with the shortest neighborhood list;
  - Any neighbor;
  - Any allele that hasn't been chosen yet.
  If there are more candidates in the same tier, choose one at random;
+ Delete the chosen allele in all entries of the edge table;
+ Append the deleted allele to the chromosome of the new individual;
+ If the table does not contain any entry, stop. Otherwise, choose as
  new neighbor list the one of the allele that has been just deleted
  and restart the algorithm.

#exercise[
	Apply edge ricombination to the chromosomes $A = (6, 3, 1, 5, 2, 7, 4)$
	and $B = (3, 7, 2, 5, 6, 1, 4)$.
]
#solution[
	The entries of the edge table are as follows:

	#figure(
		table(
			columns: (12%, 12%, 12%, 12%, 12%, 12%, 12%),
			align: horizon,
			stroke: none,
			table.header([$1$], [$2$], [$3$], [$4$], [$5$], [$6$], [$7$]),
			[$3, 4, 5, 6$], [$5^(*), 7^(*)$], [$1, 4, 6, 7$],
			[$1, 3, 6, 7$], [$1, 2^(*), 6$], [$1, 3, 4, 5$], [$2^(*), 3, 4$]
		)
	)

	Where the neighbors marked with $*$ are those that appear in both
	chromosomes for the same allele.

	#figure(
		table(
			columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
			align: horizon,
			table.header([*Allele*], [*Iter. 0*], [*Iter. 1*],
			             [*Iter. 2*], [*Iter. 3*], [*Iter. 4*],
			             [*Iter. 5*], [*Iter. 6*], [*Iter. 7*]),
			[$1$], [$3, 4, 5, 6$], [$3, 4, 5$], [$3, 4$], [$3, 4$], [$3, 4$], [$3$], [], [],
			[$2$], [$5^(*), 7^(*)$], [$5^(*), 7^(*)$], [$7^(*)$], [$7^(*)$], [], [], [], [],
			[$3$], [$1, 4, 6, 7$], [$1, 4, 7$], [$1, 4, 7$], [$1, 4, 7$], [$1, 4$], [$1$], [$1$], [],
			[$4$], [$1, 3, 6, 7$], [$1, 3, 7$], [$1, 3, 7$], [$1, 3, 7$], [$1, 3$], [$1, 3$], [$1$], [],
			[$5$], [$1, 2^(*), 6$], [$1, 2^(*)$], [$1, 2^(*)$], [$1$], [$1$], [$1$], [$1$], [],
			[$6$], [$1, 3, 4, 5$], [$1, 3, 4, 5$], [$1, 3, 4$], [$1, 3, 4$], [$1, 3, 4$], [$1, 3$], [$1$], [],
			[$7$], [$2^(*), 3, 4$], [$2^(*), 3, 4$], [$2^(*), 3, 4$], [$3, 4$], [$3, 4$], [$3$], [], []
		)
	)

	+ In the first iteration, $6$ is chosen, since it's the first allele
	  of the first chromosome;
	+ In the second iteration, the choice is among $(1, 3, 4, 5)$,
	  the neighbors of $6$. None of them is marked, so the choice is
	  done based on neighborhood length: $5$ is chosen, since it has
	  the shortest neighborhood list;
	+ In the third iteration, the choice is among $(1, 2^(*))$, the
	  neighbors of $5$. $2$ is chosen, since it's marked;
	+ In the fourth iteration, the choice is $7$, since it's marked (and
	  it's the only member of the neighbor list of $2$);
	+ In the fifth iteration, the choice is among $(3, 4)$, the
	  neighbors of $7$. None of them is marked, so the choice is done
	  based on neighborhood length: since both $3$ and $4$ have two
	  neighbors, $4$ is randomly chosen as tie breaker;
	+ In the sixth iteration, the choice is among $(1, 3)$, the
	  neighbors of $4$. None of them is marked, so the choice is done
	  based on neighborhood length: since both $1$ and $3$ have two
	  neighbors, $3$ is randomly chosen as tie breaker;
	+ In the seventh iteration, the choice is $1$, since it's the only
	  allele left.

	Which means that the resulting individual is $C = (6, 5, 2, 7, 4, 3, 1)$.
]

The precedence rules for the choice of the next allele guarantees that,
whenever possible, an allele present in the neighborhood of both parents
are favoured. Alleles with short neighbor lists are preferred over alleles
with long neighbor list in order to delay the use of the two remaining
choices as long as possible. The rationale is very simple: short neighbor
lists run a higher risk of becoming empty due to allele selections, so one
should choose from them earlier than from longer lists. Introducing new
edges is discouraged since the principle of small improvements is lost.

Crossover operators can be extended from two parents to three or more
parents. One such operator is *diagonal crossover*, that can be understood
as a generalization of one-point crossover. Given a set of $k$ parents,
arranged in some order, $k - 1$ distinct cutoff points are chosen. Then,
each $i$-th section of the chromosome is shifted cyclically across the
chromosomes. That is, for each chromosome: the first section is not shifted
(shifted to itself), the second section is shifted to the next chromosome,
the third section is shifted to the next next chromosome, ecc...

As stated already, recombination operators merge the traits of two
individuals into one, obtaining a new potential solution for exploring
the search space. However, they cannot create alleles that are not present
in either parents (that's why mutation operators are used). Therefore,
they can be used effectively on their own only if the starting population
has sufficient genetic diversity to ensure that as much of the search space
can be covered without introducing new alleles but just by combining the
existing ones.

There are, however, recombination operators that combine the traits of the
parents in such a way that the resulting individual, even though having a
genotype determined by its parents, possesses new alleles that neither
parent had. An example of such an operator is *interpolating recombination*,
which blends alleles of the parents with a randomly chosen mixing parameter.
A more concrete example for chromosomes that are real-valued arrays is
*arithmetic crossover*, which can be seen as interpolating between the
$n$-dimensional points that are represented by the parent chromosomes.

#algo(
	title: "Arithmetic-Crossover",
	parameters: ([$S_(1), S_(2)$: arrays of real numbers],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$R <-$ empty array \
		$u <-$ a random value sampled from $U ~ (0, 1)$ \
		for $i = 1$ to $abs(S_(1))$ #i \
			$R_(i) <- u dot S_(2, i) + (1 - u) dot S_(1, i)$ \
	]
)

It should be noted that abusing such blending operators might result in a
loss of genetic diversity, since they tend to "even out" the differences
and converge to a genetic mean value (the so-called *Jenkins nightmare*).
Therefore, arithmetic crossover should be balanced by a mutation operator
that ensures genetic diversity.
