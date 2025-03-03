#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "en"
)
#set page(
	paper: "a4",
	header: align(right)[_AI Models for Physics_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)

#import "AIModels_definitions.typ": *

#show: thmrules.with(qed-symbol: $square$)

#outline(indent: auto)
#pagebreak()

= Graph neural networks
== Graph definition
#include "Graphs/Definition.typ"
#pagebreak()