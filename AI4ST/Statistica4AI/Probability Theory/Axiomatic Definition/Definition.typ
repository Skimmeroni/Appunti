#import "../../Stats4AI_definitions.typ": *

To an event $A$, it is possible to associate a value, its *probability*,
denoted as $P(A)$. The value of $P(A)$ represents a measure of likelihood,
certainty or confidence of the event $A$ to occur. Intuitively, an higher
value of probability corresponds to an higher likelihood.

Modern probability theory, like set theory, is defined axiomatically.
Such axioms are also called *Kolmogorov axioms*, and are the smallest
amount of axioms from which to derive a theory of probability free of
contradictions.

#axiom("First Kolmogorov axiom")[
	For any sample space $cal(S)$ and for any event
	$A subset.eq (cal(S))$, $P(A) gt.eq 0$.
] <Kolmogorov-axiom-1>

#axiom("Second Kolmogorov axiom")[
	For any sample space $cal(S)$, $P(cal(S)) = 1$.
] <Kolmogorov-axiom-2>

#axiom("Third Kolmogorov axiom")[
	Let $cal(S)$ be any sample space. If $A_(1), A_(2), dots subset.eq
	cal(S)$ is a countably infinite collection disjoint events:

	$ P(A_(1) union A_(2) union dots) = sum_(i = 1)^(infinity) P(A_(i)) $
] <Kolmogorov-axiom-3>

@Kolmogorov-axiom-1 states that probabilities are always non-negative.
@Kolmogorov-axiom-2 states that the probability of the sample space,
which is the probability of any event to happen, is $1$. @Kolmogorov-axiom-3
states that the probability of the union of disjoint events is the sum of the
individual probabilities.

The Kolmogorov axioms are sufficient to derive the entire probability
theory, and set some constrains on which probability assignments are
valid and which are not. However, they do not define how this
assignment is supposed to be made.

At least for discrete sample spaces, the simplest way to do so is
applying the so-called *Principle of Indifference*. The Principle
is as follows: when there isn't sufficient information on how to
distribute probabilities to the possible simple outcomes of an
experiment, the "fairest" way to assign probabilities is to equally
distribute them among the outcomes.

More formally: let $cal(S)$ be a sample space constituted by $n$ simple
events ${A_(1), dots, A_(n)}$. If there isn't enough information on what
the values of $P(A_(1)), dots, P(A_(n))$ should be, then it has to be
assumed $P(A_(1)) = dots = P(A_(n)) = 1 slash n$.

The Principle is highly contentious, and if applied incorrectly can lead
to irrational results. Moreover, it can't be applied to continuous sample
spaces. However, it is often invoked (even without mention) when no other
option is possible, and an assignment done invoking the Principle is always
compliant with the Kolmogorov axioms.

#exercise[
	Assign probabilities to the events of @Experiments, applying the
	Principle of Indifference.
]
#solution[
	- Rolling a six-sided die is an experiment with $abs(cal(S)) = 6$.
	  Applying the Principle of Indifference:

	  $ P({1}) = P({2}) = P({3}) = P({4}) = P({5}) = P({6}) = frac(1, 6) $

	- Drawing a card from a (standard) deck is an experiment with
	  $abs(cal(S)) = 52$. Applying the Principle of Indifference:

	  $ P({A suit.heart}) &= P({2 suit.heart}) = dots = P({K suit.heart}) =
	     P({A suit.diamond}) = P({2 suit.diamond}) = dots = P({K suit.diamond}) = \
	     P({A suit.club}) &= P({2 suit.club}) = dots = P({K suit.club}) =
	     P({A suit.spade}) = P({2 suit.spade}) = dots = P({K suit.spade}) =
	     frac(1, 52) $

	- Tossing three coins is an experiment with $abs(cal(S)) = 6$.
	  Applying the Principle of Indifference:

	  $ P({T T T}) &= P({T T H}) = P({T H T}) = P({H T T}) = \
	    P({T H H}) &= P({H H T}) = P({H T H}) = P({H H H}) = frac(1, 8) $
]

