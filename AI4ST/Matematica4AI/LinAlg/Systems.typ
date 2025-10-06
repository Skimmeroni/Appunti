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

#lemma[
	A solvable linear system of equations has a single solution if
	and only if the rank of its coefficient matrix equals the number
	of unknowns in the system.
] <Single-solution-rank-unknowns>
// #proof[
// To be added
// ]

A linear system of equations is said to be *determined* if it has as
many equations as unknowns. It is instead said to be *overdetermined*
if it has more equations than unknowns or *underdetermined* if it
has more unknowns than equations.

Determined, overdetermined or underdetermined systems may or may not
be solvable. In particular, solvable determined and overdetermined
system can have either a single solution or infinitely many solutions,
while solvable underdetermined systems always have infinitely many
solutions.

#corollary[
	A solvable underdetermined linear system of equations always has
	infinitely many solutions.
]
#proof[
	@Single-solution-rank-unknowns states that the only way for a
	system of equations to have a single solution is to have a
	coefficient matrix whose rank equals the number of unknowns.
	However, an underdetermined system cannot satisfy such condition,
	because its rank is at most equal to the number of its equations.
	@Zero-one-infinite-solutions states that, if a system is solvable,
	it either has a single solution or infinitely many solutions;
	since a solvable underdetermined system cannot have a single
	solution, it must have infinitely many solutions.
]

#lemma[
	If a linear system of equations has infinitely many solutions, the
	number of free variables in the system is given by the difference
	between the number of equations and the rank of the coefficient matrix.
]
// #proof[
// To be added
// ]

The previous results characterize the number of solutions that
different system of equations can have, but do not specify how to
find them. @Cramer-rule instructs how to find solutions for a
determined system.

