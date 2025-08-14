#import "../AI_definitions.typ": *

As the name suggests, there exist a relationship between fuzzy sets
and fuzzy logic. If the degree of membership to a fuzzy set describes
"how much" an element possesses a certain property, the truth value
of a fuzzy proposition describes "how truthful" it would be to classifiy
said element as a member of the set.

In other words, given an element $x in U$ and a fuzzy set
$mu in cal(F)(U)$, the degree of membership $mu(x)$ corresponds
to the truth value of the fuzzy proposition "$x$ belongs to
$mu$". That is, $mu(x) = dsl x in mu dsr$. Note that the notation
$x in mu$ is somewhat misleading, since it should not be interpreted
as set membership in the standard sense. It's just a proposition like
any other.

#exercise[
	Refer to the fuzzy set and membership function of @Fuzzy-height. Let
	$P(x)$ be the statement "$x$ is tall" and let $mu(x)$ be the truth
	value of said statement, that is $mu(x) = dsl P(x) dsr$. What would
	be the truth value of the statement "people whose height is between
	$1.70$ and $1.80$ metres are tall"?
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

The link between fuzzy sets and fuzzy logic can shed light on why
intersection, union and complement of fuzzy sets were defined the
way they were. In general, it can provide a framework to extend
many more concepts of classical set theory, like mappings and the
cartesian product, to fuzzy sets.

=== Intersection

Consider the classical intersection between two sets $M_(1)$ and $M_(2)$:
an element $x$ belongs to $M_(1) inter M_(2)$ if and only if it belongs
to both $M_(1)$ and $M_(2)$ at the same time. It does not depend on the
membership of any other element $y != x$ to $M_(1)$ or $M_(2)$.

In the case of fuzzy sets, it is reasonable to assume the same. That
is, $(mu_(1) inter mu_(2))(x)$, the degree of membership of an element
$x$ with respect the intersection between the fuzzy sets $mu_(1)$ and
$mu_(2)$, should only depend on $mu_(1)(x)$ and $mu_(2)(x)$, the degrees
of membership of $x$ with respect to the two sets taken separately.

The proposition of interest is "$x$ belongs to $mu_(1)$ _and_ $x$
belongs to $mu_(2)$", which is a conjunction of two atomic propositions.
Since the truth function of a conjunction is best modeled by $t$-norms,
let $t$ be the $t$-norm of choice. The intersection of two fuzzy sets
$mu_(1)$ and $mu_(2)$ is the set $mu_(1) inter mu_(2)$, whose membership
function is defined as:

$ (mu_(1) inter_(t) mu_(2))(x) = t(mu_(1)(x), mu_(2)(x)) $

Where the pedix $t$ specifies that the explicit expression of $(mu_(1)
inter mu_(2))(x)$ depends on which $t$-norm has been chosen. Since
$mu(x) = dsl x in mu dsr$, the truth value of the fuzzy proposition
"$x$ belongs to $mu_(1)$ _and_ $x$ belongs to $mu_(2)$" is given by:

$ dsl x in (mu_(1) inter_(t) mu_(2)) dsr = dsl x in mu_(1) and x in mu_(2) dsr $

Choosing for example $min$ as the $t$-norm $t$, one obtains:

$ (mu_(1) inter mu_(2))(x) = min{mu_(1)(x), mu_(2)(x)} $

This is the default choice, unless stated otherwise.

Employing a $t$-norm in the definition of the intersection between fuzzy
sets implies that fuzzy set intersection inherits the four properties of
a $t$-norm:

- Crisp set intersection is commutative, so is fuzzy set intersection;
- Crisp set intersection is associative, so is fuzzy set intersection;
- Given three crisp sets $A, B, C$, if $A subset.eq B$ then $(A inter
  C) subset.eq (B inter C)$. This is mirrored in the monotonicity property;
- The intersection of a fuzzy set with (the characteristic function of) an
  crisp set results in the original fuzzy set limited to the crisp set with
  which it was intersected. More formally, if $M subset.eq U$ is a crisp
  subset of $U$ and $mu in cal(F)(U)$ is a fuzzy set of $U$:

  $ (mu inter chi_(M))(x) = cases(mu(x) & "if" x in M, 0 & "otherwise") $

This is relevant because these properties are the properties of (crisp)
set intersection that are worth preserving.

