#import "Unsupervised_definitions.typ": *

#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "en"
)
#set table(
	fill: (x, y) =>
	if y == 0 {
		aqua.lighten(50%)
	}
)
#set page(
	paper: "a4",
	header: align(right)[_Unsupervised Learning_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)
#set document(
        title: "Notes on Unsupervised Learning",
        author: "Shania",
        date: auto
)

#show: thmrules.with(qed-symbol: $square$)
#show heading: set block(above: 1.4em, below: 1em)
#show table.cell: set text(size: 8pt, font: "Noto Sans")

#outline(indent: auto)
#pagebreak()

= Data
== Data types
#include "Data/Types.typ"
== Dataset types
#include "Data/Sets.typ"
== Data quality
#include "Data/Quality.typ"
== Proximity measures
#include "Data/Proximity.typ"

// = Cluster analysis
// == Introduction
// #include "Cluster/Introduction.typ"
