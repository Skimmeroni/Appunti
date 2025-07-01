#import "../AI_definitions.typ": *

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
