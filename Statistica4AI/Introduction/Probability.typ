#import "../Stats4AI_definitions.typ": *

Probability provides methods to quantify chance and randomness related to a
certain event. Any activity or process having at least one outcome, all being
random (not knowable in advance) is called an *experiment*. The set containing
all possible outcomes of an experiment, denoted as $cal(S)$, is called *sample
space*.

#exercise[
	Provide some examples of experiments.
]
#solution[
	- The roll of a six-sided dice is an experiment, since the resulting
	  value of the dice is unknown until the dice is rolled. The sample
	  space $cal(S)$ contains $6$ elements:

	  $ cal(S) = {1, 2, 3, 4, 5, 6} $

	- The drawing of a card from a (standard) deck is an experiment, since
	  the value of the card is unknown until the card is drawn. The sample
	  space $cal(S)$ contains $52$ elements:

	  $ cal(S) = {
	     A suit.heart, 2 suit.heart, dots, Q suit.heart, K suit.heart,
	     A suit.diamond, 2 suit.diamond, dots, Q suit.diamond, K suit.diamond,
	     A suit.club, 2 suit.club, dots, Q suit.club, K suit.club,
	     A suit.spade, 2 suit.spade, dots, Q suit.spade, K suit.spade} $

	- The gender assigned to the offspring of a couple is an experiment,
	  since their gender is unknown until (roughly) $4$ months since
	  conception. The sample space $cal(S)$ contains $8$ elements:

	  $ cal(S) = {M M M, M M F, M F M, F M M, M M F, F F M, F M F, F F F} $
]

Any subset of the sample space is called an *event*. An event can be either
*simple* if it's a singleton (it contains a single outcome of the experiment)
or *compound* otherwise (it contains multiple outcomes). An event can either
occur or not occur, depending on the outcome of the experiment.

#exercise[
	Provide some examples of events.
]
#solution[
	- Consider the roll of a six-sided dice. The subset $A = {1, 3, 5}$
	  of the sample space $cal(S)$ corresponds to the event "an even number".
	  It is a compound event;
	- Consider the drawing of a card from a deck. The subset $B =
	  {A suit.heart, A suit.diamond, A suit.club, A suit.spade,
	  K suit.heart, K suit.diamond, K suit.club, K suit.spade}$ of
	  the sample space $cal(S)$ corresponds to the event "either an
	  ace or a king of any set". It is a compound event;
	- Consider the gender assigned to the offspring of a couple. The subset
	  $C = {F F F}$ of the sample space $cal(S)$ corresponds to the event
	  "exclusively female offspring". It is a simple event.
]

Being sets, events can be manipulated using set algebra. In particular,
given two events $A$ and $B$:

- The *complement* of $A$, denoted as $A^(c)$, corresponds to the event
  containing all outcomes not contained in $A$. That is, $A^(c)$ occurs
  if and only if $A$ does not occur. $A^(c)$ is also called the *complementary
  event* of $A$;
- The *intersection* of $A$ and $B$, denoted as $A sect B$, corresponds
  to the event containing all outcomes contained both in $A$ and in $B$.
  That is, $A sect B$ occurs if and only if both $A$ and $B$ occur at
  the same time;
- The *union* of $A$ and $B$, denoted as $A union B$, corresponds to the
  event containing all outcomes contained either in $A$, in $B$ or in both.
  That is, $A union B$ occurs if at most $A$ or $B$ occurs.

#exercise[
	Provide some examples of complemented, intersected and unified events.
]
#solution[
	- Consider the roll of a six-sided dice. The subset $A = {1, 2, 3, 4, 5}$
	  of the sample space $cal(S)$ corresponds to the event "any number but
	  $6$". It is the complement of the event "exactly six";
	- Consider the drawing of a card from a deck. The subset $B =
	  {A suit.heart, A suit.diamond, A suit.club, A suit.spade,
	  K suit.heart, K suit.diamond, K suit.club, K suit.spade}$ of
	  the sample space $cal(S)$ is actually a union of two smaller
	  events, the first being "an ace of any set" and the second
	  being "a king of any set";
	- Consider the gender assigned to the offspring of a couple. Consider the
	  two events "a male as first born" and "a female as third born". Their
	  intersection, representing the event "a male as first born and a female
	  as third born" is given by:

	  $ {M M M, M M F, M F M, M F F} sect {M M F, M F F, F M F, F F F} =
	    {M M F, M F F} $
]

