#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "en"
)
#set page(
	paper: "a4",
	header: align(right)[_Advanced Foundations of Statistics for AI_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)

#import "Stats4AI_definitions.typ": *

#show: thmrules.with(qed-symbol: $square$)
#show par: set block(spacing: 0.55em)

#outline(indent: auto)
#figure(
	image("Stats4AI_cover.jpg")
)
#pagebreak()

= Introduction
== Statistics
#include "Introduction/Statistics.typ"
== Probability
#include "Introduction/Probability.typ"
== Discrete random variables
#include "Introduction/DiscreteRV.typ"
== Known discrete random variables
#include "Introduction/KnownDRV.typ"
