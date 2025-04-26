#import "../Math4AI_definitions.typ": *

A transformation $phi.alt: V |-> W$, with both $V$ and $W$ being vector
spaces, is called a *linear transformation* if and only if:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ phi.alt(underline(v_(1)) + underline(v_(2))) =
	   phi.alt(underline(v_(1))) + phi.alt(underline(v_(2)))
	   space forall underline(v_(1)), underline(v_(2)) in V $],
	[$ phi.alt(lambda underline(v)) = lambda phi.alt(underline(v))
	   space forall underline(v) in V, lambda in RR $]
)

In particular, if $V = W$, the transformation $phi.alt$ is said to be an
*endomorphism*.

#exercise[
	Consider the vector space $RR$ (that is, the set of real numbers). Check
	whether the transformations $phi.alt_(1) (x) = 2 x$ and $phi.alt_(2) (x) =
	x + 1$ are linear or not.
]
#solution[
	- The transformation $phi.alt_(1) (x) = 2 x$ is linear. Infact, given two
	  real numbers $a$ and $b$, is indeed true that $2(a + b) = 2 a + 2 b$,
	  since the product between real numbers has the distributive property.
	  Similarly, given a real number $a$ and a real number $lambda$, it is
	  true that $2(lambda a) = 2 lambda a$, since the product between real
	  numbers has the associative property;
	- The transformation $phi.alt_(2) (x) = x + 1$ is not linear. Given two
	  real numbers $a$ and $b$, it results in $phi.alt_(2) (a + b) = (a + b)
	  + 1 = a + b + 1$, while $phi.alt_(2) (a) + phi.alt_(2) (b) = a + 1 + b
	  + 1 = a + b + 2$.
]

A remarkable property of linear transformations is that they are equivalent
to matrices. That is, for any linear transformation there exist matrices
that, when multiplied, have the same effect as applying $T$.

