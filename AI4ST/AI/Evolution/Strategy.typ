#import "../AI_definitions.typ": *

*Evolutionary Strategies* (*ES*) are a subclass of evolutionary algorithms
(and the oldest) that are focused on solving numerical optimization
problems. The chromosomes of an evolutionary strategies are therefore
always arrays of real numbers, and the evaluation function is the function
for which to find an optimum of.

Selection in evolutionary strategies is always carried out by strict
elitism, meaning that only the fittest individuals are transfered to
the next generation (instead of just being _more likely_ to be transfered).
Selection in strict elitism takes two forms: *plus strategy* and *comma
strategy*. In the former, selection is applied considering both the parent
individuals and the offspring individuals; in the latter, selection is
applied considering only the offspring.

Let $mu$ be the parent population size and let $lambda$ be the offspring
population size. Evolution strategues employing plus strategy are often
denoted as $(mu + lambda)$-ES, while those employing comma strategy are
often denoted as $(mu, lambda)$-ES. In both cases, the size of the population
after applying selection is $mu$, therefore $lambda$ has to be at least
equal to $mu$.

Actually, in comma strategy $lambda$ is much (much) greater than $mu$, in
order to guarantee sufficient genetical diversity. $lambda$ should be high
in plus strategies as well, since strict elitism makes the algorithm prone
to getting stuck in local optima: an empirical argument states that $lambda$
should be at least $7$ times larger than $mu$.

The tendency of the plus strategy to get stuck in local optima can be
mitigated by substituting it with the comma strategy for some generations,
in order to increase the diversity. On the other hand, in the comma strategy
the best individuals of the original individuals are always lost, no matter
their fitness, and this could be undesirable. Therefore, to improve the
chances of converging, it is sensible to "relax" comma strategy and allow
at least the best individual so far encountered to be kept, even if it's
absent from the current or new population.

Since the goal of evolutionary strategies is to optimize a function,
mutations consist in adding to the chromosome a random vector $bold(r)$
of $n$ elements, with $n$ being the length of the chromosome. Each
element $r_(i)$ is the realization of a Gaussian random variable with
mean $0$ and standard deviation $sigma_(i)$. The standard deviation may
or may not depend on the index (that is, a different variance for each
entry of the chromosome) and may or may not depend on the generation.

Another notable feature of evolutionary strategies is that the standard
deviations of the chromosome entries are parameters themselves, meaning
that they can be adapted together with the individuals. In the simplest
case, there is just one standard deviation $sigma$ to be adapted, shared
in common for all the entries of the chromosome.

A known heuristic for adapting $sigma$ is the so-called _one-fifth success
rule_: if at least one-fifth of the offspring has better fitness than their
parents, $sigma$ is increased; if less than one-fifth of the offspring has
better fitness than their parents, $sigma$ is decreased. The most
straigthforward way to increase/decrease $sigma$ is to multiply/divide
it by a user-specified factor $alpha$.

Note how the ratio of offspring fitter than their parents and offspring
less fit than their parents, called the *success rate*, may also be seen
as a measure for the balance of exploration and exploitation. If the success
rate is too large, exploitation of good individuals dominates, which can
lead to effects of premature convergence. On the other hand, if the success
rate is too low, exploration dominates, which can lead to slow convergence.

Also note how the one-fifth rule tends to be ill-suited for large
populations, because it's clue that is too optimistic. For this reason,
similar to how it is done in simulated annealing, a more refined approach
would be to fix a threshold $theta$ (which may be initialized at $1 slash
5$) that is slowly increased over the iterations.

#algo(
	title: "ES-Global-Adaptation-Comma-Strategy",
	parameters: ([$f : RR^(n) -> RR$: function, $mu, lambda, k$: integer,
	              $theta, alpha$: real, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$s <- 0$ \
		$sigma <- $ an initial standard deviation \
		pop #math.arrow.l a random sequence of $mu$ arrays of reals \
		for $i in {1, dots, mu}$ #i \
			pop[i].fitness #math.arrow.l $f$(pop[i]) #d \
		do #i \
			pop' $<- emptyset$ \
			for $i in {1, dots, lambda}$ #i \
				$x <-$ a random element sampled from pop \
				$y <-$ #smallcaps("Gaussian-mutation") ($x, sigma$) \
				if ($x$.fitness > $y$.fitness) #i \
					$s <- s + 1$ #d \
				pop' $<-$ pop' $union {y}$ #d \
			for $i in {1, dots, mu}$ #i \
				pop'[i].fitness #math.arrow.l $f$(pop'[i]) #d#d \
			pop $<-$ the best $mu$ individuals from pop' \
			if ($t mod k = 0$) #i \
				$p_(s) <-$ fraction of the $s$ individuals fitter than their parents \
				if ($p_(s) > theta$) #i \
					$theta <- theta dot alpha$ #d \
				else #i \
					$theta <- theta slash alpha$ #d \
				$s <- 0$ #d \
		while (not ($epsilon$)) \
		best #math.arrow.l pop[0] \
		for $i in {1, dots, mu}$ #i \
			if (pop[i].fitness > best.fitness) #i \
				best #math.arrow.l pop[i] #d#d \
		return best
	]
)

