#import "../Stats4AI_definitions.typ": *

Kolmogorov axioms define the properties of probability but do not offer
a method for assigning them to events. The simplest approaches, such as
assigning the same probability to each event, are far to weak to model
reality. Also, the sample space and the events are different from experiment
to experiment, making it hard to generalize a coherent theory of probability.
A more powerful concept to be introduced which can help model probability is
the *random variable*.

A random variable can be conceived as a mapping from the sample space
to the real line. In other words, a random variable is a function that
assigns a probability to any possible event of the sample space. Given
a sample space $cal(S)$, a random variable $X$ for such sample space is
defined as $X : cal(S) |-> RR$, and the probability of such variable
to assume a certain value $x$ of the sample space, called its *realization*,
is denoted as $P(X = x)$.

#exercise[
	Suppose a real estate investment has been carried out, and there are
	three apartments of different value ready to be sold. Assuming that
	the probability of selling one, two or three of those is the same,
	model this situation using a random variable.
]
#solution[
	It is possible to model this scenario using a random variable $X$, whose
	realizations correspond to which and how many apartments were sold. Each
	realization can be conceived as a triple $(a_(1), a_(2), a_(3))$, where
	each $a_(i)$ has value $1$ if the $i$-th apartment was sold and $0$
	otherwise:

	$ Omega = {(0, 0, 0), (0, 0, 1), (0, 1, 0), (0, 1, 1), (1, 0, 0),
	  (1, 0, 1), (1, 1, 0), (1, 1, 1)} $

	The realizations of $X$ correspond to the events with a matching
	number of $1$s. To each value of $X$ is then possible to assign a
	value of probability by equally dividing the total probability among
	the events, such that $P(Omega) = 1$.

	#grid(
		columns: (0.45fr, 0.55fr),
		[$ X(0, 0, 0) &= 0 \
		   X(0, 0, 1) &= X(1, 0, 0) = X(0, 1, 0) = 1 \
		   X(1, 1, 0) &= X(0, 1, 1) = X(1, 0, 1) = 2 \
		   X(1, 1, 1) &= 3 $],
		[$ P(X = 0) &= P({(0, 0, 0)}) = 12.5 percent \
		   P(X = 1) &= P({(0, 0, 1), (1, 0, 0), (0, 1, 0)}) = 37.5 percent \
		   P(X = 2) &= P({(1, 1, 0), (0, 1, 1), (1, 0, 1)}) = 37.5 percent \
		   P(X = 3) &= P({(1, 1, 1)}) = 12.5 percent $]
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

The set of values that a random variable can assume is called its *support*.
