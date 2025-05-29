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

As the name suggests, there exist a relationship between fuzzy sets and
fuzzy logic. If the degree of membership of a fuzzy set describes "how
much" an element possesses a certain property, the truth value of a fuzzy
proposition describes "how truthful" it is to classifiy said element as
a member of the set. That is, given an element $x in X$ and some fuzzy set
$mu$, $mu(x)$ can be interpreted as the truth value of the fuzzy proposition
"$x$ is a member of $mu$". That is, "$mu(x) = dsl x in mu dsr$".

This link between fuzzy sets and fuzzy logic can shed light on why
intersection, union and complement of fuzzy sets were defined the way
they were.

Consider the classical intersection between two sets $M_(1)$ and $M_(2)$:
an element $x$ belongs to $M_(1) inter M_(2)$ if and only if it belongs
to both $M_(1)$ and $M_(2)$ at the same time. In the case of fuzzy sets,
it is reasonable to assume that $(mu_(1) inter mu_(2))(x)$, the degree
of membership of an element $x$ with respect the intersection between
the fuzzy sets $mu_(1)$ and $mu_(2)$, should only depend on $mu_(1)(x)$
and $mu_(2)(x)$, the degree of membership of $x$ with respect to the two
sets taken separately.

As stated, $mu_(1)(x)$ and $mu_(2)(x)$ should be interpreted as the
truth value of the fuzzy propositions "$x in mu_(1)$" and "$x in mu_(2)$",
respectively. Following this line of reasoning, $mu_(1)(x) and mu_(2)(x)$
should be interpreted as the truth value of the fuzzy proposition "$x in
(mu_(1) inter mu_(2))$". However, $mu_(1)(x) and mu_(2)(x)$ can be given
a more precise formulation, since logical conjunctions are well-modeled
by $t$-norms. Therefore, having chosen a suitable $t$-norm $t$:

$ mu_(1)(x) and mu_(2)(x) =
  (mu_(1) inter mu_(2))(x) =
  dsl x in (mu_(1) inter mu_(2)) dsr =
  t(mu_(1)(x), mu_(2)(x)) $

And, assuming to choose the $max$ function as the $t$-norm, one obtains
$(mu_(1) inter mu_(2))(x) = min_(x in X){mu_(1)(x), mu_(2)(x)}$, as
expected.

Employing a $t$-norm for the definition of the intersection between fuzzy
sets implies that fuzzy set intersection inherits the four properties of
a $t$-norm. This is important, because those mirrors the properties that
classical set intersection possesses:

- Classical set intersection is commutative, so is fuzzy set intersection;
- Classical set intersection is associative, so is fuzzy set intersection;
- Given three classical sets $A, B, C$, if $A subset.eq B$ then $(A inter
  C) subset.eq (B inter C)$. This is mirrored in the monotonicity property;
- If $M subset.eq X$ is an ordinary subset of $X$ and $mu in cal(F)(X)$ is
  a fuzzy set of $X$, due to the boundedness property:

  $ (mu inter I_(M))(x) = cases(mu(x) & "if" x in M, 0 & "otherwise") $

In the same way, it is possible to define the union of two fuzzy sets by
picking a suitable $t$-conorm $s$:

$ mu_(1)(x) or mu_(2)(x) =
  (mu_(1) union mu_(2))(x) =
  dsl x in (mu_(1) union mu_(2)) dsr =
  s(mu_(1)(x), mu_(2)(x)) $

Where $max$ is the standard choice. Using $max$ and $min$ as definition of
the fuzzy union and the fuzzy intersection has the added benefit of playing
well with $alpha$-cuts. For any $alpha in [0, 1]$ and any fuzzy set $mu_(1)$
and $mu_(2)$, one has:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ [mu_(1) inter mu_(2)]_(alpha) = [mu_(1)]_(alpha) inter [mu_(2)]_(alpha) $],
	[$ [mu_(1) union mu_(2)]_(alpha) = [mu_(1)]_(alpha) union [mu_(2)]_(alpha) $]
)

To obtain the complement of a fuzzy set, note that $x in overline(M) ->
not (x in M)$ for any element $x$ and any classical set $M$. By using
$not alpha = 1 - alpha$ as truth function for the negation, one obtains
$overline(mu)(x) = 1 - mu(x)$; this is in accord with the fact that
$dsl x in overline(mu) dsr = dsl not (x in mu) dsr$.

Fuzzy set complement, like standard set complement, is *involutory*,
meaning that applying it twice is equivalent to not applying it at all:
$overline(overline(mu)) = mu$ for any fuzzy set $mu$. The standard set
intersection of any set with its complement gives the universe set: fuzzy
set complement "relaxes" this property as $(mu inter overline(mu))(x) lt.eq
0.5$ and $(mu union overline(mu))(x) gt.eq 0.5$ for any fuzzy set $mu$ and
any element $x$.
