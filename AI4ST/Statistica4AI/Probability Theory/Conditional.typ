#import "../Stats4AI_definitions.typ": *

When performing experiments, events can influence one another: knowing
that an event has occurred can change the probability of another event
occurring. Let $cal(S)$ be a sample space, and let $A$ and $B$ bet two
events of $cal(S)$, with $P(B) > 0$. The probability of $A$ to occur
given that $B$ occurred (that is, "knowing in advance it occurred") is
called the *conditional probability* of $A$ given $B$, and is given as:

$ P(A divides B) = frac(P(A inter B), P(B)) $

Where $A$ is the *conditioned event* and $B$ is the *conditioning event*.
The formula, when written in the following form:

$ P(A inter B) = P(A divides B) P(B) $

Is referred to as the *multiplication rule*.

#exercise[
	Consider rolling a six-sided die. What is the probablility of
	rolling a $6$, knowing that an even number has been rolled?
]
#solution[
	Let $A$ be the event "a six" and let $B$ be the event "an even number".
	This gives:

	$ P(A divides B) =
	  frac(P({6} inter {2, 4, 6}), P({2, 4, 6})) =
	  frac(P({6}), P({2}) + P({4}) + P({6})) =
	  frac(display(frac(1, 6)), display(frac(1, 6)) + display(frac(1, 6)) + display(frac(1, 6))) =
	  frac(1, 3) $

	This is reasonable, because knowing that the rolled side is an even
	number restricts the possible outcomes to $cal(S)' = {2, 4, 6}$, all
	equally probable by Principle of Indifference.
]

The rationale behind the formula for conditional probability is as
follows #footnote[Some authors sidestep the heuristic argument and
directly include the definition of conditional probability as a
fourth axiom of probability.]. $P(A divides B)$ assumes that $B$
has occurred, hence the sample space in which $A divides B$ lies is
not $cal(S)$, but in the subsets of $cal(S)$ in which $B$ occurs.
This is done by intersecting $A$ with $B$, so that only the subevents
of $A$ that are "compatible" with $B$ can occur. The proportionality
constant $1 slash P(B)$ ensures that an event conditioned with itself,
$P(B divides B)$, has probability $1$, since an event will obviously
happen if it is known in advance that it will.

#theorem("Law of total probability")[
	Let $cal(S)$ be a sample space. Let $A_(1), A_(2), dots, A_(n)
	subset.eq cal(S)$ be a finite collection of mutually exclusive
	events partitioning $cal(S)$, and let $B subset.eq cal(S)$ be
	any event. The following holds:

	$ P(B) =
	  sum_(i = 1)^(n) P(B inter A_(i)) =
	  sum_(i = 1)^(n) P(B divides A_(i)) P(A_(i)) $
] <Law-of-total-probability>
#proof[
	First, note how $P(E) = P(E inter cal(S))$ for any $E subset.eq
	cal(S)$, since by definition $E inter cal(S) = E$. Moreover, if
	$A_(1), dots, A_(n)$ partitions $cal(S)$, then $union.big_(i)
	A_(i) = cal(S)$. Then:

	$ P(B) =
	  P(B inter cal(S)) =
	  P(B inter union.big_(i) A_(i)) =
	  P(union.big_(i) (B inter A_(i))) $

	$A_(1), dots, A_(n)$ are assumed to be mutually exclusive, which
	means that $(B inter A_(1)), dots, (B inter A_(n))$ are also mutually
	exclusive. Applying @Kolmogorov-axiom-3-revisited:

	$ P(union.big_(i) (B inter A_(i))) =
	  sum_(i = 1)^(n) P(B inter A_(i)) =
	  sum_(i = 1)^(n) P(B divides A_(i)) P(A_(i)) $

	#figure(
		caption: [Geometric interpretation of the Law. Five mutually
		          exclusive events $A_(1), dots, A_(5)$ partition the
		          sample space, possibly including $B$.],
		cetz.canvas({
			cetz.draw.rect((0, 0), (4.75, 3.5), name: "frame")
			cetz.draw.circle("frame", radius: (1.5, 1), fill: rgb("#a5b9df"))
			cetz.draw.content("frame", $B$)
			cetz.draw.content((0, 0), anchor: "south-west", padding: 0.25, $cal(S)$)
			cetz.draw.line((1, 0), (2.25, 3.5))
			cetz.draw.line((0, 2.5), (1.625, 1.75))
			cetz.draw.line((2.15, 3.25), (4.75, 2.5))
			cetz.draw.line((3, 0), (3, 3))
			cetz.draw.content((2, 0), anchor: "south", padding: 0.25, $A_(1)$)
			cetz.draw.content((4, 0), anchor: "south", padding: 0.25, $A_(2)$)
			cetz.draw.content((4, 3.5), anchor: "north", padding: 0.25, $A_(3)$)
			cetz.draw.content((1, 3.5), anchor: "north", padding: 0.25, $A_(4)$)
			cetz.draw.content((0, 1.5), anchor: "west", padding: 0.25, $A_(5)$)
		})
	)
]

