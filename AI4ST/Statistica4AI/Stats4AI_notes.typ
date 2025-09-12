#import "../../University-Notes-Template.typ": university-notes
#show: university-notes.with(
	title: "Advanced Foundations of Statistics for AI"
)

#import "Stats4AI_definitions.typ": *
#show: thmrules.with(qed-symbol: $square$)

#outline(indent: auto)
#pagebreak()

#v(50%)
#figure(image("Stats4AI_cover.jpg"))
#pagebreak()

= Descriptive statistics
== Introduction
#include "Descriptive Statistics/Introduction/Introduction.typ"
== Frequencies for a single variable
#include "Descriptive Statistics/Single Variables/Frequency.typ"
== Central tendency indices
#include "Descriptive Statistics/Central Tendency Indices/Indices.typ"
== Variability indices
#include "Descriptive Statistics/Variability Indices/Indices.typ"
== Frequencies for two variables
#include "Descriptive Statistics/Two Variables/Frequency.typ"
#pagebreak()

= Probability theory
== Probability
#include "Probability/Probability.typ"
== Combinatorics
#include "Probability/Combinatorics.typ"
#pagebreak()

= Random variables
== Discrete random variables
#include "Random Variables/DiscreteRV.typ"
== Known discrete random variables
#include "Random Variables/Known Discrete RVs/Known.typ"
== Continuous random variables
#include "Random Variables/ContinuousRV.typ"
== Known continuous random variables
#include "Random Variables/Known Continuous RVs/Known.typ"
== Joint probability distributions
#include "Random Variables/Joint.typ"
#pagebreak()

= Inferential statistics
== Random sampling
#include "Inferential/Sampling.typ"
== Central Limit Theorem
#include "Inferential/Central.typ"
== Point estimate
#include "Inferential/Point.typ"
== Confidence intervals
#include "Inferential/Intervals.typ"
== Hypothesis testing
#include "Inferential/Hypothesis.typ"
#pagebreak()

//= Regression model
//== Simple linear regression
//#include "Regression/Simple_linear.typ"
//#pagebreak()
