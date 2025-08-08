#import "../AI_definitions.typ": *

As the name suggests, there exist a relationship between fuzzy sets
and fuzzy logic. If the degree of membership to a fuzzy set describes
"how much" an element possesses a certain property, the truth value
of a fuzzy proposition describes "how truthful" it would be to classifiy
said element as a member of the set.

In other words, given an element $x in U$ and a fuzzy set $mu$, the
degree of membership $mu(x)$ corresponds to the truth value of the
fuzzy proposition "$x$ is a member of $mu$". More formally, $mu(x)
= dsl x in mu dsr$.

This link between fuzzy sets and fuzzy logic can shed light on why
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
$mu_(1)(x)$ and $mu_(2)(x)$ is defined as:

$ (mu_(1) inter_(t) mu_(2))(x) = t(mu_(1)(x), mu_(2)(x)) $

Where the pedix $t$ specifies that the explicit expression of $(mu_(1)
inter mu_(2))(x)$ depends on which $t$-norm has been chosen. Since
$mu(x) = dsl x in mu dsr$, the truth value of the fuzzy proposition
"$x$ belongs to $mu_(1)$ _and_ $x$ belongs to $mu_(2)$" is given by:

$ dsl x in (mu_(1) inter_(t) mu_(2)) dsr = dsl x in mu_(1) and x in mu_(2) dsr $

Choosing for example $min$ as the $t$-norm $t$, one obtains:

$ (mu_(1) inter mu_(2))(x) = min{mu_(1)(x), mu_(2)(x)} $

This is the default choice, unless stated otherwise.

Employing a $t$-norm for the definition of the intersection between fuzzy
sets implies that fuzzy set intersection inherits the four properties of
a $t$-norm:

- Classical set intersection is commutative, so is fuzzy set intersection;
- Classical set intersection is associative, so is fuzzy set intersection;
- Given three classical sets $A, B, C$, if $A subset.eq B$ then $(A inter
  C) subset.eq (B inter C)$. This is mirrored in the monotonicity property;
- The intersection of a fuzzy set with (the characteristic function of) an
  ordinary set results in the original fuzzy set limited to the ordinary set
  with which it was intersected. More formally, if $M subset.eq U$ is a
  crisp subset of $U$ and $mu in cal(F)(U)$ is a fuzzy set of $U$:

  $ (mu inter chi_(M))(x) = cases(mu(x) & "if" x in M, 0 & "otherwise") $

