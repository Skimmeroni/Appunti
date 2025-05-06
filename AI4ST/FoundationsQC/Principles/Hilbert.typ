#import "../FoundationsQC_definitions.typ": *

Given a vector space $V$ and two vectors $bold(x), bold(y) in V$, their
*inner product* $angle.l bold(x), bold(y) angle.r$ is given by:

$ angle.l bold(x), bold(y) angle.r = bold(x)^(dagger) bold(y) =
  mat(x_(1)^(*), dots, x_(n)^(*)) mat(y_(1); dots.v; y_(n)) =
  sum_(i = 1)^(n) x_(i)^(*) y_(i) $

In the context of quantum mechanics, vector spaces are assumed to be on
the field $CC$. In this context, the inner product is also referred to 
as the *scalar product* (because the value returned is a single number)
or *dot product* (because it is sometimes denoted with a dot), even though
in general the scalar/dot product is a special case of inner product.

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

$ abs(abs(bold(x))) = sqrt(angle.l bold(x)\, bold(x) angle.r) =
  sqrt(mat(x_(1)^(*), dots, x_(n)^(*)) mat(x_(1); dots.v; x_(n))) $

Any vector space that possesses an inner product is called an *Hilbert
space*. Hilbert spaces are so obiquitous that, when not specified, any
vector space is assumed to be an Hilbert space.

In quantum mechanics have particular relevance bases of vector spaces
that are *orthonormal*, meaning that all vectors of the basis are orthogonal
to each other (except for itself) and have norm equal to $1$. Given a vector
space $V$ and a basis $B = bold(v)_(1), dots, bold(v)_(n)$ for $V$, The set
$B$ forms an orthonormal basis if:

$ forall i, j in \{1, dots, n\},
  angle.l bold(v)_(i), bold(v)_(j) angle.r =
  cases(0 "if" i != j, 1 "if" i = j) $

Finding an orthonormal basis for a vector space can be tedious. However,
if a generic (non orthonormal) basis is known for a certain vector space,
it is possible to apply an algorithm called *Gram-Schmidt procedure* that
can construct an orthonormal basis from the known generic basis.

Let $V$ be a vector space and let $B = bold(v)_(1), dots, bold(v)_(n)$
be a basis for $V$. Let $C = bold(w)_(1), dots, bold(w)_(n)$ be the
orthonormal basis that the Gram-Schmidt procedure will construct. The
procedure is as follows: the first vector $bold(w)_(1)$ is given by
the ratio $bold(v)_(1) slash abs(abs(bold(v)_(1)))$, whereas for any
$1 lt.eq k lt.eq n$ the vector $bold(w)_(k + 1)$ is defined inductively:

$ bold(w)_(k + 1) =
  frac(bold(v)_(k + 1) - sum_(i = 1)^(k) angle.l bold(w)_(i)\, bold(v)_(k + 1) angle.r bold(w)_(i), 
       abs(abs(bold(v)_(k + 1) - sum_(i = 1)^(k) angle.l bold(w)_(i)\, bold(v)_(k + 1) angle.r bold(w)_(i)))) $

Since the Gram-Schmidt decomposition always works, for any vector space
always exist at least an orthonormal basis.

#exercise[
  Consider the vector space $CC^(n)$ having basis $B = \{(1, 0, 0),
  (0, 2i, i + 1), (1, 0, 3)\}$. Construct an orthonormal basis $C$ for
  $CC^(n)$ from $B$.
]
#solution[
  The first element of $C$ is simply $(1, 0, 0) slash abs(abs(1\, 0\, 0))
  = (1, 0, 0)$. The second element:

  $ bold(w)_(2) &=
    frac(bold(v)_(2) - sum_(i = 1)^(1) angle.l bold(w)_(i)\, bold(v)_(2) angle.r bold(w)_(i), 
       abs(abs(bold(v)_(2) - sum_(i = 1)^(1) angle.l bold(w)_(i)\, bold(v)_(2) angle.r bold(w)_(i)))) =
    frac(bold(v)_(2) - angle.l bold(w)_(1)\, bold(v)_(2) angle.r bold(w)_(1), 
       abs(abs(bold(v)_(2) - angle.l bold(w)_(1)\, bold(v)_(2) angle.r bold(w)_(1)))) =
    frac(vec(0, 2i, i + 1) - angle.l vec(1, 0, 0)\, vec(0, 2i, i + 1) angle.r vec(1, 0, 0), 
       abs(abs(vec(0, 2i, i + 1) - angle.l vec(1, 0, 0)\, vec(0, 2i, i + 1) angle.r vec(1, 0, 0)))) = \
    &= frac(vec(0, 2i, i + 1) - 0 dot vec(1, 0, 0), abs(abs(vec(0, 2i, i + 1) - 0 dot vec(1, 0, 0)))) =
    frac(vec(0, 2i, i + 1), abs(abs(vec(0, 2i, i + 1)))) =
    frac(vec(0, 2i, i + 1), sqrt(0^(*) dot 0 + (2i)^(*) dot 2i + (i + 1)^(*) dot (i + 1))) =
    vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6))) $

  As for the third element:

  $ bold(w)_(3) &=
    frac(bold(v)_(3) - sum_(i = 1)^(2) angle.l bold(w)_(i)\, bold(v)_(3) angle.r bold(w)_(i), 
       abs(abs(bold(v)_(3) - sum_(i = 1)^(2) angle.l bold(w)_(i)\, bold(v)_(3) angle.r bold(w)_(i)))) =
    frac(bold(v)_(3) - angle.l bold(w)_(1)\, bold(v)_(3) angle.r bold(w)_(1) - angle.l bold(w)_(2)\, bold(v)_(3) angle.r bold(w)_(2), 
       abs(abs(bold(v)_(3) - angle.l bold(w)_(1)\, bold(v)_(3) angle.r bold(w)_(1) - angle.l bold(w)_(2)\, bold(v)_(3) angle.r bold(w)_(2)))) = \
    &= frac(vec(1, 0, 3) - angle.l vec(1, 0, 0)\, vec(1, 0, 3) angle.r vec(1, 0, 0) - angle.l vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6)))\, vec(1, 0, 3) angle.r vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6))), 
       abs(abs(vec(1, 0, 3) - angle.l vec(1, 0, 0)\, vec(1, 0, 3) angle.r vec(1, 0, 0) - angle.l vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6)))\, vec(1, 0, 3) angle.r vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6)))))) = \
    &= frac(vec(1, 0, 3) - vec(1, 0, 0) - (0^(*) dot 1 + (frac(2i, sqrt(6)))^(*) dot 0 + (frac(i + 1, sqrt(6)))^(*) dot 3) vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6))), 
       abs(abs(vec(1, 0, 3) - vec(1, 0, 0) - (0^(*) dot 1 + (frac(2i, sqrt(6)))^(*) dot 0 + (frac(i + 1, sqrt(6)))^(*) dot 3) vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6)))))) =
       frac(vec(0, 0, 3) + (frac(3i - 3, sqrt(6))) vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6))), 
       abs(abs(vec(0, 0, 3) + (frac(3i - 3, sqrt(6))) vec(0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6)))))) = \
    &= frac(vec(0, 0, 3) - vec(0, 1 + i, 1), abs(abs(vec(0, 0, 3) - vec(0, 1 + i, 1)))) =
       frac(vec(0, -1 - i, 2), abs(abs(vec(0, -1 - i, 2)))) =
       frac(vec(0, -1 - i, 2), sqrt(0^(*) dot 0 + (-1 -i)^(*) (-1 -i) + 2^(*) dot 2)) =
       vec(0, frac(-1 - i, sqrt(6)), frac(2, sqrt(6))) $

  Obtaining the set $C = \{(1, 0, 0), (0, frac(2i, sqrt(6)), frac(i + 1, sqrt(6))), (0, frac(-1 - i, sqrt(6)), frac(2, sqrt(6)))\}$
]

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
  mat(v_(1) mat(w_(1); dots.v; w_(m)); dots.v; v_(n) mat(w_(1); dots.v; w_(m))) =
  mat(v_(1)w_(1); dots.v; v_(1)w_(m); dots.v; v_(n)w_(1); dots.v; v_(n)w_(m)) $