#theorem("Equivalence between linear transformations and matrices")[
	Let $phi.alt: V |-> W$ be a linear transformation between two vector
	spaces $V$ and $W$. Let $cal(B) = {underline(b_(1)), dots, underline(b_(n))}$
	be a basis for $V$ and $cal(B') = {underline(c_(1)), dots, underline(c_(m))}$
	a basis for $W$. Let $C$ and $C'$ be the column vector representation of,
	respectively, a vector of $V$ and the result of applying $phi.alt$ to said
	vector. There exist a matrix $M_(phi.alt)$, dependent both on $cal(B)$ and
	on $cal(B')$, such that $M_(phi.alt) C = C'$.
]
#proof[
	Consider a generic vector $underline(x) in V$. This vector can be
	written as a linear combination of the vectors of $cal(B)$:

	$ underline(x) = sum_(i = 1)^(n) lambda_(i) underline(b_(i)) $

	Applying $phi.alt$ to $underline(x)$ gives:

	$ phi.alt(underline(x)) =
	  phi.alt(sum_(i = 1)^(n) lambda_(i) underline(b_(i))) =
	  sum_(i = 1)^(n) phi.alt(lambda_(i) underline(b_(i))) =
	  sum_(i = 1)^(n) lambda_(i) phi.alt(underline(b_(i))) $

	The two rightmost equalities stem from the fact that $phi.alt$ is linear.

	Each $i$-th vector $phi.alt(underline(b_(i)))$ is a member of $W$,
	since it's the result of applying $phi.alt$ to a vector of $V$.
	Therefore, each $phi.alt(underline(b_(i)))$ can itself be written
	as a linear combination of the vectors of $cal(B')$:

	$ phi.alt(underline(b_(i))) = sum_(j = 1)^(m) gamma_(j, i) underline(c_(j)) $

	Substituting back in the previous expression gives:

	$ phi.alt(underline(x)) =
	  sum_(i = 1)^(n) lambda_(i) (sum_(j = 1)^(m) gamma_(j, i) underline(c_(j))) =
	  sum_(i = 1)^(n) sum_(j = 1)^(m) lambda_(i) gamma_(j, i) underline(c_(j)) $

	Recall that it's always possible to encode the information regarding a
	vector into a column vector containing the coefficients of the linear
	combination used to generate it. In particular, consider the matrix 
	for $phi.alt(underline(x))$:

	$ phi.alt(underline(x)) <==>
	  mat(sum_(j = 1)^(m) lambda_(1) gamma_(j, 1); dots.v; sum_(j = 1)^(m) lambda_(n) gamma_(j, n))_(cal(B')) =
	  mat(gamma_(1, 1), gamma_(1, 2), dots, gamma_(1, n);
	      gamma_(2, 1), gamma_(2, 2), dots, gamma_(2, n);
	      dots.v, dots.v, dots.down, dots.v;
	      gamma_(m, 1), gamma_(m, 2), dots, gamma_(m, n))
	  mat(lambda_(1); dots.v; lambda_(n)) $

	However, the matrix on the right is just the column vector
	representation for $underline(x)$. Renaming the entries of
	the matrix on the left with $mu_(1), dots, mu_(n)$, one gets:

	$ mat(mu_(1); dots.v; mu_(n))_(cal(B')) =
	  mat(gamma_(1, 1), gamma_(1, 2), dots, gamma_(1, n);
	      gamma_(2, 1), gamma_(2, 2), dots, gamma_(2, n);
	      dots.v, dots.v, dots.down, dots.v;
	      gamma_(m, 1), gamma_(m, 2), dots, gamma_(m, n))^(cal(B))_(cal(B'))
	  mat(lambda_(1); dots.v; lambda_(n))_(cal(B)) $

	The $gamma_(i, j)$ matrix is the desired matrix. The $i$-th column 
	is composed by the vector representation of the result of applying
	$phi.alt$ to the $i$-th vector of the basis $cal(B)$.
]

#exercise[
	Consider the linear transformation $T: RR^(3) |-> RR^(2)$ defined
	below. Write it as a matrix multiplication with respect to the two
	bases $cal(B)_(1)$ and $cal(B)_(2)$.

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ T(x, y, z) = (x - z, y + z) $],
		[$ cal(B)_(1) = {(1, 0, 1), (2, 1, -1), (-2, 1, 4)} $],
		[$ cal(B)_(2) = {(1, 2), (2, 1)} $],
	)
]
#solution[
	Applying the transformation to the vectors in $cal(B)_(1)$ gives:

	$ cases(T(1, 0, 1) &= (1 - 1, 0 + 1) = (0, 1) = gamma_(1, 1) (1, 2) + gamma_(2, 1) (2, 1) \
	        T(2, 1, -1) &= (2 - (-1), 1 + (-1)) = (3, 0) = gamma_(1, 2) (1, 2) + gamma_(2, 2) (2, 1) \
	        T(-2, 1, 4) &= (-2 - 4, 1 + 4) = (-6, 5) = gamma_(1, 3) (1, 2) + gamma_(2, 3) (2, 1)) $

	The coefficients are:

	$ cases(0 = gamma_(1, 1) + 2 gamma_(2, 1),
	        1 = 2 gamma_(1, 1) + gamma_(2, 1),
	        3 = gamma_(1, 2) + 2 gamma_(2, 2),
	        0 = 2 gamma_(1, 2) + gamma_(2, 2),
	        -6 = gamma_(1, 3) + 2 gamma_(2, 3),
	        5 = 2 gamma_(1, 3) + gamma_(2, 3)) =
	  cases(gamma_(1, 1) = -2 gamma_(2, 1),
	        1 = 2 (-2 gamma_(2, 1)) + gamma_(2, 1),
	        3 = gamma_(1, 2) + 2 (-2 gamma_(1, 2)),
	        gamma_(2, 2) = -2 gamma_(1, 2),
	        gamma_(1, 3) = -2 gamma_(2, 3) - 6,
	        5 = 2 (-2 gamma_(2, 3) - 6) + gamma_(2, 3)) =
	  cases(gamma_(1, 1) = -2 gamma_(2, 1),
	        1 = -3 gamma_(2, 1),
	        3 = -3 gamma_(1, 2),
	        gamma_(2, 2) = -2 gamma_(1, 2),
	        gamma_(1, 3) = -2 gamma_(2, 3) - 6,
	        17 = -3 gamma_(2, 3)) =
	  cases(gamma_(1, 1) = frac(2, 3),
	        gamma_(2, 1) = -frac(1, 3),
	        gamma_(1, 2) = -1,
	        gamma_(2, 2) = 2,
	        gamma_(1, 3) = frac(16, 3),
	        gamma_(2, 3) = -frac(17, 3)) $

	Which gives the matrix

	$ M_(T) = mat(frac(2, 3), -1, frac(16, 3);
	              -frac(1, 3), 2, -frac(17, 3))^(cal(B)_(1))_(cal(B)_(2)) $

	Consider, as an example, the triple $(3, 1, 0) in V$. Its vector
	representation with respect to $cal(B)_(1)$ is:

	$ (3, 1, 0) =
	  lambda_(1) (1, 0, 1) + lambda_(2) (2, 1, -1) + lambda_(3) (-2, 1, 4) =
	  1 (1, 0, 1) + 1 (2, 1, -1) + 0 (-2, 1, 4) <==>
	  vec(1, 1, 0)_(cal(B)_(1)) $

	Applying $phi.alt$ to $(3, 1, 0)$ gives $phi.alt(3, 1, 0) =
	(3 - 0, 1 + 0) = (3, 1)$. Its vector representation with respect
	to $cal(B)_(2)$ is:

	$ (3, 1) =
	  lambda'_(1) (1, 2) + lambda'_(2) (2, 1) =
	  -frac(1, 3) (1, 2) + frac(5, 3) (2, 1) <==>
	  vec(-frac(1, 3), frac(5, 3))_(cal(B)_(2)) $

	Indeed:

	$ mat(frac(2, 3), -1, frac(16, 3);
	      -frac(1, 3), 2, -frac(17, 3))
	  mat(1; 1; 0) =
	  mat(frac(2, 3) dot 1 + (-1) dot 1 + frac(16, 3) dot 0;
	      -frac(1, 3) dot 1 + 2 dot 1 + (-frac(17, 3)) dot 0) =
	  mat(frac(2, 3) - 1 + 0;
	      -frac(1, 3) + 2 + 0) =
	  mat(-frac(1, 3); frac(5, 3)) $
]

// There's a VERY nice exercise using polynomials and derivatives in the
// October 1st lecture. Should be stolen ASAP

Let $T: V |-> W$ a linear transformation between vector spaces $V$ and $W$.
The set of all vectors of $W$ that have a correspondant in $V$ through $T$
is called the *image* of the transformation $T$, and is denoted as $Im(T)$.
It may or may not coincide with $W$.

$ Im(T) = {underline(w) in W: exists underline(v) in V space "s.t." space
  T(underline(v)) = underline(w)} $

The notion of image is present in every transformations, not just linear
ones, but images of linear transformations possess properties that images
of generic transformations don't.

#theorem[
	Let $T: V |-> W$ be a linear transformation between vector spaces $V$ and
	$W$. $Im(W)$ is a subspace of $W$.
] <Image-of-transformation-is-vector-space>
#proof[
	By @Subspace-proven-by-being-algebraically-closed, it suffices to
	prove that $underline(w_(1)) + underline(w_(2)) in Im(W)$ holds for
	all $underline(w_(1)), underline(w_(2)) in Im(W)$ and that $lambda
	underline(w) in Im(W)$ holds for all $underline(w) in Im(W)$ and
	$lambda in RR$.

	By definition, if $underline(w) in Im(W)$ then there exists
	$underline(v) in V$ such that $T(underline(v)) = underline(w)$.
	Therefore:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ underline(w_(1)) + underline(w_(2)) =
		   T(underline(v_(1))) + T(underline(v_(2))) $],
		[$ lambda underline(w) = lambda T(underline(v)) $]
	)

	By virtue of $T$ being linear:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ underline(w_(1)) + underline(w_(2)) =
		   T(underline(v_(1))) + T(underline(v_(2))) =
		   T(underline(v_(1)) + underline(v_(2))) $],
		[$ lambda underline(w) = lambda T(underline(v)) =
		   T(lambda underline(v)) $]
	)

	In both cases, there exists a vector in $V$ such that the application of
	$T$ gives such vector, therefore $Im(W)$ is algebraically closed with
	respect to the operations defined for $W$.
]