#exercise[
    Consider the fuzzy set in @Fuzzy-height, labeled $mu_(1)(x)$, and the
    fuzzy set $mu_(2)$:

    #grid(
        columns: (0.5fr, 0.5fr),
        [$ mu_(1)(x) =
          cases(1 & "if" x > 2,
	            frac(5, 2) x - 4 & "if" x lt.eq 1.6 lt.eq 2,
				0 & "if" x < 1.6) $],
        [$ mu_(2)(x) =
           cases(20x - 35 & "if" 1.75 lt.eq x lt.eq 1.80,
                 1 & "if" 1.80 lt.eq x lt.eq 1.90,
                 39 - 20x & "if" 1.90 lt.eq x lt.eq 1.95,
                 0 & "otherwise") $]
    )

    What would be their intersection? Assume that the $t$ norm is $min$
]
#solution[
    - In the range $(-infinity, 1.60)$, both membership functions are
      equal to $0$, hence the minimum is $0$;
    - In the range $[1.60, 1.75)$, $mu_(1)(x)$ is equal to $frac(5, 2)x
      - 4$, while $mu_(2)(x)$ is equal to $0$. Since $mu_(1)(x)$ is always
      positive, the minimum is $0$;
    - In the range $[1.75, 1.80)$, $mu_(1)(x)$ is equal to $frac(5, 2)x
      - 4$, while $mu_(2)(x)$ is equal to $20x - 35$. Up to $62 slash 35$
      (about $1.7714$) $mu_(2)(x)$ is smaller than $mu_(1)(x)$, larger on
      the other side;
    - In the range $[1.80, 1.90)$, $mu_(1)(x)$ is equal to $frac(5, 2)x
      - 4$, while $mu_(2)(x)$ is equal to $1$. The minimum is $frac(5, 2)x
      - 4$;
    - In the range $[1.90, 1.95)$, $mu_(1)(x)$ is equal to $frac(5, 2)x
      - 4$, while $mu_(2)(x)$ is equal to $39x - 20$. Up to $86 slash 45$
      (about $1.9111$) $mu_(1)(x)$ is smaller than $mu_(2)(x)$, larger on
      the other side;
    - In the range $[1.95, 2)$, $mu_(1)(x)$ is equal to $frac(5, 2)x
      - 4$, while $mu_(2)(x)$ is equal to $0$. The minimum is $0$;
    - In the range $[2, +infinity)$, $mu_(1)(x)$ is equal to $1$, while
      $mu_(2)(x)$ is equal to $0$. The minimum is $0$.

    Grouping the results into a membership function:

    $ (mu_(1) inter mu_(2))(x) = cases(20x - 35 & "if" 1.75 lt.eq x < 1.7714,
                                       frac(5, 2)x - 4 & "if" 1.7714 lt.eq x < 1.9111,
                                       39x - 20 & "if" 1.9111 lt.eq x < 1.95,
                                       0 & "otherwise") $

    #figure(
      caption: [Vertical representation of the intersection of the two fuzzy sets.],
      [#image("intersection.svg", width: 66%)]
    )
]

=== Union

In the same fashion, the union operator can be extended to the realm of
fuzzy sets. The proposition "$x$ belongs to $mu_(1)$ _or_ $x$ belongs
to $mu_(2)$", which is a disjunction of two atomic propositions. Let
$s$ be the $t$-conorm that models the truth function of the disjunction.
The union of two fuzzy sets $mu_(1)(x)$ and $mu_(2)(x)$ is $mu_(1) union
mu_(2)$, with membership function:

$ (mu_(1) union_(t) mu_(2))(x) = s(mu_(1)(x), mu_(2)(x)) $

The truth value of the fuzzy proposition "$x$ belongs to $mu_(1)$ _or_
$x$ belongs to $mu_(2)$" is given by:

$ dsl x in (mu_(1) union_(t) mu_(2)) dsr = dsl x in mu_(1) or x in mu_(2) dsr $

Choosing the default $max$ as $t$-conorm:

$ (mu_(1) union mu_(2))(x) = max{mu_(1)(x), mu_(2)(x)} $

Choosing $max$ and $min$ for defining of the fuzzy union and the fuzzy
intersection respectively has the added benefit of playing well with
$alpha$-cuts. For any $alpha in [0, 1]$ and any fuzzy set $mu_(1)$ and
$mu_(2)$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ [mu_(1) inter mu_(2)]_(alpha) = [mu_(1)]_(alpha) inter [mu_(2)]_(alpha) $],
	[$ [mu_(1) union mu_(2)]_(alpha) = [mu_(1)]_(alpha) union [mu_(2)]_(alpha) $]
)

=== Complement

In classical logic, the proposition "$x$ belongs to the complement of
$M$" is equivalent to the proposition "$x$ does not belong to $M$",
That is, $dsl x in overline(M) dsr equiv dsl not(x in M) dsr$. It is
sensible to stick to this definition in fuzzy logic as well: by using
the standard truth function for the negation $w_(not)(dsl alpha dsr)
= 1 - dsl alpha dsr$, one obtains $overline(mu)(x) = 1 - mu(x)$.

