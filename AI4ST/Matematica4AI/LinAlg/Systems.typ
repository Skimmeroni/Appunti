#import "../Math4AI_definitions.typ": *

Any equation constituted by real numbers in the form:

$ a_(1) x_(1) + a_(2) x_(2) + dots + a_(n) x_(n) = b $

Is called a *linear equation*. Each $x_(i)$ with $i = 1, 2,
dots, n$ is called a *variable* or an *unknown*. If the
number of unknowns is small, variables are denoted with
$x, y, z, dots$. The $b$ term and ach $a_(i)$ with $i = 1,
2, dots, n$ is instead called a *coefficient*.

Any ordered $n$-ple of real numbers $(k_(1), k_(2), dots, k_(n))$
is said to be a *solution* of the previous equation if the following
holds:

$ a_(1) k_(1) + a_(2) k_(2) + dots + a_(n) k_(n) = b $

A linear equation does not necessarely have a solution

#exercise[
	Consider the following equations:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ 3x = 5 $],
		[$ 2x - y = 1 $],
		[$ 0x = 1 $]
	)

	Do they have any solutions?
]
#solution[
	- The equation $3x = 5$ has a single solution, that can be found
	  by rearranging the terms and obtaining $x = frac(5, 3)$;
	- The equation $2x - y = 1$ has infinite solutions. Indeed, any
	  pair of real numbers $(k, 2k - 1)$ with $k in RR$ is a solution
	  for said equation;
	- The equation $0x = 1$ has no solution, since any number multiplied
	  by $0$ is always $0$, which is different from $1$.
]

Any set of $m$ linear equations of $n$ unknowns $x_(1), x_(2), dots,
x_(n)$ taken into account at the same time is called a *system of
linear equations of* $m$ *equations of* $n$ *unknowns*, or simply a
*linear system*. A linear system has the following form:

$ cases(
	a_(1 1) x_(1) + a_(1 2) x_(2) + dots + a_(1 n) x_(n) = b_(1),
	a_(2 1) x_(1) + a_(2 2) x_(2) + dots + a_(2 n) x_(n) = b_(2),
	dots.v,
	a_(m 1) x_(1) + a_(m 2) x_(2) + dots + a_(m n) x_(n) = b_(m)) $

If each $b_(i)$ with $i = 1, 2, dots, m$ is zero, the system is said
to be an *homogeneous linear system*.

#exercise[
	What are some examples of linear equations?
]
#solution[
	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ cases(2x + 3y - 5z = 1,
 		        4x + y - 2z = 3) $],
		[$ cases(2x + 3y - 2z = 0,
				 4x + 3y - 2z = 0,
				 x + 2y - z = 0) $],
		[$ cases(2x + 2y = 1,
		         4x + y = -1) $]
	)
]

Any ordered $n$-ple of real numbers $(k_(1), k_(2), dots, k_(n))$ is
said to be a *solution* of the linear system if it is a solution of
each of the equations that constitute that system at the same time.

The set of all solutions of a linear system is called the *general
solution*. _Solving_ a linear system means finding, if it exists,
its general solution. A linear system having at least one solution
(that is, whose general solution is not the empty set), is said to
be *solvable*. A linear system that is not solvable (whose general
solution is the empty set) is said to be *unsolvable*.

The easiest way to solve a linear system, though not necessarely
the most efficient, consists in trying to isolate each unknown
and substituting its value in the other. This is allowed, since
each equation ought to give the same solution at the same time.
This method is informally called the _substitution method_.

#exercise[
	Consider the following systems of equations:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ cases(x + y = 0,
		         2x + 2y = 1) $],
		[$ cases(2x + y = 2,
		         4x + 2y = 4) $],
		[$ cases(3x + 2y = 4,
		         5x + y = 1) $]
	)

	Are they solvable? If they are, what is their general solution?
] <Solvability>
#solution[
	The first linear system is unsolvable:

	$ cases(x + y = 0, 2x + 2y = 1) =>
	  cases(x = -y, 2(-y) + 2y = 1) =>
	  cases(x = -y, -2y + 2y = 1) =>
	  cases(x = -y, 0 = 1) $

	The second linear system is solvable and has infinite solutions.
	More specifically, its general solution is the set of all pair
	of numbers in the form $(k, 2 - 2k)$ with $k in RR$:

	$ cases(2x + y = 2, 4x + 2y = 4) =>
	  cases(y = 2 - 2x, 4x + 2(2 - 2x) = 4) =>
	  cases(y = 2 - 2x, 4x + 4 - 4x = 4) =>
	  cases(y = 2 - 2x, 0 = 0) $

	The third linear system is solvable. Its general solution is
	the set containing as its single member the pair $(-frac(2, 7),
	frac(17, 7))$.

	$ cases(3x + 2y = 4, 5x + y = 1) =>
	  cases(y = 1 - 5x, 3x + 2(1 - 5x) = 4) =>
	  cases(y = 1 - 5x, 3x + 2 - 10x = 4) =>
	  cases(x = -frac(2, 7), y = frac(17, 7)) $
]

