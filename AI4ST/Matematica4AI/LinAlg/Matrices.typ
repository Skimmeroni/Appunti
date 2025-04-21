#import "../Math4AI_definitions.typ": *

=== Definition and operations

A *matrix* is a bidimensional mathematical object, represented as follows:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ A = mat(
	   a_(1, 1), a_(1, 2), dots, a_(1, n);
	   a_(2, 1), a_(2, 2), dots, a_(2, n);
	   dots.v, dots.v, dots.down, dots.v;
	   a_(m, 1), a_(m, 2), dots, a_(m, n)
	) $],
	[$ A = (a_(i, j)) space i in {1, dots, m},
	   j in {1, space n} $]
)

The real numbers $a_(i, j)$ are called the *entries* or the *elements* of the
matrix, while the integers $i$ and $j$ are the *indexes*. The numbers $a_(i,
1), a_(i, 2), dots, a_(i, n)$ with $i in {1, dots, m}$ costitute a *row* of
the matrix, while the numbers $a_(1, j), a_(2, j), dots, a_(m, j)$ with $j
in {1, dots, n}$ constitute a *column*. The number of rows and columns of a
matrix is called its *order* or *dimension*, and is denoted as $m times n$.
Two matrices are *equal* if they have the same order and if $(a_(i, j)) =
(b_(i, j)) forall i, j$.

A matrix that has $m = n$ is a *square matrix of order* $n$ (or order $m$).
The elements $a_(1, 1), a_(2, 2), dots, a_(n, n)$ are called the *diagonal
elements* and constitute the *diagonal* of the matrix.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ A = mat(
	   a_(1, 1), a_(1, 2), dots, a_(1, n);
	   a_(2, 1), a_(2, 2), dots, a_(2, n);
	   dots.v, dots.v, dots.down, dots.v;
	   a_(n, 1), a_(n, 2), dots, a_(n, n)
	) $],
	[$ A = (a_(i, j)) space i in {1, dots, n},
	   j in {1, space n} $]
)

A matrix is called a *diagonal matrix* if $(a_(i, j)) = 0$ with $i != j$.
In other words, a matrix is diagonal if its non diagonal elements are $0$
(the diagonal elements can be any number, including $0$).

$ A = mat(
  a_(1, 1), 0, dots, 0;
  0, a_(2, 2), dots, 0;
  dots.v, dots.v, dots.down, dots.v;
  0, 0, dots, a_(n, n)) $

A peculiar diagonal matrix is the *identity matrix*, denoted as $I_(n)$
(where $n$ is its order), whose diagonal elements are all $1$. Another
peculiar diagonal matrix is the *null matrix*, whose diagonal elements
are all $0$.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ I_(n) = mat(
	   1, 0, dots, 0;
	   0, 1, dots, 0;
	   dots.v, dots.v, dots.down, dots.v;
	   0, 0, dots, 1) $],
	[$ O = mat(
	   0, 0, dots, 0;
	   0, 0, dots, 0;
	   dots.v, dots.v, dots.down, dots.v;
	   0, 0, dots, 0) $]
)

A matrix having a single row and $n$ columns (in other words, a $1 times n$
matrix) is also called a *row matrix*. On the other hand, a matrix having a
single column (in other words, a $n times 1$ matrix) is also called a *column
matrix*.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ A = mat(a_(1, 1), a_(1, 2), dots, a_(1, n)) $],
	[$ A = mat(a_(1, 1); a_(2, 1); dots.v; a_(n, 1)) $]
)

Given a matrix $A$, the matrix $A^(T)$ that has the rows of $A$ as its
columns and the columns of $A$ as its rows is called the *transposed*
of $A$. If a matrix is equal to its transposed, it is said to be *symmetric*.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ A = mat(
	   a_(1, 1), a_(1, 2), dots, a_(1, n);
	   a_(2, 1), a_(2, 2), dots, a_(2, n);
	   dots.v, dots.v, dots.down, dots.v;
	   a_(n, 1), a_(n, 2), dots, a_(n, n)
	) $],
	[$ A^(T) = mat(
		a_(1, 1), a_(2, 1), dots, a_(n, 1);
		a_(1, 2), a_(2, 2), dots, a_(n, 2);
		dots.v, dots.v, dots.down, dots.v;
		a_(1, n), a_(2, n), dots, a_(n, n)
	) $]
)

The *sum* between two matrices $A$ and $B$ having the same dimension $m times
n$ is defined as the sum, entry by entry, of $A$ and $B$. Two matrices that
have the same dimension are called sum-conformant. The sum between two matrices
that are not sum-conformant is undefined.

