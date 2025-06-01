#import "../AI_definitions.typ": *

Some classes of fuzzy sets are more important than others. For example:

- A fuzzy set $mu in cal(F)(X)$ is said to be *normal* if and only if
  its height is equal to $1$. The set of all normal fuzzy sets is given
  by:

  $ cal(F)_(N)(X) = {mu in cal(F)(X) | exists x in X: mu(x) = 1} $

  A fuzzy set that is not normal is said to be *subnormal*. Subnormal
  fuzzy sets possess no members having complete set membership;
- A fuzzy set $mu in cal(F)(X)$ is called a *fuzzy number* if $mu$ is
  normal and $[mu]_(alpha)$ is bounded, closed, and convex $forall alpha
  in (0, 1]$. They are used to represent values that are "somewhat close"
  to a given number;
- A fuzzy set $mu in cal(F)(X)$ is said to be *upper semi-continuous* if
  it's normal and all of its $alpha$-cuts are compact intervals. The set
  of all upper semi-continuous fuzzy sets is given by:

  $ cal(F)_(C)(X) = {mu in cal(F)_(N)(X) | [mu(x)]_(alpha) space "is compact" space forall alpha in (0, 1]} $

  The definition recalls the one of upper semi-continuous functions. A
  function $f$ is upper semi-continuous at point $x_(0)$ if and only if:

  $ lim_(x -> x_(0)) sup f(x) lt.eq f(x_(0)) $

  That is, if values near to $x_(0)$ are either close to $f(x_(0))$ or
  smaller than $f(x_(0))$;
- A fuzzy set $mu in cal(F)(X)$ is said to be a *fuzzy interval* if it's
  normal and, for any $a, b, c in X$ such that $c in [a, b]$, $mu(c)$ is
  bigger than the minimum between $mu(a)$ and $mu(b)$. The set of all fuzzy
  intervals is given by:

  $ cal(F)_(I)(X) = {mu in cal(F)_(N)(X) | mu(c) gt.eq min{mu(a), mu(b)} forall a, b, c in X: c in [a, b]} $

  The definition implies that such sets are also convex and that their core
  is a classical interval. They are used to represent intervals that are
  "somewhat close" to a given range.

The concept of fuzzy number plays fundamental role in formulating
*quantitative fuzzy variables*: those are (mathematical) variables
whose possible states are fuzzy numbers. In particular, fuzzy variables
that represent linguistic concepts (_small_, _tall_, _hot_, ecc...)
are also referred to as *linguistic variables*.

A linguistic variable is a mathematical variable defined in terms of
a base variable, which is a variable in classical sense (temperature,
pressure, age, ec...) but whose possible values are fuzzy (about $10$
degrees, roughly $20$ years, ecc...), also called *linguistic terms*.
More formally, a linguistic variable is defined by a tuple $(nu, T, X,
g, m)$:

- $nu$ is the name of the variable;
- $T$ is the set of linguistic terms of $nu$, the set of possible fuzzy
  numbers for $nu$;
- $X$ is the base set, assumed in general to be a subset of real numbers.
  Those are the possible actual values of $T$ (and of $nu$);
- $g$ is the grammar (the syntactic rules) that generates the linguistic
  terms;
- $m$ is the set of semantic rules that assigns a meaning to each linguistic
  term.

#exercise[
  Consider the following vague concepts: _freezing_, _cold_, _mild_, _warm_,
  _hot_. Suppose that such concepts can be defined by the following range
  of temperatures, in order: $[4, 10], [9, 18], [15, 27], [22, 34],
  [32, 38]$. Represent each with a fuzzy number.
]
#solution[
  #image("number.svg")
]