From the Kolmogorov axioms, many more useful properties can be derived.

#lemma[
	For any sample space $cal(S)$, $P(emptyset) = 0$. That is, the null
	event cannot occur.
] <Null-event-has-probability-zero>
#proof[
	Consider the countably infinite collection of events $emptyset,
	emptyset, dots$. Set algebra states that $emptyset union emptyset
	union dots = emptyset$, therefore $P(emptyset union emptyset union
	dots) = P(emptyset)$. Set algebra also states that $emptyset inter
	emptyset = emptyset$, which means that $emptyset, emptyset, dots$
	is a countably infinite collection disjoint events. Applying 
	@Kolmogorov-axiom-3:

	$ P(emptyset) = 
	  P(emptyset union emptyset union dots) =
	  sum_(i = 1)^(infinity) P(emptyset) $

	@Kolmogorov-axiom-1 states that $P(emptyset)$ has to be non-negative,
	and the only way for $P(emptyset)$ to be greater than or equal to $0$
	while at the same time being equal to $sum_(i = 1)^(infinity) P(emptyset)$
	is for $P(emptyset)$ to be $0$.
]

#lemma[
	Let $cal(S)$ be a sample space. If $A_(1), A_(2), dots, A_(n) subset.eq
	cal(S)$ is a finite collection of disjoint events, the following equality
	holds:

	$ P(A_(1) union A_(2) union dots union A_(n)) =
	  sum_(i = 1)^(n) P(A_(i)) $

	Which means that @Kolmogorov-axiom-3 can be extended to finite
	collections as well.
] <Kolmogorov-axiom-3-revisited>
#proof[
	Consider the countably infinite collection of events:

	$ A_(1), A_(2), dots, A_(n), A_(n + 1) = emptyset, A_(n + 2) = emptyset, dots $

	Which is the original collection but infinitely extended with empty
	sets. By definition, $A inter emptyset = emptyset$ for any set $A$,
	which means that this collection is a countably infinite collection
	of disjoint events. Applying @Kolmogorov-axiom-3:

	$ P(A_(1) union A_(2) union dots union A_(n) union emptyset union emptyset
	  union dots) = sum_(i = 1)^(infinity) P(A_(i)) $

	It is possible to split the summation in two like so:

	$ P(A_(1) union A_(2) union dots union A_(n)) +
	  P(emptyset union emptyset union dots) =
	  sum_(i = 1)^(n) P(A_(i)) + sum_(i = n + 1)^(infinity) P(emptyset) $

	But @Null-event-has-probability-zero states that $P(emptyset) = 0$,
	therefore:

	$ P(A_(1) union A_(2) union dots union A_(n)) + P(emptyset union
	  emptyset union dots) = P(A_(1) union A_(2) union dots union A_(n))
	  + 0 = sum_(i = 1)^(n) P(A_(i)) $
]

#exercise[
	Consider the three events:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ A = {7 suit.heart, 7 suit.diamond, 7 suit.club, 7 suit.spade} $],
		[$ B = {K suit.heart, K suit.diamond, K suit.club, K suit.spade} $],
		[$ C = {A suit.diamond, 2 suit.diamond, dots, K suit.diamond} $]
	)

	What are $P(A)$, $P(B)$ and $P(C)$?
] <Three-events>
#proof[
	The three compound events are constituted by single events that are all
	disjoint with each other. By Principle of Indifference, each of these
	single events has probability $1 slash 52$. @Kolmogorov-axiom-3-revisited
	can then be applied:

	$ P(A) &=
	  P({7 suit.heart, 7 suit.diamond, 7 suit.club, 7 suit.spade}) =
	  P({7 suit.heart}) + P({7 suit.diamond}) + P({7 suit.club}) + P({7 suit.spade}) = \
	  &= frac(1, 52) + frac(1, 52) + frac(1, 52) + frac(1, 52) = frac(4, 52) = frac(1, 13) \
	  P(B) &=
	  P({K suit.heart, K suit.diamond, K suit.club, K suit.spade}) =
	  P({K suit.heart}) + P({K suit.diamond}) + P({K suit.club}) + P({K suit.spade}) = \
	  &= frac(1, 52) + frac(1, 52) + frac(1, 52) + frac(1, 52) = frac(4, 52) = frac(1, 13) \
	  P(C) &=
	  P({A suit.diamond, 2 suit.diamond, dots, K suit.diamond}) =
	  P({A suit.diamond}) + P({2 suit.diamond}) + dots + P({K suit.diamond}) = \
	  &= frac(1, 52) + frac(1, 52) + dots + frac(1, 52) = frac(13, 52) = frac(1, 4) $
]