The empty set $emptyset$ denotes the event of having no outcome whatsoever,
also called the *null event*. If the intersection of two events is the null
event, such events are said to be *mutually esclusive* events, or *disjoint*
events. In other words, two events are said to be mutually esclusive if they
have no way of happening at the same time.

// Add an example of disjoint events

// Add some graphics concerning Venn diagrams

Modern probability theory, like set theory, is defined axiomatically.
Such axioms are also called *Kolmogorov axioms*, and are (supposed to
be) the minimum amount of axioms that are needed to construct a theory
of probability free of contradictions.

To an event $A$, it is possible to associate a value called its *probability*,
denoted as $P(A)$, that represents a measure of likelihood, certainty or
confidence of such event to occur (intuitively, the higher the value of
probability, the higher the likelihood). Probabilities obey three axioms,
here stated:

+ For any event $A$, $P(A) gt.eq 0$. That is, the probability of an event
  happening is non negative;
+ $P(cal(S)) = 1$. That is, the probability of any even happening at all
  is fixed as $1$;
+ If $A_(1), A_(2), dots$ is a collection of countably infinite disjoint
  events, the following equality holds:

  $ P(A_(1) union A_(2) union dots) = sum_(i = 1)^(infinity) P(A_(i)) $

  That is, given a set of events where no event can occur if at most another
  one of them occurs, the probability of any such event to occur is the sum
  of the individual probabilities.

From such axioms, it is possible to derive many useful consequences.

#theorem[
	$P(emptyset) = 0$. That is, the null event cannot occur.
] <Null-event-has-probability-zero>
#proof[
	Consider the countably infinite collection of events $emptyset,
	emptyset, dots$. By definition, the null event is disjoint with
	itself, since set algebra gives $emptyset sect emptyset = emptyset$.
	The collection $emptyset, emptyset, dots$ is therefore made up of
	disjoint events, and by set algebra $emptyset union emptyset union
	dots = emptyset$, therefore $P(emptyset union emptyset union dots) =
	P(emptyset)$. Since by axiom $3$ $P(emptyset union emptyset union
	dots) = sum_(i = 1)^(infinity) P(emptyset)$, by transitive property
	$sum_(i = 1)^(infinity) P(emptyset) = P(emptyset)$. Since by axiom
	$1$ the value of $P(emptyset)$ has to be non negative, such equality
	can hold exclusively if $P(emptyset) = 0$.
]

#theorem[
	If $A_(1), A_(2), dots, A_(n)$ is a collection of finitely many disjoint
	events, the following equality holds:

	$ P(A_(1) union A_(2) union dots union A_(n)) = sum_(i = 1)^(n) P(A_(i)) $
] <3rd-Kolmogorov-axiom-for-finite-collections>
#proof[
	Consider the countably infinite collection of events $A_(1), A_(2), dots,
	A_(n), A_(n + 1) = emptyset, A_(n + 2) = emptyset, dots, emptyset$, that
	is, a collection constructed by encoding countably infinitely many null
	events to the original collection. Applying axiom $3$ to such collection
	gives:

	$ P(A_(1) union A_(2) union dots A_(n) union emptyset union emptyset union
	  dots union emptyset) = sum_(i = 1)^(infinity) P(A_(i)) $

	It is possible to split the summation in two like so:

	$ P(A_(1) union A_(2) union dots union A_(n)) + P(emptyset union
	  emptyset union dots union emptyset) = sum_(i = 1)^(n) P(A_(i)) +
	  sum_(i = n + 1)^(infinity) P(emptyset) $

	But by @Null-event-has-probability-zero, $P(emptyset) = 0$. Therefore:

	$ P(A_(1) union A_(2) union dots union A_(n)) + P(emptyset union
	  emptyset union dots union emptyset) = P(A_(1) union A_(2) union
	  dots union A_(n)) + 0 = sum_(i = 1)^(n) P(A_(i)) $
]

