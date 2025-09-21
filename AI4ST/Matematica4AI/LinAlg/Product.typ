#import "../Math4AI_definitions.typ": *

=== Inner product

Vector spaces, to be qualified as such, must provide the notion of a sum
between two vectors and the notion of a multiplication between a vector
and a scalar. However, some vector spaces support operations that go beyond
these two.

One such example is the *inner product*: given a vector space $V$, the
inner product of two vectors $underline(v_(1))$ and $underline(v_(2))$
of $V$, denoted as $angle.l underline(v_(1)), underline(v_(2)) angle.r$
or as $underline(v_(1)) dot underline(v_(2))$, is an operation that
returns a scalar and that possessing these properties:

- *Symmetry*: for any vectors $underline(v_(1)), underline(v_(2))$,
  $angle.l underline(v_(1)), underline(v_(2)) angle.r =
   angle.l underline(v_(2)), underline(v_(1)) angle.r$
- *Linearity of the first term*: For any two scalars $a, b$ and for any
  vectors $underline(v_(1)), underline(v_(2)), underline(v_(3))$,
  $angle.l a underline(v_(1)) + b underline(v_(2)), underline(v_(3))
    angle.r = a angle.l underline(v_(1)), underline(v_(3)) angle.r + b
    angle.l underline(v_(2)), underline(v_(3)) angle.r$
- *Positive-definiteness*: for any non-null vectors $underline(v_(1)),
  underline(v_(2))$, $angle.l underline(v_(1)), underline(v_(2)) angle.r
  gt.eq 0$.

Vector spaces having a well defined notion of an inner product are called
*inner product vector spaces*. Since it always return a scalar, the inner
product is sometimes also referred to as the *scalar product*. Since it is
sometimes represented as a dot, it is sometimes also referred to as the
*dot product*. Even though _scalar product_, _dot product_ and _inner
product_ are all synonims, the first two are mostly used when considering
the vector space $RR^(n)$, whereas the third is more generic.

#exercise[
	Is $RR^(n)$ an inner product vector space?
]
#solution[
	Yes. Given any two vectors $underline(x)$ and $underline(y)$ in
	$RR^(n)$, the standard inner product over $RR^(n)$ is defined as:

	$ angle.l underline(x), underline(y) angle.r =
	  x_(1) y_(1) + x_(2) y_(2) + dots + x_(n - 1) y_(n - 1) + x_(n) y_(n) =
	  sum_(i = 1)^(n) x_(i) y_(i) $

	All three properties are satisfied:

	- $angle.l underline(x), underline(y) angle.r =
	   x_(1) y_(1) + dots + x_(n) y_(n) =
	   y_(1) x_(1) + dots + y_(n) x_(n) =
	   angle.l underline(y), underline(x) angle.r$
	- $angle.l a underline(x) + b underline(y), underline(z) angle.r =
	   (a x_(1) + b y_(1)) z_(1) + dots + (a x_(n) + b y_(n)) z_(n) =
	   a (x_(1) z_(1)) + b (y_(1) z_(1)) + dots + a (x_(n) z_(n)) + b (y_(n) z_(n)) =
	   a angle.l underline(x), underline(z) angle.r + b angle.l underline(y), underline(z) angle.r $
	- $angle.l underline(x), underline(x) angle.r = 
	   x_(1) x_(1) + dots + x_(n) x_(n) =
	   x_(1)^(2) + dots + x_(n)^(2) gt.eq 0$
]


Any inner product induces a definition of *norm* of a vector, which
generalizes the intuitive notion of "length":

$ norm(underline(v)) = sqrt(angle.l underline(v)\, underline(v) angle.r) $

The inner product of a vector with itself is always non-negative, therefore
the square root is non problematic. Since it's always possible to define a
norm for any inner product vector space, they are also called *normed vector
spaces*.