#theorem("Complement rule")[
	For any sample space $cal(S)$ and any event $A subset.eq cal(S)$:

	$ P(A) + P(A^(c)) = 1 $
] <Complement-rule>
#proof[
	By set algebra, $A union A^(c) = cal(S)$. Since @Kolmogorov-axiom-2
	states that $P(cal(S)) = 1$, then $P(A union A^(c)) = 1$. Also, set
	algebra dictates that $A inter A^(c) = emptyset$, which means that
	$A$ and $A^(c)$ are disjoint events. Applying @Kolmogorov-axiom-3-revisited:

	$ sum_(i = 1)^(2) P(A_(i)) = P(A) + P(A^(c)) = P(A union A^(c)) = 1 $
]

#lemma[
	For any sample space $cal(S)$ and any event $A subset.eq cal(S)$,
	$0 lt.eq P(A) lt.eq 1$.
] <Double-boundary-on-probability-value>
#proof[
	By @Complement-rule, $P(A) + P(A^(c)) = 1$. Since @Kolmogorov-axiom-2
	states that both $P(A)$ and $P(A^(c))$ can't be negative, the only way
	for $P(A) + P(A^(c)) = 1$ to be true is if both $P(A)$ and $P(A^(c))$
	are less than or equal to $1$. Combining both boundaries, $0 lt.eq P(A)
	lt.eq 1$.
]

#theorem("Addition law")[
	For any sample space $cal(S)$ and any two events $A, B subset.eq cal(S)$:

	$ P(A union B) = P(A) + P(B) - P(A inter B) $
] <Addition-law>
#proof[
	From set algebra, it is possible to rewrite both $A union B$ and $B$
	as the union of two disjoint events:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ A union B = A union (A^(c) inter B) $],
		[$ B = (A^(c) inter B) union (A inter B) $]
	)

	Applying @Kolmogorov-axiom-3-revisited to both expression:

	$ P(A union B) &= P(A union (A^(c) inter B)) = P(A) + P(A^(c) inter B) \
	  P(B) &= P((A^(c) inter B) union (A inter B)) = P(A^(c) inter B) + P(A inter B) $

	Moving $P(A inter B)$ to the left hand side of the second expression
	gives $P(B) - P(A inter B) = P(A^(c) inter B)$. Substituting into the
	first equation gives $P(A union B) = P(A) + P(B) - P(A inter B)$.
]

#exercise[
	Consider @Three-events. What is $P(A union B union C)$?
]
#proof[
	$P(A union B union C)$ is equivalent to $P((A union B) union C)$.
	$A union B$ is the union of two disjoint events, since $A inter B =
	emptyset$, which means that @Kolmogorov-axiom-3 can be applied.
	This gives:

	$ P(A union B) = P(A) + P(B) = frac(1, 13) + frac(1, 13) = frac(2, 13) $

	On the other hand, $A union B$ and $C$ are not disjoint:

	$ (A union B) inter C =
	  {7 suit.heart, 7 suit.diamond, 7 suit.club, 7 suit.spade,
	   K suit.heart, K suit.diamond, K suit.club, K suit.spade} 
	  inter {A suit.diamond, 2 suit.diamond, dots, K suit.diamond} =
	  {7 suit.diamond, K suit.diamond} $

	By Principle of Indifference:

	$ P((A union B) inter C) =
	  P({7 suit.diamond, K suit.diamond}) =
	  P({7 suit.diamond}) + P({K suit.diamond}) =
	  frac(1, 52) + frac(1, 52) = frac(1, 26) $

	Applying @Addition-law:

	$ P(A union B union C) =
	  P(A union B) + P(C) - P((A union B) inter C) =
	  frac(2, 13) + frac(1, 4) - frac(1, 26) = frac(19, 52) $
]