#theorem[
	For any event $A$, $P(A) + P(A^(c)) = 1$.
] <Probability-of-complementary-event>
#proof[
	By definition of complementary event, $A union A^(c) = cal(S)$. They are
	also disjoint events, since one cannot happen it the other one happened. It
	is therefore possible to apply @3rd-Kolmogorov-axiom-for-finite-collections
	and state that $sum_(i = 1)^(2) P(A_(i)) = P(A) + P(A^(c)) = P(A union
	A^(c))$. But, as stated, $A union A^(c) = cal(S)$, and by axiom $2$
	$P(cal(S)) = 1$. Therefore, by transitive property, $P(A) + P(A^(c)) = 1$.
]

#theorem[
	For any event $A$, $0 lt.eq P(A) lt.eq 1$.
] <Double-boundary-on-probability-value>
#proof[
	By @Probability-of-complementary-event, $P(A) + P(A^(c)) = 1$. By axiom
	$1$, both probabilities are greater or equal than $0$, therefore, for the
	equality to hold, both probabilities have to be lower or equal than $1$.
	Combining the two boundaries, $0 lt.eq P(A) lt.eq 1$.
]

#theorem[
	For any two events $A$ and $B$, $P(A union B) = P(A) + P(B) - P(A sect B)$.
] <Probability-of-union-of-two-generic-events>
#proof[
	By set algebra, the event $A union B$ can itself be seen as the
	union of two disjoint events, $A$ and $A^(c) sect B$. It is therefore
	possible to apply @3rd-Kolmogorov-axiom-for-finite-collections, resulting
	in:

	$ P(A union B) = P(A union (A^(c) sect B)) = P(A) + P(A^(c) sect B) $

	In the same fashion, the event $B$ can be seen as the union
	of the disjoint events $A sect B$ and $A^(c) sect B$. Applying
	@3rd-Kolmogorov-axiom-for-finite-collections gives:

	$ P(B) = P((A sect B) union (A^(c) sect B)) = P(A sect B) +
	  P(A^(c) sect B) $

	Moving $P(A sect B)$ to the left side gives $P(B) - P(A sect B) =
	P(A^(c) sect B)$. Substituting such expression in the first equation
	gives $P(A union B) = P(A) + P(B) - P(A sect B)$.
]

#theorem[
	For any three events $A$, $B$ and $C$:

	$ P(A union B union C) = P(A) + P(B) + P(C) - P(A sect B) - P(A sect C) -
	P(B sect C) + P(A sect B sect C) $
] <Probability-of-union-of-three-generic-events>
#proof[
	Works similarly as @Probability-of-union-of-two-generic-events.
]

#theorem("Boole's inequality")[
	Given any countable set of events $A_(1), A_(2), dots, A_(n)$:

	$ P(union.big_(i = 1)^(infinity) A_(i)) lt.eq
	  sum_(i = 1)^(infinity) P(A_(i)) $
]
// #proof[
//	If the events $A_(1), A_(2), dots, A_(n)$ are disjoint,
//	$P(union.big_(i = 1)^(infinity) A_(i))$ is indeed equal
//	to $sum_(i = 1)^(infinity) P(A_(i))$ by virtue of axiom
//	$3$. Otherwise,
// ]

It should be stressed that the Kolmogorov axioms simply describe the rules
by which probability works, but do not define the probability of any event
itself. Infact probabilities can be assigned to any event in any possible
way that is constrained by the axioms, but such value can have no bare on
reality or on intuition and yet construct a model that is consistent.

