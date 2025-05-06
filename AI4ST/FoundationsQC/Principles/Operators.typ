#import "../FoundationsQC_definitions.typ": *

The *conjugate transpose* of a matrix $A$, denoted as $A^(dagger)$, is the
matrix obtained from transposing $A$ and then applying complex conjugation
to each element of the resulting matrix:

$ A^(dagger) = A^(T^(*)) =
  mat(a_(1, 1), a_(1, 2), dots, a_(1, n);
      a_(2, 1), a_(2, 2), dots, a_(2, n);
      dots.v, dots.v, dots.down, dots.v;
      a_(m, 1), a_(m, 2), dots, a_(m, n))^(T^(*)) =
  mat(a_(1, 1)^(*), a_(2, 1)^(*), dots, a_(m, 1)^(*);
      a_(1, 2)^(*), a_(2, 2)^(*), dots, a_(m, 2)^(*);
      dots.v, dots.v, dots.down, dots.v;
      a_(1, n)^(*), a_(2, n)^(*), dots, a_(m, n)^(*)) $

#exercise[
  What is the conjugate transpose of the following matrix?

  $ A = mat(1, -2 - i, 5;
            1 + i, i, 4 - 2i) $
]
#solution[

  $ A^(dagger) =
    mat(1, -2 - i, 5;
        1 + i, i, 4 - 2i)^(dagger) =
    mat(1, 1 + i;
        -2 - i, i;
        5, 4 - 2i)^(*) =
    mat(1, 1 - i;
        -2 + i, -i;
        5, 4 + 2i) $
]

A square matrix $A$ is said to be *Hermitian* if $A^(dagger) = A$. It
is said to be *unitary* if $A^(dagger) = A^(-1)$.

#lemma[
  Let $M$ be a generic matrix. Then $M^(dagger)M$ is Hermitian.
] <Constructing-Hermitian-matrices>
// #proof[
// 
// ]

#lemma[
Let $A$ be a matrix and let $bold(v), bold(w)$ two vectors. If $A$ is
Hermitian, then $angle.l bold(w), A bold(v) angle.r = angle.l A bold(w),
bold(v) angle.r$.
]
// #proof[
//
// ]

#theorem[
  An Hermitian matrix has all real eigenvalues.
]
#proof[
  Let $O: V -> V$ be a linear self-ajoint operator in matrix
  representation, and let $lambda$ be one of its eigenvalues.
  Recall that, given an eigenvector $bold(v) in V$ associated
  to $lambda$, $O bold(v) = lambda bold(v)$. Consider $lambda
  angle.l bold(x), bold(x) angle.r$:

  $ lambda angle.l bold(v), bold(v) angle.r =
    angle.l lambda bold(v), bold(v) angle.r =
    angle.l O bold(v), bold(v) angle.r =
    angle.l bold(v), O^(dagger) bold(v) angle.r =
    angle.l bold(v), O bold(v) angle.r =
    angle.l bold(v), lambda bold(v) angle.r =
    lambda^(*) angle.l bold(v), bold(v) angle.r $

  By definition of eigenvector, $bold(v)$ cannot be the null vector. Also,
  since the inner product between a vector and itself is not null, it is
  allowed to simplify 

  $ lambda cancel(angle.l bold(v)\, bold(v) angle.r) =
    lambda^(*) cancel(angle.l bold(v)\, bold(v) angle.r) =>
    lambda = lambda^(*) $

  Which means that $lambda$ is a real number, because it is equal to its
  complex conjugate.
]

#theorem[
  If $A$ and $B$ are two unitary matrices, then $(A B)^(dagger) A B = I$.
  In other words, the set of unitary matrices (of a fixed dimension) is
  closed under multiplication.
] <Product-of-unitary-matrices-is-unitary>
#proof[
  By definition, $A^(dagger) A = I$ and $B^(dagger) B = I$. Then:

  $ (A B)^(dagger) A B =
    B^(dagger) A^(dagger) A B = 
    B^(dagger) (A^(dagger) A) B =
    B^(dagger) I B =
    B^(dagger) B =
    I $
]

#theorem[
  If $U$ is a unitary matrix, then the columns/rows of $U$ form an
  orthonormal for of $CC^(n)$ with respect to the inner product, and
  vice versa.
] <Unitary-matrices-orthonormal-bases>
// #proof[
//
// ]

