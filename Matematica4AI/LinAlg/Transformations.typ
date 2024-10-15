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

It can be shown that a linear transformation is equivalent to a manipulation
of matrices.

Let $phi.alt: V |-> W$ be a linear transformation between two vector space
$V$ and $W$. Let $B = {underline(b_(1)), dots, underline(b_(n))}$ be a basis
for $V$ and $C = {underline(c_(1)), dots, underline(c_(m))}$ a basis for $W$.
Each vector $underline(x) in V$ can be written as a linear combination of the
vectors of $B$:

$ underline(x) = sum_(i = 1)^(n) lambda_(i) underline(b_(i)) $

Applying $phi.alt$ to $underline(x)$ gives:

$ phi.alt(underline(x)) =
  phi.alt(sum_(i = 1)^(n) lambda_(i) underline(b_(i))) =
  sum_(i = 1)^(n) phi.alt(lambda_(i) underline(b_(i))) =
  sum_(i = 1)^(n) lambda_(i) phi.alt(underline(b_(i))) $

The two rightmost equalities stem from the fact that $phi.alt$ is linear.

Each $phi.alt(b_(i))$ is a vector of $W$, since it's the result of applying
$phi.alt$ to an vector of $V$. This means that each $phi.alt(b_(i))$ can
itself be written as a linear combination of elements of $C$:

$ phi.alt(b_(i)) = sum_(j = 1)^(m) gamma_(j, i) c_(j) $

Substituting it back in the previous expression gives:

$ phi.alt(underline(x)) =
  sum_(i = 1)^(n) lambda_(i) (sum_(j = 1)^(m) gamma_(j, i) c_(j)) =
  sum_(i, j = 1)^(n, m) lambda_(i) gamma_(j, i) c_(j) $

This means that, fixed a given basis $B$, to know all the relevant
information regarding a vector $underline(x)$ of $V$ it suffices to
"store" the $lambda$ coefficients of its linear combination with
respect to $B$ in a (column) vector.

In a similar fashion, to know all the relevant information of its
image $phi.alt(underline(x))$ it suffices to store the $sum_(j = 1)^(m)
lambda_(i) gamma_(j, i)$ coefficients of its linear combination with
respect to $C$ in a (column) vector:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ underline(x) <==> mat(lambda_(1); dots.v; lambda_(n)) $],
	[$ phi.alt(underline(x)) <==> mat(mu_(1); dots.v; mu_(n)) $]
)

Where, for clarity, each $sum_(j = 1)^(m) lambda_(i) gamma_(j, i)$ has been
written simply as $mu_(i)$.

It is then possible to describe the application of the transformation
$phi.alt$ as the following product of matrices:

$ mat(mu_(1); dots.v; mu_(n)) =
  mat(gamma_(1, 1), gamma_(1, 2), dots, gamma_(1, n);
      gamma_(2, 1), gamma_(2, 2), dots, gamma_(2, n);
      dots.v, dots.v, dots.down, dots.v;
      gamma_(m, 1), gamma_(m, 2), dots, gamma_(m, n))
  mat(lambda_(1); dots.v; lambda_(n)) $

#exercise[
	Consider the linear application $T: RR^(3) |-> RR^(2)$ defined below.
	Express it as a matrix multiplication with respect to the two bases
	$cal(B)_(1)$ and $cal(B)_(2)$.

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ T mat(x; y; z) = mat(x - z; y + z) $],
		[$ cal(B)_(1) = {mat(1; 0; 1), mat(2; 1; -1), mat(-2; 1; 4)} $],
		[$ cal(B)_(2) = {mat(1; 2), mat(2; 1)} $],
	)
]
#solution[
	The first step is to express the vectors of $cal(B)_(1)$ for $RR^(3)$
	evaluated in $T$ as linear combinations of the vectors of $cal(B)_(2)$
	for $RR^(2)$:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ T mat(1; 0; 1) =
		   lambda_(1, 1) mat(1; 2) + lambda_(2, 1) mat(2; 1) $],
		[$ T mat(2; 1; -1) =
		   lambda_(1, 2) mat(1; 2) + lambda_(2, 2) mat(2; 1) $],
		[$ T mat(-2; 1; 4) =
		   lambda_(1, 3) mat(1; 2) + lambda_(2, 3) mat(2; 1) $],
	)

	// And then?
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

// To move this around

#theorem[
	A matrix is invertible if and only if it has full rank.
] <Full-rank-matrices-are-invertible>

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
