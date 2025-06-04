#import "../AI_definitions.typ": *

*Metaheuristics* are a computational framework of techniques and practices
used to solve optimization problems. Instead of finding an exact, analytical
solution in a single step, which may be impossible or computationally
expensive, metaheuristics allows one to find a "sufficiently good"
approximated solution through several iterations, where at each step a
candidate solution is refined. Since metaheuristics does not prescribe a
fixed set of operations, to make use of it it is crucial to properly map
the problem at hand to the abstract structures provided by the metaheuristic.

An example of metaheuristics is *evolutionary computing*, solving optimization
problems constructing algorithms, called *evolutionary algorithms*, that draw
inspiration from nature-driven and biological processes, in particular the
Theory of Evolution.

The major underpinning of biological evolution is the presence in nature of
a "driving force", *natural selection*: with respect to a given environment,
one or more traits that can appear randomly in species may be favoured or
disfavoured by natural selection. Species with favoured traits tend to thrive
and reproduce, passing the acquired traits onto their offspring, whereas
species with unfavoured traits tend to die out.

New or modified traits may be created by various processes. It can happen
by chance in a single individual, for example from exposure to radiation
or from an error in DNA duplication, but also often happens during
reproduction, where the offspring inherits half set of chromosomes from
each parent, therefore creating a new unique combination of traits, and
during the meiosis process, when crossing over recombines homologous
chromosomes.

The improvements carried out by these modification may vary: allowing an
individual to find more and/or better food, better fend off predators,
increase its reproductive capabilities, ecc... It should be noted, however,
that such modified traits are not beneficial or harmful in themselves, but
only with respect to the environment in which species live. A desirable
trait in one environment might turn out to be a burden in a different one.

Biological evolution is an incredibly slow process: each variation is
immediately put to the test with respect to an environment and only the
beneficial variations are kept and extended. However, the vast majority
of random (genetic) modifications are harmful for the individual, either
limiting its capabilities or even making it unfit to live, and these get
lost in time. Only a very slim portion of the changes are actually
beneficial; small improvements can accumulate over many generations,
leading to surprising complexity and strikingly fitting adaptations (to
a specific environment).

Variation (mutation and recombination) and selection are the core
principles of biological evolution, but an in-depth analysis reveal
many more nuances. A more detailed list of principles of evolution,
useful to be taken into account when drawing inspiration for evolutionary
algorithms, is the following:

- *Diversity*:
	All forms of life, even organisms of the same species, differ from
	each other, both genetically and physically. Nevertheless, the currently
	actually existing life forms are only a tiny fraction of the theoretically
	possible ones;
- *Variation*:
	Mutation and genetic recombination continuously create new variants,
	that may result in a new combination of already existing traits or
	may introduce a modified, never seen trait altogether;
- *Inheritance*:
	Genetic variations are passed onto the offspring, whereas physical
	variations are not;
- *Speciation*:
	A new species if formed when two or more population subgroups coming
	from the same species acquired so many cumulated variations that cannot
	crossbreed anymore;
- *Birth surplus/Overproduction*:
	Nearly all life forms produce more offspring than can ever become
	mature enough to procreate themselves;
- *Natural Selection*:
	On average, the survivors of a population exhibit such hereditary
	variations which increase their adaptation to the local environment;
- *Randomness/Blind Variation*:
	Variations are random, both in cause and in intent. That is, variations
	are not preprogrammed to "push" evolution in one direction;
- *Gradualism*:
	Variations happen in small steps, thus phylogenetic changes are gradual
	and relatively slow;
- *Evolution/Transmutation/Inheritance with Modification*:
	Due to the adaptation to the environment, species are not immutable,
	evolving instead in the course of time;
- *Discrete Genetic Units*:
	The genetic information is stored in discrete units, the genes, not in
	a continuous fashion;
- *Opportunism*:
	The evolution process builds upon the living beings as they are in the
	present, does not create variations out of anything, only out of what
	the species possess;
- *Evolution-strategic Principles*:
	Not only organisms are optimized for their environment, but also the
	_mechanisms_ of evolution itself, such as reproduction rates, mortality
	rates, life spans, evolutionary speed, etc...;
- *Ecological Niches*:
	Species that compete with each other can avoid coming into conflict only
	if they occupy different ecological niches, otherwise one would prevail
	over all others;
- *Irreversibility*:
	The course of evolution is irreversible, that is, a species cannot go
	"evolve backwards";
- *Unpredictability*:
	The course of evolution has no direction and no purpose, therefore it
	cannot be predicted;
- *Increasing Complexity*:
	Biological evolution has led to increasingly more complex living beings,
	from cells to animals, over bilions of years of small changes.

The problem of having a species adapt to an environment can be conceived
as an optimization problem: "tuning" the characteristics of a species in
order to "optimize" them for a specific environment, finding a solution
that, even though not the best, is certainly satisfactory. The same
approach is what evolutionary computing seeks to apply to the solution
of numerical optimization problems.

Formally speaking, an *optimization problem* is a pair $(Omega, f)$.
$Omega$ is a set called *search space* that contains all the potential
solutions (the "candidates") whereas $f: Omega mapsto RR$ is a function
called *evaluation function*, that assigns a (real) number to each
potential solution $omega in Omega$, representing "how good" said
solution is. The "best" solutions, also called *exact solutions*,
are those that return the highest value for the evaluation function.