Let $T: V |-> W$ a linear transformation between vector spaces $V$ and $W$.
The set of all vectors of $V$ such that the application of $T$ to those
vectors gives the null vector (of $W$) is called the *kernel* of $T$, and
is denoted as $ker(T)$.

$ ker(T) = {underline(v) in V: T(underline(v)) = underline(0)} $

#theorem[
	Let $T: V |-> W$ be a linear transformation between vector spaces $V$ and
	$W$. $ker(V)$ is a subspace of $V$.
] <Kernel-of-transformation-is-vector-space>
#proof[
	By @Subspace-proven-by-being-algebraically-closed, it suffices to
	prove that $underline(v_(1)) + underline(v_(2)) in ker(V)$ holds for
	all $underline(v_(1)), underline(v_(2)) in ker(V)$ and that $lambda
	underline(v) in ker(V)$ holds for all $underline(v) in ker(V)$ and
	$lambda in RR$.

	By definition, if $underline(v) in ker(V)$ holds, then
	$T(underline(v)) = 0$. By virtue of $T$ being linear:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$
		   T(underline(v_(1)) + underline(v_(2))) =
		   T(underline(v_(1))) + T(underline(v_(2))) =
		   underline(0) + underline(0) = underline(0)
		   $],
		[$ T(lambda underline(v)) = lambda T(underline(v)) =
		   lambda (underline(0)) = underline(0) $]
	)
]