#theorem("Cramer's Rule")[
	Consider a determined system of linear equations $A underline(x) =
	underline(b)$. If it has a single solution, such solution is
	$underline(x)^(*) = A^(-1) underline(b)$, given component-wise as:

	#set math.mat(delim: "|")

	$ x^(*)_(i) =
	  frac(display(mat(a_(1, 1), dots, a_(1, i - 1), b_(1), a_(1, i + 1), dots, a_(1, n);
	                   a_(1, 2), dots, a_(2, i - 1), b_(2), a_(2, i + 1), dots, a_(2, n);
	                   dots.v, dots.down, dots.v, dots.v, dots.v, dots.down, dots.v;
	                   a_(n, 1), dots, a_(n, i - 1), b_(n), a_(n, i + 1), dots, a_(n, n))),
	       display(mat(a_(1, 1), a_(1, 2), dots, a_(1, n);
	                   a_(1, 2), a_(2, 2), dots, a_(2, n);
	                   dots.v, dots.v, dots.down, dots.v;
	                   a_(n, 1), a_(n, 2), dots, a_(n, n)))) =
	frac(det(A_(i)(underline(b))), det(A)) $

	Where $A_(i)(underline(b))$ is the matrix $A$ with the $i$-th column
	replaced by $underline(b)$.
] <Cramer-rule>
#proof[
	The fact that the only solution to the system is precisely
	$underline(x)^(*) = A^(-1) underline(b)$ stems from the obvious
	fact that substituting it in $A underline(x) = underline(b)$
	yields a valid identity.

	$A^(-1)$ certainly exists because by @Single-solution-rank-unknowns
	a system of equations has a single solution if and only if the rank
	of its coefficient matrix equals the number of unknowns in the system.
	Since the system is determined, having the rank of its coefficient
	matrix equal to the number of unknowns means that the matrix is full
	rank, hence invertible (@Full-rank-matrices-are-invertible).

	To prove that the $i$-th component of $underline(x)^(*)$ is 
	$det(A_(i)(underline(b))) slash det(A)$, consider the matrix:

	$ I_(i)(underline(x)^(*)) =
	  mat(underline(e)_(1), underline(e)_(2), dots, underline(x)^(*), dots, underline(e)_(n - 1), underline(e)_(n)) =
	  mat(1, 0, dots, x^(*)_(1), dots, 0, 0;
	      0, 1, dots, x^(*)_(2), dots, 0, 0;
	      dots.v, dots.v, dots.down, dots.v, dots.down, dots.v, dots.v;
	      0, 0, dots, x^(*)_(n - 1), dots, 1, 0;
	      0, 0, dots, x^(*)_(n), dots, 0, 1) $

	Which is the $n times n$ identity matrix with the $i$-th column
	substituted with $underline(x)^(*)$. The determinant of this matrix
	can be computed by expanding with respect to the $i$-th column:

	$ det(I_(i)(underline(x)^(*))) =
	  (-1)^(i + 1) x^(*)_(1) 
	  mat(delim: "|",
	      0, 1, dots, 0, 0;
	      dots.v, dots.v, dots.down, dots.v, dots.v;
	      0, 0, dots, 1, 0;
	      0, 0, dots, 0, 1) 
	  + dots + (-1)^(i + i) x^(*)_(i) 
	  mat(delim: "|",
	      1, 0, dots, 0, 0;
	      dots.v, dots.v, dots.down, dots.v, dots.v;
	      0, 0, dots, 1, 0;
	      0, 0, dots, 0, 1) 
	  &+ dots + (-1)^(i + n) x^(*)_(n) 
	  mat(delim: "|",
	      1, 0, dots, 0, 0;
	      0, 1, dots, 0, 0;
	      dots.v, dots.v, dots.down, dots.v, dots.v;
	      0, 0, dots, 1, 0) $

	Since the $i$-th column is the only one containing non-zero elements
	on the diagonal, all these sub-matrices are diagonal matrices. This
	means that it's possible to apply @Determinant-of-triangular-matrix.
	Notice however that all such sub-matrices, except for the $i$-th
	one, have at least a $0$ in their diagonal, hence their determinant
	is $0$. The $i$-th sub-matrix is instead the $n - 1$ identity matrix,
	whose determinant is $1$. The determinant of $I_(i)(underline(x)^(*))$
	is therefore:

	$ det(I_(i)(underline(x)^(*))) =
	  0 + dots +
	  (-1)^(i + i) x^(*)_(i) 
	  mat(delim: "|",
	      1, 0, dots, 0, 0;
	      dots.v, dots.v, dots.down, dots.v, dots.v;
	      0, 0, dots, 1, 0;
	      0, 0, dots, 0, 1)
	  + dots + 0 =
	  (-1)^(2i) x^(*)_(i) dot 1 =
	  1 dot x^(*)_(i) =
	  x^(*)_(i) $

	Multiplying $A$ with $I_(i)(underline(x)^(*))$ gives:

	$ A I_(i)(underline(x)^(*)) &=
	  A mat(underline(e)_(1), underline(e)_(2), dots, underline(x)^(*), dots, underline(e)_(n - 1), underline(e)_(n)) =
	  mat(A underline(e)_(1), A underline(e)_(2), dots, A underline(x)^(*), dots, A underline(e)_(n - 1), A underline(e)_(n)) = \
	  &= mat(underline(a)_(1), underline(a)_(2), dots, b, dots, underline(a)_(n - 1), underline(a)_(n)) = A_(i)(underline(b)) $

	Since $A I_(i)(underline(x)^(*))$ and $A_(i)(underline(b))$ are equal,
	their determinants are also equal. Applying @Binet-theorem:

	$ det(A I_(i)(underline(x)^(*))) =
	  det(A) det(I_(i)(underline(x)^(*))) =
	  det(A) x^(*)_(i) =
	  det(A_(i)(underline(b))) $

	Rearranging:

	$ x^(*)_(i) = frac(det(A_(i)(underline(b))), det(A)) $
]

Despite being a very straightforward rule, @Cramer-rule isn't a very
practical result for solving systems of equations. The first reason
is that has limited scope, since it is only valid for determined
systems whose coefficient matrix is non singular: in accord to
@Rouche-Capelli-theorem, underdetermined and overdetermined systems
are not precluded from being solvable, as determined systems having
a singular coefficient matrix. The second reason is that computing
the solution requires the matrix to be inverted, which for large
matrices is prohibitely expensive.

A different rule for solving systems of equations, which works for any
system and is much faster, is the *Gauss-Jordan algorithm*. The validity
of the algorithm relies on @Gauss-Jordan-validity.

#theorem("Validity of the Gauss-Jordan algorithm")[
	Let $A$ be the coefficient matrix of a linear system of equations
	$S$. Applying any Gauss move one or more times to $A$ gives a new
	matrix $A'$ associated to a new linear system of equations $S'$
	whose general solution is the same of $S$. 
] <Gauss-Jordan-validity>
// #proof[
// To be added
// ]