#exercise[
	Consider the vector space $RR^(3)$. Compute the norm of $(1, 2, 3)$.
]
#solution[
	$ norm((1, 2, 3)) =
	  sqrt(angle.l (1\, 2\, 3)\, (1\, 2\, 3) angle.r) =
	  sqrt(1 dot 1 + 2 dot 2 + 3 dot 3) =
	  sqrt(1 + 4 + 9) =
	  sqrt(13) $
]

The inner product of two vectors is also related to the *angle* that
is formed between them.

#theorem[
	Given two vectors $underline(a)$ and $underline(b)$, let $0 lt.eq
	theta lt.eq pi$ be the angle between them. Then:

	$ cos(theta) = frac(angle.l underline(a)\, underline(b) angle.r,
                        norm(underline(a)) norm(underline(b))) $
] <Scalar-Product-And-Cosine>
#solution[
	Given the two vectors $underline(a)$ and $underline(b)$, let
	$underline(a) - underline(b)$ be the difference between the two:

	#figure[
		#diagram(
			edge-stroke: 0.75pt,
			spacing: 4em,
			edge((5, 2.5), (0, 2.5), marks: ("stealth", none), label-pos: 0, $x$),
			edge((0, 0), (0, 2.5), marks: ("stealth", none), label-pos: 0, $y$),
			edge((0, 2.5), (1, 0.5), marks: (none, "stealth"), stroke: 1pt + blue, $underline(a)$),
			edge((0, 2.5), (4, 2), marks: (none, "stealth"), stroke: 1pt + blue, $underline(b)$),
			edge((1, 0.5), (4, 2), marks: (none, "stealth"), stroke: 1pt + blue, $underline(a) - underline(b)$),
			node((0.5, 2), $theta$, radius: 0pt)
		)
	]

	Applying the Law of Cosines:

	$ norm(underline(a) - underline(b))^(2) =
	  norm(underline(a))^(2) + norm(underline(b))^(2) - 2 norm(underline(a)) norm(underline(b)) cos(theta) =>
	  -2 norm(underline(a)) norm(underline(b)) cos(theta) =
	  norm(underline(a) - underline(b))^(2) - norm(underline(a))^(2) - norm(underline(b))^(2) $

	Expanding the right hand side:

	$ -2 norm(underline(a)) norm(underline(b)) cos(theta) &=
	  norm(underline(a) - underline(b))^(2) - norm(underline(a))^(2) - norm(underline(b))^(2) = \
	  &= ((a_(x) - b_(x))^(2) + (a_(y) - b_(y))^(2)) - (a_(x)^(2) + a_(y)^(2)) - (b_(x)^(2) + b_(y)^(2)) = \
	  &= (a_(x) - b_(x))^(2) + (a_(y) - b_(y))^(2) - a_(x)^(2) - a_(y)^(2) - b_(x)^(2) - b_(y)^(2) = \
	  &= cancel(a_(x)^(2)) + cancel(b_(x)^(2)) - 2 a_(x) b_(x) + cancel(a_(y)^(2)) + cancel(b_(y)^(2)) - 2 a_(y) b_(y) - cancel(a_(x)^(2)) - cancel(a_(y)^(2)) - cancel(b_(x)^(2)) - cancel(b_(y)^(2)) = \
	  &= - 2 (a_(x) b_(x) + a_(y) b_(y)) = - 2 angle.l underline(a), underline(b) angle.r $

	Simplifying the $-2$ factor on both sides gives the desired result.
]

If the cosine of the angle between two vectors is $1$, said vectors are
said to be *parallel*, while if it is $0$ they are said to be *orthogonal*.
In particular:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ 1 = frac(angle.l underline(x)\, underline(y) angle.r,
	       norm(underline(x)) norm(underline(y))) =>
	       angle.l underline(x), underline(y) angle.r =
	       norm(underline(x)) norm(underline(y)) $],
	[$ 0 = frac(angle.l underline(x)\, underline(y) angle.r,
	       norm(underline(x)) norm(underline(y))) =>
	       angle.l underline(x), underline(y) angle.r = 0 $]
)