#exercise[
	Provide an example of a probability model that constrasts with reality
	but obeys Kolmogorov's axioms.
]
#solution[
	Consider the toss of a coin. Such action can be conceived as an
	experiment, since whose side the coin is gonna land when tossed
	is unknown until the coin lands. Only two events are possible,
	heads or tails; since a coin cannot land on both sides at the
	same time, such events are disjoint.

	It is a known fact that the probability of both events is $0.5$,
	and indeed such assignment respects all of three axioms. But by
	choosing the assignment, say, $0.2$ to the landing on heads and
	$0.8$ to the landing on tails, no axiom is violated, even though
	such an assignment has very little resonance with experience or
	common sense.

	This does not mean that probabilities can be assigned at libitum,
	since they still ought to comply with the axioms. For example,
	assigning $0.4$ to the probability of the coin to land on heads
	and $0.3$ to the probability of the coin to land on tails won't
	do, since axiom $2$ would be violated. As another example, assigning
	$1.5$ to the probability of the coin to land on heads and $-0.5$ to
	the probability of the coin to land on tails would violate axiom $1$,
	and therefore invalid.
]

The appropriate or correct assignment depends on how one _interprets_
probability, that is to say how one intends the link between the mathematical
treatment of probability and the physical world. This quest is just as
philosophical as mathematical.

One possible and often invoked interpretation of probability is the
*objective* interpretation, also called *frequentist* interpretation.
Consider an experiment that can be repeatedly performed in an identical
and independent fashion, and let $A$ be an event consisting of a fixed
set of outcomes of the experiment. If the experiment is performed $n$
times, the event $A$ will occur $n(A)$ times (with $0 lt.eq n(A) lt.eq n$)
and will not occur $n - n(A)$ times. The ratio $n(A) slash n$ is called
the *relative frequency* of occurrence of the event $A$ in the sequence
of $n$ attempts.

Empirical data suggests that the relative frequency fluctuates considerably
if $n$ is a small number, while tends to stabilize itself as $n$ grows.
Ideally, repeating such experiment infinitely many times, it would be
possible to obtain a "perfect" frequency, called *limiting relative
frequency*. The objective interpretation of probability states that this
limiting relative frequency is indeed the probability of $A$ to occurr.

// Provide an example, possibly introducing graphs such as the one on the
// textbook

This interpretation of probability is said to be objective in the sense
that it rests on a property of the experiment and not on the concerns of
the agent performing it (ideally, two agents performing the same experiment
the same number of times would obtain the same relative limiting frequency,
and therefore the same probability).

This interpretation has limited appliability, since not all events can be
performed $n$ number of times to draw similar conclusions. In situations
such as these, it makes more sense to interpret probability in a *subjective*
way, which can be thought of as the "degree of confidence" with which an agent
believes an event to occur.

The simplest situation to model is the one where to each simple event
$E_(1), E_(2), dots, E_(N)$ is assigned the same value of probability
$P(E_(i))$:

$ 1 = sum_(i = 1)^(N) P(E_(i)) => P(E_(i)) = frac(1, N) $

That is, if there are $N$ equally likely outcomes, the probability of
one of such outcomes to happen is $1 slash N$.

More generally, consider an event $A$ containing $N(A)$ number of outcomes.
Then the task of computing probabilities reduces itself to *counting*:

$ P(A) = sum_(E_(i) in A) P(E_(i)) = sum_(E_(i) in A) frac(1, N) =
  frac(N(A), N) $

Given two events $A$ and $B$ with $P(B) > 0$, the probability of $A$ to
occur given that $B$ occurred is called the *conditional probability* of
$A$ given $B$, and is given as:

$ P(A divides B) = frac(P(A sect B), B) $

// Why is the formula like so?