To better visualize chains of events, a *probability tree* can be drawn.
The nodes correspond to a branching, while the edges correspond to the
different branches. Each branching corresponds to a collection of mutually
exclusive events that partition the sample space, the edges are labeled
with the probability of such branching taking place. Summing probabilities
in any subtree should add up to $1$.

// FIXME: insufficient

#figure(
	caption: [Probability tree for two events, $A$ and $B$.
		      By definition $A union A^(c) = cal(S)$ and $A
		      inter A^(c) = emptyset$, making it a partition.
		      Same goes for $B$.],
	cetz.canvas({
		cetz.draw.set-style(stroke: (thickness: 1.5pt))

		cetz.draw.circle((0, 0), radius: 0.25em, fill: black, name: "R")
		cetz.draw.circle((5, 1.5), radius: 0.25em, fill: black, name: "R1")
		cetz.draw.circle((5, -1.5), radius: 0.25em, fill: black, name: "R2")

		cetz.draw.line("R", "R1", fill: black, name: "A")
		cetz.draw.line("R", "R2", fill: black, name: "An")
		cetz.draw.line("R1", (10, 3), fill: black, name: "BA")
		cetz.draw.line("R1", (10, 1), fill: black, name: "BnA")
		cetz.draw.line("R2", (10, -1), fill: black, name: "BAn")
		cetz.draw.line("R2", (10, -3), fill: black, name: "BnAn")

		cetz.draw.content(("A.start", 50%, "A.end"), angle: "A.end", padding: 0.2,
			              anchor: "south", [$P(A)$])
		cetz.draw.content(("An.start", 50%, "An.end"), angle: "An.end", padding: 0.2,
			              anchor: "south", [$P(A^(c))$])

		cetz.draw.content(("BA.start", 60%, "BA.end"), angle: "BA.end", padding: 0.2,
			              anchor: "south", [$P(B divides A)$])
		cetz.draw.content(("BAn.start", 60%, "BAn.end"), angle: "BAn.end", padding: 0.2,
			              anchor: "south", [$P(B divides A^(c))$])
		cetz.draw.content(("BnA.start", 60%, "BnA.end"), angle: "BnA.end", padding: 0.2,
			              anchor: "south", [$P(B^(c) divides A)$])
		cetz.draw.content(("BnAn.start", 60%, "BnAn.end"), angle: "BnAn.end", padding: 0.2,
			              anchor: "south", [$P(B^(c) divides A^(c))$])

		cetz.draw.content((11.5, 3), [$P(B inter A)$])
		cetz.draw.content((11.5, -1), [$P(B inter A^(c))$])
		cetz.draw.content((11.5, 1), [$P(B^(c) inter A)$])
		cetz.draw.content((11.5, -3), [$P(B^(c) inter A^(c))$])
	})
)

