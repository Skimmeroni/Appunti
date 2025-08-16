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
    $s_(4)$ to $t_(5)$. How would "key $s$ opens door $t$" be
    represented as a relation?
] <Doors-and-keys>
#solution[
    #grid(
        columns: (0.5fr, 0.5fr),
        [$ R subset.eq (S times T) =
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

$ R[M] =
  {y in Y | exists x in X: (x, y) in R and x in M} =
  pi_(Y)[R inter hat(pi)_(X)(M)] $

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

//The matrix representation of a relation is particularly useful when
//trying to compute the image $R[M]$ of a (finite) subset $M subset.eq
//X$ under the relation $R$. The procedure is as follows: construct a
//binary tuple where each $i$-th entry is $1$ if the $i$-th element of
//$X$ belongs to $M$ and $0$ otherwise. Then transpose the tuple and
//compare it to each column of the matrix, constructing a new binary
//tuple $(r_(1), dots, r_(|Y|))$. If in the original transposed tuple
//and in the $j$-th column there's at least one entry in which they are
//both $1$, then $r_(j)$ is $1$, otherwise is $0$. The members of $R[M]$
//are given by decoding the newly constructed tuple.

#exercise[
    Consider @Doors-and-keys. Let $M = {s_(1), s_(2), s_(3), s_(4)}$.
    What would be the set of doors that can be opened with the keys
    in $M$ at one's disposal?
]
#solution[
    The expression of interest is:

    $ R[M] =
      R[{s_(1), s_(2), s_(3), s_(4)}] =
      pi_(Y)[R inter hat(pi)_(X)({s_(1), s_(2), s_(3), s_(4)})] $

    Since:

    $ hat(pi)_(X)({s_(1), s_(2), s_(3), s_(4)}) =
      {& (s_(1), t_(1)), (s_(1), t_(2)), (s_(1), t_(3)), (s_(1), t_(4)), (s_(1), t_(5)), (s_(1), t_(6)), \
       & (s_(2), t_(1)), (s_(2), t_(2)), (s_(2), t_(3)), (s_(2), t_(4)), (s_(2), t_(5)), (s_(2), t_(6)), \
       & (s_(3), t_(1)), (s_(3), t_(2)), (s_(3), t_(3)), (s_(3), t_(4)), (s_(3), t_(5)), (s_(3), t_(6)), \
       & (s_(4), t_(1)), (s_(4), t_(2)), (s_(4), t_(3)), (s_(4), t_(4)), (s_(4), t_(5)), (s_(4), t_(6))} $

    This gives:

    $ R[{s_(1), s_(2), s_(3), s_(4)}] &= 
      pi_(Y)[R inter hat(pi)_(X)({s_(1), s_(2), s_(3), s_(4)})] = \
      &= pi_(Y)[{(s_(1), t_(1)), (s_(2), t_(1)), (s_(2), t_(2)),
              (s_(3), t_(3)), (s_(3), t_(4)), (s_(4), t_(5))}] = \
      &= {t_(1), t_(2), t_(3), t_(4), t_(5)} $

    //The encoded tuple is $B = (1, 1, 1, 1, 0)$, since ${s_(1), s_(2),
    //s_(3), s_(4)}$ contains all members of $S$ except for $s_(5)$.
    //Transposing $B$ (writing it as a column) and comparing it with
    //the matrix in @Doors-and-keys, each column has at least a $1$ in
    //the same position as $B$, except for the last one. The resulting
    //tuple is then $C = (1, 1, 1, 1, 1, 0)$. Decoding:

    //$ R[s_(1), s_(2), s_(3), s_(4)] = $
]

Relations are useful because they can model logical inferences. Consider a
logical deduction based on an implication of the form $x in A -> y in B$,
with $A subset.eq X$ and $B subset.eq Y$ crisp sets. The statement "if $x$
belongs to $A$ then $y$ belongs to $B$" can be encoded into a relation in
the following way:

$ R(x, y) &= {(x, y) in X times Y | x in A -> y in B} = \
  &= (A times B) union (overline(A) times overline(B)) union (overline(A) times B) = \
  &= (A times B) union (overline(A) union overline(A) times overline(B) union B) = \
  &= (A times B) union (overline(A) times Y) $

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

Then, for all $M subset.eq X$:

$ R_(2)[R_(1)[M]] = (R_(2) compose R_(1))[M] $

#exercise[
    Consider @Doors-and-keys. Suppose that $P = {p_(1), p_(2), p_(3)}$ is
    the set of people owning the keys. The relation "person $p$ is the owner
    of key $s$" is:

    $ R' subset.eq (P times S) =
      {(p_(1), s_(1)), (p_(1), s_(2)), (p_(2), s_(3)),
       (p_(2), s_(4)), (p_(3), s_(5))} $

    What would be $R compose R'$, the relation "person $p$ can open door
    $t$"? What would be $(R compose R')[{p_(1), p_(2)}]$?
]
#solution[
    Since $R subset.eq (S times T)$:

    $ R compose R' =&
      {(p, t) in P times T | exists s in S: (p, s) in R' and (s, t) in R} = \
      =& {(p_(1), t_(1)), (p_(1), t_(2)), (p_(2), t_(3)), (p_(2), t_(4)), (p_(2), t_(5)), (p_(3), t_(1)), \
          & (p_(3), t_(2)), (p_(3), t_(3)), (p_(3), t_(4)), (p_(3), t_(5)), (p_(3), t_(6))} $

    Which gives:

    $ (R compose R')[{p_(1), p_(2)}] = pi_(T)[(R compose R') inter hat(pi)_(P)({p_(1), p_(2)})] $

    Since:

    $ hat(pi)_(P)({p_(1), p_(2)}) =&
      {(p_(1), t_(1)),(p_(1), t_(2)),(p_(1), t_(3)),(p_(1), t_(4)),(p_(1), t_(5)), \
       & (p_(2), t_(1)),(p_(2), t_(2)),(p_(2), t_(3)),(p_(2), t_(4)),(p_(2), t_(5))} $

    One has:

    $ (R compose R')[{p_(1), p_(2)}] &=
      pi_(T)[(R compose R') inter hat(pi)_(P)({p_(1), p_(2)})] = \
      &= pi_(T)[{(p_(1), t_(1)), (p_(1), t_(2)), (p_(2), t_(3)), (p_(2), t_(4)), (p_(2), t_(5))}] = \
      &= {t_(1), t_(2), t_(3), t_(4), t_(5)} $
]

Relations can also be extended to fuzzy sets. A fuzzy set $rho in
cal(F)(X times Y)$ is called a (binary) *fuzzy relation* between
the universe sets $X$ and $Y$. A fuzzy relation is a generalization
of a "standard" relation where, instead of having elements of $X$
and $Y$ that are either paired or not paired, have a degree of
"pairedness" quantified by $rho(x, y)$.

#exercise[
    Suppose that a caliber has a precision of $0.1$. That is, if a
    value of $x$ millimetres is measured with the caliber, then the
    "real" value of the measurement lies in the interval $[x - 0.1,
    x + 0.1]$. Represent the relationship "the measured value $x$
    corresponds to the real value $y$" with a fuzzy relation.
] <Fuzzy-caliber>
#solution[
    Let $X$ be the universe of all possible values that can be measured,
    and let $Y$ be the universe of all "real" values of a measurement.
    For simplicity, both $X$ and $Y$ can be assumed to be $RR$. A crisp
    relation that connects $X$ and $Y$ would be:

    $ R = {(x, y) in X times Y | abs(x - y) lt.eq 0.1} $

    The issue is that, phrased this way, it is equally reasonable to
    associate $x$ to any value in $[x + 0.1, x - 0.1]$. This makes
    little sense, because a value of $y$ that is closer to $x$ should
    obviously more likely correspond to the real value than a value of
    $y$ that is far away from $x$.

    The fuzzy relation $rho in cal(F)(RR times RR)$ that connects the
    measured values with the actual values can be given, for example,
    the following membership function:

    $ rho(x, y) = 1 - min{10 abs(x - y), 1} $

    This way, the closer the real value is to the measurement, the more
    likely it is for it to be the real value for the measurement. In
    particular, if $x = y$, then $rho(x, y) = 1$, meaning that if the real
    value is $x$ then the measurement perfectly overlaps. Also, if
    $abs(x - y) gt.eq 0.1$ then $rho(x, y) = 0$, because a value of $y$
    that dists more than $0.1$ from $x$ is outside the precision range,
    and cannot correspond to its true value.
]

