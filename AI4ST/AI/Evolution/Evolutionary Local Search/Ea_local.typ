#import "../../AI_definitions.typ": *

Some local search algorithms are directly influenced by evolutionary
algorithmic approaches. That is, they combine the elements of local
search (search space, moving from a candidate solution to its neighbors,
ecc...) and elements of evolutionary algorithms (populations, random
mutations, ecc...)

=== Tabu search

*Tabu search* #footnote[The name "tabu search" comes from the word "taboo",
meaning "forbidden".] is a variant of local search where the creation of a
new solution candidate depends on the history of previous candidates. That
is, if the new candidate solution is identical to a previous candidate that
is known to be suboptimal, it is discarded immediately. This way, the
algorithm avoids entering paths that were already attempted and is
incentivized to try out new ways.

Tabu search does not consider one solution at a time, working instead
on a population of individuals. The previous candidates are stored in
a list, called *tabu-list*. This list is a FIFO (first in first out)
and has a fixed lenght. Whenever a new solution candidate is chosen
among the population, it is added to the list; if the list has reached
its maximum capacity, the first element is removed from the list. This
way, a solution candidate that has been evaluated recently will be in
the list, hence unavailable, but after enough iterations a solution
previously added to the list can become available again.

The algorithm, presented as follows, requires a a termination criteria
and a parameter $lambda$, which controls the size of the population:

#pseudocode(
	title: "Tabu-Search",
	parameters: ([$f : RR^(n) -> RR$], [$lambda$], [$epsilon$],),
	content: [
		A $<-$ #smallcaps("Random-Individual") () \
		$A_(max) <-$ A \
		T $<-$ #smallcaps("Init-Tabu-List") () \
		do #i \
			P $<- emptyset$ \
			do #i \
				B $<-$ #smallcaps("Mutate") (A) \
				if $((A, B) in.not T or f(B) > f(A_(max)))$ #i \
					P $<-$ P $union$ {B} #d#d \
			while $(abs(P) < lambda)$ \
			$A_("old") <- A$ \
			$A <- max_(f) {P}$ \
			if $(f(A) > f(A_(max)))$ #i \
				$A_(max) <- A$ #d \
			if (#smallcaps("Maximum-Capacity") (T)) #i \
				#smallcaps("Pop") (T) #d \
			#smallcaps("Push") $((A_("old"), A), T)$ #d \
		while (not($epsilon$)) \
		return $A_(max)$ \
	]
)

=== Memetic algorithms

*Memetic algorithms* try to take advantage of the benefits of evolutionary
algorithms (many solutions explored at the same time) and those of local
search algorithms (speed) but trying to mitigate the first (wastefulness)
and the second's (susceptibility to local optima) downsides. The name comes
from the biological concept of _meme_, an element of the behaviour that can
be acquired from experience (in contrast to genes, that are hereditary).

The algorithm starts with a randomly generated population, then applies a
local search algorithm to each individual of the population to find the
candidates that are most promising. Then, at each step of the main loop
a subset of the population that is deemed fit is chosen to repopulate,
substituting the old population with the offring of said chosen few after
having applied genetic operators to improve their fitness. This way, over
time, individuals that are already fit will be superseded by even fitter
ones.

Even though this approach is almost guaranteed to be very fast, has the
issue of potentially limiting the search space too much. Also, the choice
of the starting solution has a huge impact on the outcome, since each
generation is heavily dependent on the previous.
/*
#algo(
	title: "Memetic-Algorithm",
	parameters: ([$f : RR^(n) -> RR$: function, $lambda$: integer, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		$t <- 0$ \
		$P(t) <-$ #smallcaps("Initialize-Population") \
		$P(t) <-$ #smallcaps("Local-Search") ($F$) on each individual in $P(t)$ \
		do #i \
			$E <-$ select parents for $lambda$ offspring in $P(t)$ \
			$P' <-$ create offspring by recombination on $E$ \
			$P'' <-$ mutate each individual in $P'$ \
			$P''' <-$ #smallcaps("Local-Search") ($F$) on each individual in $P(t)$ \
			$t <- t + 1$ \
			$P(t) <-$ environmental selection on $P'''$ #d \
		while (not($epsilon$)) \
		return $max_(f){P(t)}$ \
	]
)
*/
=== Differential evolution

*Differential evolution* tries to exploit the relationships that intercur
between solutions.

=== Scatter search

*Scatter search* employs populations of selection candidates that are
subject to evolutionary pressure exploring their neighborhood, but as
the name suggests tries to "jump" around the search space trying to
cover an area as wide as possible.

=== Cultural algorithm
