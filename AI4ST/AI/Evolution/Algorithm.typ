#import "../AI_definitions.typ": *

*Metaheuristics* are computational techniques typically used to
solve numerical and combinatorial optimization problems with a 
satisfactory degree of approximation. They are often employed
where an analytical solution is either impossible or impractical
to compute. These techiques are very general, offering a blueprint
that has to be adapted to the specific problem at hand. Aside from
the fact that all such algorithms apply some form of guided search,
their methodologies and inspirations vary greatly.

The oldest and widely employed form of metaheuristics is *evolutionary
computing*. Evolutionary computing seeks to solve optimization problems
constructing algorithms, called *evolutionary algorithms*, that draw
inspiration from nature-driven and biological processes, *biological
evolution* in particular. Biological evolution explains why the living
beings on Earth look as they do and where do they come from.

The existence of biological evolution is the result of the *Theory of
Evolution* by Charles Darwin. The most important underpinning of the
Theory is the presence in nature of a "driving force", *natural selection*:
with respect to a given environment, one or more traits that can appear
randomly in species may be favoured or disfavoured by natural selection.
Species with favoured traits tend to thrive and reproduce, passing the
acquired traits onto their offspring, whereas species with unfavoured
traits tend to die out.

New or modified traits may be created by various processes. It can happen
by chance in a single individual, for example from exposure to radiation
or from an error in DNA duplication. It can also happen during reproduction,
where the offspring inherits half set of chromosomes from each parent,
therefore creating a new unique combination of traits. It can also happen
during the *meiosis* process, when *crossing over* recombines homologous
chromosomes.

The improvements carried out by these modification may vary: allowing an
individual to find more and/or better food, better fend off predators,
increase its reproductive capabilities, ecc... It should be noted, that
such modified traits are not beneficial or harmful in themselves, only
with respect to the environment in which species live. A desirable trait
in one environment might turn out to be a setback in a different one.

The vast majority of random (genetic) modifications are actually harmful
for the individual, either limiting its capabilities or even making it
unfit to live. Each variation is immediately put to the test with respect
to an environment and only the beneficial ones, a very tiny proportion,
is kept. This is why biological evolution is so slow: most modifications
are detrimental and become lost in time. To observe a substantial change,
many small improvements have to accumulate over many generations.

A more detailed list of the principles underpinning the Theory of
Evolution is the following:

- *Diversity*: all forms of life, even organisms of the same species,
  differ from each other, both genetically and physically. Nevertheless,
  the currently existing life forms are only a tiny fraction of the
  theoretically possible ones;
- *Variation*: mutation and genetic recombination continuously create
  new variants. These can result in a new combination of already existing
  traits or may introduce a new trait that has never been seen before;
- *Inheritance*: genetic variations are passed onto the offspring,
  physical variations are not;
- *Speciation*: a new species if formed when two or more subgroups of
  life forms from the same species have acquired so many cumulated
  variations that cannot crossbreed anymore;
- *Birth surplus/Overproduction*: (nearly) all life forms produce more
  offspring than can ever become mature enough to procreate themselves.
  That is, quantity is often favoured over quality;
- *Natural Selection*: on average, the survivors of a population exhibit
  such hereditary variations which increase their adaptation to the local
  environment;
- *Randomness/Blind Variation*: variations are random, both in cause and
  in intent. No variation is preprogrammed to "push" evolution in one
  direction;
- *Gradualism*: variations happen in small steps, thus appreciable changes
  are gradual and very slow;
- *Evolution/Transmutation/Inheritance with Modification*: having to adapt
  to the environment, species are not immutable, evolving instead in the
  course of time;
- *Discrete Genetic Units*: the genetic information is stored in continuous
  units, but in discrete ones, the genes;
- *Opportunism*: the evolution process builds upon the living beings as
  they are in the present, cannot create variations out of nothing;
- *Evolution-strategic Principles*: not just organisms are optimized for
  their environment, but also the _mechanisms_ of evolution itself, such
  as reproduction rates, mortality rates, life spans, evolutionary speed,
  etc... become optimized;
- *Ecological Niches*: species that compete with each other can avoid coming
  into conflict only if they occupy different ecological niches. Otherwise,
  one would prevail over the others;
- *Irreversibility*: the course of evolution is irreversible. That is, a
  species cannot "evolve backwards";
- *Unpredictability*: the evolution process has no direction and no
  purpose, therefore it cannot be predicted;
- *Increasing Complexity*: biological evolution has led to increasingly
  more complex living beings, from cells to animals, over bilions of
  years of small changes.

The idea behind evolutionary algorithms is therefore to encode an
optimization problem as a simulated evolutionary process. That is,
representing the possible solutions as if they were living beings
in a certain environment, and the desireable traits are those that
represent an optimal solution. As biological evolution favours
individuals fit for an environment, simulated evolution should
favour solutions that are closer to an optimum.

To construct such an encoding, it is first necessary to introduce
some terminology. Terms borrowed by biology ought to be translated
into their computer science counterpart.

*Individual* is the term used in biology to refer to a single living
being of a given species. Individuals have a higher or lesser degree
of adaptation to their environment and are subject to natural selection.
In computer science, an individual corresponds to a potential solution
to the given optimization problem.

