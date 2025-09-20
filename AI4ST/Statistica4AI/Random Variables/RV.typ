#import "../Stats4AI_definitions.typ": *

Approaching experiments by constructing a model that operates case
by case (tossing a coin, rolling a dice, drawing a card, ecc...)
is insufficient if the goal is to put probability theory on solid
grounds. What is needed is to _abstract_ the modeling aspects in
such a way that they are applicable everywhere.

Instead of referring to the possible outcomes of an experiment as
they are, a better way is to map each outcome (each simple event)
to a number with a fixed mapping rule. For a given sample space
$cal(S)$, any mapping from $cal(S)$ to $RR$ is called a *random
variable*. The name "random variable" highlights two aspects: it's
a "variable" because different numerical values are possible, but
it's also "random" because the observed value depends on which of
the possible experimental outcomes results.

Random variables are generally denoted with uppercase letters. For
a given sample space $cal(S)$ and an event $s in cal(S)$, let $X :
cal(S) mapsto RR$ be a random variable. The real number that is
mapped by $X$ to $s$ is $X(s)$. $X$ may not be injective, meaning
that more than one event can be mapped to the same number. For any
random variable $X$, the set of possible values that $X$ can return
(its image) is also called its *support*, denoted as $D(X)$.

Like events, it's possible to assign probabilities to random
variables: the probability assigned to a certain mapping $X(s)$
with $s in cal(S)$ is just the probability assigned to $s$,
meaning that $P(X(s)) = P(s)$. With a slight abuse of notation,
it is much more common to write $P(X(s))$ as $P(X = X(s))$,
emphasising the value returned by the variable rather than the
outcome of the experiment which resulted in said value.

#exercise[
	Consider an experiment consisting in tossing three coins. Construct a
	random variable that maps each outcome to the number of heads appearing
	in that outcome.
] <Random-variables>
#solution[
	The sample space of the experiment is (referring to @Experiments):

	$ cal(S) = {T T T, T T H, T H T, H T T, T H H, H H T, H T H, H H H} $

	The number of heads in each possible outcome is $0$, $1$, $2$ or $3$.
	These are captured by the following events:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ "Zero heads"  &= {T T T} \
		   "One head"    &= {T T H, T H T, H T T} $],
		[$ "Two heads"   &= {T H H, H H T, H T H} \
		   "Three heads" &= {H H H} $]
	)

	Let $X$ be the random variable that maps each possible event to a
	number, counting the number of heads in such outcome. The support
	of $X$ is $D(X) = {0, 1, 2, 3}$. Since $cal(S)$ is discrete, the
	mappings described by $X$ can be enumerated:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ X(T T T) &= 0 \
		   X(T T H) &= X(T H T) = X(H T T) = 1 $],
		[$ X(T H H) &= X(H H T) = X(H T H) = 2 \
		   X(H H H) &= 3 $]
	)

	Probabilities are assigned by invoking the Principle of Indifference:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ P(X = 0) &= P({T T T}) = frac(1, 8) \
		   P(X = 1) &= P({T T H, T H T, H T T}) = frac(3, 8) $],
		[$ P(X = 2) &= P({T H H, H H T, H T H}) = frac(3, 8) \
		   P(X = 3) &= P({H H H}) = frac(1, 8) $]
	)
]

Random variables fall in two broader categories: *discrete* and *continuous*.
A random variable is said to be discrete if the set of values it can assume
is either finite or countably infinite. A random variable is said to be
continuous if the two following properties apply:

+ Its set of possible values consists either of all numbers in a
  single (possibly infinite) interval on the real line or all numbers
  in a disjoint union of such intervals;
+ The probability of the random variable to assume a specific value is
  always zero.