The term "linear system" suggests that it is possible to encode a
linear system of equations into a matrix. Indeed, this is the case;
for each system of equations, it is possible write a matrix product
that is equivalent to said system:

$ cases(a_(1, 1) x_(1) + a_(1, 2) x_(2) + dots + a_(1, n) x_(n) = b_(1),
        a_(2, 1) x_(1) + a_(2, 2) x_(2) + dots + a_(2, n) x_(n) = b_(2),
        dots.v,
        a_(m, 1) x_(1) + a_(m, 2) x_(2) + dots + a_(m, n) x_(n) = b_(m)) 
  <==>
  mat(a_(1, 1), a_(1, 2), dots, a_(1, n);
      a_(2, 1), a_(2, 2), dots, a_(2, n);
      dots.v, dots.v, dots.down, dots.v;
      a_(m, 1), a_(m, 2), dots, a_(m, n);)
  vec(x_(1), x_(2), dots.v, x_(n)) =
  vec(b_(1), b_(2), dots.v, b_(m)) $

Where the $a_(i, j)$ coefficients with $i in {1, dots, n}, j in {1,
dots, m}$ are collected into the matrix $A$, the $x_(i)$ unknowns
into a vector $underline(x)$ and the $b_(i)$ known terms into a
vector $underline(b)$. In compact form, an equivalent matrix product
for the system is $A underline(x) = underline(b)$. Since $underline(x)$
is a vector, a third way to write the matrix product is:

$ x_(1) vec(a_(1, 1), a_(2, 1), dots.v, a_(m, 1)) +
  x_(2) vec(a_(1, 2), a_(2, 2), dots.v, a_(m, 2)) +
  dots +
  x_(n) vec(a_(1, n), a_(2, n), dots.v, a_(m, n)) =
  vec(b_(1), b_(2), dots.v, b_(m)) $

#exercise[
	Write the following linear system of equations as a matrix product.

	$ cases(2x - y + z = 4,
	        x + 3y - 4z = 1,
	        -x + 5y + 6z = 0) $
]
#solution[
	$ A X = B =>
	  mat(2, -1, 1;
	      1, 3, -4;
	      -1, 5, 6;)
	  mat(x; y; z;) =
	  mat(4; 1; 0;) $
]

The $A$ matrix is called the *coefficient matrix*. The $A | underline(b)$
matrix, costructed by justapposing $underline(b)$ vector on the right side
of $A$, is called the *augmented matrix*.

$ A | underline(b) =
  mat(a_(1, 1), a_(1, 2), dots, a_(1, n), b_(1);
      a_(2, 1), a_(2, 2), dots, a_(2, n), b_(2);
      dots.v, dots.v, dots.down, dots.down, dots.v;
      a_(m, 1), a_(m, 2), dots, a_(m, n), b_(m);) $

#theorem("Rouché-Capelli Theorem")[
	A linear system of equations is solvable if and only if its
	coefficient matrix and its augmented matrix have the same rank.
] <Rouche-Capelli-theorem>
#proof[
	Consider the following linear system of equations $A underline(x)
	= underline(b)$:

	$ cases(a_(1 1) x_(1) + a_(1 2) x_(2) + dots + a_(1 n) x_(n) = b_(1),
	        a_(2 1) x_(1) + a_(2 2) x_(2) + dots + a_(2 n) x_(n) = b_(2),
	        dots.v,
	        a_(m 1) x_(1) + a_(m 2) x_(2) + dots + a_(m n) x_(n) = b_(m)) $

	Suppose that the $n$-tuple $underline(x)^(p) = (x_(1)^(p),
	x_(2)^(p), dots, x_(n)^(p))$ is a solution to the system.
	This means that:

	$ x_(1)^(p) vec(a_(1, 1), a_(2, 1), dots.v, a_(m, 1)) +
	  x_(2)^(p) vec(a_(1, 2), a_(2, 2), dots.v, a_(m, 2)) +
	  dots +
	  x_(n)^(p) vec(a_(1, n), a_(2, n), dots.v, a_(m, n)) =
	  vec(b_(1), b_(2), dots.v, b_(m)) $

	This means that the vector $underline(b)$ is a linear combination
	of the column vectors of $A$, with $x_(1)^(p), dots, x_(n)^(p)$
	being the coefficients. This in turn means that $underline(b)$ belongs
	to the vector space generated by the column vectors of $A$. The rank
	of $A$ is precisely the dimension of the vector space generated by $A$,
	hence $"rank"(A) = "rank"(A | underline(b))$ because $underline(b)$ is
	linearly dependent on the columns of $A$.

	Suppose instead that $"rank"(A) = "rank"(A | underline(b))$. It must
	then mean that $underline(b)$ is linearly dependent on the columns of
	$A$. Then, there must exist a $n$-tuple of real numbers $(lambda_(1),
	dots, lambda_(n))$ such that:

	$ vec(b_(1), b_(2), dots.v, b_(m)) =
	  lambda_(1) vec(a_(1, 1), a_(2, 1), dots.v, a_(m, 1)) +
	  lambda_(2) vec(a_(1, 2), a_(2, 2), dots.v, a_(m, 2)) +
	  dots +
	  lambda_(n) vec(a_(1, n), a_(2, n), dots.v, a_(m, n)) =
	  mat(a_(1, 1), a_(1, 2), dots, a_(1, n);
	      a_(2, 1), a_(2, 2), dots, a_(2, n);
	      dots.v, dots.v, dots.down, dots.v;
	      a_(m, 1), a_(m, 2), dots, a_(m, n))
      vec(lambda_(1), lambda_(2), dots.v, lambda_(n)) $

	But this is precisely the definition of the system of equations having
	the $n$-tuple $(lambda_(1), dots, lambda_(n))$ as a solution. Hence,
	the system is solvable.
]