=== Cross product

Given two vectors $underline(a) = (a_(1), a_(2), a_(3)), underline(b) =
(b_(1), b_(2), b_(3)) in RR^(3)$, the *cross product* of $underline(a)$
and $underline(b)$, denoted as $underline(a) times underline(b)$, is
given by:

$ underline(a) times underline(b) =
  (a_(2)b_(3) - a_(3)b_(2), a_(3)b_(1) - a_(1)b_(3), a_(1)b_(2) - a_(2)b_(1)) $

Unlike the inner product, the result of the cross product is a vector.
For this reason, the cross product is also called *vector product*.
Also, while it is perfectly valid to define the inner product for
any number of dimensions, the cross product really makes sense only
in the context of $3$-dimensional vectors.

#lemma[
	Given two vectors $underline(a), underline(b) in RR^(3)$, their cross
	product $underline(a) times underline(b)$ is perpendicular to both
	$underline(a)$ and $underline(b)$.
]
#proof[
	This can be checked explicitly:

	$ angle.l (underline(a) times underline(b)), underline(a) angle.r &=
	  angle.l (a_(2)b_(3) - a_(3)b_(2), a_(3)b_(1) - a_(1)b_(3), a_(1)b_(2) - a_(2)b_(1)), underline(a) angle.r = \
	  &= sqrt(a_(1)(a_(2)b_(3) - a_(3)b_(2)) + a_(2)(a_(3)b_(1) - a_(1)b_(3)) + a_(3)(a_(1)b_(2) - a_(2)b_(1))) = \
	  &= sqrt(cancel(a_(1)a_(2)b_(3)) - cancel(a_(1)a_(3)b_(2)) + cancel(a_(2)a_(3)b_(1)) - cancel(a_(2)a_(1)b_(3)) + cancel(a_(3)a_(1)b_(2)) - cancel(a_(3)a_(2)b_(1))) =
	  sqrt(0) = 0 $

	$ angle.l (underline(b) times underline(a)), underline(b) angle.r &=
	  angle.l (b_(2)a_(3) - b_(3)a_(2), b_(3)a_(1) - b_(1)a_(3), b_(1)a_(2) - b_(2)a_(1)), underline(b) angle.r = \
	  &= sqrt(b_(1)(b_(2)a_(3) - b_(3)a_(2)) + b_(2)(b_(3)a_(1) - b_(1)a_(3)) + b_(3)(b_(1)a_(2) - b_(2)a_(1))) = \
	  &= sqrt(cancel(b_(1)b_(2)a_(3)) - cancel(b_(1)b_(3)a_(2)) + cancel(b_(2)b_(3)a_(1)) - cancel(b_(2)b_(1)a_(3)) + cancel(b_(3)b_(1)a_(2)) - cancel(b_(3)b_(2)a_(1))) =
	  sqrt(0) = 0 $
]

There is also a relationship between the cross product of two vectors
and the angle between them.

