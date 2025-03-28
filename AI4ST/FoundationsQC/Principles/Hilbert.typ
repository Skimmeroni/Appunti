#import "../FoundationsQC_definitions.typ": *

Given a vector space $V$ and two vectors $bold(x), bold(y) in V$, their
*inner product* $angle.l bold(x), bold(y) angle.r$ is given by:

$ angle.l bold(x), bold(y) angle.r = bold(x)^(dagger) bold(y) =
  mat(x_(1)^(*), dots, x_(n)^(*)) mat(y_(1); dots.v; y_(n)) =
  sum_(i = 1)^(n) x_(i)^(*) y_(i) $

In the context of quantum mechanics, vector spaces are assumed to be on
the field $CC$. In this context, the inner product is also referred to 
as the *scalar product* (because the value returned is a single number)
or *dot product* (because it is sometimes denoted with a dot).

The inner product is a mathematical operation that satisfies (at least)
this three properties:

- Invariance with respect to conjugation: $angle.l bold(x), bold(y)
  angle.r = angle.l bold(x), bold(y) angle.r^(*)$;
- Linearity in the second position: $angle.l bold(x), alpha bold(y) +
  beta bold(z) angle.r = alpha angle.l bold(x), bold(y) angle.r +
  beta angle.l bold(x), bold(y) angle.r$;
- Antilinearity in the first position: $angle.l alpha bold(x) + beta
  bold(y), bold(z) angle.r = alpha^(*) angle.l bold(x), bold(z)
  angle.r + beta^(*) angle.l bold(y), bold(z) angle.r$;
- $angle.l bold(x), bold(x) angle.r gt.eq 0$ for any $bold(x) in CC$;
- $angle.l bold(x), bold(x) angle.r = 0$ if $bold(x) = bold(0)$.

The square root of the inner product of a vector $bold(x)$ with itself
is called the *norm* of the vector:

$ abs(bold(x)) = sqrt(angle.l bold(x)\, bold(x) angle.r) =
  sqrt(mat(x_(1)^(*), dots, x_(n)^(*)) mat(x_(1); dots.v; x_(n))) $

Any vector space on a field  that possesses an inner product is called
an *Hilbert space*. Hilbert spaces are so obiquitous that, when not
specified, any vector space is assumed to be an Hilbert space.

The *direct sum* of two vectors spaces $V$ and $W$ having bases $A =
\{bold(alpha_(1)), dots, bold(alpha_(n))\}$ and $B = \{bold(beta_(1)),
dots, bold(beta_(m))\}$ respectively, denoted as $V plus.circle W$,
is the vector space spanned by the basis $A union B = \{bold(alpha_(1)),
dots, bold(alpha_(n)), bold(beta_(1)), dots, bold(beta_(m))\}$.

Every element $bold(x) in V plus.circle W$ can be written as $bold(v)
plus.circle bold(w)$, for some $bold(v) in V$ and some $bold(w) in W$.
The dimension of $V plus.circle W$ is simply given by $dim(V) + dim(W)$.

Addition and scalar multiplication are defined by performing the
operation on the two component vector spaces separately and adding
the results. When $V$ and $W$ are inner product spaces, the standard
inner product on $V plus.circle W$ is given by:

$ (bold(v_(2))^(dagger) plus.circle bold(w_(2))^(dagger))
  (bold(v_(1)) plus.circle bold(w_(1))) =
  angle.l bold(v_(2)), bold(v_(1)) angle.r +
  angle.l bold(w_(2)), bold(w_(1)) angle.r $

The vector spaces $V$ and $W$ embed in $V plus.circle W$ in the obvious
canonical way, and the images are orthogonal under the standard inner
product.

#theorem("Direct sum decomposition")[
  For any finite inner product vector space $S$ of dimension
  $n$, there exist a set of orthogonal subspaces $\{V_(1),
  dots, V_(k)\}$ for some $k lt.eq n$ such that $S = V_(1)
  plus.circle dots plus.circle V_(k)$
] <Direct-sum-decomposition>
// #proof[
// 
// ]

The *tensor product* between two vectors $bold(v)$ and $bold(w)$ is the
vector $bold(v) times.circle bold(w)$ constructed as:

$ bold(v) times.circle bold(w) =
  mat(v_(1); dots.v; v_(n)) times.circle mat(w_(1); dots.v; w_(m)) =
  mat(v_(1)w_(1), dots, v_(1)w_(m), dots, v_(n)w_(1), dots, v_(n)w_(m))^(T) $

The tensor product between vectors satisfies the following relations:

- $(bold(v_(1)) + bold(v_(2))) times.circle bold(v_(3)) =
   bold(v_(1)) times.circle (bold(v_(2)) + bold(v_(3))) =
   bold(v_(1)) times.circle bold(v_(2)) + bold(v_(1)) times.circle bold(v_(3))$
