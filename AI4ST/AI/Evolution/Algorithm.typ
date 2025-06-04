#import "../AI_definitions.typ": *

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

An instructive example of a genetic algorithm is the one that solves the
*n-queens problem*. The problem asks to find a way to place on a $n times
n$ chessboard $n$ queens in such a way that they cannot capture each other.
That is, in such a way that no queen shares a row, a column of a diagonal
with another queen. If the number of queens is very small, the problem can
be solved by random search.

#exercise[
	What would be a possible solution for the $5$-queens problem?
]
#solution[
	#grid(
		columns: (0.375fr, 0.625fr),
		[#board(position(
		 "..Q..",
		 "Q....",
		 "...Q.",
		 ".Q...",
		 "....Q",
		))],
		[The search space of the problem, even for the relatively simple
		 case $n = 5$, has cardinality:
		 
		 $ frac(5^(2) !, (5^(2) - 5)! space 5!) =
		   frac(25!, 20! space 5!) =
		   frac(25 times 24 times 23 times 22 times 21, 5 times 4 times 3 times 2 times 1) =
		   53130 $

		 However, it is possible to figure out a possible solution with
		 little effort just by trial and error, such as the one presented
		 on the left.]
	)
]

One possible reasonable approach to solving the problem is employing
a backtracking algorithm, doing an exhaustive exploration on the search
space with a depth-first search. The algorithm exploits the fact that
each row of the chessboard must contain exactly one queen. The idea
is to place queens row by row, checking in every possible square if
this placement obstructs an already placed queen; if this is the case,
or if the recursion to the next row returns with the result that no
solution can be found because obstructions could not be avoided, the
queen is removed again and the algorithm continues with the next square.
If no obstructions are found, the algorithm proceeds recursively to
the next row, and terminates when a queen has been (properly) placed
on each row. The pseudocode is as follows:

#algo(
	title: "N-Queens-Backtrack",
	parameters: ([$n$: integer, $k$: integer, $"board"$: matrix of booleans],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		if ($k gt.eq n$) #i\
			return True #d\
		else #i\
			for $i = 0$ to $n - 1$ do #i\
				$"board"[i, k] <-$ True\
				col $<-$ True\
				for $j = 1$ to $k - 1$ do #i\
					if ($"board"[i, j]$ = False) #i #comment[Another queen in this column]\
						col $<-$ False\
						break #d#d\
				row $<-$ True\
				for $j = 1$ to $min(k, i)$ do #i\
					if ($"board"[i - j, k - j]$ = False) #i\
						row $<-$ False\
						break #d#d\
				diag $<-$ True\
				for $j = 1$ to $min(k, n - i - 1)$ do #i\
					if ($"board"[i + j, k - j]$ = False) #i\
						diag $<-$ False\
						break #d#d\
				rec $<-$ #smallcaps("N-Queens-Backtrack") ($n$, $k + 1$, $"board"$)) #comment[Recursion succeeds] \
				if (row and col and diag and rec) #i\
					return True #d\
				else #i\
					$"board"[i, k] <-$ False #d#d\
			return False\
	]
)

The algorithm can be easily extended to yield all possible solutions
of the problem, not just one solution. However, the approach is very
inefficient; if the interest is in finding just one possible solution
disregarding the others, a better approach is a completely analytical
solution. Given a chessboard size $n$, the algorithm is as follows:

- If $n = 2$ or $n = 3$, the $n$-queens problem has no solution;
- If $n$ is odd, a queen is placed onto the square $(n − 1, n − 1)$
  $n$ is decremented by $1$ and the algorithm is repeated;
- If $n mod 6 != 2$, then the queens in the rows $y = 0, dots,
  frac(n, 2) − 1$ are placed in the columns $x = 2y + 1$ and the
  queens in the rows $y = frac(n, 2), dots, n − 1$ are placed in
  the columns $x = 2y − n$;
