#import "../AI_definitions.typ": *

The applications of optimization problems are not confined to strictly
numerical problems. They can be employed to study social interactions
and the behaviours and choices of individuals. The framework under which
*rational agents* are studied is *game theory*, where the decisions of
two or more agents and the impact that they have are modeled as a game
that they play. The problem of finding the set of decisions that give
the best outcome for an agent is translated into finding a winning
strategy for the game.

A paradigmatic example of problem in game theory is the *Prisoner's
Dilemma* #footnote[The name "Prisoner's Dilemma" is somewhat misleading,
since the two agents in the problem are suspects, not inmates. A more
appropriate name would the "the Suspects' Dilemma".], where two agents
are compelled to make a choice between cooperating with each other or
betraying one another. The interest of the problem is finding out (in
the context of the problem) which of the two strategies is the most
effective, either with respect to their self-interest or with respect
to the interest of both.

The problem can be phrased as follows. Two individuals found in
possession of illegal fire arms are taken into custody. Not only
that, but they are also suspected of being involved in a bank heist.
Since there isn't sufficient evidence for framing them for robbery,
the sheriff offers them a choice. If one of the two testifies as key
witness and confesses that they both are indeed bank robbers, he will
be acquainted of all charges for both crimes ($0$ years jail time, that
is), whereas the other suspect will be jailed for $10$ years. However,
if they both plead guilty, the key witness priviledge won't apply, and
they will both be jailed for $5$ years. If both do not confess, since
the evidence for illegal firearm possession is undisputed, they will
both be in jail for $1$ year. What would be the best strategy that the
two prisoners should choose to get as little jail time as possible?
To confess or to refrain?

Two-player problems such as these are often represented as matrices,
called *payoff matrices*: the two sides (up-down and left-right) represent
the two players, the rows/columns represent the choices that the two can
make and the entries are the _payoffs_, the material advantage gained by
the player for each combination of choices.

Since the Prisoner's Dilemma has two choices (refrain/confess) that each
player can make, the matrix has four entries, corresponding to the four
possibilities: both refrain, both confess, first refrains and second
confesses, first confesses and second refrains. The values is the entries
are the jail time served for each player for a given choice of actions.
Since the desider outcome in game theory problems is often intended as the
_maximum_ advantage, whereas the suspects are interested in _minimizing_
jail time, these values are written as negative numbers, so that the
highest value (the most sought after) is $0$.

#figure(
	caption: [The payoff matrix for the Prisoner's Dilemma.],
	[#nfg(
		players: ("Suspect 1", "Suspect 2"),
		s1: ("Refrain", "Confess"),
		s2: ("Refrain", "Confess"),
		[$-1, -1$], [$-10, 0$], [$0, -10$], [$-5, -5$]
	)]
)

From a global perspective, it is clear that the best choice would be to
refrain, since they would both get a feasible $1$ year jail time. However,
if both prisoners were to unapologetically behave to maximize their best
interest, they would both choose to confess, since it's the option that
gives the highest payoff. Yet, if both prisoners confess, hence they both
behave "rationally" from their own perspective, the result is sub-optimal,
with both having to serve $5$ years in prison.

Technically speaking, a double confession is the so-called *Nash equilibrium*
of this payoff matrix: neither agent can improve its payoff by changing
its action, while the other agent maintains the same action. If both
players confess and only one of them could theoretically change its
action retroactively, it would actually just worsen the situation (from
$-5$ to $0$, that is). An improvement is only possible if both agents
change their action.

The Prisoner's Dilemma can be generalized to an abstract two-player
game where both players, wanting to maximize their gain, can choose
one move out of two in each iteration. These two moves are _cooperating_
and _betraying_: in the first, they both obtain a little reward, in the
second, one obtains a great reward and the other obtains nothing. A
payoff matrix can encode the four possible outcomes $(T, R, P, S)$,
where:

- $T$: the player has betrayed and the other tried to cooperate (_temptation to defect_);
- $R$: both prisoners have cooperated (_reward for mutual cooperation_);
- $P$: prisoners betrayed each other (_punishment for mutual defection_);
- $S$: the player tried to cooperate, but the other betrayed (_sucker's payoff_).

#figure(
	caption: [The generalized payoff matrix for the Prisoner's Dilemma.],
	[#nfg(
		players: ($A$, $B$),
		s1: ("Cooperate", "Betray"),
		s2: ("Cooperate", "Betray"),
		[$R, R$], [$S, T$], [$T, S$], [$P, P$]
	)]
)

The values of $T, R, P, S$ can be any quadruplet that satisfies 
the two following constraints:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ T > R > P > S $],
	[$ 2R > T + S $]
)

The left inequality states that looking after oneself should yield
an higher payoff than cooperating, and that being betrayed results
in a unfavorable outcome, otherwise there would be no point in being
self-interested. It also states that being altruistic is better than
being betrayed, otherwise there would be no point in cooperating.
The right inequality states that making ongoing cooperation preferable
to alternating exploitation. With these conditions, mutual defection
is a Nash equilibrium of the payoff matrix.

The most interesting aspect of the Prisoner's Dilemma is that it models
many real-world social interactions where two agents (not necessarely
two humans) have to choose between helping each other out towards a common
goal or being selfish and trying to take advantage of one another. From
the point of view of the Dilemma, it would seem that the second choice
is better, since, again, exploitation allows for a greater potential gain
than collaboration. But if this is the case, it begs the question:
why do most living beings (humans, animals, ecc...) favour altruism
over egoism? If cooperating is worse than competing, should have evolution
ruled it out?

First, it is clear that, despite its wide range of applicability, the
Dilemma is a very limited model. For example, most real-world social
interactions are episodic, meaning that after interacting with someone
there's a good chance that many more other interactions with the same
person/agent will happen in the near future. Also, it assumes perfect
transfer of information, that is, both agents know with exact certainty
which action the other agent has taken.

An extension of the Prisoner's Dilemma in this sense is the *Iterated
Prisoner's Dilemma*, where the two parties have to take the same actions
(cooperating/betraying) in multiple iterations. The rationale behind the
Iterated Prisoner's Dilemma is that cooperating could be more enticing
in the long run, since now actions have consequences: if one of the two
players starts being selfish, the other might seek revenge in the following
iterations, also acting self-interested. In the original formulation of the
problem this form of retaliation was not possible, since each player could
only choose their action once.

In a known experiment, many strategies of varying complexity were tested
against one another, to see which one, on average, managed to secure the
highest number of points to the user employing it. Each strategy would
compete in a round robin tournament, meaning that each would have to be
paired once with each other strategy. Each strategy had to compete against
the other for $200$ rounds for each opponent. The strategies had access to
the history of games that they played against their opponent, in order to
get the upper hand by exploiting previously intercepted weaknesses. The
"fitness" of each strategy was defined as the cumulative payoff obtained
by the player in the entirety of the tournament.