Fuzzy set complement, like non-fuzzy set complement, is *involutory*,
meaning that applying it twice is the same as not applying it at all:
$overline(overline(mu)) = mu$ for any fuzzy set $mu$.

For crisp sets, the *law of excluded middle* holds: the intersection of
a crisp set with its complement always results in the universe set. With
fuzzy sets, this is not the case. What happens instead is that $(mu inter
overline(mu))(x) lt.eq 0.5$ and $(mu union overline(mu))(x) gt.eq 0.5$
for any fuzzy set $mu$ and any element $x$.

=== Functions with arity $1$

Consider two universes $X$ and $Y$ and a crisp set $M subset.eq X$. Let
$f: X mapsto Y$ be a function of arity $1$, having $X$ as domain and $Y$
as codomain. The image $f[M]$ of $M$ under $f$ is the subset of $Y$
containing the images of all the elements of $M$ to whom $f$ is applied.
That is:

$ f[M] = {y in Y | exists x in X: x in M and f(x) = y} $

Or equivalently:

$ y in f[M] <==> (exists x in X)(x in M and f(x) = y) $

Consider a fuzzy set $mu in cal(F)(X)$, and let $f[mu]$ be the image
of $mu$ under $f$. The truth value of the proposition "$y$ belongs to
$f[mu]$" is given by:

$ dsl y in f[mu] dsr = dsl exists x in X: x in mu and f(x) = y dsr $

$f[mu]$ is itself a fuzzy set, and $f[mu](y)$ is the membership value of
the element $y$ to the image of $mu$ under $f$. The existential quantifier
has been extended as a supremum and using a $t$-norm as the truth function
for the conjunction. This gives:

$ f[mu](y) &= sup{dsl x in mu and f(x) = y dsr | x in X} = \
  &= sup{t(dsl x in mu dsr, dsl f(x) = y dsr) | x in X} = \
  &= sup{t(mu(x), dsl f(x) = y dsr) | x in X} $

Where "$x in mu and f(x) = y$" plays the role of the proposition $P(x)$.

Notice how the choice of $t$ in this expression is irrelevant. This is
because the proposition $f(x) = y$ is not fuzzy: $y$ either is or is not
the image of $x$ under $f$. That is, $dsl f(x) = y dsr in {0, 1}$. Recall
that, for any $t$-norm and any $x in RR$, $t(x, 0) = 0$ and $t(x, 1) = x$.
Applying the property to the $t$-norm in the previous expression:

$ t(mu(x), dsl f(x) = y dsr) =
  cases(mu(x) & "if" dsl f(x) = y dsr = 1, 0 & "otherwise") =
  cases(mu(x) & "if" f(x) = y, 0 & "otherwise") $

Thus $f[mu](y)$ can be reduced to:

$ f[mu](y) = sup{cases(mu(x) & "if" f(x) = y, 0 & "otherwise") | x in X} = sup{mu(x) | f(x) = y} $

Stated otherwise, this means that the degree of membership of an
element $y in Y$ to the image of the fuzzy set $mu in cal(F)(X)$
under $f$ is the highest degree of membership that an element of
$X$ has to $mu$ such that said element $x in X$ has $y$ as image
under $f$. This extension of a mapping to fuzzy sets is called
*extension principle* (for single-valued functions).