#theorem("Boole's inequality")[
	For any sample space $cal(S)$ any countable (possibly
	infinite) collection of events $A_(1), A_(2), dots, A_(n)
	subset.eq cal(S)$:

	$ P(union.big_(i = 1)^(infinity) A_(i)) lt.eq
	  sum_(i = 1)^(infinity) P(A_(i)) $
]
#proof[
	The statement can be proven invoking the Principle of Induction.
	For the base case $n = 1$:

	$ P(union.big_(i = 1)^(infinity) A_(i)) lt.eq sum_(i = 1)^(infinity) P(A_(i)) =>
	  P(union.big_(i = 1)^(1) A_(i)) lt.eq sum_(i = 1)^(1) P(A_(i)) =>
	  P(A_(1)) lt.eq P(A_(1)) $

	Which is trivially true. As for the inductive step, @Addition-law
	states that:

	$ P(union.big_(i = 1)^(n + 1) A_(i)) =
	  P((union.big_(i = 1)^(n) A_(i)) union A_(n + 1)) = 
	  P(union.big_(i = 1)^(n) A_(i)) + P(A_(n + 1)) - P((union.big_(i = 1)^(n) A_(i)) inter A_(n + 1)) $

	Substituting:

	$ & P(union.big_(i = 1)^(n + 1) A_(i)) lt.eq
	  sum_(i = 1)^(n + 1) P(A_(i)) => \
	  & P(union.big_(i = 1)^(n) A_(i)) + cancel(P(A_(n + 1))) - P((union.big_(i = 1)^(n) A_(i)) inter A_(n + 1)) lt.eq
	  cancel(P(A_(n + 1))) + sum_(i = 1)^(n) P(A_(i)) => \
	  & P(union.big_(i = 1)^(n) A_(i)) lt.eq
	  sum_(i = 1)^(n) P(A_(i)) +
	  P((union.big_(i = 1)^(n) A_(i)) inter A_(n + 1)) $

	$P(union.big_(i = 1)^(n) A_(i))$ is smaller than or equal to
	$sum_(i = 1)^(n) P(A_(i))$ by the inductive hypothesis. This
	means that the inequality is true if and only if the second
	term on the right hand side is non-negative. Since this is
	guaranteed by @Kolmogorov-axiom-1, the result is proven.
]

// FIXME: this is cheesy, since it proves the countably finite case only

Probability theory is powerful, but doesn't explain what a probability
value is exactly supposed to be. That is, what is the epistemological
meaning of probability? How is probability "mapped" to reality? As a
matter of fact, probabilities can be assigned to events in any possible
way that is constrained by the axioms even if the result is not applicable
to real life, even if such an assignment defies known physical laws.