#exercise[
	An electronics store sells three different brands of DVD players. Of
	its DVD player sales, $50 percent$ are brand $1$ (the least expensive),
	$30 percent$ are brand $2$, and $20 percent$ are brand $3$. Each
	manufacturer offers a $1$-year warranty on parts and labor. It is
	known that $25 percent$ of brand $1$'s DVD players require warranty
	repair work, whereas the corresponding percentages for brands $2$
	and $3$ are $20 percent$ and $10 percent$, respectively.

	+ What is the probability that a randomly selected purchaser has bought
	  a brand 1 DVD player that will need repair while under warranty?
	+ What is the probability that a randomly selected purchaser has a DVD
	  player that will need repair while under warranty?
]
#solution[
	Let $A_(i)$ with $i in {1, 2, 3}$ be the event "the DVD player comes
	from the $i$-th brand", and let $B$ be the event "the DVD player needs
	to be repaired". The experiment is performed in two steps, first a DVD
	player is chosen, then knowing its brand it is determined whether it
	needs to be repaired. The probabilities are then distributed as follows:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		$ P(A_(1)) &= frac(1, 2) \
		  P(B divides A_(1)) &= frac(1, 4) $,
		$ P(A_(2)) &= frac(3, 10) \
		  P(B divides A_(2)) &= frac(1, 5) $,
		$ P(A_(3)) &= frac(1, 5) \
		  P(B divides A_(3)) &= frac(1, 10) $,
	)

	Notice how _"It is known that $25 percent$ of..."_ denotes a conditional
	probability, not an intersection of probabilities, because it represents
	a knowledge update. This is better understood by rephrasing _"It is known
	that $25 percent$ of brand $1$'s DVD players require warranty repair work"_
	as the less misleading _"Knowing that the DVD player at hand comes from
	brand $1$, there's a $25 percent$ probability of it requiring warranty
	repair work_".

	#figure(
		caption: [The probability tree in its entirety.],
		cetz.canvas({
			cetz.draw.set-style(stroke: (thickness: 1.5pt))

			cetz.draw.circle((0, 0), radius: 0.25em, fill: black, name: "R")
			cetz.draw.circle((5, 3), radius: 0.25em, fill: black, name: "R1")
			cetz.draw.circle((5, 0), radius: 0.25em, fill: black, name: "R2")
			cetz.draw.circle((5, -3), radius: 0.25em, fill: black, name: "R3")

			cetz.draw.line("R", "R1", fill: black, name: "A1")
			cetz.draw.line("R", "R2", fill: black, name: "A2")
			cetz.draw.line("R", "R3", fill: black, name: "A3")
			cetz.draw.line("R1", (10, 5), fill: black, name: "BA1")
			cetz.draw.line("R1", (10, 3), fill: black, name: "BnA1")
			cetz.draw.line("R2", (10, 1), fill: black, name: "BA2")
			cetz.draw.line("R2", (10, -1), fill: black, name: "BnA2")
			cetz.draw.line("R3", (10, -3), fill: black, name: "BA3")
			cetz.draw.line("R3", (10, -5), fill: black, name: "BnA3")

			cetz.draw.content(("A1.start", 60%, "A1.end"), angle: "A1.end", padding: 0.2,
			                  anchor: "south", [$P(A_(1)) = display(frac(1, 2))$])
			cetz.draw.content(("A2.start", 60%, "A2.end"), angle: "A2.end", padding: 0.2,
			                  anchor: "south", [$P(A_(2)) = display(frac(3, 10))$])
			cetz.draw.content(("A3.start", 60%, "A3.end"), angle: "A3.end", padding: 0.2,
			                  anchor: "south", [$P(A_(3)) = display(frac(1, 5))$])

			cetz.draw.content(("BA1.start", 70%, "BA1.end"), angle: "BA1.end", padding: 0.2,
			                  anchor: "south", [$P(B divides A_(1)) = display(frac(1, 4))$])
			cetz.draw.content(("BA2.start", 70%, "BA2.end"), angle: "BA2.end", padding: 0.2,
			                  anchor: "south", [$P(B divides A_(2)) = display(frac(1, 5))$])
			cetz.draw.content(("BA3.start", 70%, "BA3.end"), angle: "BA3.end", padding: 0.2,
			                  anchor: "south", [$P(B divides A_(3)) = display(frac(1, 10))$])
			cetz.draw.content(("BnA1.start", 70%, "BnA1.end"), angle: "BnA1.end", padding: 0.2,
			                  anchor: "south", [$P(B^(c) divides A_(1)) = display(frac(3, 4))$])
			cetz.draw.content(("BnA2.start", 70%, "BnA2.end"), angle: "BnA2.end", padding: 0.2,
			                  anchor: "south", [$P(B^(c) divides A_(2)) = display(frac(4, 5))$])
			cetz.draw.content(("BnA3.start", 70%, "BnA3.end"), angle: "BnA3.end", padding: 0.2,
			                  anchor: "south", [$P(B^(c) divides A_(3)) = display(frac(9, 10))$])

			cetz.draw.content((12, 5), [$P(B inter A_(1)) = display(frac(1, 8))$])
			cetz.draw.content((12, 1), [$P(B inter A_(2)) = display(frac(3, 50))$])
			cetz.draw.content((12, -3), [$P(B inter A_(3)) = display(frac(1, 50))$])
			cetz.draw.content((12, 3), [$P(B^(c) inter A_(1)) = display(frac(3, 8))$])
			cetz.draw.content((12, -1), [$P(B^(c) inter A_(2)) = display(frac(6, 25))$])
			cetz.draw.content((12, -5), [$P(B^(c) inter A_(3)) = display(frac(9, 50))$])
		})
	)

	The probability of a DVD player coming from brand $i$ will need repair
	is $P(B inter A_(i))$. By multiplication rule:

	$ P(B inter A_(1)) &=
	  P(B divides A_(1)) P(A_(1)) =
	  frac(1, 4) dot frac(1, 2) =
	  frac(1, 8) \
	  P(B inter A_(2)) &=
	  P(B divides A_(2)) P(A_(2)) =
	  frac(1, 5) dot frac(3, 10) =
	  frac(3, 50) \
	  P(B inter A_(3)) &=
	  P(B divides A_(3)) P(A_(3)) =
	  frac(1, 10) dot frac(1, 5) =
	  frac(1, 50) $

	The probability of any DVD player to need repair is $P(B)$. Applying
	@Law-of-total-probability:

	$ P(B) =
	  P(B divides A_(1)) P(A_(1)) +
	  P(B divides A_(2)) P(A_(2)) +
	  P(B divides A_(3)) P(A_(3)) =
	  frac(1, 8) + frac(3, 50) + frac(1, 50) =
	  frac(41, 200) $
]

