#import "../../University-Notes-Template.typ": university-notes
#show: university-notes.with(
	title: "Advanced Foundations of Mathematics for AI"
)

#import "Math4AI_definitions.typ": *
#show: thmrules.with(qed-symbol: $square$)

#outline(indent: auto)
#pagebreak()

= Sequences and series
== Sequences
#include "Series/Sequences.typ"
== Series
#include "Series/Series.typ"
#pagebreak()

= Linear Algebra
== Matrices
#include "LinAlg/Matrices.typ"
== Vector Spaces
#include "LinAlg/Spaces.typ"
== Linear Dependence and Independence
#include "LinAlg/Bases.typ"
== Determinant and Rank
#include "LinAlg/Determinant.typ"
== Systems of Linear Equations
#include "LinAlg/Systems.typ"
== Linear Transformations
#include "LinAlg/Transformations.typ"
== Kernel and Image
#include "LinAlg/KerIm.typ"
== Eigenvalues and Eigenvectors
#include "LinAlg/Eigen.typ"
== Inner product and cross product
#include "LinAlg/Product.typ"
== Spectral Theorem
#include "LinAlg/Spectral.typ"
== Decompositions
#include "LinAlg/Decomposition.typ"
#pagebreak()

= Multivariable calculus
== Partial derivatives
#include "Calculus/Partial.typ"
