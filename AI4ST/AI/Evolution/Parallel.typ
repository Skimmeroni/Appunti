#import "../AI_definitions.typ": *

=== Parallelizing creation, selection and mutation

Evolutionary algorithms, despite their promising results, are
computationally expensive, since at each iteration they have
to handle not just one solution, but entire populations of
considerable size. Hence, to have them being useful, it is
mandatory to address the problem of high computational cost.

Unlike neural networks, where the GPU could be exploited to offload
part of the calculations, with evolutionary algorithms this is hardly
of any help. This is because GPUs are optimized for operations such
as weighted sums and convolutions, which coincidentally are used both
for rendering and for neural network training. On the other hand,
evolutionary algorithms require much more sofisticated computations.

Slow execution time can be mitigated to some extent by parallelization,
meaning that on the computer the inner workings of each step (selection,
mutation, crossover) are run in parallel on different processors. Of
course, it is not possible to run the three steps themselves in parallel,
since they depend on each other.

Creating the initial population is a trivially-parallelizable task,
since each individual is randomly generated independently of each
other. There could be an issue of overrepresentation, since if each
parallel computation generates a subset of the population independently
of the others, the same individual may appear in more than one subset,
giving them an edge. However, if the population is very large, this is
hardly relevant. Also, since creating the initial population is done
only once, introducing extra checks to ensure that no duplicated individuals
is most-likely an over-engineered solution.

Computing the fitness of individuals is also trivially-parallelizable
for the same reason. Genetic operators are trivially-parallelizable too,
not just those that involve a single parent (one-bit-mutation, ecc...),
but also those that involve two or more parents, since the original parent
is discarded and no race condition arises.

The same cannot be said for selection. This is because most selection
methods rely on the relative fitness of the population, which to be
computed requires the absolutive fitness of the entire population.
Selection methods such as roulette-wheel selection and rank-based
selection can be parallelized after the relative fitness is computed
(in a non-parallel way), since each extraction can be done independently
of the others.

Expected value model and elitism are much harder to parallelize, since
the selection process itself has to take into account the entire population.
A compromise solution consists in partitioning the population and sorting
each partition in a different parallel unit; the result of each partial
sorting is then itself sorted by a central unit. In any case, both selection
methods cannot be trivially-parallelizable in any way.

Tournament selection, on the other hand, is trivially parallelizable
in its entirety, since each tournament can be carried out independently
of the others. For this reason, many real-world implementations of
evolutionary algorithms use tournament selection as selection method.

Some termination criteria can be trivially-parallelized. For example,
the criterion "stop after a given number of iterations" is not problematic.
However, criteria such as "stop when the fitness of an individual has reached
a boundary" or "stop when the improvement from the previous generation is
negligible" are not, since in both cases the fitnesses of each parallelized
run have to be merged to be inspected by a central agent.

=== The island model

Even though some selection criteria can be troublesome to be parallelized,
this does not mean that they have no use. Indeed, some selection methods
are better suited than others depending on the problem at hand. Also, it's
still possible to "mimic" parallelization simply by running the evolutionary
algorithm with many populations at the same time, each on its dedicated
processor, then merging the results selecting the best individual among
all populations. Each population can be thought of as inhabiting its own
"island", which explains the name *island model* for such an architecture.

Running many instances of the algorithm at the same time is the simplest
form of island model, also called *pure island model*. As a matter of fact,
aside for the performance improvement, this is conceptually no different
than running the same algorithm many times in a serial fashion. Also,
running many instances of the algorithm with smaller population sizes
actually yields worse performance than running the algorithm just once
but with a larger population size.

The island model can be extended much further, however. Instead of just
having the islands as separate and independent instances of the algorithm,
a variant of the island model suggests transfering individuals from one
island to another every $k$ iterations (with $k$ tunable parameter). Again
drawing on an obvious analogy from nature, such an approach is commonly
called *migration*. Migration allows for the increase in genetic variety
of the islands, since they will most likely be different from each other,
leading to a better collective exploration of the search space.

Regarding the method used to choose which islands should have a migration,
the simplest one is the *random model*, where any too islands are choosen
at random, no matter their characteristic. A more restrictive approach is
the *network model*, where islands are arranged in a graph or a lattice,
usually in a squared or hexagonal grid, and migration happens only between
two neighboring islands. A completely different model is the *contest model*,
where islands do not cooperate transfering individuals but instead compete:
each island has its own choice of parameters for the algorithms, and the
population of each island is either increased or decreased every $k$
iterations based on the average fitness of their individuals. It is
advisable to introduce a lower bound on the island's size, so that an
island cannot become empty.

=== Cellular evolutionary algorithms

Related to the island model, *cellular evolutionary algorithms* (*cEAs*)
are a form of parallelization that is also called "isolation by distance".
cEAs work with a large number of (virtual) processors, each handling a
single individual (or a small number of individuals). The processors are
arranged in a rectangular grid, usually in the shape of a torus in order
to avoid boundary effects. Selection and crossover can happen only between
neighbors, that is, with processors connected by an edge of the grid.
Selection means that a processor chooses the best chromosome of the (four)
processors adjacent to it (or one of these chromosomes randomly based on
their fitness). The processor then performs crossover of the selected
chromosome with its own. The better child resulting from such a crossover
replaces the chromosome of the processor (local elite principle). A processor
may also mutate its chromosome, the result of which, however, replaces the
old chromosome only if it is better (local elite principle again). In such
an architecture, groups of adjacent processors are created that maintain
similar chromosomes. This mitigates the usually destructive effect of
crossover.
