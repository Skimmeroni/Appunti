#import "../AI_definitions.typ": *

A particular framework for solving optimization problems that falls
into the guided search category is *Metaheuristics*. An example of
metaheuristics is *evolutionary computing*: solving optimization problems
constructing algorithms, called *evolutionary algorithms*, that draw
inspiration from nature-driven and biological processes, in particular
the Theory of Evolution. The Theory explains why the living beings on
Earth look as they do and where do they come from.

The major underpinning of the Theory of Evolution is the presence in
nature of a "driving force", *natural selection*: with respect to a
given environment, one or more traits that can appear randomly in species
may be favoured or disfavoured by natural selection. Species with favoured
traits tend to thrive and reproduce, passing the acquired traits onto their
offspring, whereas species with unfavoured traits tend to die out.

New or modified traits may be created by various processes. It can happen
by chance in a single individual, for example from exposure to radiation
or from an error in DNA duplication, but also often happens during
reproduction, where the offspring inherits half set of chromosomes from
each parent, therefore creating a new unique combination of traits, and
during the *meiosis* process, when crossing over recombines homologous
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
lost in the generations. Only a very slim portion of the changes are
actually beneficial; small improvements can accumulate over many generations,
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

The general idea of an evolutionary algorithm it to employ evolution
principles to generate increasingly better solution candidates for
the optimization problem at hand. Essentially, this entails evolving
a population of solution candidates, selecting the most promising on
each generation on the basis of their adaptation to the environment.
An evolutionary algorithm requires:

- An encoding for the solution candidates;
- A method to create an initial population;
- A fitness function to evaluate the individuals;
- A selection method on the basis of the fitness function;
- A set of genetic operators to modify chromosomes;
- A termination criterion for the search;
- Values for various parameters.

Since the intent is to evolve a population of solution candidates,
it is necessary to find a way of representing them as chromosomes.
That is, it is necessary to encode them, as sequences of computational
objects. Such an encoding may be so direct that the distinction between
genotype and phenotype becomes blurred, or non existent. In other cases
there is a clear distinction between the solution candidate and its
encoding.

In general, the encoding of the solution candidates is highly dependent on
the problem at hand, and there is no one-size fits-all method for doing so.
However, it is important to specify that a wrong encoding might result in
an unusable evolutionary algorithm, therefore the choice of the encoding
must be taken with care.

Once an encoding is chosen, one can create an initial population of solution
candidates in the form of chromosomes representing them. Since chromosomes
are simple sequences of computational objects, an initial population is
commonly created by simply generating random sequences. In some cases, 
especially if the solution candidates have to satisfy certain constraints,
a more refined approach might be needed.

In order to mimic the influence of the environment in biological evolution,
one needs a fitness function with which one can evaluate the individuals
of the created population. In many cases this fitness function is just the
function of optimization problem. However, the fitness function may also
contain additional elements that represent constraints that have to be
satisfied in order for a solution candidate to be acceptable or that
introduce a tendency toward certain additionally desired properties of
a solution.

The natural selection process of biological evolution is simulated by
a method to select candidate solutions according to their fitness. This
method is used to choose the parents of offspring we want to create or
to select those individuals that are transferred to the next generation
without change. Such a selection method may simply transform the fitness
values into a selection probability, such that better individuals have
higher chances of getting chosen for the next generation.

The random variation of chromosomes is simulated by so-called genetic
operators that modify and recombine chromosomes, for example, mutation,
which randomly changes individual genes, and crossing over, which exchanges
parts of the chromosomes of parent individuals to produce offspring.
Depending on the problem and the chosen encoding, the genetic operators
can be very generic or highly problem-specific. The choice of the genetic
operators is another element that effort should be spent on, especially in
connection with the chosen encoding.

Even though real-world evolution never actually stops, the last needed
element for an evolutionary algorithm is a stopping criteria to extract
an optimal (final) solution. Such a criterion might be, for example:
stop after a given number of iterations, stop after the improvement
from one generation to the next is negligible, stop when a user-specified
minimum solution quality has been obtained.

To complete the specification of an evolutionary algorithm, one has
to choose the values of several parameters, such as: the size of the
population to evolve, the fraction of individuals that is chosen from
each population to produce offspring, the probability of a mutation
occurring in an individual, ecc...

A generic evolutionary algorithm can be written as such:

#algo(
	title: "Generic-evolutionary-algorithm",
	parameters: ([$epsilon$: a termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$t <- 0$\
		#smallcaps("Initialize") ($"population"(t)$) #comment[Create the initial population]\
		#smallcaps("Evaluate") ($"population"(t)$) #comment[Compute fitness]\
		while ($epsilon$ = False): #i\
		$t <- t + 1$\
		$"population"(t) <-$ #smallcaps("Select-from") ($"population"(t −1)$) #comment[Select individuals based on fitness]\
		#smallcaps("Alter") ($"population"(t)$) #comment[Apply genetic operators]\
		#smallcaps("Evaluate") ($"population"(t)$) #comment[Evaluate the new population]
	]
)

That is, after having created and evaluated an initial population
of solution candidates (in the form of chromosomes), a sequence of
generations of solution candidates is computed. Each new generation
is created by selecting individuals based on their fitness (higher
fitness means a higher chance of getting selected). Then genetic
operators (like mutation and crossover) are applied to the selected
individuals. Next, the modified population (or at least the new
individuals in it, which have been created by the genetic operators)
is evaluated and the cycle starts over. This process continues until
the chosen termination criterion is fulfilled.

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