Out of all the strategies ("always betray", "always cooperate", "only
cooperate every $n$ games", "choose randomly", ecc...) the winner was
a very simple strategy that came to be known as _tit for tat_. The
strategy was as follows: in the first game, always cooperate; in the
following games, copy the move of the other player in the previous game.
Even after repeating the experiment a second time, with revised and
improved strategies, the winner was still _tit for tat_.

This is interesting, because _tit for tat_ is not a strategy that will
win in every game. For example, playing _tit for tat_ against the _always
betray_ strategy results in a guaranteed loss, because in the first game
_tit for tat_ will cooperate and always defect in the following games,
resulting in a net payoff loss and $n - 1$ ties. Also, if two _tit for
tat_ strategies are playing against each other, if by chance one of the
two betrays by mistake, they would keep on betraying and cooperating
changing they their roles back and forth, resulting in a very low quality.

An alternative strategy that does not fall to this issue could be _tit for
two tats_, that starts betraying only after two betrayal in a row by the
opponent. Note that this strategy is vulnerable to an opponent that already
knows one will employ it, since it just needs to alternate back and forth
between betraying and cooperating to win by a large margin.

The problem of finding out which strategy is the best can be solved in
a more formal and substanciated way by employing a genetic algorithm,
where each chromosome represents a strategy. Each gene of the chromosome
corresponds to which move should be played in response to a specific
history of matches. More specifically, each gene represented the action
to take (cooperate, $0$, or betray, $1$) with respect to the actions
taken in the previous three games with the same opponent. For example,
the first allele could represent the action to take if the three previous
games were $((0, 0), (0, 0), (0, 0))$, the second allele the action take
in response to $((1, 0), (0, 0), (0, 0))$, ecc... all the way to $((1, 1),
(1, 1), (1, 1))$. Since each triplet of games involves one out of two
choices for each player, six in total, the number of all possible triplets
(and hence of genes) is $2^(6) = 64$. Each chromosome was also endowed with
$6$ extra bits that contained the "zero" game, a starting condition so
that a strategy could be engineered even in the first game, for a total
of $70$ bits.

The initial population is created by randomly generating sequences
of $70$ bits. The individuals of a population are evaluated by
pairing each individual with sufficiently many opponents that are
randomly selected from the population. In each pairing, 200 matches
were played. The fitness of an individual is the average payoff it
gained per pairing. Individuals are selected for the next generation
according to the simplified expectation value model: let $mu_(f)(t)$
be the average fitness of the individuals in the population at time
$t$ and $sigma_(f)(t)$ its standard deviation. Individuals whose
fitness was lower than $mu_(f)(t) − sigma_(f)(t)$ do not receive
offspring; individuals whose fitness lied between $mu_(f)(t) − sigma_(f)(t)$
and $mu_(f)(t) + sigma_(f)(t)$ got one children and individuals whose
fitness was greater then $mu_(f)(t) + sigma_(f)(t)$ got two. The genetic
operators of choice were standard mutation and one-point crossover.

The algorithm was then run for a certain number of generations and the
best individuals of the final population were examined. The patterns
that most of such fittest individuals exhibited were the following:

- *Don't rock the boat*. If all three games ended up with both of you
  cooperating, keep going: $(0, 0), (0, 0), (0, 0) -> 0$;
- *Be provocable*. If you both cooperated in the first and second games
  but the opponent betrayed you in the third, don't be naive and retaliate:
  $(0, 0), (0, 0), (0, 1) -> 1$;
- *Accept an apology*. If you started cooperating, the opponent exploited
  you in the second game (you cooperated and they betrayed) and then you
  exploited them in the third (you betrayed and they cooperated), start
  cooperating again, since it would seem they are willing to make amend:
  $(0, 0), (0, 1), (1, 0) -> 0$;
- *Forget*. If you cooperated in the first and third game but the
  opponent betrayed you in the second, don't hold a grudge and keep
  cooperating: $(0, 0), (0, 1), (0, 0) -> 0$;
- *Accept a rut*. If you both always defected, keep going, since the
  opponent is most likely self-interested $(1, 1), (1, 1), (1, 1) -> 1$.

The _tit for tat_ strategy clearly possesses all five traits; the
_tit for two tats_ strategy had four out of five, lacking only the
"be provocable" trait, since it started betraying only after two
betrayals by the opponent in a row. This makes it vulnerable to
players who know of this strategy and of its weaknesses, as stated
above, hence it makes sense for this strategy to not be the top
contender.

Note that this result should still not be taken as an argument that
_tit for tat_ is generally the best strategy. Again, a single individual
employing the _tit for tat_ strategy playing in a population that
employs the _always betray_ strategy will always loose. However, if
there's a sufficiently large niche of individuals that employ _tit for
tat_, they will eventually rule out the selfish individuals and take
over the population. This is facilitated if the _tit for tat_ players
can choose their adversaries instead of being paired randomly, since
they will naturally prefer to play against each other and thriving.
