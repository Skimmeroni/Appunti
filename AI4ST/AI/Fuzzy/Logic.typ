#import "../AI_definitions.typ": *

Classical logic deals with propositions that can have only two possible
truth values: true ($1$) or false ($0$). Given a proposition $alpha$,
its truth value is denoted by $dsl alpha dsr$.

Propositions are combined with each other using logical connectives, the
most important being:

- `AND`, conjuction, denoted as $and$;
- `OR`, disjounction, denoted as $or$;
- `IMPLIES`, implication, denoted as $->$;
- `NOT`, negation, denoted as $not$.

The first three are binary operators, mapping the set ${0, 1}^(2)$ to the
set ${0, 1}$, whereas the last one is unary, mapping ${0, 1}$ to itself.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ and, or, ->: {0, 1}^(2) mapsto {0, 1} $],
	[$ not: {0, 1} mapsto {0, 1} $]
)

The truth value of propositions combined using logical connectives are
evaluated using truth tables:

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


Modelling real-world propositions as having exclusively true or false
truth values is often restrictive. It is however possible to extend
classical logic to allow propositions to have more than two possible
truth values: in such formulations, some statements can be neither
true or false.

In particular, *fuzzy logic* is a logic formulation where the possible
truth values is any real number in the interval $[0, 1]$. That is, the
more a truth value is close to $1$ the more it is true, the more is close
to $0$ the more it is false. A truth value of $1 slash 2$ corresponds to
complete undeterminacy.

Logical connectives defined with respect to classical logic can be extended
to be used in fuzzy logic. However, instead of mapping the set ${0, 1}$ or
the set ${0, 1}^(2)$ to the set ${0, 1}$, these extended operators ought to
map the entire interval $[0, 1]$ or the interval $[0, 1]^(2)$ to the entire
interval $[0, 1]$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ and, or, ->: [0, 1]^(2) mapsto [0, 1] $],
	[$ not: [0, 1] mapsto [0, 1] $]
)

The most widely employed definition of the logical conjuction and disjunction
for fuzzy propositions are, respectively, their minimum and their maximum.
In other words, $alpha and beta = min{alpha, beta}$ and $alpha or beta =
max{alpha, beta}$. The negation of a fuzzy proposition is generally given in
term of its one-complement: $not alpha = 1 - alpha$. Implication is either
defined as the *Łukasiewicz implication* or the *Gödel implication*,
respectively:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ alpha -> beta = min{1 - alpha + beta, 1} $],
	[$ alpha -> beta = cases(1 & "if" alpha lt.eq beta, 0 & "otherwise") $]
)

Choosing specifically these functions to extend the logical connectives
is not arbitrary. Indeed, these functions possess many properties that
one expects a logical connective to have. Many more functions belong to
the same family, therefore many reasonable choices could be made.

One additional requirement for choice of implementation of the logical
connectives is the compatibility between them and their classical logical
counterparts. That is, "fuzzy" `AND`, "fuzzy" `OR`, "fuzzy" `IMPLIES` and
"fuzzy" `NOT`, when given (exactly) $0$ or (exactly) $1$ as input, should
behave in the exact same way as "classical" `AND`, "classical" `OR`,
"classical" `IMPLIES` and "classical" `NOT`, respectively.

A function $t: [0, 1]^(2) mapsto [0, 1]$ is said to be a $t$-*norm*, or
*triangular norm*, if it possesses the following properties:

- *Commutativity*: for any $alpha, beta$,
  $t(alpha, beta) = t(beta, alpha)$;
- *Associativity*: for any $alpha, beta, gamma$,
  $t(t(alpha, beta), gamma) = t(alpha, t(beta, gamma))$;
- *Monotonicity*: for any $alpha, beta, gamma$,
  if $beta lt.eq gamma$ then $t(alpha, beta) lt.eq t(alpha, gamma)$;
- *Boundedness*: for any $alpha$,
  $t(alpha, 1) = alpha$.

It is advisable to choose a $t$-norm as a logical conjunction: indeed,
the function $min{alpha, beta}$ chosen to define $alpha and beta$ is
a $t$-norm. Other examples of $t$-norms are the:

#grid(
	columns: (0.5fr, 0.5fr),
	[*Łukasiewicz t-norm*:
	$ t(alpha, beta) = max{alpha + beta - 1, 0} $
	#image("lukasiewicz_norm.svg", width: 66%)],
	[*Algebraic product*:
	$ t(alpha, beta) = alpha dot beta $
	#image("algebraic_product.svg", width: 66%)]
)

#grid(
	columns: (0.5fr, 0.5fr),
	[*Drastic product*:
	$ t(alpha, beta) = cases(0 & "if" 1 in.not {alpha, beta}, min{alpha, beta} & "otherwise") $
	#image("drastic_product.svg", width: 66%)],
	[*Nilpotent minimum*:
	$ t(alpha, beta) = cases(min{alpha, beta} & "if" alpha + beta > 1, 0 & "otherwise") $
	#image("nilpotent_minimum.svg", width: 66%)]
)

Also, from the boundedness property, it follows that $t(1, 1) = 1$ and
$t(0, 1) = 0$ for any $t$-norm. Applying the commutative property to
$t(0, 1) = 0$ one obtains $t(1, 0) = 0$. Applying the monotonic property
to $t(0, 1) = 0$ gives $t(0, 0) = 0$. Therefore, any $t$-norm behaves in
the exact same way as the logical conjunction when giving $0$ and/or $1$
as input.

The family of $t$-norms is very broad: the only property of $min{alpha,
beta}$ that stands out among other $t$-norms, making it an appalling
choice for the logical conjunction, is that it is *idempotent*, meaning
that $t(alpha, alpha) = alpha$ for all $alpha in [0, 1]$. Even though
idempotency can be a desirable property, it would be a mistake to take
it for granted: there are scenarios where idempotency, meaning having
$min$ as the logical conjuction, poorly models the reality one intends
to model.

A function $s: [0, 1]^(2) mapsto [0, 1]$ is said to be a $t$-*conorm*,
or *triangular conorm*, if it possesses the first three properties
of a $t$-norm (commutativity, associativity, monotonicity) and, for
any $alpha$, $s(alpha, 0) = alpha$. Similarly to how it was done for
the $t$-norm, it is advisable to choose a $t$-conorm as a logical
disjunction, and the function $max{alpha, beta}$ is indeed a $t$-conorm.

$t$-norms and $t$-conorms possess a form of duality: from any $t$-norm
$t$ it is possible to induce a dual $t$-conorm $s$, and from any $t$-conorm
$s$ it is possible to induce a dual $t$-norm $t$. This is done as follows:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ s(alpha, beta) = 1 - t(1 - alpha, 1 - beta) $],
	[$ t(alpha, beta) = 1 - s(1 - alpha, 1 - beta) $]
)

These relations are a generalization of the *De Morgan's Laws* for classical
logic:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ dsl alpha or beta dsr = dsl not (not alpha and not beta) dsr $],
	[$ dsl alpha and beta dsr = dsl not (not alpha or not beta) dsr $]
)

Applying the duality relation to the Łukasiewicz t-norm, the algebraic
product and the drastic product one obtains the following conorms:

#grid(
	columns: (0.5fr, 0.5fr),
	[*Łukasiewicz t-conorm*:
	$ s(alpha, beta) = max{alpha + beta, 1} $
	#image("lukasiewicz_conorm.svg", width: 66%)],
	[*Algebraic sum*:
	$ s(alpha, beta) = alpha + beta - alpha dot beta $
	#image("algebraic_sum.svg", width: 66%)]
)

#grid(
	columns: (0.5fr, 0.5fr),
	[*Drastic sum*:
	$ s(alpha, beta) = cases(1 & "if" 0 in.not {alpha, beta}, max{alpha, beta} & "otherwise") $
	#image("drastic_sum.svg", width: 66%)],
	[*Nilpotent maximum*:
	$ t(alpha, beta) = cases(max{alpha, beta} & "if" alpha + beta < 1, 1 & "otherwise") $
	#image("nilpotent_maximum.svg", width: 66%)]
)

Analogously to $min{alpha, beta}$, $max{alpha, beta}$ is the only
$t$-conorm that is idempotent. Also, $min{alpha, beta}$ and $max{alpha,
beta}$ are the only $t$-norm and $t$-conorm that are the dual of each
other possessing the distributive property.

In addition to the connection between $t$-norms and $t$-conorms, there exist
a connection between $t$-norms and implications. A continuous $t$-norm $t$
induces a *residuated implication* as:

$ arrow(t)(alpha, beta) = sup{gamma in [0, 1] | t(alpha, gamma) lt.eq beta} $

Indeed, the Łukasiewicz implication is obtained by substituting the
Łukasiewicz $t$-norm in the aforementioned formula, whereas the Gödel
implication is obtained by using $min{alpha, beta}$.