This is relevant because these properties are the properties of classical
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

    Grouping the results into a function:

    $ (mu_(1) sect mu_(2))(x) = cases(20x - 35 & "if" 1.75 lt.eq x < 1.7714,
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
The union of two fuzzy sets $mu_(1)(x)$ and $mu_(2)(x)$ is defined as:

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
$overline(overline(mu)) = mu$ for any fuzzy set $mu$. The standard set
intersection of any set with its complement gives the universe set: fuzzy
set complement "relaxes" this property as $(mu inter overline(mu))(x) lt.eq
0.5$ and $(mu union overline(mu))(x) gt.eq 0.5$ for any fuzzy set $mu$ and
any element $x$.

=== Functions with one argument

Given a classical set $M subset.eq X$ and a function $f: X
mapsto Y$, the image $f[M]$ is the subset of $Y$ containing the images
of all the elements of $M$ to whom $f$ is applied. That is:

$ f[M] = {y in Y | exists x in X: x in M and f(x) = y}
  " that is "
  y in f[M] <==> (exists x in X)(x in M and f(x) = y) $

Consider a fuzzy set $mu$ and a function $f$. The previous equation can
be rephrased as:

$ dsl y in f[mu] dsr = dsl exists x in X: x in mu and f(x) = y dsr $

Which, with respect to the way the existential quantifier was extended,
gives:

$ f[mu](y) &=
  sup{dsl x in mu and f(x) = y dsr | x in X} =
  sup{t(dsl x in mu dsr, dsl f(x) = y dsr) | x in X} = \
  &= sup{t(mu(x), dsl f(x) = y dsr) | x in X} $

Where $x in mu and f(x) = y$ plays the role of the proposition $P(x)$
and $t$ is an approprietely-chosen $t$-norm to implement the conjunction
between $x in mu$ and $f(x) = y$.

Note, however, how the choice of $t$ is completely irrelevant. This is due
to the fact that the expression $f(x) = y$ is not fuzzy, since $y$ either
is or is not the image of $x$ under $f$. Therefore, $dsl f(x) = y dsr in
{0, 1}$, which in turn implies that the $t$-norm $t$ will always be either
$t(mu(x), 0)$ or $t(mu(x), 1)$. This means that it's possible to apply the
boundedness property, giving:

$ t(mu(x), dsl f(x) = y dsr) =
  cases(mu(x) & "if" dsl f(x) = y dsr = 1, 0 & "otherwise") =
  cases(mu(x) & "if" f(x) = y, 0 & "otherwise") $

Therefore, $f[mu](y)$ can be reduced to:

$ f[mu](y) = sup{mu(x) | f(x) = y} $

In simpler terms, this just means that the degree of membership of an
element $y in Y$ to the image of the fuzzy set $mu in cal(F)(X)$ is the
highest degree of membership to $X$ that can be found among the elements
of $x$ having $y$ as image through $f$. This extension of a mapping to
fuzzy sets is called *extension principle* (for single-valued functions).

=== Cartesian product, projection, cylindrical extension

Let $M_(i)$ with $i = 1, dots, n$ be a family of $n$ classical sets. The
cartesian product of said sets is given by the set:

$ M_(1) times M_(2) times dots times M_(n) =
  {(x_(1), x_(2), dots, x_(n)) | x_(1) in M_(1), x_(2) in M_(2), dots, x_(n) in M_(n)} $

That is, the set of all possible ordered tuples having as each $i$-th
element an element of the $i$-th set. Stated otherwise, a tuple $(x_(1),
dots, x_(n))$ is a member of $M_(1) times dots times M_(n)$ if and only
if each $i$-th element of the tuple is a member to the $i$-th member of
the product. That is:

$ (x_(1), x_(2), dots, x_(n)) in M_(1) times M_(2) times dots times M_(n) 
  <==>
  x_(1) in M_(1) and x_(2) in M_(2) and dots and x_(n) in M_(n) $

Given a family of $n$ fuzzy sets $mu_(i)$ with $i = 1, dots, n$, this is
equivalent to:

$ dsl (x_(1), x_(2), dots, x_(n)) in mu_(1) times mu_(2) times dots times mu_(n) dsr
  =
  dsl x_(1) in mu_(1) and x_(2) in mu_(2) and dots and x_(n) in mu_(n) dsr $

Which means that the Cartesian product $mu_(1) times dots times mu_(n) in
cal(F)(X_(1) times dots times X_(n))$ can be extended as:

$ (mu_(1) times dots times mu_(n))(x_(1), dots, x_(n)) &=
  dsl x_(1) in mu_(1) and dots and x_(n) in mu_(n) dsr =
  min{dsl x_(1) in mu_(1) dsr, dots, dsl x_(n) in mu_(n) dsr} = \
  &= min{mu_(1)(x_(1)), dots, mu_(n)(x_(n))} $

Consider a Cartesian product $X = X_(1) times dots times X_(n)$ with
$i in {1, dots, n}$. The mapping:

$ pi_(i) : X = X_(1) times dots times X_(n) mapsto X_(i),
  space pi_(i)(x_(1), dots, x_(n)) = x_(i) $

That has as input an element of a Cartesian product and returns as output
an element of one of the sets that constitutes it is the *projection* of
$X_(1) times dots times X_(n)$ onto $X_(i)$. Applying the extension
principle to $pi_(i)$ gives:

$ pi_(i)[mu](x) = sup{mu(x_(1), dots, x_(i − 1), x, x_(i + 1), dots, x_(n)) |
                      x_(1) in X_(1), dots, x_(i − 1) in X_(i − 1), x_(i + 1) in X_(i + 1), dots, x_(n) in X_(n)} $

A special case of a Cartesian product is the *cylindrical extension* of a
fuzzy set. Given a fuzzy set $mu in cal(F)(X_(i))$ and a Cartesian product
$X_(1) times dots times X_(n)$, the cylindrical extension of $mu$ is the
Cartesian product between $mu$ and the characteristic functions of $X_(1),
dots, X_(i - 1), X_(i + 1), dots, X_(n)$:

$ hat(pi)_(i)(mu) =
  I_(X_(1)) times dots times I_(X_(i − 1)) times mu times I_(X_(i + 1)) times dots times I_(X_(n)),
  space hat(pi)_(i)(mu)(x_(1), dots, x_(n)) = mu(x_(i)) $

As long as the sets $X_(1), dots, X_(n)$ are nonempty,
projecting a cylindrical extension results in the original
fuzzy set: $pi_(i)[hat(pi)_(i)(mu)] = mu$. If the fuzzy sets
$mu_(1), dots, mu_(i - 1), mu_(i + 1), dots, mu_(n)$ are normal,
$pi_(i) [mu_(1) times dots times mu_(n)] = mu_(i)$ holds.

=== Function with arbitrarely many arguments

Extensions of functions with one argument can be generalized to functions
with many arguments from the results obtained on the Cartesian product.
Consider a mapping $f: X_(1) times dots times X_(n) mapsto Y$. The image
of the tuple $(mu_(1), dots, mu_(n)) in cal(F)(X_(1)) times dots times
cal(F)(X_(n))$ of $n$ fuzzy sets under the mapping $f$ is the fuzzy set
$f[mu_(1), dots, mu_(n)]$ evaluated over the entire set $Y$. That means:

$ f[mu_(1), dots, mu_(n)](y) &=
  sup_((x_(1), dots, x_(n)) in X_(1) times dots times X_(n))
  {(mu_(1) times dots times mu_(n))(x_(1), dots, x_(n)) | f(x_(1), dots, x_(n)) = y} = \
  &= sup_((x_(1), dots, x_(n)) in X_(1) times dots times X_(n))
  {min{mu_(1)(x_(1)), dots, mu_(n)(x_(n))} | f(x_(1), dots, x_(n)) = y} $

Which is the most general form of the extension principle.

#exercise[
  How should addition between two fuzzy sets $mu_(1) in cal(F)(X_(1))$,
  $mu_(2) in cal(F)(X_(2))$ be defined?
]
#solution[
  Addition between two fuzzy sets can be thought of as a function
  $f : mu_(1) times mu_(2) mapsto mu_(1) plus.circle mu_(2)$. In
  particular, applying the definition:

 $ f[mu_(1), mu_(2)](y) =
   sup_((x_(1), x_(2)) in X_(1) times X_(2))
   {min{mu_(1)(x_(1)), mu_(2)(x_(2))} | x_(1) + x_(2) = y} $ 
]
