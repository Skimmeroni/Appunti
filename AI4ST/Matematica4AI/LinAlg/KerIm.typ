#import "../Math4AI_definitions.typ": *

=== Image

Let $T: V mapsto W$ a linear transformation between vector spaces $V$ and $W$.
The set of all vectors of $W$ that have a correspondant in $V$ through $T$
is called the *image* of the transformation $T$, and is denoted as $Im(T)$.
It may or may not coincide with $W$.

$ Im(T) = {underline(w) in W: exists underline(v) in V space "s.t." space
  T(underline(v)) = underline(w)} $

#exercise[
	Given the linear transformation $T: RR_(2)[x] mapsto RR_(2)[x]$ defined as
	$T(p(x)) = x p(x) - frac(1, 2) x^(2) frac(d, d x) p(x)$, compute its image.
]
#solution[
	The image of $T$ is the set of all polynomials $q(x) = a_(1) + a_(2)x +
	a_(3)x^(2)$ such that $q(x) = T(p(x))$. That is:

	$ q(x) &= x p(x) - frac(1, 2) x^(2) p(x) => \
	  a_(1) + a_(2)x + a_(3)x^(2) &= x (b_(1) + b_(2)x + b_(3)x^(2)) - frac(1, 2) x^(2) frac(d, d x) (b_(1) + b_(2)x + b_(3)x^(2)) => \
	  a_(1) + a_(2)x + a_(3)x^(2) &= x b_(1) + b_(2)x^(2) + cancel(b_(3)x^(3)) - frac(1, 2) x^(2) b_(2) - cancel(b_(3)x^(3)) => \
	  a_(1) + (a_(2) - b_(1))x + (a_(3) - frac(1, 2) b_(2)) x^(2) &= 0 => 
	  cases(
		a_(1) = 0,
		a_(2) - b_(1) = 0,
		a_(3) - frac(1, 2) b_(2) = 0) =>
	  cases(
		a_(1) = 0,
		a_(2) = b_(1),
		a_(3) = frac(1, 2) b_(2)) $

	This means that $Im(T)$ is the set:

	$ Im(T) = {q(x) in RR_(2)[x] mid(|) q(x) = h x + frac(1, 2)k x^(2), h in RR, k in RR} $
]

#lemma[
	Let $T: V mapsto W$ be a linear transformation between vector spaces $V$ and
	$W$. $Im(W)$ is a subspace of $W$.
] <Image-of-transformation-is-vector-space>
#proof[
	To show that $Im(W)$ is a subspace of $W$, it has to be proven
	that $underline(w_(1)) + underline(w_(2)) in Im(W)$ holds for
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

Since it's possible to represent any linear transformation employing
a matrix, it's also possible to extend the notion of image to matrices
as well. Consider the matrix $M_(phi.alt)$ associated to the linear
transformation $phi.alt: V mapsto W$ with respect to two bases $cal(B)$
and $cal(C)$. The image of $M_(phi.alt)$ is the set of all coordinate
vector representations $Y$ of vectors of $W$ such that it exists a
coordinate representation vector $X$ of a vector in $V$ such that
$M X = Y$.

#exercise[
	What is the image of $A = mat(1, 2, 3; 1, 4, 9; 1, 5, 12)$?
]
#solution[
	$ mat(1, 2, 3; 1, 4, 9; 1, 5, 12) vec(x, y, z) &= vec(l_(1), l_(2), l_(3)) => 
	  mat(1 dot x + 2 dot y + 3 dot z;
	      1 dot x + 4 dot y + 9 dot z;
	      1 dot x + 5 dot y + 12 dot z) = vec(l_(1), l_(2), l_(3)) => \
	  mat(x + 2y + 3z; x + 4y + 9z; x + 5y + 12z) &= vec(l_(1), l_(2), l_(3)) =>
	  cases(x + 2y + 3z = l_(1), x + 4y + 9z = l_(2), x + 5y + 12z = l_(3)) => 
	  cases(l_(3) = 12z +5y +x,
	        l_(2) = x + 4y + 9z,
	        l_(1) = 3 l_(2) - 2l_(3)) $

	Which gives:

	$ Im(A) = {X mid(|) X = vec(3h - 2k, h, k), h in RR, k in RR} $
]

=== Kernel

Let $T: V mapsto W$ a linear transformation between vector spaces $V$ and
$W$. The set of all vectors of $V$ such that the application of $T$ to
those vectors gives the null vector (of $W$) is called the *kernel* of
$T$, and is denoted as $ker(T)$.

$ ker(T) = {underline(v) in V: T(underline(v)) = underline(0)} $