Let $T: V |-> W$ be a linear transformation between vector spaces $V$ and $W$.
The dimension of the image of $T$ is called the *rank* of $T$, and denoted as
$"rank"(T)$, while the dimension of the kernel of $T$ is called the *nullity*
of $T$, and denoted as $"null"(T)$.

#theorem("Rank-nullity theorem")[
	Let $T: V |-> W$ be a linear transformation between vector spaces
	$V$ and $W$. The dimension of $V$ is given by the sum of the rank
	of $T$ and the nullity of $T$:

	$ dim(V) = "rank"(T) + "null"(T) = dim(ker(T)) + dim(Im(T)) $
] <Rank-nullity-theorem>
// #proof[
// Hard to prove
// ]

Let $T: V |-> W$ be a linear transformation between vector spaces $V$ and
$W$. The linear transformation $T^(-1): W |-> V$ is said to be the *inverse*
of $T$ if:

$ T^(-1)(T(underline(v))) = T(T^(-1)(underline(v))) = underline(v),
space forall underline(v) in V $

As for any function, a linear transformation $T$ has an inverse if and only
if it is both injective and subjective. A linear transformation that has an
inverse is said to be *invertible*.

#theorem[
	Let $T: V |-> W$ be a linear transformation. If $T$ is injective, then
	its nullity is $0$.
] <Injective-transformations-have-empty-nullity>
#proof[
	If $T$ is injective then, for any distinct $underline(v_(1)),
	underline(v_(2)) in V$, $T(underline(v_(1))) eq.not T(underline(v_(2)))$,
	which is to say $T(underline(v_(1))) - T(underline(v_(2))) eq.not
	underline(0)$. But $T$ is linear by definition, therefore
	$T(underline(v_(1))) - T(underline(v_(2))) = T(underline(v_(1)) -
	underline(v_(2)))$. Being $V$ a vector space, it algebraically closed
	with respect to the sum of vectors, therefore $(underline(v_(1)) -
	underline(v_(2)))$ is itself a member of $V$ distinct from
	$underline(0)$, be it $underline(v)$. In other words, if $T$ is
	injective, $T(underline(v))$ has to be different from $underline(0)$
	for any $underline(v) in V$, that isn't the null vector, that is to
	say that the kernel is only composed of the null vector, which is
	the definition of the nullity of a linear transformation to be $0$.
]

