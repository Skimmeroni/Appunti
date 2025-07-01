#import "../AI_definitions.typ": *

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