#exercise[
	Consider the following systems of equations:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ cases(x - y + 2z = 1,
		         3x + y + 3z = 6,
		         x + 3y - z = -1) $],
		[$ cases(x + 3y - z = -2,
		         4x + y + z = 1,
		         2x - 5y + 3z = 5) $]
	)

	Are they solvable?
]
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ A =
		   mat(1, -1, 2;
			   3, 1, 3;
			   1, 3, -1;) $],
		[$ A | underline(b) =
		   mat(1, -1, 2, 1;
		       3, 1, 3, 6;
		       1, 3, -1, -1;) $]
	)

	Since $"rank"(A) = 2$ and $"rank"(A | underline(b)) = 3$,
	@Rouche-Capelli-theorem states that the
	linear system is unsolvable.

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ A =
		   mat(1, 3, -1;
		       4, 1, 1;
		       2, -5, 3;) $],
		[$ A | underline(b) =
		   mat(1, 3, -1, -2;
			   4, 1, 1, 1;
			   2, -5, 3, 5;) $]
	)

	Since $"rank"(A) = 2$ and $"rank"(A | underline(b)) = 2$,
	@Rouche-Capelli-theorem states that the linear system is
	solvable.
]

#lemma[
	An homogeneous linear system $A underline(x) = underline(0)$ is
	always solvable.
]
#proof[
	Let $A$ and $A | underline(0)$ be the coefficient and
	augmented matrices of an homogeneous linear system. Being
	homogeneous, the $underline(0)$ vector is entirely constituted
	by zeros, and therefore $A$ and $A | underline(0)$ have the
	same rank. Applying @Rouche-Capelli-theorem, it is guaranteed
	that said linear system is solvable.

	It is also easy to see that the _null solution_, constituted by all
	zeros, is certainly a solution for the system, since $A underline(0)
	= underline(0)$. This may or may not be the only one.
]

Notice how @Rouche-Capelli-theorem only deals with the solvability
of a linear system of equations, and is not concerned with how many
solutions exist. However, it is possible to know the number of possible
solutions for any system.

#theorem[
	Any linear system of equations either has no solution, exactly one
	solution or infinitely many solutions.
] <Zero-one-infinite-solutions>
#proof[
	To convince oneself that there exists at least one linear system of
	equations that has zero, one or infinitely many solutions, @Solvability
	shows some examples. What has to be shown is that if a linear system of
	equations has more than one solution, then it must have infinitely many
	solutions.

	Consider a solvable linear system of equations $A underline(x) =
	underline(b)$ that has more than one solution. Suppose that two
	of its solutions are $underline(x)^(p)$ and $underline(x)^(q)$,
	with $underline(x)^(p) != underline(x)^(q)$. This means that
	$A underline(x)^(p) = underline(b)$ and $A underline(x)^(q) =
	underline(b)$, which in turn implies $A underline(x)^(p) = A
	underline(x)^(q)$. Grouping the terms, one has $A(underline(x)^(p)
	- underline(x)^(q)) = underline(0)$.

	Consider $underline(x)^(*) = underline(x)^(p) + k(underline(x)^(p) -
	underline(x)^(q))$, with $k in RR$. Since $underline(x)^(p) !=
	underline(x)^(q)$, $k(underline(x)^(p) - underline(x)^(q)) !=
	underline(0)$, which means that $underline(x)^(*) != underline(x)^(p)$.
	$underline(x)^(*)$ is another solution to $A underline(x) =
	underline(b)$, since:

	$ A underline(x)^(*) =
	  A(underline(x)^(p) + k(underline(x)^(p) - underline(x)^(q))) =
	  A underline(x)^(p) + k A(underline(x)^(p) - underline(x)^(q)) =
	  underline(b) + k A(underline(x)^(p) - underline(x)^(q)) =
	  underline(b) + k underline(0) =
	  underline(b) $

	However, since there is no restriction on which $k$ should be chosen,
	$underline(x)^(*)$ represents a family of solutions of infinite size.
	That is to say, if a linear system of equations has at least two
	solutions, it's always possible to construct infinitely many solutions
	from such solutions.
]