#theorem[
	Let $T: V |-> W$ be a linear transformation. If $T$ is invertible, then
	$V$ and $W$ have the same dimension.
] <Invertible-transformations-have-equal-dimensions>
#proof[
	By @Rank-nullity-theorem, $dim(V) = dim(ker(T)) + dim(Im(T))$. Being
	$T$ invertible, the dimension of the image equals the dimension of
	the codomain $W$. By @Injective-transformations-have-empty-nullity,
	$dim(ker(T)) = 0$. Therefore, $dim(V) = 0 + dim(Im(T)) = dim(W)$.
]

As stated before, every result concerning linear transformations can be
formulated very naturally as a result concerning matrices.

#theorem[
	Let A be the $m times n$ matrix associated to the invertible
	linear application $T: V |-> W$ with respect to two bases
	$cal(B)$ and $cal(C)$. Then, $m$ and $n$ are equal (that is,
	$A$ is a square matrix).
] <Invertible-matrices-have-equal-dimensions>
#proof[
	By @Invertible-transformations-have-equal-dimensions, if $T$ is
	an invertible linear transformation, $dim(V) = dim(W)$. Since the
	dimensions of $A$ are $dim(V)$ and $dim(W)$ respectively, $m = n$.
]

Indeed, it is possible to define a kernel and an image for an invertible
matrix. Consider the linear transformation $T: V |-> W$, with respect to
whom a $n times n$ matrix $A$ of real values can be associated. Therefore,
any vector $underline(w) in W$ can be written as $A underline(v)$, where
$underline(v)$ is a vector in $V$. Writing $v$ as a linear combination of
the canonical basis of $V$ gives:

$ underline(w) = A underline(v) = A(lambda_(1) underline(e_(1)) +
  lambda_(2) underline(e_(2)) + dots + lambda_(n) underline(e_(n))) =
  A lambda_(1) underline(e_(1)) + A lambda_(2) underline(e_(2)) +
  dots + A lambda_(n) underline(e_(n)) $

But multiplying the matrix $A$ by the canonical vector $underline(e_(i))$
simply returns the $i$-th column of $A$:

$ A underline(e_(i)) =
  mat(
	a_(1, 1), a_(1, 2), dots, a_(1, n);
	a_(2, 1), a_(2, 2), dots, a_(2, n);
	dots.v, dots.v, dots.down, dots.v;
	a_(n, 1), a_(n, 2), dots, a_(n, n);
) mat(0; dots.v; i; dots.v; 0) =
mat(a_(1, i); a_(2, i); dots.v; a_(n, i)) $

Which means that any image can be written as a linear combination of the
columns of $A$, taken as vectors:

$ underline(w) = A underline(v) = A lambda_(1) underline(e_(1)) +
  A lambda_(2) underline(e_(2)) + dots + A lambda_(n) underline(e_(n)) =
  lambda_(1) mat(a_(1, 1); a_(2, 1); dots.v; a_(n, 1)) +
  lambda_(2) mat(a_(1, 2); a_(2, 2); dots.v; a_(n, 2)) +
  dots + lambda_(n) mat(a_(1, n); a_(2, n); dots.v; a_(n, n)) $