An element $omega^(*) in Omega$ is an exact of the optimization problem
$(Omega, f)$ if and only if it is an *optimum*, either a minimum ($forall
omega in Omega, f(omega^(*)) lt.eq f(omega)$) or a maximum ($forall omega
in Omega, f(omega^(*)) gt.eq f(omega)$). Exact solutions can be more than
one: in that case, one of them can be chosen arbitrarely. Also note that
the search space is, in general, not the entire set of real numbers, but
a subset of reals that satisfy some conditions, or *constraints*.

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

Optimization problems are ubiquitous in fields where the goal is to
maximize the efficiency/performance/return of a process, such as routing
problems (_Travelling Salesman Problem_), packing problems (_Knapsack
problem_), or scheduling problems (such as air traffic or job scheduling).
The approaches to solve them fall into four broad categories:

- *Analytical Solution*: finding the optimum of the evaluation function
  by computing it directly, such as zeroing the gradient, employs Lagrange
  multipliers, a KKT system, ecc... If a problem can be solved this way,
  it is advisable to do so, since the obtained solution is guaranteed to
  be actually optimal (and not an approximation). However, many problems
  cannot be solved analitically, for example because it's not possible
  to zero the gradient (if the degree of the equation is too high) or
  because the problem is NP-hard, and therefore too computational expensive;
- *Complete/Exhaustive Exploration*: finding the optimum of the evaluation
  function by trying every possible solution in the search space. Even
  though the approach is technically correct, since out of all the possible
  solutions there has to be one or more better than the others, if the
  search space is too big the approach quickly becomes inefficient. Also,
  if the search space is not discrete, the approach cannot be applied at
  all;
- *(Blind) Random Search*: finding the optimum of the evaluation function
  by trying random values of the search space, keeping track of the best
  solution found so far, and stopping when a sufficiently satisfactory
  solution is found or when a given number of attempts is reached. The
  approach is hardly promising;
- *Guided (Random) Search*: finding the optimum of the evaluation
  function by exploit the structure of the search space and how the
  evaluation function assesses similar elements to control the search.
  The idea is to notice if it's possible to search for solutions in
  the search space not at random, but "steering" the search into
  promising directions and pruning directions that aren't worthwile.
  Of course, for this to be possible, the evaluation of similar elements
  of the search space must be similar.

Evolutionary computing, and metaheuristics in general, falls into the
last category. To make good use of evolutionary computing technique,
it is important to state how biological terms are translated into
computer science.

An *individual*, which is a living organism in biology, corresponds to a
candidate solution in computer science. Individuals are the entities to
which a fitness is assigned and which are subject to the (natural)
selection process.

A *chromosome* is, in biology, a string of DNA enveloped in proteins,
that stores the genetic information of an individual, its "blueprint",
that encodes its traits. In computer science, its counterpart would be
information stored in bits. Note that most living organisms have several
chromosomes, among whose information is (unequally) distributed; in
computer science, there is no need to model this aspect, and all genetic
information can be combined in a single chromosome.

A *gene* is the fundamental unit of inheritance as it determines (a part
of) a trait or characteristic of an individual. The possible ways in which
a gene can exist are called *alleles*; each individual has exactly one
allele (that is, one mode of existing) for each gene. The location of a
gene in a DNA strand, called *locus* is (pretty much) fixed, meaning that
it's (almost) possible to refer to a genetic trait with respect to its
position on the strand. In computer science, an allele is simply the value
of a computational object, which selects one of several possible properties
of a solution candidate that the gene stands for.

In biology, the *genotype* is the genetic configuration of an organism,
which alleles are present for each of its genes (or, at least, the ones
of interest), whereas the *phenotype* is the physical appearance of an
organism, the way the genotype manifests itself. Note that the phenotype
is what interacts with the environment, hence it's the phenotype, and not
the genotype, that actually determines the fitness of the individual, even
though the genotype is still a latent influence, since it determines the
phenotype. In computer science, the genotype corresponds to the encoding
of a candidate solution, whereas the phenotype is the implementation or
application of a candidate solution, from which the fitness of the
corresponding individual can be read.

A *population* is a simple set of individuals, usually of the same species;
a *generation* is the population at a certain point in time. In biology,
no two individuals from the same population can be an exact genetic copy
of one another (not even homozygous twins), since the number of possible
combinations of genes is too big for this to happen. In computer science,
however, the number of genes is limited to a small subset of interest,
therefore identical individuals can (co)exist. As a consequence, a population
of an evolutionary algorithm is a _multiset_ (a set where the elements can
appear more than once) of individuals.

A new generation is created by *reproduction*, that is, by the generation
of offspring from one or more (usually two) organisms, in which genetic
material of the parent individuals may be recombined. The same holds for
computer science, only that the child creation process works directly on
the chromosomes and that the number of parents may exceed two.

The *fitness* of an individual measures how high its chances of survival
and reproduction are due to its adaptation to its environment. The quality
of a biological organism with respect to its environment is difficult to
assess objectively. Simply defining fitness as "the ability of an individual
to survive" would just move the goalpost: a formally more precise and
quantifiable definition of fitness would be the number of (average) fertile
offspring of an individual. In computer science, the fitness is much easier
to quantify, since the optimization problem provides a fitness function with
which solution candidates are to be evaluated.