#exercise[
    Consider the fuzzy number with membership function $Lambda_(-1.5,
    -0.5, 2.5)$, representing the imprecise concept "about $-0.5$".
    What would be the fuzzy set representing "the absolute value of
    about $-0.5$"?
]
#solution[
    The explicit expression for $Lambda_(-1.5, -0.5, 2.5)$ is:

    $ Lambda_(-1.5, -0.5, 2.5)(x) =
      cases(frac(x + 1.5, -0.5 + 1.5) & "if" -1.5 lt.eq x < -0.5,
            frac(2.5 - x, 2.5 + 0.5) & "if" -0.5 lt.eq x lt.eq 2.5,
            0 & "otherwise") =
      cases(x + frac(3, 2) & "if" -frac(3, 2) lt.eq x < -frac(1, 2),
            -frac(1, 3)x + frac(5, 6) & "if" -frac(1, 2) lt.eq x lt.eq frac(5, 2),
            0 & "otherwise") $

    The fuzzy set of interest is:

    $ f[Lambda_(-1.5, -0.5, 2.5)](y) =
      sup{Lambda_(-1.5, -0.5, 2.5)(x) | abs(x) = y} $

    Obviously, for any non-positive value of $y$, there is no $x$ such
    that $abs(x) = y$, since $abs(x)$ cannot be negative. Therefore,
    with $y in (-infinity, 0)$:

    $ f_(y in (-infinity, 0))[Lambda_(-1.5, -0.5, 2.5)](y) =
      sup{Lambda_(-1.5, -0.5, 2.5)(x) | abs(x) = y, y in (-infinity, 0)} =
      sup{emptyset} = 0 $

    Since the supremum of the empty set is the smallest element.
    The same happens when $y$ is greater or equal than $2.5$, since
    $Lambda_(-1.5, -0.5, 2.5)(x) = 0$ for any $x in [2.5, +infinity)$:
    
    $ f_(y in [2.5, +infinity))[Lambda_(-1.5, -0.5, 2.5)](y) =
      sup{Lambda_(-1.5, -0.5, 2.5)(x) | abs(x) = y, y in [2.5, +infinity)} =
      sup{0} = 0 $

    For any value of $y$ between $1.5$ and $2.5$, the image behaves like
    the original function, since $Lambda_(-1.5, -0.5, 2.5)(x) = 0$ for
    any $(-infinity, -1.5]$:

    $ f_(y in [1.5, 2.5))[Lambda_(-1.5, -0.5, 2.5)](y) &=
      sup{Lambda_(-1.5, -0.5, 2.5)(x) | abs(x) = y, y in [1.5, 2.5)} = \
      &= sup{Lambda_(-1.5, -0.5, 2.5)(-x), Lambda_(-1.5, -0.5, 2.5)(x)} = \
      &= sup{0, -frac(1, 3)x + frac(5, 6)} = -frac(1, 3)x + frac(5, 6) $

    The same happens for $y$ between $1$ and $1.5$, because $x +
    frac(3, 2)$ with a negative $x$ is always smaller than
    $-frac(1, 3)x + frac(5, 6)$ with a positive $x$ when $abs(x) > 1$:

    $ f_(y in [1, 1.5))[Lambda_(-1.5, -0.5, 2.5)](y) &=
      sup{Lambda_(-1.5, -0.5, 2.5)(x) | abs(x) = y, y in [1, 1.5)} = \
      &= sup{Lambda_(-1.5, -0.5, 2.5)(-x), Lambda_(-1.5, -0.5, 2.5)(x)} = \
      &= sup{-x + frac(3, 2), -frac(1, 3)x + frac(5, 6)} = -frac(1, 3)x + frac(5, 6) $

    With $y$ between $0$ and $0.5$, the image behaves like the original,
    except for a minus sign:

    $ f_(y in [0, 0.5))[Lambda_(-1.5, -0.5, 2.5)](y) &=
      sup{Lambda_(-1.5, -0.5, 2.5)(x) | abs(x) = y, y in [0, 0.5)} = \
      &= sup{Lambda_(-1.5, -0.5, 2.5)(-x), Lambda_(-1.5, -0.5, 2.5)(x)} = \
      &= sup{frac(1, 3)x + frac(5, 6), -frac(1, 3)x + frac(5, 6)} =
      frac(1, 3)x + frac(5, 6) $

    The same happens for $y$ between $0.5$ and $1$, because $x +
    frac(3, 2)$ with a negative $x$ is always bigger than
    $-frac(1, 3)x + frac(5, 6)$ with a positive $x$ when $abs(x) < 1$:

    $ f_(y in [0.5, 1))[Lambda_(-1.5, -0.5, 2.5)](y) &=
      sup{Lambda_(-1.5, -0.5, 2.5)(x) | abs(x) = y, y in [0.5, 1)} = \
      &= sup{Lambda_(-1.5, -0.5, 2.5)(-x), Lambda_(-1.5, -0.5, 2.5)(x)} = \
      &= sup{-x + frac(3, 2), -frac(1, 3)x + frac(5, 6)} = -frac(1, 3)x + frac(3, 2) $

    Summing up:

    $ f[Lambda_(-1.5, -0.5, 2.5)](y) =
      cases(frac(1, 3)y + frac(5, 6) & "if" 0 lt.eq y < 0.5,
            -y + frac(3, 2) & "if" 0.5 lt.eq y < 1,
            -frac(1, 3)y + frac(5, 6) & "if" 1 lt.eq y < 2.5,
            0 & "otherwise") $

    #figure(
        caption: [In blue, the vertical representation of the fuzzy set
                  representing "the absolute value of about $-0.5$". In
                  red, the vertical representation of the fuzzy set
                  representing "about $-0.5$"],
        image("absolute.svg", width: 66%)
    )
]

=== Cartesian product

Let $M_(i)$ with $i = 1, dots, n$ be a family of $n$ crisp sets. The
cartesian product of said sets is the set:

$ M_(1) times M_(2) times dots times M_(n) =
  {(x_(1), x_(2), dots, x_(n)) | x_(1) in M_(1), x_(2) in M_(2), dots, x_(n) in M_(n)} $

Which is the set of all possible ordered tuples whose $i$-th element
comes from the $i$-th set. 

A tuple $(x_(1), dots, x_(n))$ is a member of the cartesian product of
crisp sets $M_(1) times dots times M_(n)$ if and only if each $i$-th
element of the tuple is a member to the $i$-th set in the product:

$ (x_(1), x_(2), dots, x_(n)) in M_(1) times M_(2) times dots times M_(n) 
  <==>
  x_(1) in M_(1) and x_(2) in M_(2) and dots and x_(n) in M_(n) $

Let $U_(1), U_(2), dots, U_(n)$ be $n$ universes of discourse. Consider
a family of $n$ fuzzy sets $mu_(1), mu_(2), dots, mu_(n)$, where each
$mu_(i)$ with $i = 1, dots, n$ is a member of $cal(F)(U_(i))$. The
cartesian product of the fuzzy sets is a member of the $cal(F)$ set
of the cartesian product of the universes:

$ mu_(1) times mu_(2) times dots times mu_(n) in
  cal(F)(U_(1) times U_(2) times dots times U_(n)) $

To extend the cartesian product to fuzzy sets, refer to the definition of
membership to the cartesian product for crisp sets. This gives:

$ dsl (x_(1), x_(2), dots, x_(n)) in mu_(1) times mu_(2) times dots times mu_(n) dsr
  =
  dsl x_(1) in mu_(1) and x_(2) in mu_(2) and dots and x_(n) in mu_(n) dsr $

The truth value of the fuzzy proposition "$(x_(1), x_(2), dots, x_(n))$
belongs to $mu_(1) times mu_(2) times dots times mu_(n)$" is equivalent
to the membership value $(mu_(1) times mu_(2) times dots times mu_(n))
(x_(1), x_(2), dots, x_(n))$, which is exactly the cartesian product of
the $n$ fuzzy sets. The cartesian product can therefore be extended as:

$ (mu_(1) times mu_(2) times dots times mu_(n))(x_(1), x_(2), dots, x_(n)) &=
  dsl (x_(1), x_(2), dots, x_(n)) in mu_(1) times mu_(2) times dots times mu_(n) dsr = \
  &= dsl x_(1) in mu_(1) and x_(2) in mu_(2) and dots and x_(n) in mu_(n) dsr = \
  &= min{dsl x_(1) in mu_(1) dsr, dsl x_(2) in mu_(2) dsr, dots, dsl x_(n) in mu_(n) dsr} = \
  &= min{mu_(1)(x_(1)), mu_(2)(x_(2)), dots, mu_(n)(x_(n))} $

Which means that the membership value of a $n$-tuple of elements to the
cartesian product of $n$ fuzzy sets is, out of all the membership values
that each $i$-th element of the tuple has to the $i$-th fuzzy set, the
smallest.

Note that the membership function $(mu_(1) times dots times mu_(n))
(x_(1), dots, x_(n))$ of the cartesian product of $n$ fuzzy sets has
arity $n$, and therefore its vertical representation would have to be
$(n + 1)$-dimensional. This means that the vertical representation of
the cartesian product of two fuzzy sets is a tridimensional plot (two
universes and the $[0, 1]$ interval on the $z$ axis) and for any cartesian
product of $3$ or more fuzzy sets no vertical representation is possible.