A discrete fuzzy relation can still be represented in matrix form,
where each $i, j$-th entry is not either $0$ or $1$ but $rho(x, y)$.

The extention of the image of a relation to fuzzy sets follows from
applying the extention principle:

$ rho[mu](y) &=
  dsl y in rho[mu] dsr =
  dsl exists x in X: (x, y) in rho and x in mu dsr = \
  &= sup_(x in X){dsl (x, y) in rho and x in mu dsr} = \
  &= sup_(x in X){min{dsl (x, y) in rho dsr, dsl x in mu dsr}} = \
  &= sup_(x in X){min{rho(x, y), mu(x)}} $

This membership value of a certain $y_(0)$ should be interpreted
as how much one can believe that it is possible that the variable
$y$ attains the value $y_(0)$.

#exercise[
    Consider @Fuzzy-caliber. Suppose that $mu(x) = Lambda_(0.2, 0.3, 0.4)(x)$.
    What is $rho[mu](y)$?
]
#solution[
    $ rho[mu](y) &=
      sup_(x in X){min{rho(x, y), mu(x)}} = \
      &= sup_(x in X){min{1 - min{10 abs(x - y), 1}, Lambda_(0.2, 0.3, 0.4)(x)}} = \
      &= sup_(x in X){min{1 - min{10 abs(x - y), 1},
                     cases(10x - 2 & "if" 0.2 lt.eq x < 0.3,
                           4 - 10x & "if" 0.3 lt.eq x < 0.4,
                           0 & "otherwise")}} = \
      &= 1 - min{5 abs(y - 0.3), 1} $

    // Why would that be the case?
]

As stated, an implication of the form $x in A -> y in B$ can be
represented using a relation. Replacing $A$ and $B$ with the fuzzy
sets $mu$ and $nu$ and using the Gödel implication as truth function
for the implication, one has:

$ rho(x, y) =
  dsl (x, y) in rho dsr =
  dsl x in mu -> y in nu dsr =
  cases(1 & "if" mu(x) lt.eq nu(y), nu(y) & "otherwise") $

#exercise[
    Model the implication "If $x$ is about $2$, then $y$ is about $3$"
    as a fuzzy implication.
]
#solution[
    $ rho(x, y) = cases(1 & "if" min{abs(3 - y), 1} lt.eq abs(2 - x),
                        1 - min{abs(3 - y), 1} & "otherwise") $

    // Why would that be the case?
]

It's possible to extend relation compositions to fuzzy sets. Given
two fuzzy relations $rho_(1) in cal(F)(X times Y)$ and $rho_(2) in
cal(F)(Y times Z)$, their composition is the fuzzy relation:

$ (rho_(2) compose rho_(1))(x, z) &=
  dsl (x, z) in (rho_(2) compose rho_(1)) dsr =
  dsl exists y in Y: (x, y) in rho_(1) and (y, z) in rho_(2) dsr = \
  &= sup_(y in Y){dsl (x, y) in rho_(1) and (y, z) in rho_(2) dsr} = \
  &= sup_(y in Y){min{dsl (x, y) in rho_(1) dsr, dsl (y, z) in rho_(2) dsr}} = \
  &= sup_(y in Y){min{rho_(1)(x, y), rho_(2)(y, z)}} $

As it was the case for crisp relations, for all $mu in cal(F)(X)$:

$ rho_(2)[rho_(1)[mu]] = (rho_(2) compose rho_(1))[mu] $

#exercise[
    Consider @Fuzzy-caliber. Suppose that the caliber is digital and
    the display that shows the measurement is scratched, giving unclear
    results that have to be interpreted. Let $rho'(a, x) = 1 - min{5
    abs(a - x), 1}$ be the relation that models how far is the value
    measured by the caliber from the value read on the display. What
    is the relation that connects the values read from the display to
    the real measured values?
]
#solution[
    $ (rho compose rho')(a, y) &=
      sup_(x in X){min{rho'(a, x), rho(x, y)}} = \
      &= sup_(x in X){min{1 - min{5 abs(a - x), 1}, 1 - min{10 abs(x - y), 1}}} = \
      &= 1 - min{frac(10, 3) abs(a - y), 1} $

    // Why would that be the case?
]
