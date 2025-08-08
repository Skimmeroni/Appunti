#import "../AI_definitions.typ": *

Propositional logic deals with statements that can have only two
possible truth values: true ($1$) or false ($0$). Given a statement
$alpha$, its truth value is denoted by $dsl alpha dsr$.

Propositions are combined with each other using logical connectives.
The most fundamental connectives are *conjuction* (denoted as $and$),
*disjunction* (denoted as $or$), *implication* (denoted as $->$) and
*negation* (denoted as $not$). The first three are binary operators,
the last one is unary. The set ${and, or, ->, not}$ is sufficient to
construct all possible composite propositions.

Let $u_(and), u_(or), u_(->), u_(not)$ be the functions that have
truth values as input and the truth value of applying the respective
logical connective as output. the first three functions map the set
${0, 1}^(2)$ to ${0, 1}$, the last one maps the set ${0, 1}$ to ${0, 1}$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ u_(and)(dsl alpha dsr, dsl beta dsr) : {0, 1}^(2) mapsto {0, 1} = dsl alpha and beta dsr \
	   u_(->)(dsl alpha dsr, dsl beta dsr) : {0, 1}^(2) mapsto {0, 1} = dsl alpha -> beta dsr $],
	[$ u_(or)(dsl alpha dsr, dsl beta dsr) : {0, 1}^(2) mapsto {0, 1} = dsl alpha or beta dsr \
	   u_(not)(dsl alpha dsr) : {0, 1} mapsto {0, 1} = dsl not alpha dsr $]
)

Since all four functions operate on discrete inputs, they can be computed
simply by enumeration. This is done with the help of *truth tables*:

#grid(
	columns: (0.275fr, 0.275fr, 0.275fr, 0.175fr),
	[$ mat(delim: "[",
	       dsl alpha dsr, dsl beta dsr, dsl alpha and beta dsr;
	       0, 0, 1; 1, 0, 0; 0, 1, 0; 1, 1, 0;
	       augment: #(-1)) $],
	[$ mat(delim: "[",
	       dsl alpha dsr, dsl beta dsr, dsl alpha or beta dsr;
	       0, 0, 1; 1, 0, 1; 0, 1, 1; 1, 1, 0;
	       augment: #(-1)) $],
	[$ mat(delim: "[",
	       dsl alpha dsr, dsl beta dsr, dsl alpha -> beta dsr;
	       0, 0, 1; 1, 0, 0; 0, 1, 1; 1, 1, 1;
	       augment: #(-1)) $],
	[$ mat(delim: "[",
	       dsl alpha dsr, dsl not alpha dsr;
	       0, 1; 1, 0;
	       augment: #(-1)) $],
)

The problem that arose in using set theory when modelling spurious
memberships manifests itself in logic as well. That is, propositional
logic asserts that propositions ought to be either unambiguously true
or unambiguously false, but for most real-world propositions a more
nuanced notion of truth is necessary. For example, *ternary logic*
is a form of logic where statements can either be true, false or
_undefined_ (neither true nor false).

In general, logics where there are more than two truth values are
called *multi-valued logics*. The multi-valued logic of interest
here is *fuzzy logic*, where the possible truth values are all real
numbers in the interval $[0, 1]$. That is, the closer a truth value
is to $1$ "the more true" the statement is, the closer a truth value
is to $0$ "the more false" the statement is. If the truth value of a
statement is $1$, then the statement is unambiguously true, if the
truth value is $0$ then it is unambiguously false.

Fuzzy propositions, on their own, are insufficient to build a logic.
It is also necessary to extend logical operators of "standard" (non
fuzzy) logic to fuzzy logic. More specifically, it is necessary to
extend the way truth values are assigned in non fuzzy logic to fuzzy
logic. Let $w_(and), w_(or), w_(->), w_(not)$ be the functions that
have fuzzy propositions as input and the truth value of applying the
respective logical connective as output. the first three functions
map the interval $[0, 1]^(2)$ to $[0, 1]$, the last one maps the
interval $[0, 1]$ to $[0, 1]$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ w_(and)(dsl alpha dsr, dsl beta dsr) : [0, 1]^(2) mapsto [0, 1] = dsl alpha and beta dsr \
	   w_(->)(dsl alpha dsr, dsl beta dsr) : [0, 1]^(2) mapsto [0, 1] = dsl alpha -> beta dsr $],
	[$ w_(or)(dsl alpha dsr, dsl beta dsr) : [0, 1]^(2) mapsto [0, 1] = dsl alpha or beta dsr \
	   w_(not)(dsl alpha dsr) : [0, 1] mapsto [0, 1] = dsl not alpha dsr $]
)

The simplest way to extend the truth function of logical operators to
fuzzy logic follows the same lines as extending set operators to fuzzy
sets. Observe how, for any pair of propositions $alpha$ and $beta$, in
propositional/predicative logic the truth value of $alpha and beta$ is
just the minimum between the truth value of $alpha$ and $beta$. Similarly,
$dsl alpha and beta dsr$ is just the minimum between $dsl alpha dsr$ and
$dsl beta dsr$. Finally, the truth value of the complement of a proposition
is just $1$ minus said value. This gives:

$ w_(and)(dsl alpha dsr, dsl beta dsr) &= u_(and)(dsl alpha dsr, dsl beta dsr) = dsl alpha and beta dsr = min{dsl alpha dsr, dsl beta dsr} \
  w_(or)(dsl alpha dsr, dsl beta dsr) &= u_(or)(dsl alpha dsr, dsl beta dsr) = dsl alpha or beta dsr = max{dsl alpha dsr, dsl beta dsr} \
  w_(not)(dsl alpha dsr) &= u_(not)(dsl alpha dsr) = dsl not alpha dsr = 1 - dsl alpha dsr $

This is a reasonable choice, but not the only choice. Different choices
for the truth value functions are better suited for different scenarios.
To discover other candidate functions, the best approach is to lay out
which requirements such functions should possess and restrict the
exploration to those. In other words, the idea is to determine which
properties the truth value of the classical logical operators possess
and which of said properties are worth preserving.

A requirement that should be transversal to all truth functions is that
they ensure compatibility between fuzzy logical operators and classical
logical operators. That is, "fuzzy" conjunction, "fuzzy" disjunction,
"fuzzy" implication and "fuzzy" negation, when given (exactly) $0$ or
(exactly) $1$ as input, should return the same outputs as "classical"
conjunction, "classical" disjunction, "classical" implication and
"classical" negation, respectively.

First, consider possible candidates for implementing the truth function
for fuzzy conjunction. Any function $t: [0, 1]^(2) mapsto [0, 1]$ is
said to be a $t$-*norm*, or *triangular norm*, if it possesses the
following properties:

- *Commutativity*: for any $x, y$, $t(x, y) = t(y, x)$;
- *Associativity*: for any $x, y, z$, $t(t(x, y), z) = t(x, t(y, z))$;
- *Monotonicity*: for any $x, y, z$, if $y lt.eq z$ then $t(x, y) lt.eq t(x, z)$;
- *Boundedness*: for any $x$, $t(x, 1) = x$.

It is advisable to choose a $t$-norm as the truth function for the
logical conjunction, since these properties are those that any reasonable
implementation should possess. Indeed, $min{dsl alpha dsr, dsl beta dsr}$,
the truth function of non-fuzzy conjunction, possesses all these four
properties, which made it the first-class choice for the truth function
for fuzzy conjunction. Other examples of $t$-norms are the:

#grid(
	columns: (0.5fr, 0.5fr),
	[*Łukasiewicz t-norm*:
	$ t(x, y) = max{x + y - 1, 0} $
	#image("Norm_graphs/lukasiewicz_norm.svg", width: 66%)],
	[*Algebraic product*:
	$ t(x, y) = x dot y $
	#image("Norm_graphs/algebraic_product.svg", width: 66%)]
)

#grid(
	columns: (0.5fr, 0.5fr),
	[*Drastic product*:
	$ t(x, y) = cases(0 & "if" 1 in.not {x, y}, min{x, y} & "otherwise") $
	#image("Norm_graphs/drastic_product.svg", width: 66%)],
	[*Nilpotent minimum*:
	$ t(x, y) = cases(min{x, y} & "if" x + y > 1, 0 & "otherwise") $
	#image("Norm_graphs/nilpotent_minimum.svg", width: 66%)]
)

Also, from the boundedness property, it follows that $t(1, 1) = 1$ and
$t(0, 1) = 0$ for any $t$-norm. Applying the commutative property to
$t(0, 1) = 0$ one obtains $t(1, 0) = 0$. Applying the monotonic property
to $t(0, 1) = 0$ gives $t(0, 0) = 0$. Therefore, any $t$-norm behaves in
the exact same way as the truth function of the logical conjunction when
giving $0$ and/or $1$ as input.

The family of $t$-norms is very broad. $min{x, y}$ stands out among the
other t-norms because it is *idempotent*, meaning that $t(x, x) = x$ for
all $x in [0, 1]$. This might seem a mandatory requirement, but it is not.
There are scenarios where idempotency is actually undesireable.

// Maybe add the example of the house sale.

A function $s: [0, 1]^(2) mapsto [0, 1]$ is said to be a $t$-*conorm*,
or *triangular conorm*, if it possesses the first three properties
of a $t$-norm (commutativity, associativity, monotonicity) and, for
any $x$, $s(x, 0) = x$. Similarly to how it was done for the $t$-norm,
it is advisable to choose a $t$-conorm as a logical disjunction, and
the truth function $max{dsl alpha dsr, dsl beta dsr}$ for the non-fuzzy
disjunction is indeed a $t$-conorm.

$t$-norms and $t$-conorms possess a form of duality: from any $t$-norm
$t$ it is possible to induce a dual $t$-conorm $s$, and from any $t$-conorm
$s$ it is possible to induce a dual $t$-norm $t$. This is done as follows:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ s(x, y) = 1 - t(1 - x, 1 - y) $],
	[$ t(x, y) = 1 - s(1 - x, 1 - y) $]
)

These relations are a generalization of the *De Morgan's Laws* for classical
logic:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ dsl alpha or beta dsr = dsl not (not alpha and not beta) dsr $],
	[$ dsl alpha and beta dsr = dsl not (not alpha or not beta) dsr $]
)

Applying this duality relation to $max{x, y}$ gives $min{x, y}$. This
means that $max{dsl alpha dsr, dsl beta dsr}$, the truth function of
the non-fuzzy conjunction, and $min{dsl alpha dsr, dsl beta dsr}$, the
truth function of the non-fuzzy disjunction, are each other's dual. Applying
the relation to the Łukasiewicz t-norm, the algebraic product, the drastic
product and the nilpotent minimum respectively, one obtains the following
conorms:

#grid(
	columns: (0.5fr, 0.5fr),
	[*Łukasiewicz t-conorm*:
	$ s(x, y) = max{x + y, 1} $
	#image("Norm_graphs/lukasiewicz_conorm.svg", width: 66%)],
	[*Algebraic sum*:
	$ s(x, y) = x + y - x dot y $
	#image("Norm_graphs/algebraic_sum.svg", width: 66%)]
)

#grid(
	columns: (0.5fr, 0.5fr),
	[*Drastic sum*:
	$ s(x, y) = cases(1 & "if" 0 in.not {x, y}, max{x, y} & "otherwise") $
	#image("Norm_graphs/drastic_sum.svg", width: 66%)],
	[*Nilpotent maximum*:
	$ t(x, y) = cases(max{x, y} & "if" x + y < 1, 1 & "otherwise") $
	#image("Norm_graphs/nilpotent_maximum.svg", width: 66%)]
)

Analogously to $min{x, y}$, $max{x, y}$ is the only $t$-conorm that is
idempotent. Also, $min{x, y}$ and $max{x, y}$ are the only $t$-norm and
$t$-conorm that are the dual of each other possessing the distributive
property.

In addition to the connection between $t$-norms and $t$-conorms, there exist
a connection between $t$-norms and implications. A continuous $t$-norm $t$
induces a *residuated implication* as:

$ arrow(t)(x, y) = sup{z in [0, 1] | t(x, z) lt.eq y} $

Substituting the Łukasiewicz $t$-norm in the aforementioned formula
gives the *Łukasiewicz implication* (left), while substituting the
minimum gives the *Gödel implication* (right):

#grid(
	columns: (0.5fr, 0.5fr),
	[$ x -> y = min{1 - x + y, 1} $],
	[$ x -> y = cases(1 & "if" x lt.eq y, 0 & "otherwise") $]
)

From the residuated implication one can construct the *biimplication*
$accent(t, arrow.l.r)$ as:

$ accent(t, arrow.l.r) = arrow(t)(max{x, y}, min{x, y}) =
  t(arrow(t)(x, y), arrow(t)(y, x)) = min{arrow(t)(x, y), arrow(t)(y, x)} $

This formula is motivated from the fact that, in classical logic,
$dsl alpha <-> beta dsr$ is just $dsl alpha -> beta and beta -> alpha dsr$.

The remaining element whose truth function are to be generalized are
the *universal quantifier* $forall$ (forall) and the *existential
quantifier* $exists$ (exists). To perform this generalization, it is
possible to exploit the link between $forall$ and $t$-norms and between
$exists$ and $t$-conorms.

Consider a universe $U$ and a predicate $P(x)$; the statement "for any
element of $U$, $P$ holds" is equivalent to the statement "$P$ holds for
the first element of $U$ _and_ for the second element of $U$ _and_ for
the third element of $U$ ecc...". More formally:

$ dsl forall x in U: P(x) dsr equiv dsl P(x_(1)) and P(x_(2)) and P(x_(3)) and dots dsr $

Using, for example, $min$ as $t$-norm gives:

$ dsl forall x in U: P(x) dsr =
  min{dsl P(x_(1)) dsr, dsl P(x_(2)) dsr, dsl P(x_(3)) dsr, dots} =
  min{dsl P(x) dsr | x in U} $

In the more general case of a universe $U$ that is uncountably infinite:

$ dsl forall x in U: P(x) dsr = inf{dsl P(x) dsr | x in U} $

In a similar fashion, the statement "there's at least an element of $U$
for which $P$ holds" is equivalent to the statement "$P$ holds for
the first element of $U$ _or_ for the second element of $U$ _or_ for
the third element of $U$ ecc...":

$ dsl exists x in U: P(x) dsr equiv dsl P(x_(1)) or P(x_(2)) or P(x_(3)) or dots dsr $

Using, $max$ as $t$-conorm gives:

$ dsl exists x in U: P(x) dsr = sup{dsl P(x) dsr | x in U} $

Even though $min$ and $max$ could be replaced with any other $t$-norm
and $t$-conorm respectively, this is rarely the case. This is because,
in general, $t$-norms and $t$-conorms are not idempotent, which easily
leads to "degenerate" truth values in the case of uncountably infinite
universes.

#exercise[
	Consider @Fuzzy-height. Let $P(x)$ be the statement "$x$ is tall"
	and let $mu(x)$ be the truth value of said statement, that is $mu(x)
	= dsl P(x) dsr$. What would be the truth value of the statement "all
	people of height between $1.70$ and $1.80$ metres are tall"?
]
#solution[
	The statement can be written as:

	$ dsl forall x in [1.70, 1.80]: P(x) dsr =
	  inf{dsl P(x) dsr | x in [1.70, 1.80]} $

	Substituting $dsl P(x) dsr$ with $mu(x)$:

	$ inf{dsl P(x) dsr | x in [1.70, 1.80]} =
	  inf{mu(x) | x in [1.70, 1.80]} =
	  mu(1.70) =
	  0.25 $

	Since $mu(x)$ is monotonically non-decreasing.
]