#exercise[
    Let $X = [-5, 5]$ and $Y = [-10, 10]$ be two universes. Consider
    the two fuzzy sets $mu_(1) in cal(F)(X)$ and $mu_(2) in cal(F)(Y)$,
    having membership function $mu_(1)(x) = Pi_(-1, 0, 1, 2)(x)$ and
    $mu_(2)(y) = Lambda_(-5, 0, 5)(y)$, respectively. What would be
    $mu_(1) times mu_(2)$?
] <Fuzzy-cartesian>
#solution[
    By writing:

    #grid(
        columns: (0.5fr, 0.5fr),
        [$ Pi_(-1, 0, 1, 2)(x) =
           cases(x + 1 & "if" −1 lt.eq x < 0,
                 1 & "if" 0 lt.eq x < 1,
                 2 − x & "if" 1 lt.eq x < 2,
                 0 & "otherwise") $],
         [$ Lambda_(-5, 0, 5)(y) =
            cases(1 − frac(1, 5) abs(y) & "if" abs(y) lt.eq 5,
                  0 & "otherwise") $]
        
    )

    The expression for $(mu_(1) times mu_(2))(x, y)$ can be written
    explicitly by going over all possible combinations:

    $ (mu_(1) times mu_(2))(x, y) &= 
      min{Pi_(-1, 0, 1, 2)(x), Lambda_(-5, 0, 5)(y)} = \
      &= cases(min(x + 1, 1 − frac(1, 5) abs(y)) & "if" −1 lt.eq x < 0 and abs(y) lt.eq 5,
               min(x + 1, 0) & "if" −1 lt.eq x < 0 and abs(y) > 5,
               min(1, 1 − frac(1, 5) abs(y)) & "if" 0 lt.eq x < 1 and abs(y) lt.eq 5,
               min(0, 1) & "if" 0 lt.eq x < 1 and abs(y) > 5,
               min(2 − x, 1 − frac(1, 5) abs(y)) & "if" 1 lt.eq x < 2 and abs(y) lt.eq 5,
               min(2 − x, 0) & "if" 1 lt.eq x < 2 and abs(y) > 5,
               min(0, 1 − frac(1, 5) abs(y)) & "if" (x < -1 or x gt.eq 2) and abs(y) lt.eq 5,
               min(0, 0) & "if" (x < -1 or x gt.eq 2) and abs(y) > 5) = \
      &= cases(min(x + 1, 1 − frac(1, 5) abs(y)) & "if" −1 lt.eq x < 0 and abs(y) lt.eq 5,
               1 − frac(1, 5) abs(y) & "if" 0 lt.eq x < 1 and abs(y) lt.eq 5,
               min(2 − x, 1 − frac(1, 5) abs(y)) & "if" 1 lt.eq x < 2 and abs(y) lt.eq 5,
               0 & "otherwise") $

    #figure(
        caption: [The vertical representation of the fuzzy set
                  $mu_(1) times mu_(2)$],
        [#image("cartesian.svg", width: 75%)]
    )
]

=== Cylindrical extension

When analyzing fuzzy sets, there are situations where there's interest in
"artificially" increasing the number of dimensions (this is particularly
useful when dealing with fuzzy relations, discussed further). An operation
that can increase the number of dimensions is the *cylindrical extension*.

Let $U_(1) times dots times U_(n)$ be a cartesian product of $n$ universes,
and let $mu in cal(F)(U_(i))$ be a fuzzy set. The cylindrical extension of
$mu$ with respect to $U_(1) times dots times U_(n)$ is the fuzzy set 
$hat(pi)_(i)(mu)$, with membership function:

$ hat(pi)_(i)(mu)(x_(1), dots, x_(n)) = mu(x_(i)) $

The idea behind the cylindrical extension can be better understood when
considering only two universes. Let $mu in cal(F)(X)$ be a fuzzy set and
let $X, Y$ be two universes. The cylindrical extension of $mu$ with respect
to $X times Y$ is:

#grid(
    columns: (0.6fr, 0.4fr),
    [$ hat(pi)_(X)(mu) = {((x, y), mu(x)) | x in X, y in Y $],
    [$ hat(pi)_(X)(mu)(x, y) = mu(x) $]
)

That is, the cylindrical extension "inflates" the domain with extra
dimensions, on which the membership function of the original fuzzy
set has no effect. As a matter of fact, the cylindrical extension is
a special case of the cartesian product where the membership function
of all the other fuzzy sets is always $1$:

$ hat(pi)_(i)(mu)(x_(1), dots, x_(n)) =
  min{1, dots, 1, mu(x_(i)), 1, dots, 1} =
  mu(x_(i)) $

#exercise[
    Consider the two universes $X = [-10, 10]$ and $Y = [1, 2]$ and the
    fuzzy set $mu in cal(F)(X)$ with $mu(x) = Omega_(1, 2)(x)$. What is
    the cylindrical extension of $mu$ with respect to $X times Y$?
]
#solution[
    #figure(
        caption: [The vertical representation of the fuzzy set
                  $hat(pi)_(X)(mu)$],
        [#image("cylindrical.svg", width: 75%)]
    )
]

=== Projection

Let $U_(1) times dots times U_(n)$ with $i in {1, dots, n}$ be a cartesian
product of $n$ universe sets. Consider the mapping $pi_(i)$ that has as
input an $n$-tuple of the cartesian product and returns as output the
$i$-th entry of the tuple (a member of $U_(i)$):

#grid(
    columns: (0.5fr, 0.5fr),
    [$ pi_(i) : U_(1) times dots times U_(n) mapsto U_(i) $],
    [$ pi_(i)(x_(1), dots, x_(n)) = x_(i) $]
)

This is the *projection* of the cartesian product $U_(1) times dots times
U_(n)$ onto the coordinate space $U_(i)$. The projection of a fuzzy set
$mu in cal(F)(U_(1) times dots times U_(n))$ onto the space $U_(i)$ is
the fuzzy set $pi_(i)[mu]$, whose membership functions is given by applying
the extension principle:

$ pi_(i)[mu](x) = sup{mu(x_(1), dots, x_(i − 1), x, x_(i + 1), dots, x_(n)) |
                      x_(j) in U_(j) space forall j in {1, dots, i - 1, i + 1, dots, n}} $

A projection does the opposite of the cylindrical extension, reducing
the number of dimensions instead of increasing them. Furthermore, as
long as the universes $U_(1), dots, U_(n)$ are nonempty, projecting a
cylindrical extension results in the original fuzzy set: $pi_(i)
[hat(pi)_(i)(mu)](x) = mu(x)$.

#exercise[
    Consider @Fuzzy-cartesian. What are the projections of $mu_(1) times
    mu_(2)$ onto $X$ and $Y$?
]
#solution[
    The projection onto the $X$ space is given by:

    $ pi_(x)[mu](x) = sup_(y in Y){cases(min(x + 1, 1 − frac(1, 5) abs(y)) & "if" −1 lt.eq x < 0 and abs(y) lt.eq 5,
                                1 − frac(1, 5) abs(y) & "if" 0 lt.eq x < 1 and abs(y) lt.eq 5,
                                min(2 − x, 1 − frac(1, 5) abs(y)) & "if" 1 lt.eq x < 2 and abs(y) lt.eq 5,
                                0 & "otherwise")} $

    If $x in [-1, 0)$, then $x + 1 in [0, 1]$. The choice of $y$ that
    maximises $min(x + 1, 1 − frac(1, 5) abs(y))$ is $y = 0$, since
    $1 − frac(1, 5) abs(y) in [0, 1]$ and $1 − frac(1, 5) abs(0) = 1$:

    $ pi_(x, x in [-1, 0))[mu](x) = min(x + 1, 1) = x + 1 $

    If $x in [0, 1)$, the choice of $y$ that maximises $1 − frac(1, 5)
    abs(y)$ is $y = 0$:

    $ pi_(x, x in [0, 1))[mu](x) =
      sup_(y in Y){1 − frac(1, 5) abs(y)} = 
      1 − frac(1, 5) abs(0) = 1 $

    If $x in [1, 2)$, then $2 - x in [1, 2]$. The choice of $y$ that
    maximises $min(2 - x, 1 − frac(1, 5) abs(y))$ is $y = 0$, as shown
    before:

    $ pi_(x, x in [1, 2))[mu](x) = min(2 - x, 1) = 2 - x $

    Finally, any choice of $x in (-infinity, -1) union [2, +infinity)$
    results in $0$. This means that $pi_(x)[mu](x)$ "reconstructs" the
    membership function of the first fuzzy set of the cartesian product.

    The projection onto the $Y$ space is given by:

    $ pi_(y)[mu](y) = sup_(x in X){cases(min(x + 1, 1 − frac(1, 5) abs(y)) & "if" −1 lt.eq x < 0 and abs(y) lt.eq 5,
                                1 − frac(1, 5) abs(y) & "if" 0 lt.eq x < 1 and abs(y) lt.eq 5,
                                min(2 − x, 1 − frac(1, 5) abs(y)) & "if" 1 lt.eq x < 2 and abs(y) lt.eq 5,
                                0 & "otherwise")} $

    Any choice of $y in (-infinity, -5) union [5, +infinity)$ results in
    $0$. If $y in [-5, +5)$, then the choices of $x$ that give the supremum
    are any value in the interval $[0, 1]$. In any case, $pi_(y)[mu](y)$
    results in $1 - abs(y) slash 5$. Therefore, $pi_(y)[mu](y)$ "reconstructs"
    the membership function of the second fuzzy set of the cartesian product.

    #figure(
        caption: [The vertical representation of the projections of
                  $mu_(1) times mu_(2)$ onto $X$ (in red) and onto
                  $Y$ (in blue). The original membership function is
                  in the middle (in black).],
        [#image("projection.svg", width: 75%)]
    )
]

If the fuzzy sets $mu_(1), dots, mu_(i - 1), mu_(i + 1), dots, mu_(n)$
are normal, $pi_(i) [mu_(1) times dots times mu_(n)](x) = mu_(i)(x)$ holds.

=== Function with arbitrarely many arguments

Extensions of functions with one argument can be generalized to functions
with many arguments from the results obtained on the cartesian product.

Consider a mapping $f: X_(1) times dots times X_(n) mapsto Y$. The image
of the tuple $(mu_(1), dots, mu_(n)) in cal(F)(X_(1)) times dots times
cal(F)(X_(n))$ of $n$ fuzzy sets under the mapping $f$ is the fuzzy set
$f[mu_(1), dots, mu_(n)]$ evaluated over the entire set $Y$. That means:

$ f[mu_(1), dots, mu_(n)](y) &=
  sup_((x_(1), dots, x_(n)) in X_(1) times dots times X_(n))
  {(mu_(1) times dots times mu_(n))(x_(1), dots, x_(n)) | f(x_(1), dots, x_(n)) = y} = \
  &= sup_((x_(1), dots, x_(n)) in X_(1) times dots times X_(n))
  {min{mu_(1)(x_(1)), dots, mu_(n)(x_(n))} | f(x_(1), dots, x_(n)) = y} $

Which is the most general form of the extension principle. This allows one
to define operations between fuzzy sets such as addition and multiplication.
For example, addition between two fuzzy sets $mu_(1) in cal(F)(X_(1))$ and
$mu_(2) in cal(F)(X_(2))$ would be:

$ f[mu_(1), mu_(2)](y) =
   sup_((x_(1), x_(2)) in X_(1) times X_(2)){min{mu_(1)(x_(1)), mu_(2)(x_(2))} | x_(1) + x_(2) = y} $ 

#exercise[
    What is $Lambda_(0, 1, 2) + Lambda_(1, 2, 3)$?
]
#solution[
    Recall that:

    #grid(
        columns: (0.5fr, 0.5fr),
    	[$ Lambda_(0, 1, 2)(x) = cases(x & "if" 0 lt.eq x < 1,
								       2 - x & "if" 1 lt.eq x lt.eq 2,
								       0 & "otherwise") $],
		[$ Lambda_(1, 2, 3)(x) = cases(x - 1 & "if" 1 lt.eq x < 2,
								       3 - x & "if" 2 lt.eq x lt.eq 3,
								       0 & "otherwise") $]
    )


    The expression of interest is:

    $ f[Lambda_(0, 1, 2), Lambda_(1, 2, 3)](y) =
      sup_((x_(1), x_(2)) in X_(1) times X_(2)){min{Lambda_(0, 1, 2)(x_(1)), Lambda_(1, 2, 3)(x_(2))} | x_(1) + x_(2) = y} $ 

    Clearly, when $y in (-infinity, 1)$, $f[Lambda_(0, 1, 2),
    Lambda_(1, 2, 3)](y)$ is also $0$. This is because $x_(1) + x_(2) = y$
    requires either $x_(1)$ or $x_(2)$ to take a value that results in $0$
    membership for the corresponding set. The same happens for $y in
    [5, +infinity)$:

    $ f_(y in (-infinity, 1))[Lambda_(0, 1, 2), Lambda_(1, 2, 3)](y) &=
      f_(y in (5, +infinity))[Lambda_(0, 1, 2), Lambda_(1, 2, 3)](y) = \
      &= sup_((x_(1), x_(2)) in X_(1) times X_(2)){min{Lambda_(0, 1, 2)(x_(1)), Lambda_(1, 2, 3)(x_(2))} | x_(1) + x_(2) = y} = \
      &= sup_((x_(1), x_(2)) in X_(1) times X_(2)){min{Lambda_(0, 1, 2)(x_(1)), 0} | x_(1) + x_(2) = y} = \
      &= sup_((x_(1), x_(2)) in X_(1) times X_(2)){min{0, Lambda_(1, 2, 3)(x_(2))} | x_(1) + x_(2) = y} = \
      &= sup_((x_(1), x_(2)) in X_(1) times X_(2)){0} = 0 $

    It is also easy to show that $f[Lambda_(0, 1, 2),
    Lambda_(1, 2, 3)](3) = 1$. This is because the choice
    of $x_(1), x_(2)$ that maximises $min{Lambda_(0, 1, 2)(x_(1)),
    Lambda_(1, 2, 3)(x_(2))}$ such that $x_(1) + x_(2) = 3$ is
    $x_(1) = 1, x_(2) = 2$, returning precisely $1$ for both
    membership functions:

    $ f[Lambda_(0, 1, 2), Lambda_(1, 2, 3)](3) &=
      sup_((x_(1), x_(2)) in X_(1) times X_(2)){min{Lambda_(0, 1, 2)(x_(1)), Lambda_(1, 2, 3)(x_(2))} | x_(1) + x_(2) = 3} = \
      &= min{Lambda_(0, 1, 2)(1), Lambda_(1, 2, 3)(2)} =
      min{1, 1} = 1 $

    // Missing $y in [1, 3)$ and $y in [3, 5)$

    #figure(
        caption: [The vertical representation of $Lambda_(0, 1, 2) +
                  Lambda_(1, 2, 3)$.],
        [#image("sum.svg", width: 66%)]
    )
]
