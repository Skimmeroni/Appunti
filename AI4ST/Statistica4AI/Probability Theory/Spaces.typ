#import "../Stats4AI_definitions.typ": *

*Probability theory* is a mathematical framework providing methods
that describe situations and events having an unforseeable outcome,
quantifying chance and randomness related to said results.

Any activity or process having at least one (unnkowable in advance)
outcome is called an *experiment*. The set containing all possible
outcomes of an experiment, denoted $cal(S)$ or $Omega$, is called
*sample space*. The sample space can be either discrete or continuous.

#exercise[
	Provide some examples of experiments.
] <Experiments>
#solution[
	- Rolling a six-sided die is an experiment; the value read on the
	  top is unkowable until the die is rolled. The sample space $cal(S)$
	  contains $6$ elements:

	  $ cal(S) = {1, 2, 3, 4, 5, 6} $

	- Drawing a card from a (standard) deck is an experiment; the value
	  on the card is unknowable until the card is turned face up. The
	  sample space $cal(S)$ contains $52$ elements:

	  $ cal(S) = {
	     A suit.heart,   2 suit.heart,   dots, K suit.heart,
	     A suit.diamond, 2 suit.diamond, dots, K suit.diamond,
	     A suit.club,    2 suit.club,    dots, K suit.club,
	     A suit.spade,   2 suit.spade,   dots, K suit.spade} $

	- Tossing three coins (or any number of coins) is an experiment; the
	  side of the coin facing up (heads or tails) is unkowable until the
	  coin is flipped. The sample space $cal(S)$ contains $8$ elements:

	  $ cal(S) = {T T T, T T H, T H T, H T T, T H H, H H T, H T H, H H H} $
]

Any subset of the sample space is called an *event*. An event can be either
*simple* if it's a singleton (it contains a single outcome of the experiment)
or *compound* (it contains multiple outcomes). An event can either
occur or not occur, depending on the outcome of the experiment.

When an experiment is performed, a particular event $A$ is said to occur if
the outcome of the experiment is either $A$ itself or is a subset of $A$. In
general, exactly one simple event will occur, but many compound events will
occur simultaneously.

#exercise[
	Provide some examples of events, referring to @Experiments.
]
#solution[
	- Consider the roll of a six-sided die. The subset $A = {1, 3, 5}$
	  of the sample space $cal(S)$ is the event "an even number". It is
	  a compound event;
	- Consider the drawing of a card from a deck. The subset $B =
	  {A suit.heart, A suit.diamond, A suit.club, A suit.spade, K suit.club}$
	  of the sample space $cal(S)$ is the event "either an ace of any suit or
	  the king of clubs". It is a compound event;
	- Consider the side facing up of three coins after being tossed. The
	  subset $C = {H H H}$ of the sample space $cal(S)$ is the event "all
	  three heads". It is a simple event.
]

Events are nothing more than (sub)sets. They can therefore be given a
graphical representation through *Euler-Venn diagrams*.

#figure(
	caption: [Drawing an event as an Euler-Venn diagram. The event is the
	          circle labeled $A$, while the sample space is the rectangle
	          labeled $cal(S)$ enclosing the circle.],
	cetz.canvas({
		cetz.draw.rect((0, 0), (4.75, 3.5), name: "frame")
		cetz.draw.circle("frame", fill: rgb("#a5b9df"))
		cetz.draw.content("frame", $A$)
		cetz.draw.content((0, 0), anchor: "south-west", padding: 0.25, $cal(S)$)
	})
)

Moreover, events can be manipulated using the algebra of set theory to
construct new events. Given a sample space $cal(S)$ and two events $A$
and $B$, subsets of $cal(S)$:

- The *intersection* of $A$ and $B$, denoted as $A inter B$, corresponds
  to the event containing all outcomes contained both in $A$ and in $B$.
  That is, $A inter B$ occurs if and only if both $A$ and $B$ occur at
  the same time;
- The *union* of $A$ and $B$, denoted as $A union B$, corresponds to the
  event containing all outcomes contained either in $A$, in $B$ or in both.
  That is, $A union B$ occurs if at most $A$ or $B$ occurs.
- The *complement* of $A$, denoted as $A^(c)$, corresponds to the event
  containing all outcomes not contained in $A$. That is, $A^(c)$ occurs
  if and only if $A$ does not occur;

#figure(
	caption: [On the left, the intersection of two events $A$ and $B$,
	          subsets of the sample space $cal(S)$. In the middle, their
	          union. On the right, the complement of $A$.],
	grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		cetz.canvas({
			venn2(name: "events", ab-fill: rgb("#a5b9df"))
			cetz.draw.content("events.a", [$A$])
			cetz.draw.content("events.b", [$B$])
			cetz.draw.content("events.not-ab", [$cal(S)$])
		}),
		cetz.canvas({
			venn2(name: "events", a-fill: rgb("#a5b9df"), ab-fill: rgb("#a5b9df"), b-fill: rgb("#a5b9df"))
			cetz.draw.content("events.a", [$A$])
			cetz.draw.content("events.b", [$B$])
			cetz.draw.content("events.not-ab", [$cal(S)$])
		}),
		cetz.canvas({
			cetz.draw.rect((0, 0), (4.75, 3.5), name: "frame", fill: rgb("#a5b9df"))
			cetz.draw.circle("frame", fill: white)
			cetz.draw.content("frame", $A$)
			cetz.draw.content((0, 0), anchor: "south-west", padding: 0.25, $cal(S)$)
		})
	)
)