Being $underline(w)$ a generic vector, this must mean that the columns of $A$,
taken as vectors, is a set that can generate $W$. To know the dimension of
$Im(V)$, that is to say, the rank of $A$, it suffices to find the smallest
number of column-vectors of $A$ that is linearly independent.

By @Rank-nullity-theorem, the dimension of $Im(V)$, which is equal to
$"rank"(A)$, has to be equal to the dimension of the domain, which in
this case is just $RR^(n)$ having dimension $n$. Therefore, for a matrix
to be invertible (that is, to be the matrix associated to an invertible
linear transformation), its rank has to be equal to the number of its
columns or, equivalently, if its columns form a linearly independent set.
If this happens, such a matrix is said to have *full rank*.

#lemma[
	The rank of a matrix is invariant with respect to transposition. In other
	words, $"rank(A)" = "rank"(A^(T))$.
] <Rank-invariant-with-transposition>
// #proof[
// To be added
// ]

#lemma[
	A matrix is invertible if and only if it has full rank.
] <Full-rank-matrices-are-invertible>

#theorem[
	Let $A$ be a square matrix. The following results are equivalent, meaning
	if one of these is true also the others are true:

	- $A$ is non singular;
	- There exists an inverse of $A$;
	- $A$ is full rank;
	- The rows/columns of $A$ form a linearly independent set.
]
// #proof[
// Just combine the results found elsewhere
// ]

*Gaussian moves* are special operations that can be performed on matrices. Said
operations are as follows:

- Swapping two rows/columns;
- Multiplying a row/column by a scalar;
- Summing a row/column to another row/column multiplied by a scalar.

#theorem[
	The application of Gaussian moves to a matrix does not change its rank.
] <Gauss-moves-rank>
// #proof[
// To be added
// ]

#lemma[
	Let $A$ be a square matrix, and let $A'$ be the matrix resulting from
	applying the first Gaussian move to $A$. Then $det(A) = -det(A')$.
]
// #proof[
// To be added
// ]

#theorem[
	The application of the third Gaussian move to a matrix does not change its
	determinant.
]
// #proof[
// To be added
// ]

A matrix is in *row echelon form* if all rows having only zero entries
are at the bottom and the left-most nonzero entry of every nonzero row,
called the *pivot*, is on the right of the leading entry of every row above.

#exercise[
	Provide some examples of matrices in row echelon form.
]
#solution[
	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ mat(0, 4, 1, 5, 2;
		   0, 0, 6, 1, 9;
		   0, 0, 0, 4, 1;
		   0, 0, 0, 0, 3) $],
		[$ mat(2, 1, 3;
		   0, 4, 2;
		   0, 0, 0) $],
		[$ mat(1, 3, 5, 0;
		   0, 9, 0, 1;
		   0, 0, -4, 2) $]
	)
]

#theorem[
	The rank of a matrix in row echelon form is equal to the number of its
	pivots.
] <Rank-echelon-pivots>
// #proof[
// To be added
// ]

@Rank-echelon-pivots suggests another way to compute the rank of a matrix.

#exercise[
	Compute the rank of the matrix $A = mat(1, -1, 3, 2; 3, 2, 7, 6;
	1, 4, 1, 2)$.
]
#solution[
	@Gauss-moves-rank guarantees that applying the third Gaussian move to $A$
	renders a matrix with the same rank. $A$ can therefore be converted into a
	matrix in row echelon form as follows:

	+ Substituting the third row with itself summed to the first multiplied by
	  $-1$;
	+ Substituting the second row with itself summed to the first multiplied by
	  $-3$;
	+ Substituting the second row with itself summed to the third multiplied by
	  $-1$.

	$ mat(1, -1, 3, 2; 3, 2, 7, 6; 1, 4, 1, 2) =>
	  mat(1, -1, 3, 2; 3, 2, 7, 6; 0, 5, -2, 0) =>
	  mat(1, -1, 3, 2; 0, 5, -2, 0; 0, 5, -2, 0) =>
	  mat(1, -1, 3, 2; 0, 5, -2, 0; 0, 0, 0, 0) $

	As stated in @Rank-echelon-pivots, the rank of $A$ is $2$.
]

