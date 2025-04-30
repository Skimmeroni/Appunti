#import "../Math4AI_definitions.typ": *

=== Determinant

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

Peculiar matrices can have their determinant computed faster.

#proposition[
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
	row. Note that this holds for diagonal matrices as well, since diagonal
	matrices are a special case of triangular matrices.
]

#proposition[
	The determinant is invariant with respect to transposition.
] <Determinant-equal-by-rows-or-columns>
// #proof[
// To be added
// ]

@Determinant-equal-by-rows-or-columns implies that the determinant of a
matrix can be computed by applying the formula with respect to the columns,
not only with respect to rows.

#theorem("Binet's Theorem")[
	Given two matrices $A$ and $B$, $det(A B) = det(A) det(B)$ (that is,
	the determinant is a multiplicative function).
] <Binet-theorem>
// #proof[
// Hard to prove
// ]

#proposition[
	It two rows/columns of a matrix are swapped, its determinant changes sign.
]
// #proof[
// To be added
// ]

#proposition[
	Given a $n times n$ matrix $A$ and a scalar $k$,
	$det(k A) = k^(n) det(A)$.
]
// #proof[
// To be added
// ]

=== Rank

The number of linearly independent columns of a matrix is referred to as
its *rank by column*, whereas the number of linearly independent rows of
a matrix is referred to as its *rank by row*.

Since the rank by row of a matrix is always equal to its rank by column,
it is possible to simply refer to the *rank* of matrix meaning either one
or the other. Given a matrix $A$, its rank is denoted as $"rank"(A)$.

Clearly, the rank of a matrix cannot be greater than the minimum between
its number of rows and its number of columns. In particular, only a square
matrix can have its rank exactly equal to its number of rows/columns. If
this is the case, the matrix is said to be *full rank*. Not all square
matrices are full rank, but all full rank matrices are square.

#proposition[
	The rank of a matrix is invariant with respect to transposition.
] <Rank-invariant-with-transposition>
// #proof[
// To be added
// ]

#proposition[
	A matrix has full rank if and only if it's not singular.
]
// #proof[
//
// ]

A matrix is in *row echelon form* if all rows having only zero entries
are at the bottom and the left-most nonzero entry of every nonzero row,
called the *pivot*, is on the right of the leading entry of every row above.

#exercise[
	Provide some examples of matrices in row echelon form.
]
#solution[
	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ mat(0, 4, 1, 5, 2;
		   0, 0, 6, 1, 9;
		   0, 0, 0, 4, 1;
		   0, 0, 0, 0, 3) $],
		[$ mat(2, 1, 3;
		   0, 4, 2;
		   0, 0, 0) $],
		[$ mat(1, 3, 5, 0;
		   0, 9, 0, 1;
		   0, 0, -4, 2) $]
	)
]

These matrices are relevant because their rank is particularly easy to
compute.

#proposition[
	The rank of a matrix in row echelon form is equal to the number of its
	pivots.
] <Rank-echelon-pivots>
// #proof[
// To be added
// ]

Any matrix can be converted in row echelon form by employing *Gaussian
moves*, which are are special operations that can be performed on matrices.
Said operations are as follows:

- Swapping two rows/columns;
- Multiplying a row/column by a scalar;
- Summing a row/column to another row/column multiplied by a scalar.

#proposition[
	The application of Gaussian moves to a matrix does not change its rank.
] <Gauss-moves-rank>
// #proof[
// To be added
// ]

@Gauss-moves-rank allows one to convert a matrix in row echelon form while
keeping the rank equal to the original.

#exercise[
	Compute the rank of the matrix $A = mat(1, -1, 3, 2; 3, 2, 7, 6;
	1, 4, 1, 2)$.
]
#solution[
	@Gauss-moves-rank guarantees that applying the third Gaussian move to $A$
	renders a matrix with the same rank. $A$ can therefore be converted into a
	matrix in row echelon form as follows:

	+ Substituting the third row with itself summed to the first multiplied by
	  $-1$;
	+ Substituting the second row with itself summed to the first multiplied by
	  $-3$;
	+ Substituting the second row with itself summed to the third multiplied by
	  $-1$.

	$ mat(1, -1, 3, 2; 3, 2, 7, 6; 1, 4, 1, 2) =>
	  mat(1, -1, 3, 2; 3, 2, 7, 6; 0, 5, -2, 0) =>
	  mat(1, -1, 3, 2; 0, 5, -2, 0; 0, 5, -2, 0) =>
	  mat(1, -1, 3, 2; 0, 5, -2, 0; 0, 0, 0, 0) $

	As stated in @Rank-echelon-pivots, the rank of $A$ is $2$.
]

=== Inverse matrix

Given a square matrix $A$, the matrix $A^(-1)$ (if it exists) such that $A
A^(-1) = A^(-1) A = I$ is called the *inverse matrix* of $A$. Such matrix is
given by:

$ (a^(-1)_(i, j)) = frac((-1)^(i + j) det(M_(j, i)), det(A)) $

Where $M_(j, i)$ is the matrix $A$ with the $j$-th row and the $i$-th column
removed. If $A^(-1)$ exists, $A$ is said to be *invertible*.

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
	A matrix is invertible if and only if it has full rank.
] <Full-rank-matrices-are-invertible>
// #proof[
// To be added
// ]

#proposition[
	A matrix is invertible if and only if the set of its rows/columns forms a
	linearly independent set.
]
// #proof[
// To be added
// ]

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

=== Equivalent and similar matrices

Two matrices $A$ and $B$ are said to be *equivalent* if there exist
two invertible matrices $S$ and $T$ such that $B = T^(-1) A S$. If
$T = S$, the two matrices are said to be *similar*. Matrix similarity
is a special case of matrix equivalence.

#proposition[
	Matrix equivalence (and similarity) is an equivalence relation.
]
// #proof[
// 
// ]

#proposition[
	If two matrices are similar, they have the same determinant and
	the same rank.
]
#proof[
	Suppose $A$ and $B$ are similar. Then:

	$ det(A) =
	  det(P B P^(-1)) =
	  det(P) det(B) det(P^(-1)) =
	  cancel(det(P)) det(B) frac(1, cancel(det(P))) =
	  det(B) $
]

=== Trace

The *trace* of a square matrix is defined as the sum of the elements on its
diagonal:

$ tr(A) = sum_(i = 1)^(n) a_(i, i) $

If the inverse of a matrix is equal to his transposition, said matrix is
called *orthogonal*.
