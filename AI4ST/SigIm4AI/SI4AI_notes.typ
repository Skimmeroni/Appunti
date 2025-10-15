#import "../../University-Notes-Template.typ": university-notes
#show: university-notes.with(
	title: "AI for Signal and Image Processing"
)

#import "SI4AI_definitions.typ": *
#show: thmrules.with(qed-symbol: $square$)

#show: lilaq.theme.schoolbook
#show: lilaq.set-spine(stroke: 1pt)
#show: lilaq.set-tick(
    inset: 3pt, outset: 3pt,
    shorten-sub: 50%,
    stroke: 1pt
)
#show: lilaq.set-grid(
    stroke: 0.5pt + gray,
    stroke-sub: 0.5pt + luma(90%)
)

#outline(indent: auto)
#pagebreak()

= Introduction
== Introduction
#include "Introduction.typ"
== Sinusoids
#include "Sinusoid.typ"
== Spectrum
#include "Spectrum.typ"
#pagebreak()