The algorithm assumes comma strategy. A version with plus strategy would
differ only in the instruction pop' $<- emptyset$ (destroy the current
population completely), substituted by pop' $<-$ pop (include the current
population in the selection pool).

In contrast to global variance adaptation, local variance adaptation has a
specific standard deviation for each chromosome, or even a specific standard
deviation for each single gene of each chromosome. Each single standard
deviation is optimized in turn with the individuals: the rationale behind
it is that chromosomes with "bad" standard deviations will create unfit
individuals, whereas chromosomes with "good" standard deviations will create
fitter individuals. Therefore, even though the two does not influence each
other directly, "good" genes and "good" standard deviations should go hand
in hand.

#algo(
	title: "ES-Local-Adaptation-Comma-Strategy",
	parameters: ([$f : RR^(n) -> RR$: function, $mu, lambda$: integer,
	              $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		pop #math.arrow.l a random sequence of $mu$ arrays of reals \
		for $i in {1, dots, mu}$ #i \
			pop[i].fitness #math.arrow.l $f$(pop[i]) #d \
		do #i \
			pop' $<- emptyset$ \
			for $i in {1, dots, lambda}$ #i \
				$(x, sigma_(x)) <-$ a random element sampled from pop \
				$(y, sigma_(y)) <-$ #smallcaps("Self-Adaptive-Gaussian-Mutation") ($x, sigma$) \
				pop' $<-$ pop' $union {(y, sigma_(y))}$ #d \
			for $i in {1, dots, mu}$ #i \
				pop'[i].fitness #math.arrow.l $f$(pop'[i]) #d \
			pop $<-$ the best $mu$ individuals from pop' #d \
		while (not ($epsilon$)) \
		best #math.arrow.l pop[0] \
		for $i in {1, dots, mu}$ #i \
			if (pop[i].fitness > best.fitness) #i \
				best #math.arrow.l pop[i] #d#d \
		return best
	]
)

The algorithm assumes, again, comma strategy, and can be adapted to work
with plus strategy as done before.

A version of the algorithm where each single gene of each chromosome (and
not simply each chromosome) is adapted is more convoluted. A commonly
used rule for adapting single gene standard deviations is the following:

$ sigma'_(i) = sigma_(i) exp(r_(1) u_(0) + r_(2) u_(i)) $

Where $r_(1)$ and $r_(2)$ are tunable parameters, $u_(0), dots, u_(i),
dots, u_(n))$ are $n$ values sampled from a standard normal distribution
and $n$ is the length of the chromosome. Common empirically-driven choices
for $r_(1)$ and $r_(2)$ are $(1 slash sqrt(2 n), 1 slash sqrt(2 sqrt(n)))$
and $(0.1, 0.2)$. Also, a lower bound for $sigma_(i)$ (greater than the
trivial lower bound of $0$) is often introduced.

In the standard form of variance adaption, the variances of different
vector elements are independent of each other. That is,the covariance
matrix of the mutation operator is a diagonal matrix. As a consequence,
the mutation operator is only able to prefer directions in the search
space that are parallel to the coordinate axes of the search space. An
oblique direction is impossible to reach, even if it were to be better.

This entails that the variances of the chromosome must either all
increase or all decrease; it's impossible to have some standard
deviations to increase and some to decrease. The issue can be solved
by introducing, together with a variance for each gene, also their
covariances. This way, it becomes possible (although not guaranteed)
for each gene-specific variance to vary in its own direction.

As stated before, a recombination operator is used close to never in
evolutionary strategies. If it is, it either takes the form of uniform
crossover (randomly choosing genes from the two parents and merging
the result) or blending, for example as implemented by arithmetic
crossover. One should always keep in mind that crossover operators
carry the danger of the Jenkins nightmare: the "evening out" of all
variance in the population.