#lemma[
  Unitary matrices are inner product-invariant. In other words, given
  a unitary matrix $U$ and two vectors $bold(u), bold(v) in CC^(n)$,
  $angle.l U bold(u), U bold(v) angle.r = angle.l bold(u), bold(v) angle.r$.
] <Unitary-matrices-are-inner-product-invariant>
// #proof[
//
// ]

Recall that, for a fixed basis, each operator can be associated to a
matrix that, when multiplied to a vector, performs the same action.
By extension, an operator in matrix form is simply referred to as an
"operator" as well. 

Since trasposing an operator in matrix form exchanges domain and
codomain, the conjugate transpose of an operator $O: V -> W$ is
the operator $O^(dagger): W -> V$. The matrix representation of
$O^(dagger)$ is, as expected, the conjugate transpose of the
matrix representation of $O$. The conjugate transpose of an
operator is also called its *adjoint operator*. If an operator
is equal to its adjoint (if its matrix representation is Hermitian),
it is said to be *self-adjoint*. 

Hermitian matrices are also normal matrices, therefore it is possible
to apply the spectral theorem and obtain their eigendecomposition. The
spectral decomposition of an Hermitian matrix has a unique property.

#theorem[
  Let $O$ be an Hermitian matrix, having eigenvector basis $E =
  \{e_(lambda_(1)), dots, e_(lambda_(n))\}$. Let $S_(lambda_(i)) =
  "span"\{e_(lambda_(i))\}$ be the subspace spanned by the $i$-th
  eigenvector. The set $E$ is an orthogonal set and:

  $ S_(lambda_(1)) plus.circle S_(lambda_(2)) plus.circle dots
    plus.circle S_(lambda_(n)) = V $

  Moreover, for every such decomposition, there exists a Hermitian
  operator whose eigendecomposition is this decomposition.
] <Spectral-decomposition-of-Hermitian-matrix>
#proof[
  First, note how two eigenspaces of a matrix are necessarely disjoint.
  Given a unit vector $bold(x)$ and two distinct eigenvalues $lambda_(1)$
  and $lambda_(2)$, if $O bold(x) = lambda_(1) bold(x)$ and $O bold(x) =
  lambda_(2) bold(x)$ then $lambda_(1) bold(x) = lambda_(2) bold(x)$, but
  this is only possible if $lambda_(1) = lambda_(2)$.

  For any Hermitian operator, the eigenvectors for distinct eigenvalues
  must be orthogonal. Let $bold(v)_(1)$ be an eigenvector for $lambda_(1)$
  and $bold(v)_(2)$ an eigenvector for $lambda_(2)$. Then:

  $ lambda_(1) angle.l bold(v)_(1), bold(v)_(2) angle.r =
    angle.l bold(v)_(1)^(*) O^(dagger), bold(v)_(2) angle.r =
    angle.l bold(v)_(1), O bold(v)_(2) angle.r =
    lambda_(2) angle.l bold(v)_(1), bold(v)_(2) angle.r $

  Since $lambda_(1)$ and $lambda_(2)$ were assumed to be distinct,
  $lambda_(1) angle.l bold(v)_(1), bold(v)_(2) angle.r = lambda_(2)
  angle.l bold(v)_(1), bold(v)_(2) angle.r$ is possible only if 
  $angle.l bold(v)_(1), bold(v)_(2) angle.r = 0$.

  // Prove that the decomposition is true
]

An important class of Hermitian operators are the *orthogonal projectors*.
An orthogonal projector is any operator that is self-adjoint and maps
elements of a space to elements of one of its subspaces. The matrix
representation of an orthogonal projector, say $P$, has the remarkable
property that $P^(n) = P = P^(dagger)$.

Consider a vector space $V$ having an orthonormal basis $bold(v)_(1), dots,
bold(v)_(n)$. Let $W$ be a subspace of $V$ of dimension $k lt.eq n$. It
is possible to construct an orthogonal projector $P$ in matrix form employing
said basis as:

$ P = sum_(i = 1)^(k) bold(v)^(dagger)_(i) bold(v)_(i) $

Which is Hermitian by virtue of @Constructing-Hermitian-matrices.