A linear system of equations is said to be *determined* if it has as
many equations as unknowns. It is instead said to be *overdetermined*
if it has more equations than unknowns or *underdetermined* if it has
more unknowns than equations. Determined, overdetermined or underdetermined
are either solvable or unsolvable.

#lemma[
	Consider a solvable linear system of equations that is determined.
	The system has one and only solution if and only if the rank of the
	coefficient matrix equals the number of equations in the system. On
	the other hand, the system has infinitely many solutions if and only
	if the rank of the coefficient matrix is smaller than the number of
	equations in the system.
]
// #proof[
// Consider a solvable linear system of equations $A underline(x) =
// underline(b)$ that is determined. Being determined, the matrix $A$
// has to be a square matrix, suppose of dimension $n times n$. Being
// solvable, @Rouche-Capelli-theorem ensures that $"rank"(A) =
// "rank"(A | underline(b))$.
// ]

#lemma[
	Consider a solvable linear system of equations that is overdetermined.
	The system has one and only solution if and only if the rank of the
	coefficient matrix equals the number of equations in the system. On
	the other hand, the system has infinitely many solutions if and only
	if the rank of the coefficient matrix is smaller than the number of
	equations in the system.
]
// #proof[
// To be added
// ]

#lemma[
	An underdetermined linear system of equations that is solvable
	always has infinitely many solutions. In particular, the number
	of free variables in the system is given by the difference between
	the number of equations and the rank of the coefficient matrix.
]
// #proof[
// To be added
// ]

The previous lemmas characterize the number of solutions that different
system of equations can have, but do not specify how to find them.
@Cramer-theorem instructs how to find solutions for a determined system.

#theorem("Cramer Theorem")[
	Consider a determined system of linear equations $A underline(x) =
	underline(b)$. If $A$ is not singular, then it is solvable. Moreover,
	its one and only solution is $underline(x)^(p) = A^(-1) underline(b)$.
] <Cramer-theorem>
#proof[
	To prove that $A underline(x) = underline(b)$ can have at most one
	solution, suppose by contradiction that this is not the case, and
	therefore that the system has two or more solutions. Suppose that
	two of its solutions are $underline(x)^(p)$ and $underline(x)^(q)$,
	with $underline(x)^(p) != underline(x)^(q)$. As it was the case in
	@Zero-one-infinite-solutions, it's possible to write $A(underline(x)^(p)
	- underline(x)^(q)) = underline(0)$. Since $A$ is assumed to be
	invertible:

	$ A (underline(x)^(p) - underline(x)^(q)) = underline(0) =>
	  cancel(A^(-1)) cancel(A) (underline(x)^(p) - underline(x)^(q)) = A^(-1) underline(0) =>
	  underline(x)^(p) - underline(x)^(q) = underline(0) =>
	  underline(x)^(p) = underline(x)^(q) $

	But it was assumed that $underline(x)^(p) != underline(x)^(q)$, which
	leads to a contradiction. It has to be true then that the system has
	one and only solution.

	The fact that $underline(x)^(p) = A^(-1) underline(b)$ is a possible
	solution to the system stems from the obvious fact that substituting
	$underline(x)$ with $underline(x)^(p)$ gives $A A^(-1) underline(b) =
	underline(b)$. However, since $x^(p) = A^(-1) underline(b)$, the
	existence of $x^(p)$ necessitates $A$ to be invertible, which is to
	say that $A$ has to be not singular. Also, since it has just been shown
	that such system has a single solution, this solution also happens to
	be the one and only.
]

@Cramer-theorem is powerful, but holds only for determined system.
This is because the coefficient matrix, to be inverted, has to be
a square matrix, which happens only in determined systems. Moreover,
for large matrices, computing the inverse matrix can be very expensive.
A more generic approach, which also happens to be faster, is given in
@Gaussian-elimination.

#theorem("Principle of Gaussian elimination")[
	Let $A$ be the coefficient matrix of a linear system of equations
	$S$. Applying any Gauss move one or more times to $A$ gives a new
	matrix $A'$ associated to a new linear system of equations $S'$
	whose general solution is the same of $S$. 
] <Gaussian-elimination>
// #proof[
// To be added
// ]
