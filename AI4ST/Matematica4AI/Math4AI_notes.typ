#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "en"
)
#set page(
	paper: "a4",
	header: align(right)[_Advanced Foundations of Mathematics for AI_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
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
== Bases and Dimension
#include "LinAlg/Bases.typ"
== Linear Transformations
#include "LinAlg/Transformations.typ"
== Systems of Linear Equations
#include "LinAlg/Systems.typ"
== Eigenvalues and eigenvectors
#include "LinAlg/Eigen.typ"
== Spectral Theorem
#include "LinAlg/Spectral.typ"
== Decompositions
#include "LinAlg/Decomposition.typ"
#pagebreak()

= Multivariable calculus
== Partial derivatives
#include "Calculus/Partial.typ"