#grid(
	columns: (0.25fr, 0.25fr, 0.5fr),
	[$ A = mat(
	   a_(1, 1), dots, a_(1, n);
	   dots.v, dots.down, dots.v;
	   a_(m, 1), dots, a_(m, n)
	) $],
	[$ B = mat(
	   b_(1, 1), dots, b_(1, n);
	   dots.v, dots.down, dots.v;
	   b_(m, 1), dots, b_(m, n)
	) $],
	[$ A + B = mat(
	   a_(1, 1) + b_(1, 1), dots, a_(1, n) + b_(1, n);
	   a_(2, 1) + b_(2, 1), dots, a_(2, n) + b_(2, n);
	   dots.v, dots.down, dots.v;
	   a_(m, 1) + b_(m, 1), dots, a_(m, n) + b_(m, n)
	) $]
)

Given a matrix $A$, the *opposite matrix* of $A$ is the matrix $-A$ such that
$A + (-A) = (0_(i, j))$.

The product between a matrix and a scalar is an operation that has as input
a matrix $A$ and a scalar $k$ and has as output a matrix $k A$ that has each
entry multiplied by $k$.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ A = mat(
	   a_(1, 1), a_(1, 2), dots, a_(1, n);
	   a_(2, 1), a_(2, 2), dots, a_(2, n);
	   dots.v, dots.v, dots.down, dots.v;
	   a_(m, 1), a_(m, 2), dots, a_(m, n)
	) $],
	[$ k A = mat(
	   k a_(1, 1), k a_(1, 2), dots, k a_(1, n);
	   k a_(2, 1), k a_(2, 2), dots, k a_(2, n);
	   dots.v, dots.v, dots.down, dots.v;
	   k a_(m, 1), k a_(m, 2), dots, k a_(m, n)
	) $]
)

Given a $m times p$ matrix $A$ and a $p times n$ matrix $B$, the *product*
between two matrices (also called *row-by-column product*) is the $m times n$
matrix $C = A B$ given by:

$ C = A B = (c_(i, j)) =
  mat(
  sum_(i = 1)^(p) a_(1, p) dot b_(p, 1),
  sum_(i = 1)^(p) a_(1, p) dot b_(p, 2),
  dots,
  sum_(i = 1)^(p) a_(1, p) dot b_(p, n);
  sum_(i = 1)^(p) a_(2, p) dot b_(p, 1),
  sum_(i = 1)^(p) a_(2, p) dot b_(p, 2),
  dots,
  sum_(i = 1)^(p) a_(2, p) dot b_(p, n);
  dots.v, dots.v, dots.down, dots.v;
  sum_(i = 1)^(p) a_(m, p) dot b_(p, 1),
  sum_(i = 1)^(p) a_(m, p) dot b_(p, 2),
  dots,
  sum_(i = 1)^(p) a_(m, p) dot b_(p, n);
) $

That is, the $i,j$-th entry of $A B$ is given by the sum between the products
corresponding entries of the $i$-th row of $A$ and the $j$-th column of $B$.
Two matrices that possess this property are called product-conformant. The
product between two matrices that are not product-conformant is undefined.

#exercise[
	Compute the product of the following matrices:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ A = mat(-1, 4; 6, 1) $],
		[$ B = mat(3, 2, -4; 5, 0, 2) $]
	)
]
#solution[
	$ A B =
	  mat(-1, 4; 6, 1) mat(3, 2, -4; 5, 0, 2) =
	  mat((-1) dot 3 + 4 dot 5, (-1) dot 2 + 4 dot 0, (-1) dot (-4) + 4 dot 2;
	      6 dot 3 + 1 dot 5, 6 dot 2 + 1 dot 0, 6 dot (-4) + 1 dot 2) =
	  mat(17, -2, 12; 23, 12, -22) $
]

The product between matrices possesses the following properties:

- It is not commutative, therefore $A B != B A$;
- Cancellation law does not hold. If $A B = B C$ holds, it does not
  necessarely holds that $A = C$;
- The product of two non null matrices can result in the null matrix.
  In other words, if $A B = 0$, neither $A$ or $B$ have to be the null matrix;
- The null matrix is the absorbing element for matrix multiplication.
  Multiplying a non null matrix by the null matrix results in the null matrix;
- It is associative;
- The identity matrix is the identity element for matrix multiplication, since
  $A I = I A = A$ for any matrix $A$.

#proposition[
	Let $A$ and $B$ be two product-conformant matrices. Then $(A B)^(T) =
	B^(T) A^(T)$.
]
// #proof[
// To be added
// ]

=== Determinant and trace of a matrix

The *determinant* is a function that associates a number to a square
matrix. Given a $n times n$ matrix $A$, its determinant, denoted as
$det(A)$ or $| A |$, is defined recursively as follows:

$ det(A) =
  cases(
	sum_(j = 1)^(n) (-1)^(i + j) a_(i, j) det(M_(i, j)) "if" n > 1,
	a_(11) "otherwise"
) $

Where $j$ is any column of the matrix $A$ chosen at random and $M_(i, j)$ is
the matrix obtained by removing the $i$-th row and $j$-th column from $A$.
The formula can also be applied with respect to rows instead of columns.

When the matrix has dimension $n = 2$, the formula can actually be simplified
as follows:

$ det(A) = (a_(1, 1) dot a_(2, 2)) - (a_(2, 1) dot a_(1, 2)) $

