#import "../AI_definitions.typ": *

A (binary) *relation* over the universe sets $X$ and $Y$ is any subset $R$
of the Cartesian product between $X$ and $Y$. The pairs $(x, y) in X times
Y$ belonging to the relation $R$ are linked by a semantic connection
specified by $R$.

Relations are a more general form of functions: if the function $f: X mapsto
Y$ maps $X$ to $Y$, the graph of $f$ (the set of all input-output pairs of
$X$ and $Y$ mediated by $f$) is the relation:

$ "graph"(f) = {(x, f(x) | x in X)} $

As functions, a relation can be applied to an entire set. If $R subset.eq
X times Y$ is a relation between $X$ and $Y$ and $M subset.eq X$ is a subset
of $X$, the image of $M$ under $R$ is the set:

$ R[M] = {y in Y | exists x in X: (x, y) in R and x in M}
  " that is "
  y in R[M] <==> exists x in X: (x, y) in R and x in M $

That is, $R[M]$ contains those elements from $Y$ that appear in $R$ paired
with an element of $M$ at least once.

Relations can also be extended to fuzzy sets. A fuzzy set $rho in
cal(F)(X times Y)$ is called a (binary) *fuzzy relation* between the
universe sets $X$ and $Y$. A fuzzy relation is a generalization of a
"standard" relation where, instead of having elements of $X$ and $Y$
that are either paired or not paired, have a degree of "pairedness"
quantified by $rho(x, y)$. 

The extention of the image of a relation to fuzzy sets follows from the
definition:

$ rho[mu](y) &=
  dsl y in rho[mu] dsr =
  dsl exists x in X: (x, y) in R and x in M dsr = \
  &= sup{dsl (x, y) in R and x in M dsr | x in X} = \
  &= sup{min{(x, y) in R, x in M} | x in X} $

The real strength of relations is the fact they can model logical inferences.
This allows one to extend logical deductions to fuzzy logic, and being able
to reason even in the face of partial truth. Consider a logical deduction
based on an implication of the form $x in A -> y in B$, with $A subset.eq X$
and $B subset.eq Y$ classical sets. The statement "if $x$ belongs to $A$ then
$y$ belongs to $B$" can be encoded into a relation in the following way:

$ R(x, y) &= {(x, y) in X times Y | x in A -> y in B} =
  (A times B) union (overline(A) times overline(B)) union (overline(A) times B) = \
  &= (A times B) union (overline(A) union overline(A) times overline(B) union B) =
  (A times B) union (overline(A) times Y) $

Since an implication is always true except when the left hand side is true
and the right hand side is false. Extending this relation to fuzzy sets using
the Gödel implication:

$ rho(x, y) =
  dsl (x, y) in rho dsr =
  dsl x in mu -> y in nu dsr =
  cases(1 & "if" dsl x in mu dsr lt.eq dsl y in nu dsr, dsl y in nu dsr & "otherwise") =
  cases(1 & "if" mu(x) lt.eq nu(y), nu(y) & "otherwise") $

Inferring new facts from rules and known facts usually means dealing with
chained deduction steps in the form of $phi_(1) -> phi_(2)$, $phi_(2) ->
phi_(3)$ from which one can derive $phi_(1) -> phi_(3)$. A similar principle
can be formulated in the context of relations.

Consider the relations $R_(1) subset.eq X times Y$ and $R_(2) subset.eq
Y times Z$. An element $x in X$ is indirectly related to an element $z
in Z$ if there exists an element $y in Y$ such that $x$ and $y$ are in
the relation $R_(1)$ and $y$ and $z$ are in the relation $R_(2)$. In
this way, the composition of the relations $R_(1)$ and $R_(2)$ can be
defined as the relation:

$ R_(2) compose R_(1) = {(x, z) in X times Z | exists y in Y: (x, y) in R_(1) and (y, z) in R_(2)} $

It's possible to extend relation compositions to fuzzy sets. Given
two fuzzy relations $rho_(1) in cal(F)(X times Y)$ and $rho_(2) in
cal(F)(Y times Z)$, their composition is the fuzzy relation:

$ (rho_(2) compose rho_(1))(x, z) =
  dsl (x, z) in (rho_(2) compose rho_(1)) dsr =
  dsl exists y in Y: (x, y) in rho_(1) and (y, z) in rho_(2) dsr =
  sup{dsl (x, y) in rho_(1) and (y, z) in rho_(2) dsr | y in Y} =
  sup{min{dsl (x, y) in rho_(1) dsr, dsl (y, z) in rho_(2) dsr} | y in Y} =
  sup{min{rho_(1)(x, y), rho_(2)(y, z)} | y in Y} $