- $(a bold(v_(1))) times.circle bold(v_(2)) =
   bold(v_(1)) times.circle (a bold(v_(2))) =
   a (bold(v_(1)) times.circle bold(v_(2)))$

When there is no ambiguity, the tensor product of two vectors $bold(v)$ and
$bold(w)$ is simply denoted as $bold(v) bold(w)$.

#exercise[
  What is the tensor product of the two following vectors?

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ bold(v) = mat(frac(1, sqrt(5)); -frac(2, sqrt(5))) $],
    [$ bold(w) = mat(-frac(1, sqrt(10)); frac(3, sqrt(10))) $]
  )
]
#solution[
  $ bold(v) times.circle bold(w) =
    mat(frac(1, sqrt(5))  (-frac(1, sqrt(10))),
        frac(1, sqrt(5))  frac(3, sqrt(10)),
        -frac(2, sqrt(5)) (-frac(1, sqrt(10))),
        -frac(2, sqrt(5)) frac(3, sqrt(10)))^(T) =
    mat(-frac(1, 5 sqrt(2)),
        frac(3, 5 sqrt(2)),
        -frac(2, 5 sqrt(2)),
        -frac(6, 5 sqrt(2)))^(T) $
]

The *tensor product* of two vector spaces $V$ and $W$, having bases
$A = {bold(v_(1)), bold(v_(2)), dots, bold(v_(n))}$ and $B = {bold(w_(1)),
bold(w_(2)), dots, bold(w_(m))}$ respectively, is a $n m$-dimensional
vector space denoted as $V times.circle W$.

The basis of $V times.circle W$ is constituted by all of possible tensor
products between the vectors of the two original bases. Explicitly, the
basis of $V times.circle W$ is:

$ \{bold(v_(1)) times.circle bold(w_(1)), dots,
  bold(v_(n)) times.circle bold(w_(1)), dots,
  bold(v_(1)) times.circle bold(w_(m)), dots,
  bold(v_(n)) times.circle bold(w_(m))\} $

With $bold(v_(1)), dots, bold(v_(n)) in A$ and $bold(w_(1)), dots, bold(w_(m)) in B$.

This means that any generic vector of $V times.circle W$ can be written as:

$ lambda_(1,1)(bold(v_(1)) times.circle bold(w_(1))) + dots +
  lambda_(n,1)(bold(v_(n)) times.circle bold(w_(1))) + dots +
  lambda_(1,m)(bold(v_(1)) times.circle bold(w_(m))) + dots +
  lambda_(n,m)(bold(v_(n)) times.circle bold(w_(m))) $

For $n m$ coefficients $lambda_(i, j)$ with $i in {1, dots, n}$ and
$j in {1, dots, m}$.

If $V$ and $W$ are two vector spaces for whose an inner product is
defined (like Hilbert spaces), then it is possible to define an inner
product for $V times.circle W$ as the product of the inner products
with respect to those spaces.

The tensor product has many properties that are of interest for quantum
state analysis.

#lemma[
  The tensor product of two unit vectors is also a unit vector.
] <Tensor-product-preserves-unit>
// #proof[
//
// ]

#lemma[
  Let $V$ and $W$ be two vector spaces having bases $A = \{bold(v_(1)),
  bold(v_(2)), dots, bold(v_(n))\}$ and $B = \{bold(w_(1)), bold(w_(2)),
  dots, bold(w_(m))\}$ respectively. If $A$ and $B$ are both orthonormal,
  then the basis:

  $ C = \{bold(v_(1)) times.circle bold(w_(1)), dots,
    bold(v_(n)) times.circle bold(w_(1)), dots,
    bold(v_(1)) times.circle bold(w_(m)), dots,
    bold(v_(n)) times.circle bold(w_(m))\} $

  Of $V times.circle W$ is also orthonormal.
] <Tensor-product-preserves-orthonormal>
// #proof[
//
// ]

The *outer product* of two vectors $bold(v)$ and $bold(w)$, denoted as
$angle.r v, w angle.l$, is given by:

$ angle.r v, w angle.l = bold(v) bold(w)^(dagger) =
  mat(v_(1); v_(2); dots.v; v_(n))
  mat(w_(1); w_(2); dots.v; w_(n))^(dagger) =
  mat(v_(1) w_(1)^(*), v_(1) w_(2)^(*), dots, v_(1) w_(n)^(*);
      v_(2) w_(1)^(*), v_(2) w_(2)^(*), dots, v_(2) w_(n)^(*);
      dots.v, dots.v, dots.down, dots.v;
      v_(m) w_(1)^(*), v_(m) w_(2)^(*), dots, v_(m) w_(n)^(*)) $

Where $m$ is the dimension of $bold(v)$ and $n$ is the dimension of $bold(w)$.
