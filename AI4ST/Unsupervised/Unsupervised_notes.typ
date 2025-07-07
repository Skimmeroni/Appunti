#import "../../University-Notes-Template.typ": university-notes
#show: university-notes.with(
	title: "Unsupervised Learning"
)

#show: thmrules.with(qed-symbol: $square$)
#show table.cell: set text(size: 8pt, font: "Noto Sans")
#import "Unsupervised_definitions.typ": *
#set table(
	fill: (x, y) =>
	if y == 0 {
		aqua.lighten(50%)
	}
)

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