The union and intersection of three or more events are computed from
extending the definition for two events in the standard way.

#exercise[
	Provide some examples of complemented, intersected and unified events,
	referring to @Experiments.
]
#solution[
	- Consider the roll of a six-sided die. The subset $A = {6}$
	  of the sample size $cal(S)$ is the event "six", while the
	  subset $A^(c) = {1, 2, 3, 4, 5}$ is the event "any number
	  but six";
	- Consider the drawing of a card from a deck. Let $B_(1) =
	  {A suit.heart, A suit.spade, K suit.club}$ be the event
	  "an ace of hearts, an ace of spades or the king of clubs",
	  and let $B_(2) = {A suit.diamond, A suit.club, K suit.club}$
	  be the event "an ace of diamonds, an ace of clubs or the king
	  of clubs". The set $B = B_(1) union B_(2) = {A suit.heart,
	  A suit.diamond, A suit.club, A suit.spade, K suit.club}$ is
	  the event "either an ace of any suit or the king of clubs";
	- Consider the toss of three coins. Let $C_(1) = {H T T, H H T,
	  H T H, H H H}$ be the event "first coin heads", and let $C_(2)
	  = {T H T, H H T, T H H, H H H}$ be the event "second coin heads".
	  The set $C = C_(1) inter C_(2) = {H H T, H H H}$ is the event
	  "first and second coin heads".
]

The empty set $emptyset$ denotes the event of having no outcome whatsoever,
also called the *null event*. If the intersection of two events is the null
event, such events are said to be *mutually exclusive* events, or *disjoint*
events. In other words, two events are said to be mutually exclusive if they
can't happen at the same time. By definition, an event and its complement are
mutually exclusive.

#figure(
	caption: [The events on the left are not mutually exclusive, because
	          their intersection is not the empty set. The events on the
	          right are mutually exclusive.],
	grid(
		columns: (0.5fr, 0.5fr),
		[#cetz.canvas({
			venn2(name: "events", ab-fill: rgb("#a5b9df"), a-fill: rgb("#a6e2a2"), b-fill: rgb("#dca7cf"))
			cetz.draw.content("events.a", [$A$])
			cetz.draw.content("events.b", [$B$])
			cetz.draw.content("events.not-ab", [$cal(S)$])
		})],
		cetz.canvas({
			cetz.draw.rect((0, 0), (4.75, 3.5), name: "frame")
			cetz.draw.circle((1.25, 1.75), fill: rgb("#a6e2a2"), name: "A")
			cetz.draw.circle((3.5, 1.75), fill: rgb("#dca7cf"), name: "B")
			cetz.draw.content("A", $A$)
			cetz.draw.content("B", $B$)
			cetz.draw.content((0, 0), anchor: "south-west", padding: 0.25, $cal(S)$)
		})
	)
)

#exercise[
	Provide an example of disjoint events, referring to @Experiments.
]
#solution[
	Consider the drawing of a card from a deck, with sample space $cal(S)$.
	Consider the following events:

	$ B_(1) &=
	  {7 suit.heart, 7 suit.diamond, 7 suit.club, 7 suit.spade} =
	  "A 7 of any suit" \
	  B_(2) &=
	  {Q suit.heart, Q suit.diamond, Q suit.club, Q suit.spade} =
	  "A queen of any suit" \
	  B_(3) &=
	  {A suit.heart, 2 suit.heart, dots, K suit.heart} =
	  "Any card of the hearts suit" $

	Intersecting them gives:

	$ B_(1) inter B_(2) &=
	  {7 suit.heart, 7 suit.diamond, 7 suit.club, 7 suit.spade} inter
	  {Q suit.heart, Q suit.diamond, Q suit.club, Q suit.spade} = emptyset \
	  B_(2) inter B_(3) &=
	  {Q suit.heart, Q suit.diamond, Q suit.club, Q suit.spade} inter
	  {A suit.heart, 2 suit.heart, dots, K suit.heart} = {Q suit.heart} \
	  B_(1) inter B_(3) &=
	  {7 suit.heart, 7 suit.diamond, 7 suit.club, 7 suit.spade} inter
	  {A suit.heart, 2 suit.heart, dots, K suit.heart} = {7 suit.heart} $

	Which means that $B_(1)$ and $B_(2)$ are mutually exclusive, while
	both $B_(1)$ and $B_(3)$ and $B_(2)$ and $B_(3)$ are not.
]
