#import "../Math4AI_definitions.typ": *

=== Definition

A transformation $phi.alt: V |-> W$, with both $V$ and $W$ being vector
spaces, is called a *linear transformation* or *vector space homomorphism*
if and only if:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ phi.alt(underline(v_(1)) + underline(v_(2))) =
	   phi.alt(underline(v_(1))) + phi.alt(underline(v_(2)))
	   space forall underline(v_(1)), underline(v_(2)) in V $],
	[$ phi.alt(lambda underline(v)) = lambda phi.alt(underline(v))
	   space forall underline(v) in V, lambda in RR $]
)

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

A linear transformation $phi.alt: V |-> W$ is said to be:

- *Injective* if, for any two distinct $underline(x), underline(y) in V$,
  $phi.alt(x) != phi.alt(y)$;
- *Surjective* if $phi.alt(V) = W$;
- *Bijective* if it's both injective and surjective.

With respect to these definitions, it is possible to classify a linear
transformation $phi.alt: V |-> W$ as follows:

- If it's bijective, it's called an *isomorphism*;
- If $V = W$, it's called an *endomorphism*;
- If it's both an isomorphism and an endomorphism, it's called an *automorphism*.

A remarkable property of linear transformations is that they are equivalent
to matrices. That is, for any linear transformation there exist matrices
that, when multiplied, have the same effect as applying $T$.

#theorem("Equivalence between linear transformations and matrices")[
	Let $phi.alt: V |-> W$ be a linear transformation between two vector
	spaces $V$ and $W$. Let $cal(B) = {underline(b_(1)), dots, underline(b_(n))}$
	be a basis for $V$ and $cal(B') = {underline(c_(1)), dots, underline(c_(m))}$
	a basis for $W$. Let $C$ and $C'$ be the coordinate representation of,
	respectively, a vector of $V$ and the result of applying $phi.alt$ to said
	vector. There exist a matrix $M_(phi.alt)$, dependent both on $cal(B)$ and
	on $cal(B')$, such that $M_(phi.alt) C = C'$.
] <Linear-transformations-as-matrices>
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

	However, the matrix on the right is just the coordinate
	representation for $underline(x)$. Renaming the entries of
	the matrix on the left with $mu_(1), dots, mu_(n)$, one gets:

	$ mat(mu_(1); dots.v; mu_(n))_(cal(B')) =
	  mat(gamma_(1, 1), gamma_(1, 2), dots, gamma_(1, n);
	      gamma_(2, 1), gamma_(2, 2), dots, gamma_(2, n);
	      dots.v, dots.v, dots.down, dots.v;
	      gamma_(m, 1), gamma_(m, 2), dots, gamma_(m, n))^(cal(B))_(cal(B'))
	  mat(lambda_(1); dots.v; lambda_(n))_(cal(B)) $

	The $gamma_(i, j)$ matrix is the desired matrix. The $i$-th column is
	composed by the coordinate representation of the result of applying
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

	Consider, as an example, the triple $(3, 1, 0) in V$. Its coordinate
	representation with respect to $cal(B)_(1)$ is:

	$ (3, 1, 0) =
	  lambda_(1) (1, 0, 1) + lambda_(2) (2, 1, -1) + lambda_(3) (-2, 1, 4) =
	  1 (1, 0, 1) + 1 (2, 1, -1) + 0 (-2, 1, 4) <==>
	  vec(1, 1, 0)_(cal(B)_(1)) $

	Applying $phi.alt$ to $(3, 1, 0)$ gives $phi.alt(3, 1, 0) =
	(3 - 0, 1 + 0) = (3, 1)$. Its coordinate representation with
	respect to $cal(B)_(2)$ is:

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

Note how @Basis-change-is-matrix-multiplication is just a special case of
@Linear-transformations-as-matrices when both vector spaces are the same
and the linear transformation is the one that maps every vector to itself,
the *identity transformation*. Also, the same result allows one to construct
the matrix representation of the same linear transformation employing
different bases.

#proposition[
	Let $phi.alt: V |-> W$ be a linear transformation between two vector
	spaces $V$ and $W$. Let $cal(B)$ and $cal(B')$ be two distinct bases
	for $V$ and let $cal(C)$ and $cal(C')$ be two distinct bases for $W$.
	Given a generic vector $underline(x) in V$, let $B$, $B'$ be the 
	coordinate representation of $underline(x)$ with respect to $cal(B)$
	and $cal(B')$, respectively. Given $phi.alt(underline(x)) in W$, the
	mapping of $underline(x)$ through $phi.alt$, let $C$, $C'$ be the 
	coordinate representation of $phi.alt(underline(x))$ with respect to
	$cal(C)$ and $cal(C')$, respectively. Let $M_(phi.alt)$ be the matrix
	representation of $phi.alt$ with respect to $cal(B)$ and $cal(C)$, and
	let $M'_(phi.alt)$ be the matrix representation of $phi.alt$ with respect
	to $cal(B')$ and $cal(C')$. Let $P$ be the matrix of basis change from
	$cal(B)$ to $cal(B')$, and let $Q$ be the matrix of basis change from
	$cal(C)$ to $cal(C')$. Then $M_(phi.alt) = Q^(-1) M'_(phi.alt) P$.
] <Matrix-basis-change-is-matrix-multiplication>
#proof[
	By definition, $M_(phi.alt) B = C$ and $M'_(phi.alt) B' = C'$.
	But $P B = B'$ and $Q C = C'$, which gives:

	$ M'_(phi.alt) B' = C' =>
	  M'_(phi.alt) P B = Q C =>
	  Q^(-1) M'_(phi.alt) P B = C =>
	  Q^(-1) M'_(phi.alt) P B = M_(phi.alt) B =>
	  Q^(-1) M'_(phi.alt) P = M_(phi.alt) $
]
