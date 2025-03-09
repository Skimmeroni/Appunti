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
]
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

$ cases(a_(1 1) x_(1) + a_(1 2) x_(2) + dots + a_(1 n) x_(n) = b_(1),
	a_(2 1) x_(1) + a_(2 2) x_(2) + dots + a_(2 n) x_(n) = b_(2),
	dots.v,
	a_(m 1) x_(1) + a_(m 2) x_(2) + dots + a_(m n) x_(n) = b_(m)) 
  <==>
  mat(a_(1 1), a_(1 2), dots, a_(1 n);
      a_(2 1), a_(2 2), dots, a_(2 n);
      dots.v, dots.v, dots.down, dots.v;
      a_(m 1), a_(m 2), dots, a_(m n);)
  mat(x_(1); x_(2); dots.v; x_(n)) =
  mat(b_(1); b_(2); dots.v; b_(m))
  <==>
  A X = B $

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

The $A$ matrix is called the *coefficient matrix*. The $(A | B)$
matrix, costructed by justapposing the $A$ and $B$ matrices, is
called the *augmented matrix*.

$ (A | B) = mat(a_(1 1), a_(1 2), dots, a_(1 n), b_(1);
                a_(2 1), a_(2 2), dots, a_(2 n), b_(2);
                dots.v, dots.v, dots.down, dots.down, dots.v;
                a_(m 1), a_(m 2), dots, a_(m n), b_(m);) $

#theorem("Rouché-Capelli Theorem")[
	A linear system of equations is solvable if and only if its
	coefficient matrix and its augmented matrix have the same rank.
] <Rouche-Capelli-theorem>
// #proof[
// To be added
// ]

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
		[$ A = mat(1, -1, 2;
				   3, 1, 3;
				   1, 3, -1;) $],
		[$ A | B = mat(1, -1, 2, 1;
		               3, 1, 3, 6;
		               1, 3, -1, -1;) $]
	)

	Since $"rank"(A) = 2$ and $"rank"(A | B) = 3$,
	@Rouche-Capelli-theorem states that the
	linear system is unsolvable.

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ A = mat(1, 3, -1;
		           4, 1, 1;
		           2, -5, 3;) $],
		[$ (A | B) = mat(1, 3, -1, -2;
					     4, 1, 1, 1;
					     2, -5, 3, 5;) $]
	)

	Since $"rank"(A) = 2$ and $"rank"(A | B) = 2$,
	@Rouche-Capelli-theorem states that the linear
	system is solvable.
]

#lemma[
	An homogeneous linear system is always solvable.
]
#proof[
	Let $A$ and $(A | B)$ be the coefficient and augmented matrices of
	an homogeneous linear system. Being homogeneous, the $B$ matrix is
	entirely constituted by zeros, and therefore $A$ and $(A | B)$ have
	the same rank. Applying @Rouche-Capelli-theorem, it is guaranteed
	that said linear system is solvable. It is also easy to see that
	a solution is the _null solution_, constituted by all zeros.
]

Notice how @Rouche-Capelli-theorem only deals with the solvability
of a linear system of equations, and is not concerned with how many
solutions exist.

A linear system of equations is said to be *determinated* if it has as
many equations as unknowns. It is instead said to be *overdeterminated*
if it has more equations than unknowns or *underdeterminated* if it has
more unknowns than equations.

#theorem("Cramer Theorem")[
	A determinated linear system of equations has one and only solution
	if and only if its coefficient matrix is non singular.
]
// #proof[
// To be added
// ]

#lemma[
	A determinated or overdeterminated linear system has either one
	or infinitely many solutions. The first case happens when the rank
	of the coefficient matrix equals the number of equations of the
	system, whereas the second case happens when the rank of the
	coefficient matrix is less than the number of its equations.	
]
// #proof[
// To be added
// ]

#lemma[
	An underdeterminated linear system is either unsolvable or,
	if it is solvable, has always infinitely many solutions. In
	particular, the number of degrees of freedom of the system
	is given by the difference between the number of equations
	and the rank of the coefficient matrix.
]
// #proof[
// To be added
// ]

#theorem("Principle of Gaussian elimination")[
	Let $A$ be the coefficient matrix of a linear system of equations
	$S$. Applying any Gauss move one or more times to $A$ gives a new
	matrix $A'$ associated to a new linear system of equations $S'$
	whose general solution is the same of $S$. 
]
// #proof[
// To be added
// ]
