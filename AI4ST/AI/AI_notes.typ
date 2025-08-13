#import "../../University-Notes-Template.typ": university-notes
#show: university-notes.with(
	title: "Artificial Intelligence"
)

#import "AI_definitions.typ": *
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
== $alpha$-cuts
#include "Fuzzy/Alpha.typ"
== Relevant classes of fuzzy sets
#include "Fuzzy/Classes.typ"
== Fuzzy logic
#include "Fuzzy/Logic.typ"
== Extending set operators to fuzzy sets
#include "Fuzzy/Extension.typ"
== Fuzzy reasoning
#include "Fuzzy/Inference.typ"
#pagebreak()

= Evolutionary computing
== Optimization problems
#include "Evolution/Optimization.typ"
== Local search algorithms
#include "Evolution/Local.typ"
== Evolutionary algorithms
#include "Evolution/Algorithm.typ"
== Choosing a solution encoding
#include "Evolution/Encoding.typ"
== Choosing a selection method
#include "Evolution/Selection.typ"
== Choosing a genetic operator
#include "Evolution/Operator.typ"
// == The n-queens problem
// #include "Evolution/Queens.typ"
== Improving performance through parallelization
#include "Evolution/Parallel.typ"
== Classes of evolutionary algorithms: evolutionary local search
#include "Evolution/Ea_local.typ"
== Classes of evolutionary algorithms: swarm intelligence
#include "Evolution/Swarm.typ"
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