The tensor product has the following properties:

- Is bilinear: $(bold(v_(1)) + bold(v_(2))) times.circle bold(v_(3)) =
   bold(v_(1)) times.circle (bold(v_(2)) + bold(v_(3))) =
   bold(v_(1)) times.circle bold(v_(2)) + bold(v_(1)) times.circle bold(v_(3))$
- Is associative: $(a bold(v_(1))) times.circle bold(v_(2)) =
   bold(v_(1)) times.circle (a bold(v_(2))) =
   a (bold(v_(1)) times.circle bold(v_(2)))$
- Is multiplicative: $(bold(v_(1)) times.circle dots times.circle bold(v_(n)))
   (bold(w_(1)) times.circle dots times.circle bold(w_(n))) =
   bold(v_(1)) bold(w_(1)) times.circle dots times.circle bold(v_(n)) bold(w_(n)) $

#exercise[
  What is the tensor product of the two following vectors?

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ bold(v) = mat(1; 7) $],
    [$ bold(w) = mat(3; 10) $]
  )
]
#solution[
  $ bold(v) times.circle bold(w) =
    mat(1 dot 3; 1 dot 10; 7 dot 3; 7 dot 10) =
    mat(3; 10; 21; 70) $
]

Given two vectors $bold(v)$ and $bold(w)$, the tensor product $bold(v)
times.circle bold(w)^(dagger)$ is also referred to as the *outer product*
between $bold(v)$ and $bold(w)$. The result of the outer product between
two vectors is a matrix:

$ bold(v) times.circle bold(w)^(dagger) =
  mat(v_(1); dots.v; v_(n)) times.circle mat(w_(1)^(*), dots, w_(m)^(*)) =
  mat(v_(1) mat(w_(1)^(*), dots, w_(m)^(*)); dots.v; v_(n) mat(w_(1)^(*), dots, w_(m)^(*))) =
  mat(v_(1) w_(1)^(*), dots, v_(1) w_(m)^(*);
  dots.v, dots.down, dots.v;
  v_(n) w_(1)^(*), dots, v_(n) w_(m)^(*)) $

The tensor product can be extended to matrices, generating a block matrix:

$ bold(A) times.circle bold(B) =
  mat(a_(1, 1), a_(1, 2), dots, a_(1, n);
      a_(2, 1), a_(2, 2), dots, a_(2, n);
      dots.v, dots.v, dots.down, dots.v;
      a_(m, 1), a_(m, 2), dots, a_(m, n))
  times.circle bold(B) =
  mat(a_(1, 1) bold(B), a_(1, 2) bold(B), dots, a_(1, n) bold(B);
      a_(2, 1) bold(B), a_(2, 2) bold(B), dots, a_(2, n) bold(B);
      dots.v, dots.v, dots.down, dots.v;
      a_(m, 1) bold(B), a_(m, 2) bold(B), dots, a_(m, n) bold(B)) $

By definition, $dim(bold(A) times.circle bold(B)) = dim(A) dim(B)$.
It should be noted that the tensor product between matrices, like
the row-column product, is not commutative, but unlike the row-column
product it requires no assumption on the dimension of the matrices to
be defined.

The tensor product of two vector spaces $V$ and $W$, having bases
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