@Basis-change-is-matrix-multiplication proves that it is possible to
convert the representation of a vector with respect to a given basis
in the representation of the same vector to a different basis by multiplying
the known representation with respect to a "conversion" matrix $P$. The same
can be achieved with respect to matrices associated to endomorphisms.

#theorem[
	Let $T: V |-> V$ be an endomorphism of dimension $n$. Let $A$ be the
	matrix associated to $T$ with respect to the basis $cal(B)$ (for both
	domain and codomain), and let $A'$ be the matrix associated to $T$ with
	respect to a different basis $cal(B')$. There exists an invertible matrix
	$P$ such that:

	$ A = P A' P^(-1) $
] <Matrix-basis-change-is-matrix-multiplication>
#proof[
	Let $underline(x)$ be a vector of $V$, and let $underline(y)$ be the
	result of applying $T$ to $underline(x)$. Being $T$ an endomorphism,
	both $underline(x)$ and $underline(y)$ belong to the same vector space,
	and can therefore be represented by the bases $cal(B)$ and $cal(B')$:

	#grid(
		columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
		[$ underline(x) <=> mat(x_(1); dots.v; x_(n))_(cal(B)) $],
		[$ underline(x) <=> mat(x'_(1); dots.v; x'_(n))_(cal(B')) $],
		[$ underline(y) = T(underline(x)) <=> mat(y_(1); dots.v; y_(n))_(cal(B)) $],
		[$ underline(y) = T(underline(x)) <=> mat(y'_(1); dots.v; y'_(n))_(cal(B')) $],
	)

	By definition of associated matrix, applying $T$ to $underline(x)$ is
	equivalent to multiplying $A$ with the representation of $underline(x)$
	with respect to $cal(B)$, or multiplying $A'$ with the representation
	of $underline(x)$ with respect to $cal(B')$:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat(y_(1); dots.v; y_(n))_(cal(B)) =
		A mat(x_(1); dots.v; x_(n))_(cal(B)) $],
		[$ mat(y'_(1); dots.v; y'_(n))_(cal(B')) =
		A' mat(x'_(1); dots.v; x'_(n))_(cal(B')) $]
	)

	As stated in @Basis-change-is-matrix-multiplication, there exist a matrix
	$P$ that permits to convert the representation of a vector with respect to
	a given basis in the representation to a different basis, while the inverse
	matrix $P^(-1)$ does the opposite conversion. Such conversion, since they
	belong to the same vector space $V$, can be done for both $underline(x)$
	and $underline(y)$:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat(y'_(1); y'_(2); dots.v; y'_(n)) =
		P^(-1) mat(y_(1); y_(2); dots.v; y_(n)) $],
		[$ mat(x'_(1); x'_(2); dots.v; x'_(n)) =
		P^(-1) mat(x_(1); x_(2); dots.v; x_(n)) $])

	Substituting in the previous expression gives:

	$ mat(y'_(1); dots.v; y'_(n))_(cal(B')) =
	A' mat(x'_(1); dots.v; x'_(n))_(cal(B')) =>
	P^(-1) mat(y_(1); dots.v; y_(n))_(cal(B)) =
	A' P^(-1) mat(x_(1); dots.v; x_(n))_(cal(B)) =>
	P^(-1) A cancel(mat(x_(1); dots.v; x_(n))_(cal(B))) =
	A' P^(-1) cancel(mat(x_(1); dots.v; x_(n))_(cal(B))) => \
	P^(-1) A = A' P^(-1) => cancel(P) cancel(P^(-1)) A = P A' P^(-1) =>
	A = P A' P^(-1) $
]
