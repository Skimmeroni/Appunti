#import "../AI_definitions.typ": *

A (binary) *relation* over the universes $X$ and $Y$ is any subset
$R$ of the cartesian product between $X$ and $Y$. The pairs $(x, y)
in X times Y$ that belong to the relation $R$ are linked by a semantic
connection specified by $R$.

If a relation $R$ is a discrete set, it can be represented mainly in
two ways: by enumerating its pairs or with a binary matrix, where each
$i, j$-th entry is $1$ if $(x_(i), y_(j)) in R$ and $0$ otherwise.

#exercise[
    A house has six doors and each of them has a lock which can be
    unlocked by certain keys. Let the set of doors be $T = {t_(1),
    dots, t_(6)}$, the set of keys $S = {s_(1), dots, s_(5)}$. Key
    $s_(5)$ can open all doors. Key $s_(1)$ fits only to door $t_(1)$,
    $s_(2)$ to $t_(1)$ and $t_(2)$, $s_(3)$ to $t_(3)$ and $t_(4)$,
    $s_(4)$ to $t_(5)$. How would "key $a$ opens door $b$" be
    represented as a relation?
] <Doors-and-keys>
#solution[
    #grid(
        columns: (0.5fr, 0.5fr),
        [$ R subset.eq (T times S) =
           {& (s_(1), t_(1)), (s_(2), t_(1)), (s_(2), t_(2)), \
            & (s_(3), t_(3)), (s_(3), t_(4)), (s_(4), t_(5)), \
            & (s_(5), t_(1)), (s_(5), t_(2)), (s_(5), t_(3)), \
            & (s_(5), t_(4)), (s_(5), t_(5)), (s_(5), t_(6))} $],
        [$ mat(1, 0, 0, 0, 0, 0;
               1, 1, 0, 0, 0, 0;
               0, 0, 1, 1, 0, 0;
               0, 0, 0, 0, 1, 0;
               1, 1, 1, 1, 1, 1) $]
    )
]

Functions are a special case of relations: if the function $f: X mapsto
Y$ maps $X$ to $Y$, the graph of $f$ (the set of all input-output pairs
of $X$ and $Y$ mediated by $f$) is the relation:

$ "graph"(f) = {(x, f(x) | x in X)} $

As long as, for any $x$, there is one and only $y in Y$ such that $f(x) = y$.

As functions, a relation can be applied to an entire set. If $R subset.eq
X times Y$ is a relation between the universes $X$ and $Y$ and $M subset.eq
X$ is a subset of $X$, the image of $M$ under $R$ is the set:

$ R[M] = {y in Y | exists x in X: (x, y) in R and x in M} $

That is, $R[M]$ contains the elements from $Y$ that appear in $R$ paired
with an element of $M$ at least once. The image of a subset under a relation
corresponds to the "inversion" of the semantical link between the pairs.

If $f: X -> Y$ is a function, then applying the relation $"graph"(f)$ to a
singleton set ${x} subset.eq X$ gives:

$ "graph"[{x}] = {y in Y | exists x in X: (x, y) in R and x in {x}} = {f(x)} $

Which is the singleton set containing the image of $x$ under the function
$f$. In general:

$ "graph"(f)[M] = f[M] = {y in Y | exists x in X: x in M and f(x) = y} $

For any subset $M subset.eq X$.

The matrix representation of a relation is particularly useful when
trying to compute the image $R[M]$ of a (finite) subset $M subset.eq
X$ under the relation $R$. The procedure is as follows: construct a
binary tuple where each $i$-th entry is $1$ if the $i$-th element of
$X$ belongs to $M$ and $0$ otherwise. Then transpose the tuple and
compare it to each column of the matrix, constructing a new binary
tuple $(r_(1), dots, r_(|Y|))$. If in the original transposed tuple
and in the $j$-th column there's at least one entry in which they are
both $1$, then $r_(j)$ is $1$, otherwise is $0$. The members of $R[M]$
are given by decoding the newly constructed tuple.

#exercise[
    Consider @Doors-and-keys. What would be $R[s_(1), s_(2), s_(3), s_(4)]$?
]
#solution[
    The encoded tuple is $B = (1, 1, 1, 1, 0)$, since ${s_(1), s_(2),
    s_(3), s_(4)}$ contains all members of $X$ except for $s_(5)$.
    Transposing $B$ (writing it as a column) and comparing it with
    the matrix in @Doors-and-keys, each column has at least a $1$ in
    the same position as $B$, except for the last one. The resulting
    tuple is then $C = (1, 1, 1, 1, 1, 0)$. Decoding:

    $ R[s_(1), s_(2), s_(3), s_(4)] = {t_(1), t_(2), t_(3), t_(4), t_(5)} $

    Following the analogy, the set $R[s_(1), s_(2), s_(3), s_(4)]$
    represents the set of doors that can be opened with the keys
    ${s_(1), s_(2), s_(3), s_(4)}$ at one's disposal.
]

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

$ (rho_(2) compose rho_(1))(x, z) &=
  dsl (x, z) in (rho_(2) compose rho_(1)) dsr =
  dsl exists y in Y: (x, y) in rho_(1) and (y, z) in rho_(2) dsr = \
  &= sup{dsl (x, y) in rho_(1) and (y, z) in rho_(2) dsr | y in Y} = \
  &= sup{min{dsl (x, y) in rho_(1) dsr, dsl (y, z) in rho_(2) dsr} | y in Y} = \
  &= sup{min{rho_(1)(x, y), rho_(2)(y, z)} | y in Y} $