#exercise[
	Given the linear transformation $T: RR_(2)[x] mapsto RR_(2)[x]$ defined as
	$T(p(x)) = x p(x) - frac(1, 2) x^(2) frac(d, d x) p(x)$, compute its rank.
]
#solution[
	The kernel of $T$ is the set of all polynomials $p(x) = a_(1) +
	a_(2)x + a_(3)x^(2)$ such that $T(p(x)) = 0$. That is:

	$ T(p(x)) = 0 =>
	  x p(x) - frac(1, 2) x^(2) p(x) = 0 => \
	  x (a_(1) + a_(2)x + a_(3)x^(2)) - frac(1, 2) x^(2) frac(d, d x) (a_(1) + a_(2)x + a_(3)x^(2)) = 0 => \
	  a_(1)x + a_(2)x^(2) + a_(3)x^(3) - frac(1, 2) x^(2) (a_(2) + 2a_(3)x) = 0 => \
	  a_(1)x + a_(2)x^(2) + cancel(a_(3)x^(3)) - frac(1, 2) a_(2) x^(2) - cancel(a_(3) x^(3)) = 0 => \
	  a_(1)x + frac(1, 2) a_(2) x^(2) = 0 =>
	  a_(1) + frac(1, 2) a_(2) x = 0 =>
	  cases(a_(1) = 0, frac(1, 2) a_(2) = 0, a_(3) = a_(3)) =>
	  cases(a_(1) = 0, a_(2) = 0, a_(3) = a_(3)) $
	
	This means that $ker(T)$ is the set:

	$ ker(T) = {p(x) in RR_(2)[x] mid(|) p(x) = h x^(2), h in RR} $

	Indeed:

	$ T(h x^(2)) =
	  x (h x^(2)) - frac(1, 2) x^(2) frac(d, d x) (h x^(2)) =
	  h x^(3) - frac(1, 2) x^(2) (2h x) =
	  cancel(h x^(3)) - cancel(h x^(3)) =
	  0 $
]

#lemma[
	Let $T: V mapsto W$ be a linear transformation between vector spaces $V$
	and $W$. $ker(V)$ is a subspace of $V$.
] <Kernel-of-transformation-is-vector-space>
#proof[
	To show that $ker(W)$ is a subspace of $W$, it has to be proven
	that $underline(w_(1)) + underline(w_(2)) in ker(W)$ holds for
	all $underline(w_(1)), underline(w_(2)) in ker(W)$ and that $lambda
	underline(w) in ker(W)$ holds for all $underline(w) in ker(W)$ and
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

As it was done for the image, it's possible to define the kernel of a matrix.
Consider the matrix $M_(phi.alt)$ associated to the linear transformation
$phi.alt: V mapsto W$ with respect to two bases $cal(B)$ and $cal(C)$.
The kernel of $M_(phi.alt)$ is the set of all coordinate vector
representations $X$ of vectors of $V$ such that $M X = underline(0)$.

#exercise[
	What is the kernel of $A = mat(1, 2, 3; 1, 4, 9; 1, 5, 12)$?
]
#solution[
	$ mat(1, 2, 3; 1, 4, 9; 1, 5, 12) vec(x, y, z) &= vec(0, 0, 0) => 
	  mat(1 dot x + 2 dot y + 3 dot z;
	      1 dot x + 4 dot y + 9 dot z;
	      1 dot x + 5 dot y + 12 dot z) = vec(0, 0, 0) => \
	mat(x + 2y + 3z; x + 4y + 9z; x + 5y + 12z) &= vec(0, 0, 0) => 
	cases(x + 2y + 3z = 0, x + 4y + 9z = 0, x + 5y + 12z = 0) =>
	cases(x = -2y - 3z, y + 3z = 0, 3y + 9z = 0) =>
	cases(x = 3z, y = -3z, z = z) $

	Which gives:

	$ ker(A) = {X mid(|) X = t vec(3, -3, 1), t in RR} $
]

=== Rank and nullity

Let $T: V mapsto W$ be a linear transformation between vector spaces $V$
and $W$. The dimension of the image of $T$ is called the *rank* of $T$,
and denoted as $"rank"(T)$, while the dimension of the kernel of $T$ is
called the *nullity* of $T$, and denoted as $"null"(T)$. Again, the notions
of rank and nullity extend to matrices in the natural way.

#theorem("Rank-nullity theorem")[
	For any linear transformation $T: V mapsto W$, $dim(V) = "rank"(T) +
	"null"(T)$.
] <Rank-nullity-theorem>
// #proof[
// Hard to prove
// ]

