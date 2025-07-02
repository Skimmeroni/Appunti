#import "../AI_definitions.typ": *

Evolutionary algorithms, despite their promising results, are
computationally expensive, since at each iteration they have
to handle not just one solution, but entire populations of
considerable size. This downside can be mitigated to some extent
by parallelization, meaning that on the computer the inner workings
of each step (selection, mutation, crossover) are run in parallel
on different processors. Of course, it is not possible to run the
three steps themselves in parallel, since they depend on each other.

Creating the initial population is a trivially-parallelizable task,
since each individual is randomly generated independently of each
other. Computing the fitness of individuals is also trivially-parallelizable
for the same reason. Genetic operators are trivially-parallelizable too,
not just those that involve a single parent (one-bit-mutation, ecc...),
but also those that involve two or more parents, since the original parent
is discarded and no race condition arises.

The same cannot be said for selection, since most selection methods rely
either on the relative fitness of members of the population (roulette-wheel
selection) or on their ranking by absolute fitness (rank-based selection):
in both cases, these are not trivially-parallelizable tasks, since the
partial computations of the parallel branches have to be combined by a
central agent. However, after carrying out this initial task, the selection
itself is trivially-parallelizable. Expected value model and elitism are much
worse, since they take into account the entire population as a whole, making
the selection itself not trivially-parallelizable. Tournament selection, on
the other hand, is trivially parallelizable in its entirety, since each
tournament is independent of the others, making it an appealing choice.

Some termination criteria can be trivially-parallelized. For example,
the criterion "stop after a given number of iterations" is not problematic.
However, criteria such as "stop when the fitness of an individual has reached
a boundary" or "stop when the improvement from the previous generation is
negligible" are not, since in both cases the fitnesses of each parallelized
run have to be merged to be inspected by a central agent.

Even though some selection criteria can be troublesome to be parallelized,
it's still possible to "mimic" parallelization simply by running the
algorithm with many populations at the same time (each on its dedicated
processor). As a matter of fact, aside for the improvement in execution
time, this is no different than running the same algorithm many times.
Drawing on an obvious analogy from nature, each population can be seen
as inhabiting an island, which explains the name *island model* for such
an architecture.

The island model can yield much more than this, however. Instead of just
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

Cellular evolutionary algorithms are a form of parallelization that is
also called “isolation by distance.” They work with a large number of
(virtual) processors, each of which handles a single individual (or
only a small number of individuals). The processors are arranged in
a rectangular grid, usually in the shape of a torus in order to avoid
boundary effects. Selection and crossover are restricted to adjacent
processor, that is, to processors that are connected by an edge of the
grid. Selection means that a processor chooses the best chromosome of
the (four) processors adjacent to it (or one of these chromosomes randomly
based on their fitness). The processor then performs crossover of the
selected chromosome with its own. The better child resulting from such
a crossover replaces the chromosome of the processor (local elite principle).
A processor may also mutate its chromosome, the result of which, however,
replaces the old chromosome only if it is better (local elite principle
again). In such an architecture, groups of adjacent processors are created
that maintain similar chromosomes. This mitigates the usually destructive
effect of crossover.
