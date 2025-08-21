#import "../../University-Notes-Template.typ": university-notes
#show: university-notes.with(
	title: "Artificial Intelligence"
)

#import "AI_definitions.typ": *
#show: thmrules.with(qed-symbol: $square$)

#outline(indent: auto)
#pagebreak()

= Introduction
== Logistic regression
#include "Introduction/Logistic Regression/Regression.typ"
== Optimization problems
#include "Introduction/Optimization.typ"
== Local search algorithms
#include "Introduction/Local Search Algorithms/Local.typ"
#pagebreak()

= Neural Networks
== Biological foundations
#include "Neural/Biological Foundations/Biology.typ"
== Threshold Logic Units
#include "Neural/Threshold Logic Units/TLU.typ"
== Artificial neural networks
#include "Neural/Artificial Neural Networks/Artificial.typ"
== Multilayer perceptrons
=== Structure of a multilayer perceptron
#include "Neural/Multilayer Perceptrons/Structure.typ"
=== Approximating functions using a multilayer perceptron
#include "Neural/Multilayer Perceptrons/Approximation.typ"
=== Training a multilayer perceptron
#include "Neural/Multilayer Perceptrons/Backpropagation.typ"
#pagebreak()

= Fuzzy logic
== Fuzzy sets
#include "Fuzzy/Fuzzy Sets/Sets.typ"
== $alpha$-cuts
#include "Fuzzy/Alpha Cuts/Alpha.typ"
== Relevant classes of fuzzy sets
#include "Fuzzy/Relevant Fuzzy Sets/Classes.typ"
== Fuzzy logic
#include "Fuzzy/Fuzzy Logic/Logic.typ"
== Extending set operators to fuzzy sets
#include "Fuzzy/Extending Set Operators/Extension.typ"
== Fuzzy reasoning
#include "Fuzzy/Inference.typ"
#pagebreak()

= Evolutionary computing
== Evolutionary algorithms
#include "Evolution/Algorithm.typ"
== Choosing a solution encoding
#include "Evolution/Encoding.typ"
== Choosing a selection method
#include "Evolution/Selection.typ"
== Choosing a genetic operator
#include "Evolution/Genetic Operators/Operator.typ"
// == The n-queens problem
// #include "Evolution/Queens.typ"
== Improving performance through parallelization
#include "Evolution/Parallel.typ"
== Classes of evolutionary algorithms: evolutionary local search
#include "Evolution/Evolutionary Local Search/Ea_local.typ"
== Classes of evolutionary algorithms: swarm intelligence
#include "Evolution/Swarm Intelligence/Swarm.typ"
== Classes of evolutionary algorithms: genetic algorithms
#include "Evolution/Schemata.typ"
== Classes of evolutionary algorithms: genetic programming
#include "Evolution/Programming.typ"
== Classes of evolutionary algorithms: evolutionary strategies
#include "Evolution/Strategy.typ"
== Classes of evolutionary algorithms: finding Pareto-frontiers
#include "Evolution/Pareto.typ"
== Classes of evolutionary algorithms: solving behaviour simulations
#include "Evolution/Behaviour.typ"
