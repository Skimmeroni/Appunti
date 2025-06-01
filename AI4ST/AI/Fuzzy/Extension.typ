#import "../AI_definitions.typ": *

As the name suggests, there exist a relationship between fuzzy sets and
fuzzy logic. If the degree of membership of a fuzzy set describes "how
much" an element possesses a certain property, the truth value of a fuzzy
proposition describes "how truthful" it is to classifiy said element as
a member of the set. That is, given an element $x in X$ and some fuzzy set
$mu$, $mu(x)$ can be interpreted as the truth value of the fuzzy proposition
"$x$ is a member of $mu$". That is, $mu(x) = dsl x in mu dsr$.

This link between fuzzy sets and fuzzy logic can shed light on why
intersection, union and complement of fuzzy sets were defined the way
they were. In general, it can provide a framework to extend many more
instruments of classical set theory, like mappings and quantifiers, to
fuzzy sets.

=== Intersection, union, complement

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
meaning that applying it twice is equivalent to not applying it at
all: $overline(overline(mu)) = mu$ for any fuzzy set $mu$. The standard
set intersection of any set with its complement gives the universe set:
fuzzy set complement "relaxes" this property as $(mu inter overline(mu))(x)
lt.eq 0.5$ and $(mu union overline(mu))(x) gt.eq 0.5$ for any fuzzy set $mu$
and any element $x$.

=== Universal and existential quantifiers

Extending the universal quantifier $forall$ and the existential quantifier
$exists$ can be done by building upon the process used to extend conjunction
and disjunction, exploiting the relationship between these connectives and
the quantifiers.

For a given set $X = {x_(1), dots, x_(n)}$ and a predicate $P(x)$, the
statement $(forall x in X)(P(x))$ is equivalent to $P(x_(1)) and dots
and P(x_(n))$. That is, $P(x)$ is true for all members of $X$ if and
only if it is true for each member of $X$ individually. This means that
$(forall x in X)(P(x))$ can be extended in the following way:

$ dsl forall x in X: P(x) dsr =
  dsl P(x_(1)) and dots and P(x_(n)) dsr =
  min{dsl P(x) dsr | x in X} $

Analogously, the statement $(exists x in X)(P(x))$ is equivalent to
$P(x_(1)) or dots or P(x_(n))$, therefore $(exists x in X)(P(x))$ can
be extended as:

$ dsl exists x in X: P(x) dsr =
  dsl P(x_(1)) or dots or P(x_(n)) dsr =
  max{dsl P(x) dsr | x in X} $

If the set $X$ were to be infinite, one would have to substitute the
minimum and the maximum with, respectively, the infimum and the supremum:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ dsl forall x in X: P(x) dsr = inf{dsl P(x) dsr | x in X} $],
	[$ dsl exists x in X: P(x) dsr = sup{dsl P(x) dsr | x in X} $]
)

Choosing $min$ as a $t$-norm to extend the universal quantifier and
$max$ as a $t$-conorm to extend the existential quantifier is a standard
choice. Even though it would be valid, extend the quantifiers using norms
that aren't $min$ and $max$ respectively is hardly ever done.

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
