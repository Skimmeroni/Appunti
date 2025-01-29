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

= Descriptive statistics
== Introduction
#include "Descriptive/Introduction.typ"
== Frequencies for a single variable
#include "Descriptive/Frequency.typ"
== Frequencies for two variables
#include "Descriptive/Correlation.typ"
== Central tendency indices
#include "Descriptive/Central.typ"
== Variability indices
#include "Descriptive/Variability.typ"
#pagebreak()

= Probability theory
== Probability
#include "Probability/Probability.typ"
== Combinatorics
#include "Probability/Combinatorics.typ"
#pagebreak()

= Random variables
== Discrete random variables
#include "Variables/DiscreteRV.typ"
== Known discrete random variables
#include "Variables/KnownDRV.typ"
== Continuous random variables
#include "Variables/ContinuousRV.typ"
== Known continuous random variables
#include "Variables/KnownCRV.typ"
== Joint probability distributions
#include "Variables/Joint.typ"
#pagebreak()

= Inferential statistics
== Random sampling
#include "Inferential/Sampling.typ"
== Central Limit Theorem
#include "Inferential/Central.typ"
== Confidence intervals
#include "Inferential/Intervals.typ"
== Hypothesis testing
#include "Inferential/Hypothesis.typ"
#pagebreak()

= Regression model
== Simple linear regression
#include "Regression/Simple_linear.typ"
#pagebreak()