A *chromosome* is a string of DNA enveloped in proteins, that stores
the genetic information of an individual, its "blueprint" that encodes
its traits. In computer science, a chromosome would be the information
related to a certain solution, stored as bits. Note that most living
organisms don't have a single chromosome. Instead, they have more than
one chromosome, and the genetic information is distributed (unequally)
among them. Moreover, each chromosome exists in two copies for each
individual, one inherited from each parent. In computer science there
is no need to model this aspect #footnote[This wouldn't be the case if
the intent was to model an actual, really existing organism.], and all
genetic information can be packed in a single chromosome.

A *gene* is the fundamental unit of inheritance as it determines (a part
of) a trait or characteristic of an individual. The location of a gene in
a DNA strand, called *locus* is (almost) fixed, meaning that it's (almost)
possible to refer to a genetic trait with respect to a position on the
strand. In computer science, a gene is one of the properties of a solution.

The possible ways or modes in which a gene can exist are called *alleles*.
In computer science, an allele is one of the possible choice of values that
can be made for a given property. Note that, in biology, each individual
actually has two alleles, one for each chromosome in a pair. Again, in
computer science there is no need to model this aspect, and each individual
is assumed to have a single allele for each gene.

The *genotype* is the genetic configuration of an organism, which alleles
are present for each of its genes, whereas the *phenotype* is the physical
appearance of an organism, the way the genotype manifests itself. Since
it's the phenotype that actually interacts with the environment, not the
genotype, it's the phenotype that determines how much an individual is
adapted to their environment. In computer science, the genotype corresponds
to the way a potential solution is encoded, while whereas the phenotype is
the implementation or application of a candidate solution, from which the
fitness of the corresponding individual can be read.

A *population* is a set of individuals, usually understood to be of the
same species. A *generation* is a "snapshot" of a population at a certain
point in time. In computer science, a population is a _multiset_ (a set
where elements can appear more than once) of individuals, and a generation
is the population at a given iteration of the algorithm. In biology, no two
individuals from the same population can be an exact genetic copy of one
another #footnote[Not even homozygous twins.], since the number of possible
combinations of genes is too big for this to happen. In computer science,
in general, there is no need to impose this restriction, therefore identical
individuals can coexist.

A new generation is created by *reproduction*, that is, by the generation
of offspring from existing organisms, in which genetic material of the
parent individuals may be recombined. The same holds for computer science,
where a new individual of the population is created by recombining and
shuffling information between individuals. In biology, reproduction occurs
either between two individuals or just one, in computer science it is
possible to have reproduction between more than two individuals.

The *fitness* of an individual is a measure of its degree of adaptation
to the environment, that is, how high its chances of survival and
reproduction are. In biology, a precise and quantifiable definition of
fitness does not exist. In computer science, it's just the value of the
fitness function of the optimization problem at hand when evaluating a
given potential solution.

Summing up, to construct an evolutionary algorithm the following
building blocks are required:

- An encoding that represents potential solutions as individuals. The
  encoding of choice is highly dependent on the problem at hand, and
  there is no one-size fits-all method for doing so;
- A method to create an initial population. Since computer science
  chromosomes are mostly just strings, the initial population is
  often random sequences. If the solution candidates have to satisfy
  certain constraints, a more refined approach might be needed;
- A fitness function that assigns a fitness to each individual. In
  many cases, this is just the evaluation function of the optimization
  problem, but it can also include additional constraints that an
  individual must possess;
- A selection method that simulates natural selection. The selection
  method should assign greater odds of reproducting to individuals
  with higher fitness and smaller odds to individual with lower
  fitness. In the most straightforward case, this means assigning a
  probability of reproducing to each individual that is proportional
  to their fitness; 
- A set of operators that create new individuals from the existing
  ones, simulating reproduction and genetic mutation. For example,
  randomly changing a gene in each individual with a different allele
  or merging part of the genotype of two individuals into a new
  individual;
- A termination criterion, to prevent the algorithm from continuing
  indefinitely. For example, stopping the algorithm after a fixed
  amount of maximum iterations. This is necessary because, by definition,
  it's not possible to solve an optimization problem with guided search
  with perfect accuracy, and an error bound has to be set;
- Values for various tunable parameters, like for example the number of
  individuals in the population, or maximum number of iterations.

A generic evolutionary algorithm can be written as such:

#pseudocode(
	title: "Generic-evolutionary-algorithm",
	parameters: ([$epsilon$],),
	content: [
		$t <- 0$ #comment[Starting time] \
		#smallcaps[initialize] (pop($t$)) #comment[Create the initial population] \
		#smallcaps[evaluate] (pop($t$)) #comment[Compute fitness] \
		while (not($epsilon$)) #i \
			$t <- t + 1$ \
			pop($t$) $<-$ #smallcaps[select-from] (pop($t − 1$)) #comment[Select individuals based on fitness] \
			#smallcaps[alter] (pop($t$)) #comment[Apply genetic operators] \
			#smallcaps[evaluate] (pop($t$)) #comment[Evaluate the new population] #d \
	]
)

After having created an initial population of solution candidates,
each individual is evaluated. A new generation is created by selecting
individuals based on their fitness, and then entirely new individuals
are created by mutating existing individuals or having two or more
individuals "reproduce". Each individual in the new population is
evaluated, and the process is repeated. The algorithm stops when
the chosen termination criterion $epsilon$ is fulfilled.
