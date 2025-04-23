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

#show: thmbox-init()
#show heading: set text(
  font: "Noto Sans"
)

#outline(indent: auto)
#pagebreak()

= Graph neural networks
== Graph definition
#include "Graphs/Definition.typ"
== Graph embedding
#include "Graphs/Embedding.typ"
#pagebreak()

= Reinforcement learning
== Agents and environments
#include "Reinforcement/Agent.typ"