#theorem[
	Given two vectors $underline(a)$ and $underline(b)$, let $0 lt.eq
	theta lt.eq pi$ be the angle between them. Then:

	$ sin(theta) = frac(norm(underline(a) times underline(b)),
                        norm(underline(a)) norm(underline(b))) $
] <Cross-Product-And-Sine>
#solution[
	Given the two vectors $underline(a)$ and $underline(b)$, let
	$underline(a) times underline(b)$ be their cross product:

	#figure[
		#diagram(
			edge-stroke: 0.75pt,
			spacing: 4em,
			edge((5, 2.5), (0, 2.5), marks: ("stealth", none), label-pos: 0, $x$),
			edge((0, 0), (0, 2.5), marks: ("stealth", none), label-pos: 0, $y$),
			edge((-1.25, 3.75), (0, 2.5), marks: ("stealth", none), label-pos: 0, $z$),
			edge((0, 2.5), (-1, 0.5), marks: (none, "stealth"), stroke: 1pt + blue, $underline(a)$),
			edge((0, 2.5), (3.5, 3.5), marks: (none, "stealth"), stroke: 1pt + blue, $underline(b)$),
			edge((0, 2.5), (1.5, 1.25), marks: (none, "stealth"), stroke: 1pt + fuchsia, $underline(a) times underline(b)$),
		)
	]

	Taking the square of $norm(underline(a) times underline(b))$ gives:

	$ norm(underline(a) times underline(b))^(2) &=
	  (a_(2)b_(3) - a_(3)b_(2))^(2) + (a_(3)b_(1) - a_(1)b_(3))^(2) + (a_(1)b_(2) - a_(2)b_(1))^(2) = \
	  &= a_(2)^(2)b_(3)^(2) + a_(3)^(2)b_(2)^(2) - 2a_(2)a_(3)b_(2)b_(3) + 
	     a_(3)^(2)b_(1)^(2) + a_(1)^(2)b_(3)^(2) - 2a_(1)a_(3)b_(1)b_(3) + 
	     a_(1)^(2)b_(2)^(2) + a_(2)^(2)b_(1)^(2) - 2a_(1)a_(2)b_(1)b_(2) $

	Completing the square of the trinomial:

	$ norm(underline(a) times underline(b))^(2) &=
	  a_(2)^(2)b_(3)^(2) + a_(3)^(2)b_(2)^(2) - 2a_(2)a_(3)b_(2)b_(3) + 
	  a_(3)^(2)b_(1)^(2) + a_(1)^(2)b_(3)^(2) - 2a_(1)a_(3)b_(1)b_(3) + 
	  a_(1)^(2)b_(2)^(2) + a_(2)^(2)b_(1)^(2) - 2a_(1)a_(2)b_(1)b_(2) + \
	  &+ (a_(1)^(2)b_(1)^(2) - a_(1)^(2)b_(1)^(2))
	   + (a_(2)^(2)b_(2)^(2) - a_(2)^(2)b_(2)^(2))
	   + (a_(3)^(2)b_(3)^(2) - a_(3)^(2)b_(3)^(2)) = \
	  &= - (a_(1)b_(1) + a_(2)b_(2) + a_(3)b_(3))^(2) +
	     a_(2)^(2)b_(3)^(2) + a_(3)^(2)b_(2)^(2) + 
	     a_(3)^(2)b_(1)^(2) + a_(1)^(2)b_(3)^(2) + 
	     a_(1)^(2)b_(2)^(2) + a_(2)^(2)b_(1)^(2) +
	     a_(1)^(2)b_(1)^(2) + a_(2)^(2)b_(2)^(2) +
	     a_(3)^(2)b_(3)^(2) = \
	  &= a_(1)^(2)(b_(1)^(2) + b_(2)^(2) + b_(3)^(2)) +
	     a_(2)^(2)(b_(1)^(2) + b_(2)^(2) + b_(3)^(2)) +
	     a_(3)^(2)(b_(1)^(2) + b_(2)^(2) + b_(3)^(2)) 
	   - (a_(1)b_(1) + a_(2)b_(2) + a_(3)b_(3))^(2) = \
	   &= (a_(1)^(2) + a_(2)^(2) + a_(3)^(2))(b_(1)^(2) + b_(2)^(2) + b_(3)^(2)) 
	   - (a_(1)b_(1) + a_(2)b_(2) + a_(3)b_(3))^(2) $

	Substituting the explicit expression of the scalar product:

	$ norm(underline(a) times underline(b))^(2) =
	  (a_(1)^(2) + a_(2)^(2) + a_(3)^(2))(b_(1)^(2) + b_(2)^(2) + b_(3)^(2)) 
	  - (a_(1)b_(1) + a_(2)b_(2) + a_(3)b_(3))^(2) =
	  norm(underline(a))^(2) norm(underline(b))^(2) - angle.l underline(a), underline(b) angle.r^(2) $

	Applying @Scalar-Product-And-Cosine:

	$ norm(underline(a) times underline(b))^(2) &=
	  norm(underline(a))^(2) norm(underline(b))^(2) - angle.l underline(a), underline(b) angle.r^(2) =
	  norm(underline(a))^(2) norm(underline(b))^(2) - (norm(underline(a)) norm(underline(b)) cos(theta))^(2) = \
	  &= norm(underline(a))^(2) norm(underline(b))^(2) - norm(underline(a))^(2) norm(underline(b))^(2) cos^(2)(theta) =
	  norm(underline(a))^(2) norm(underline(b))^(2) (1 - cos^(2)(theta)) = \
	  &= norm(underline(a))^(2) norm(underline(b))^(2) sin^(2)(theta) =
	  (norm(underline(a)) norm(underline(b)) sin(theta))^(2) $

	Taking the square root on both sides, one obtains the desired result.
]

