#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "en"
)
#set page(
	paper: "a4",
	header: align(right)[_Artificial Intelligence_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)

#import "AI_definitions.typ": *

#show link: underline
#show: thmrules.with(qed-symbol: $square$)

#outline(indent: auto)
#pagebreak()

= Neural Networks
== Biological foundations
#include "Neural/Biology.typ"
== Threshold Logic Units
#include "Neural/TLU.typ"
== Training TLUs
#include "Neural/Training.typ"
== Artificial neural networks
#include "Neural/Artificial.typ"
== Multilayer perceptrons
#include "Neural/MLP.typ"
== Logistic regression
#include "Neural/Regression.typ"
== Gradient descent
#include "Neural/Gradient.typ"
#pagebreak()

= Fuzzy logic
== Fuzzy sets
#include "Fuzzy/Sets.typ"
== Fuzzy logic
#include "Fuzzy/Logic.typ"
// = Evolutionary computing
