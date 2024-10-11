#import "../Math4AI_definitions.typ": *

//
// Add many results taken from previous courses
//

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

#theorem[
	A matrix is invertible if and only if its determinant is not zero.
] <Invertible-matrices-not-null-determinant>
// #proof[
// To be added
// ]

#theorem[
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
	The determinant is a multiplicative function. That is to say, given two
	matrices $A$ and $B$:

	$ det(A B) = det(A) det(B) $
] <Binet-theorem>
// #proof[
// Hard to prove
// ]

#theorem[
	The determinant is invariant with respect to transposition.
]
// #proof[
// To be added
// ]

#theorem[
	Given an invertible matrix $A$, the determinant of its inverse is the
	reciprocal of the determinant of $A$:

	$ det(A^(-1)) = frac(1, det(A)) $
]
// #proof[
// To be added
// ]

The *trace* of a square matrix is defined as the sum of the elements on its
diagonal:

$ tr(A) = sum_(i = 1)^(n) a_(i, i) $
