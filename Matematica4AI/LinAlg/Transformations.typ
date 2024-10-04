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