A matrix whose determinant is equal to $0$ is called a *singular matrix*.

#exercise[
	Given the matrix $A = mat(1, 2, 3; 0, 1, 2; 1, 1, 0)$, compute
	its determinant.
]
#solution[
	#set math.mat(delim: "|")
	The fastest way to compute a determinant is to pick the row/column that
	has the most zeros, because the number of $det(M_(i, j))$ to compute is
	the smallest. In the case of $A$, the best choices are: the second row,
	the first column, the third row and the third column. Suppose the first
	column is chosen:

	$ det(A) = sum_(i = 1)^(3) (-1)^(i + j) a_(i, j) det(M_(i, j)) = \
	  (-1)^(1 + 1) a_(1, 1) det(M_(1, 1)) +
	  (-1)^(2 + 1) a_(2, 1) det(M_(2, 1)) +
	  (-1)^(3 + 1) a_(3, 1) det(M_(3, 1)) = \
	  1 dot mat(1, 2; 1, 0) -
	  cancel(0 dot mat(2, 3; 1, 0)) +
	  1 dot mat(2, 3; 1, 2) =
	  (1 dot 0 - 1 dot 2) + (2 dot 2 - 3 dot 1) =
	  0 - 2 + 4 - 3 = -1 $
]

#lemma[
	The determinant of a triangular matrix is equal to the product of the
	elements on its diagonal.
]
#proof[
	Consider an upper triangular matrix $A$ and pick the first column to
	apply the formula:

	// To be extended

	#set math.mat(delim: "|")
	$ det(A) = mat(
	a_(1, 1), a_(1, 2), dots, a_(1, n);
	0, a_(2, 2), dots, a_(2, n);
	dots.v, dots.v, dots.down, dots.v;
	0, 0, dots, a_(n, n)) =
	a_(1, 1) mat(
	a_(2, 2), dots, a_(2, n);
	dots.v, dots.down, dots.v;
	0, dots, a_(n, n)) =
	dots =
	product_(i = 1)^(n) a_(i, i)
	$

	The same is achieved for a lower triangular matrix by picking the first
	row.
]

#theorem("Binet's Theorem")[
	The determinant is a multiplicative function. In other words, given two
	matrices $A$ and $B$:

	$ det(A B) = det(A) det(B) $
] <Binet-theorem>
// #proof[
// Hard to prove
// ]

#proposition[
	The determinant is invariant with respect to transposition.
]
// #proof[
// To be added
// ]

#lemma[
	Given a $n times n$ matrix $A$ and a scalar $k$,
	$det(k A) = k^(n) det(A)$.
]
// #proof[
// To be added
// ]

The *trace* of a square matrix is defined as the sum of the elements on its
diagonal:

$ tr(A) = sum_(i = 1)^(n) a_(i, i) $

If the inverse of a matrix is equal to his transposition, said matrix is
called *orthogonal*.

=== Inverse matrix

Given a square matrix $A$, the matrix $A^(-1)$ (if it exists) such that $A
A^(-1) = A^(-1) A = I$ is called the *inverse matrix* of $A$. Such matrix is
given by:

$ (a^(-1)_(i, j)) = frac((-1)^(i + j) det(M_(j, i)), det(A)) $

Where $M_(j, i)$ is the matrix $A$ with the $j$-th row and the $i$-th column
removed.

#proposition[
	A matrix is invertible if and only if it's not singular.
] <Invertible-matrices-not-null-determinant>
#proof[
	If $A$ is a singular matrix, its determinant is $0$. Therefore, the
	expression for $(a^(-1)_(i, j))$ would involve a division by $0$,
	which is not admissible.
	
	// The other way around is missing
]

#proposition[
	Given an invertible matrix $A$, $det(A^(-1)) = (det(A))^(-1)$.
]
#proof[
	Applying @Binet-theorem gives:

	$ det(A A^(-1)) = det(A) dot det(A^(-1)) = 1 =>
	  det(A) = frac(1, det(A^(-1))) =>
	  det(A^(-1)) = frac(1, det(A)) $
]

#exercise[
	Compute the inverse of the following matrix:

	$ A = mat(2, 2; 1, 0) $
]
#solution[
	The determinant of $A$ is $2 dot 0 - 1 dot 2 = -2$. Therefore, an inverse
	exists:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ a_(1, 1) = frac((-1)^(1 + 1) det(M_(1, 1)), det(A)) =
		   frac(0, -2) = 0 $],
		[$ a_(1, 2) = frac((-1)^(1 + 2) det(M_(2, 1)), det(A)) =
		   frac(-2, -2) = 1 $],
	)

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ a_(2, 1) = frac((-1)^(2 + 1) det(M_(1, 2)), det(A)) =
		   frac(-1, -2) = frac(1, 2) $],
		[$ a_(2, 2) = frac((-1)^(2 + 2) det(M_(2, 2)), det(A)) =
		   frac(2, -2) = -1 $]
	)
]