#exercise[
	Consider the linear transformation $T: "Mat"(2 times 2) mapsto
	"Mat"(2 times 2)$ defined as:

	$ T(mat(a, b; c, d)) = mat(a + b + c, 2b; b, 3d + 2c) $

	What are its rank and nullity?
]
#solution[
	The kernel of $T$ is given by:

	$ mat(a + b + c, 2b; b, 3d + 2c) = mat(0, 0; 0, 0) =>
	  cases(a + b + c = 0,
	        2b = 0,
	        b = 0,
	        3d + 2c = 0) =>
	  cases(a = -c,
	        b = 0,
	        b = 0,
	        d = -frac(2, 3)c) $

	Which means that $ker(T)$ is the set:

	$ ker(T) = {M in "Mat"(2 times 2) mid(|) M = h mat(1, 0; 0, frac(2, 3)), h in RR} $

	$ker(T)$ is spanned by a single matrix, which means that its dimension
	is $1$. The image of $T$ is given by:

	$ mat(a + b + c, 2b; b, 3d + 2c) = mat(l_(1), l_(2); l_(3), l_(4)) =>
	  cases(a + b + c = l_(1),
	        2b = l_(2),
	        b = l_(3),
	        3d + 2c = l_(4)) =>
	  cases(l_(1) = a + b + c,
	        l_(2) = 2l_(3),
	        l_(3) = b,
	        l_(4) = 3d + 2c) $

	Which means that $Im(T)$ is the set:

	$ Im(T) = {M in "Mat"(2 times 2) mid(|)
	           M = alpha mat(1, 0; 0, 0) + beta mat(0, 2; 1, 0) + gamma mat(0, 0; 0, 1),
	           alpha in RR, beta in RR, gamma in RR} $

	$Im(T)$ is spanned by three matrices, which means that its dimension
	is $3$. Note that the dimension of $"Mat"(2 times 2)$ is $4$, and
	indeed $"rank"(T) + "null"(T) = 3 + 1 = 4$.
]

#lemma[
	The rank of a linear transformation is equal to the rank of its matrix
	representation (with respect to any basis).
]
// #proof[
//
// ]

=== Inverse

Let $T: V mapsto W$ be a linear transformation between vector spaces $V$ and
$W$. The linear transformation $T^(-1): W mapsto V$ is said to be the *inverse*
of $T$ if:

$ T^(-1)(T(underline(v))) = T(T^(-1)(underline(v))) = underline(v),
  space forall underline(v) in V $

As for any function, a linear transformation $T$ has an inverse if and only
if it's bijective. For this reason, bijective linear transformations are
also referred to as *invertible* transformations.

#lemma[
	Let $T: V |-> W$ be a linear transformation. $T$ is injective if and
	only if $"null"(T) = 0$.
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

#corollary[
	Let $T: V |-> W$ be a linear transformation. $T$ is invertible if and
	only if $dim(V) = dim(W)$.
] <Invertible-transformations-have-equal-dimensions>
#proof[
	By @Rank-nullity-theorem, $dim(V) = dim(ker(T)) + dim(Im(T))$. Being
	$T$ invertible, the dimension of the image equals the dimension of
	the codomain $W$. By @Injective-transformations-have-empty-nullity,
	$dim(ker(T)) = 0$. Therefore, $dim(V) = 0 + dim(Im(T)) = dim(W)$.
]

#exercise[
	Consider the invertible linear transformation $T: "Mat"(2 times 2)
	mapsto "Mat"(2 times 2)$ defined as:

	$ T(mat(a, b; c, d)) = mat(a + b + c, 2b; b + c, 3d + 2c) $

	What is its inverse?
]
#solution[
	Reversing the equality and solving for ${l_(1), l_(2), l_(3), l_(4)}$:

	$ mat(l_(1), l_(2); l_(3), l_(4)) =& mat(a + b + c, 2b; b + c, 3d + 2c) =>
	  cases(l_(1) = a + b + c,
	        l_(2) = 2b,
	        l_(3) = b + c,
	        l_(4) = 3d + 2c) =>
	  cases(l_(1) = a + frac(1, 2) l_(2) + c,
	        b = frac(1, 2) l_(2),
	        l_(3) = frac(1, 2) l_(2) + c,
	        l_(4) = 3d + 2c) => \
	  &cases(l_(1) = a + l_(3),
	        b = frac(1, 2) l_(2),
	        c = l_(3) - frac(1, 2) l_(2),
	        l_(4) = 3d + 2l_(3) - l_(2)) =>
	  cases(a = l_(1) - l_(3),
	        b = frac(1, 2) l_(2),
	        c = l_(3) - frac(1, 2) l_(2),
	        l_(4) = 3d + 2l_(3) - l_(2)) =>
	  cases(a = l_(1) - l_(3),
	        b = frac(1, 2) l_(2),
	        c = l_(3) - frac(1, 2) l_(2),
	        d = frac(1, 3) l_(4) - frac(2, 3) l_(3) + frac(1, 3) l_(2)) $

	Which gives:

	$ T^(-1)(mat(a, b; c, d)) = mat(a - c, frac(1, 2) b; c - frac(1, 2) b, frac(1, 3) d - frac(2, 3) c + frac(1, 3) b) $

	Indeed:

	$ T^(-1)(T(mat(a, b; c, d))) &=
	  T^(-1)(mat(a + b + c, 2b; b + c, 3d + 2c)) = \
	  &= mat((a + b + c) - (b + c),
	      frac(1, 2) (2b);
	      (b + c) - frac(1, 2) (2b),
	      frac(1, 3) (3d + 2c) - frac(2, 3) (b + c) + frac(1, 3) 2b) = \
	  &= mat(a + cancel(b) + cancel(c) - cancel(b) - cancel(c),
	      b;
	      cancel(b) + c - cancel(b),
	      d + cancel(frac(2, 3) c) - cancel(frac(2, 3) b) + cancel(frac(2, 3) c) + cancel(frac(2, 3) b)) =
	  mat(a, b; c, d) $
]