#exercise[
	Consider the toss of a six-sided die. Are these probability assignments
	valid?

	#set math.mat(delim: none)
	#set math.mat(row-gap: 1em)

	$ mat(, P({1}), P({2}), P({3}), P({4}), P({5}), P({6});
          "Assignment 1", display(frac(1, 6)), display(frac(1, 6)), display(frac(1, 6)),
                          display(frac(1, 6)), display(frac(1, 6)), display(frac(1, 6));
          "Assignment 2", display(frac(1, 4)), display(frac(1, 6)), display(frac(1, 6)),
                          display(frac(1, 6)), display(frac(1, 6)), display(frac(1, 12));
          "Assignment 3", 0, 0, 0, 0, 0, 1;
          "Assignment 4", display(frac(1, 3)), display(frac(1, 6)), display(frac(1, 6)),
                          display(frac(1, 3)), display(frac(1, 6)), -display(frac(1, 6));
          "Assignment 5", display(frac(1, 3)), display(frac(1, 6)), display(frac(1, 8)),
                          display(frac(1, 3)), display(frac(1, 6)), display(frac(1, 8));
          augment: #(hline: 1, vline: 1);
	) $
]
#solution[
	+ Yes, since it complies with @Kolmogorov-axiom-1, @Kolmogorov-axiom-2
	  and @Kolmogorov-axiom-3. This is the assignment derived from invoking
	  the Principle of Indifference. Since there is no other information on
	  how the die is constructed, it is reasonable to assume that the die
	  can land to any side;
	+ Yes, since it complies with @Kolmogorov-axiom-1, @Kolmogorov-axiom-2
	  and @Kolmogorov-axiom-3. If the die is loaded, meaning that it has been
	  crafted in such a way that the center of mass is not in its geometrical
	  center, this assignment is actually possible;
	+ Yes, since it complies with @Kolmogorov-axiom-1, @Kolmogorov-axiom-2
	  and @Kolmogorov-axiom-3. However, there is no real world die that can
	  be described by this assignment: it's impossible to construct a die,
	  no matter how precisely, that will always land on the same side;
	+ No, because it defies @Kolmogorov-axiom-1, since $P({6}) lt.eq 0$;
	+ No, because it defies @Kolmogorov-axiom-2:

	  $ P(cal(S)) &= P({1}) + P({2}) + P({3}) + P({4}) + P({5}) + P({6}) = \
	    &= frac(1, 3) + frac(1, 6) + frac(1, 8) + frac(1, 3) + frac(1, 6) + frac(1, 8) =
	    frac(5, 4) $
]

There are multiple schools of thought in regards to interpreting
probability in an epistemological sense. Most interpretations
fall into two broad categories: *objective* interpretations,
such as the *frequentist* interpretation, and *subjective*
interpretations, such as the *Bayesian* interpretation.

The frequentist interpretation relies on empirical data for assigning
probabilities. Consider an experiment that can be repeatedly performed
in the exact same way (tossing a coin, rolling a die, drawing a card,
ecc...). Let $A$ be any event; if the experiment is performed $n$ times,
the event $A$ will occur $n(A)$ times (with $0 lt.eq n(A) lt.eq n$).
The ratio $n(A) slash n$ is called the *relative frequency* of occurrence
of $A$ in the sequence of $n$ attempts.

Empirical data suggests that the relative frequency fluctuates considerably
if $n$ is a small number, while tends to stabilize itself as $n$ grows.
Ideally, repeating such experiment infinitely many times, it would be
possible to obtain a "perfect" frequency, called *limiting relative
frequency*. The frequentist interpretation of probability states that this
limiting relative frequency is precisely the probability that should be
assigned to $A$.

#figure(
	caption: [Result of simulating a dice roll using the `sample` function
	          in R. The horizontal black line has as intercept $1 slash 6$,
	          the probability of rolling any face, understood to be the
	          limiting relative frequency. The blue line interpolates the
	          relative frequencies computed at each iteration. Even though
	          in the earlier iterations the two frequencies don't match,
	          they get closer as the iterations increase.],
	image("die.svg", width: 100%)
)

This interpretation of probability is said to be objective in the sense
that it rests on a fact of nature and not on the concerns of the agent
performing it. Ideally, two agents performing the same experiment the
same number of times would obtain the same relative limiting frequency.
Note that not all real-world phenomena can be tested multiple times,
which means that its applicability is limited #footnote[It could be
objected that, even though a physical experiment might not be possible,
a simulated experiment on a computer could. However, this is only true
to some extent, since there are phenomena that are impossibly hard to
model, or too computationally expensive.].

The Bayesian interpretation relies instead on a "degree of confidence"
with which an agent believes an event to occur, meaning that different
agents will have different descriptions of the same phenomena. The
probability assigned to an event is precisely this degree of confidence,
that can change if the agent acquires more knowledge on the generation
of the event.