#theorem("Law of total probability")[
	Let $A_(1), A_(2), dots, A_(n)$ be a finite partition of a sample space
	$cal(S)$ such that no event has assigned zero probability, and let $B$
	be any event in $cal(S)$. Then:

	$ P(B) = P(B divides A_(1)) P(A_(1)) + dots + P(B divides A_(n)) P(A_(n))
	  = sum_(i = 1)^(n) P(B divides A_(i)) P(A_(i)) $

	// The graphical representation is actually kinda nice
] <Law-of-total-probability>
// #proof[
// It can be retrieved on ProofWiki
// ]

#theorem("Bayes' theorem")[
	Let $A_(1), A_(2), dots, A_(n)$ be a finite partition of a sample
	space $cal(S)$. Each event $A_(j)$ has a probability $P(A_(j))$,
	also called its *prior probability*, that is non zero. Let $B$ be
	any event in $cal(S)$ whose probability is non zero. The probability
	$P(A_(j) divides B)$, also called the *posterior probability*, is
	given as:

	$ P(A_(j) divides B) = frac(P(A_(j) sect B), P(B)) =
	  frac(P(B divides A_(j)) P(A_(j)), sum_(i = 1)^(infinity)
	  P(B divides A_(i)) P(A_(i))) $
] <Bayes-theorem>
// #proof[
// To be added
// ]

#exercise[
	An electronics store sells three different brands of DVD players. Of
	its DVD player sales, $50 percent$ are brand $1$ (the least expensive),
	$30 percent$ are brand $2$, and $20 percent$ are brand $3$. Each
	manufacturer offers a $1$-year warranty on parts and labor. It is
	known that $25 percent$ of brand $1$'s DVD players require warranty
	repair work, whereas the corresponding percentages for brands $2$
	and $3$ are $20 percent$ and $10 percent$, respectively.

	// Add the probability tree

	+ What is the probability that a randomly selected purchaser has bought
	  a brand 1 DVD player that will need repair while under warranty?
	+ What is the probability that a randomly selected purchaser has a DVD
	  player that will need repair while under warranty?
	+ If a customer returns to the store with a DVD player that needs warranty
	  repair work, what is the probability that it is a brand 1 DVD player?
]
// #solution[
// What is the solution? Apply the law of total probability and Bayes theorem
// ]

// #exercise[
// Rare disease example from lecture
// ]

Consider two events, $A$ and $B$, the second happening after the first.
The fact that $B$ occurred may or may not influence the probability of
$A$ to occur. If the probability of $A$ to happen is the same whether or
not $B$ happened, that is to say if $P(A)$ and $P(A divides B)$ are equal,
The event $A$ is said to be *independent* of $B$. Otherwise, it's said to
be *dependent* of $B$.

#theorem[
	Event independence is symmetric. In other words, given two events $A$
	and $B$, if $A$ is independent of $B$, then $B$ is independent of $A$.
] <Event-independence-is-symmetric>
#proof[
	If $A$ is independent of $B$, then $P(A divides B) = P(A)$. Applying
	@Bayes-theorem gives:

	$ P(A divides B) = cancel(P(A)) =
	  frac(P(B divides A) cancel(P(A)), P(B)) =>
	  P(B divides A) = P(B) $

	Which, by definition, means that $B$ is independent of $A$ as well.
]

An equivalent definition of independent events is as follows.
Given two independent events $A$ and $B$, by the previous
definition $P(A) = P(A divides B)$, so:

$ P(A divides B) = frac(P(A sect B), P(B)) =>
  P(A) = frac(P(A sect B), P(B)) =>
  P(A sect B) = P(A) P(B) $

Event independence can be extended to a situation with more than two events.
Given a collection of $n$ events $A_(1), A_(2), dots, A_(n)$, such events are
said to be *mutually independent* if for every $k = 2, 3, dots, n$ and for
every subset of indices $i_(1), i_(2), dots, i_(k)$:

$ P(A_(i, 1) sect A_(i, 2) sect dots sect A_(i, k)) =
  P(A_(i, 1)) dot P(A_(i, 2)) dot  dots dot P(A_(i, k)) $