#corollary[
	Two non-null vectors are parallel if and only if their cross product
	is the null vector.
] <Cross-Product-Parallel>
#proof[
	For two non-null vectors $underline(a)$ and $underline(b)$ to be
	parallel, the angle $theta$ between them has to be equal to $pi$
	(or to $0$). If so, then $sin(theta) = 0$, but since @Cross-Product-And-Sine
	states that $sin(theta) = norm(underline(a) times underline(b))
	slash norm(underline(a)) norm(underline(b))$, this means that
	$norm(underline(a) times underline(b)) = 0$. The only vector that
	has norm equal to $0$ is the norm vector, therefore $underline(a)
	times underline(b) = underline(0)$.
]

The cross product also has an interesting geometric interpretation.

#corollary[
	The norm of the cross product $underline(a) times underline(b)$ is
	equivalent to the area of the parallelogram traced by the vectors
	$underline(a)$ and $underline(b)$.
]
#proof[
	#figure[
		#diagram(
			edge-stroke: 0.75pt,
			spacing: 4em,
			edge((0, 2.5), (0.5, 0.5), marks: (none, "stealth"), stroke: 1pt + blue, $underline(a)$),
			edge((0, 2.5), (4.5, 2.5), marks: (none, "stealth"), stroke: 1pt + blue, $underline(b)$),
			edge((0.5, 0.5), (5, 0.5), "--", stroke: 1pt + blue),
			edge((4.5, 2.5), (5, 0.5), "--", stroke: 1pt + blue),
			edge((0.5, 2.5), (0.5, 0.5), "--", stroke: 1pt + blue, $norm(underline(a)) sin(theta)$),
			node((0.375, 2), $theta$, radius: 0pt)
		)
	]

	Consider two vectors $underline(a)$ and $underline(b)$, with an
	angle $theta$ between them. The projection of $underline(a)$ onto
	$underline(b)$ has, by definition, norm equal to $norm(underline(a))
	sin(theta)$. The area of the traced parallelogram is base times
	height, that is, $norm(underline(b)) norm(underline(a)) sin(theta)$,
	which is also equal to $norm(underline(a) times underline(b))$ due
	to @Cross-Product-And-Sine.
]

#lemma[
	Given three vectors $underline(a), underline(b), underline(c) in RR^(3)$
	and a scalar $k$:

	+ $underline(a) times underline(b) = - underline(b) times underline(a)$;
	+ $(k underline(a)) times underline(b) = k(underline(a) times underline(b)) = underline(a) times (k underline(b))$;
	+ $underline(a) times (underline(b) + underline(c)) = underline(a) times underline(b) + underline(a) times underline(c)$;
	+ $(underline(a) + underline(b)) times underline(c) = underline(a) times underline(c) + underline(b) times underline(c)$;
	+ $underline(a) dot (underline(b) times underline(c)) = (underline(a) times underline(b)) dot underline(c)$;
	+ $underline(a) times (underline(b) times underline(c)) = (underline(a) dot underline(c)) underline(b) - (underline(a) dot underline(b)) underline(c)$.
] <Cross-Product-Properties>
// #proof[
// To be added
// ]
