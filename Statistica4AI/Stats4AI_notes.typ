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
	justify: true,
)
#set heading(
	numbering: "1."
)
#set document(
        title: "Notes on Advanced Foundations of Statistics for AI",
        author: "Shania",
        date: auto
)

#import "Stats4AI_definitions.typ": *

#show: thmrules.with(qed-symbol: $square$)
#show heading: set block(above: 1.4em, below: 1em)

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
== Combinatorics
#include "Introduction/Combinatorics.typ"
== Discrete random variables
#include "Introduction/DiscreteRV.typ"
== Known discrete random variables
#include "Introduction/KnownDRV.typ"
== Continuous random variables
#include "Introduction/ContinuousRV.typ"
== Known continuous random variables
#include "Introduction/KnownCRV.typ"
== Joint probability distributions
#include "Introduction/Joint.typ"
== Random sampling
#include "Introduction/Sampling.typ"
== Confidence intervals
#include "Introduction/Intervals.typ"
== Hypothesis testing
#include "Introduction/Hypothesis.typ"
== Simple linear regression
#include "Introduction/Regression.typ"