Conditional probability plays a crucial role in Bayesian statistics.
In this interpretations, probability assignments are performed by
an agent based on the information that it possesses on the phenomena
under analysis. The more information is collected, the more "refined"
the assignment becomes.

In this sense $P(A)$ represents the initial assignment, an "absolute
probability" based on the information the agent has _a priori_, while
$P(A divides B)$ is an update on the assignment, incorporating the
knowledge carried by $B$. This is why in Bayesian statistics $P(A)$
and $P(A divides B)$ are respectively referred to as *prior probability*
and *posterior probability*. If $A$ is independent of $B$ ($P(A) = P(A
divides B)$), it means that $B$ provided no contribution to the knowledge
of the phenomena.

#theorem("Bayes' theorem")[
	Let $cal(S)$ be a sample space. Let $A_(1), A_(2), dots, A_(n)
	subset.eq cal(S)$ be a finite collection of mutually exclusive
	events partitioning $cal(S)$, and let $B subset.eq cal(S)$ be
	any event such that $P(B) > 0$. For any $A_(i)$ with $i in {1,
	dots, n}$, the following holds:

	$ P(A_(i) divides B) = 
	  frac(P(B divides A_(i)) P(A_(i)),
	       sum_(j = 1)^(n) P(B divides A_(j)) P(A_(j))) $
] <Bayes-theorem>
#proof[
	By multiplication rule:

	#grid(
		columns: (0.5fr, 0.5fr),
		$ P(A_(i) inter B) = P(A_(i) divides B) P(B) $,
		$ P(B inter A_(i)) = P(B divides A_(i)) P(A_(i)) $
	)

	Since $A_(i) inter B = B inter A_(i)$, the first expression can
	be substituted in the second:

	$ P(B inter A_(i)) =
	  P(B divides A_(i)) P(A_(i)) =
	  P(A_(i) divides B) P(B) =>
	  P(A_(i) divides B) =
	  frac(P(B divides A_(i)) P(A_(i)), P(B)) $

	Since $A_(1), dots, A_(n)$ is a collection of mutually
	exclusive events that partition $cal(S)$, it is possible
	to apply @Law-of-total-probability at the denominator:

	$ P(A_(i) divides B) =
	  frac(P(B divides A_(i)) P(A_(i)), P(B)) =
	  frac(P(B divides A_(i)) P(A_(i)),
	       sum_(j = 1)^(n) P(B divides A_(j)) P(A_(j))) $
]