- If $n mod 6 = 2$, then the queens in the rows $y = 0, dots,
  frac(n, 2) − 1$ in the columns $x = (2y + frac(n, 2)) mod n$
  and the queens in the rows $y = frac(n, 2), dots, n − 1$ in
  the columns $x = (2y − frac(n, 2) + 2) mod n$.

In order to solve the $n$-queens problem with an evolutionary algorithm,
the first step is writing an encoding of the solution candidates. To
do so, it is possible to exploit (again) the fact that each queen must
be placed on a single row. A candidate solution can be described by a
chromosome having $n$ genes, where each gene refers to one row of the
chessboard (numbered $0$ to $n - 1$). Each gene has $n$ possible alleles
(numbered, again, $0$ to $n - 1$), each representing the position of
the queen on the row.

With this encoding there is a clear distinction between the genotype of
the problem (the array of numbers) and its phenotype (the actual placement
of the queens on the chessboard). Also, assigning a chromosome to each row
has the advantage of excluding candidate solutions with more than one queen
per rank (that aren't valid anyway). As a consequence, the search space
becomes much smaller, and thus can be explored more quickly and more
effectively.

The initial population has no particular requirement (outside having one
queen per row), therefore it can be constructed just as random sequences
of numbers. Each element of the chromosome is therefore assigned a random
number from $0$ to $n - 1$, and a certain number $k$ of chromosomes is
constructed this way.

The fitness function can be constructed by summing all the obstructions
for each queen, dividing the result by $2$ and changing its sign. Clearly,
a solution will have a value of the fitness function equal to $0$, whereas
any other solution will yield a negative value. The division by two is
introduced to remove dupicates, since the obstruction is always symmetric
(if queen $A$ obstructs queen $B$, then queen $B$ also obstructs queen
$A$), whereas the negative sign is introduce in order to have a maximization
problem, instead of a minimization.

The termination criteria for this algorithm is, clearly, having found a
solution whose value of the fitness function is $0$. However, to be more
cautios, it is advisable to also introduce an additional criteria that
stops the algorithm when a sufficient number of generations has been
reached, returning whatever solution has been found (that will be, most
likely, suboptimal).

A possible and widely employed selection method that can be used in
this context would be the *tournament selection*. The idea is to sample
a subset of individuals from the population and then choose the individual
that has the highest value of the fitness function (the one that "wins"
the "tournament"); if there were to be a tie between two individuals, one
of them is chosen at random. The "winning" individual is added to the next
generation of the population, whereas the "losing" individual are shuffled
back in the current population. This process is repeated until the next
generation of the population is complete, which generally just means that
it has reached the same size as the current population.

In order to alter the individuals of the population, it is necessary to
introduce a genetic operator both for recombination and for variation.
The first "shuffles" the genetic traits of the individuals, creating new
individuals possessing a combination of traits that neither of the two
possess, while the second introduces new traits into the population,
traits that no individual might possess.

A choice for the recombination operator is the *one-point crossing-over*,
that mimics the way crossing-over functions during gamete duplication. The
operator, out of a sample of the entire population, chooses two individuals
and then first splits their chromosomes in a random point into two parts,
then exchanges the matching parts of the two chromosomes (first part of
the first with first part of the second, second part of the first with the
second part of the second). This way, two new individuals are created, whose
traits may be better than the traits of their "parents".

A choice for the variation operator is the *standard mutation*, where
to each gene of each individual is assigned a probability of transitioning
into a new random value. Introducing variation is necessary, since
recombination alone would just entail reshuffling the existing traits
over and over, without the possibility of new alleles. Note that both
variation and recombination might result in an individual actually having
lower fitness than before, but this is to be expected, since most real-life
genetic mutations are indeed detrimental.

The last step is to fix the values of several parameters, in particular:
the size of the population to evolve, the maximum number of generations
to compute before terminating, the sample size of the tournaments, the
fraction of individuals that are subject to crossing over and the probability
that a gene is subject to a mutation.