The fact that inverting conditional probabilities using @Bayes-theorem
can lead to completely different values breeds apparent paradoxes.

#exercise("Medical test paradox")[
	Only 1 in 1000 adults is afflicted with a rare disease for which
	a diagnostic test has been developed. The test is such that when
	an individual actually has the disease, a positive result will
	occur $99 percent$ of the time (_true positive_), whereas an
	individual without the disease will show a positive test result
	only (_false positive_) of the time. If a randomly selected
	individual is tested and the result is positive, what is the
	probability of the individual to really have the disease?
]
#solution[
	Let $A$ be the event "the individual has the disease" and let
	$B$ be the event "the test returns positive". The probability
	of randomly selecting an individual with the disease is $P(A) =
	0.001$. A true positive corresponds to $B divides A$, having
	probability $0.99$, while a false positive corresponds to $B
	divides A^(c)$ with probability $0.02$. The event "knowing
	that the test is positive, the individual has the disease"
	would correspond to $A divides B$. Applying @Bayes-theorem:

	$ P(A divides B) &= 
	  frac(P(B divides A) P(A),
	       sum_(j = 1)^(2) P(B divides A_(j)) P(A_(j))) =
	  frac(P(B divides A) P(A),
	       P(B divides A) P(A) + P(B divides A^(c)) P(A^(c))) = \
	  &= frac(0.99 dot 0.001, 0.99 dot 0.001 + 0.02 dot (1 - 0.001)) approx 0.05 $

	The apparent paradox stems from the fact that the diagnostic test
	is very accurate ($99 percent$ chance of a true positive) and yet
	a very tiny fraction of people tested positive actually have the
	disease. The explanation is that the disease is so rare that most
	of the positive test results come from errors rather than from the
	individuals actually having the disease. If the disease were to be
	more common, this discrepancy wouldn't arise.
]

Let $cal(S)$ be a sample space, and let $A, B subset.eq cal(S)$ two
events. If $P(A) = P(A divides B)$, meaning that the occurrence of
$B$ does not influence the chances of $A$ to occur, $A$ is said to
be *independent* of $B$. If $P(A) != P(A divides B)$, $A$ is said
to be *dependent* on $B$.

Dependence and mutual exclusiveness are two distinct concepts. If $A, B
in cal(S)$ are mutually exclusive, then they are certainly also dependent,
because knowing that one has happened implies that the other cannot happen.
Indeed, if $A$ and $B$ are mutually exclusive then $P(A inter B) = 0$, which
gives $P(A divides B) = P(A inter B) slash B = 0$.

#corollary[
	Given a sample space $cal(S)$ and two events $A, B subset.eq cal(S)$,
	if $A$ is independent of $B$ then $B$ is independent of $A$. That is,
	event independence is symmetric.
] <Event-independence-is-symmetric>
#proof[
	If $A$ is independent of $B$, then $P(A divides B) = P(A)$. Applying
	@Bayes-theorem gives:

	$ P(A divides B) = cancel(P(A)) =
	  frac(P(B divides A) cancel(P(A)), P(B)) =>
	  P(B divides A) = P(B) $

	Which is the definition of independence.
]

Independence can be extended to three or more events. Given a collection
of $n$ events $A_(1), A_(2), dots, A_(n)$ over a sample space $cal(S)$,
such events are said to be *mutually independent* if for every $k = 2, 3,
dots, n$ and for every subset of indices $i_(1), i_(2), dots, i_(k)$:

$ P(A_(i, 1) inter A_(i, 2) inter dots inter A_(i, k)) =
  P(A_(i, 1)) dot P(A_(i, 2)) dot  dots dot P(A_(i, k)) $
