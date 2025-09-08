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
#pagebreak()
== Optimization problems
#include "Introduction/Optimization.typ"
#pagebreak()
== Local search algorithms
#include "Introduction/Local Search Algorithms/Local.typ"
#pagebreak()

= Neural Networks
== Biological foundations
#include "Neural/Biological Foundations/Biology.typ"
#pagebreak()
== Threshold logic units
=== Single threshold logic units
#include "Neural/Threshold Logic Units/Single.typ"
=== Training single threshold logic units
#include "Neural/Threshold Logic Units/Training.typ"
=== Multiple threshold logic units
#include "Neural/Threshold Logic Units/Multiple.typ"
#pagebreak()
== Artificial neural networks
#include "Neural/Artificial.typ"
#pagebreak()
== Multilayer perceptrons
=== Structure of a multilayer perceptron
#include "Neural/Multilayer Perceptrons/Structure.typ"
=== Approximating functions using a multilayer perceptron
#include "Neural/Multilayer Perceptrons/Approximation.typ"
=== Training a multilayer perceptron
#include "Neural/Multilayer Perceptrons/Training.typ"
=== Deep learning
#include "Neural/Multilayer Perceptrons/Deep.typ"
=== Sensitivity analysis
#include "Neural/Multilayer Perceptrons/Sensitivity.typ"
#pagebreak()
== Radial basis function networks
=== Structure of a radial basis function network
#include "Neural/Radial Basis Functions/Structure.typ"
=== Approximating functions using a radial basis function network
#include "Neural/Radial Basis Functions/Approximation.typ"
=== Training a radial basis function network
#include "Neural/Radial Basis Functions/Training.typ"
#pagebreak()
== Learning vector quantization networks
=== K-means clustering
#include "Neural/Learning Vector Quantization/Kmeans.typ"
=== Structure of a learning vector quantization network
#include "Neural/Learning Vector Quantization/Structure.typ"
#pagebreak()
== Self-organizing maps
=== Structure of a self-organizing map
#include "Neural/Self-Organizing Maps/Structure.typ"
#pagebreak()
== Hopfield networks
=== Structure of a Hopfield network
#include "Neural/Hopfield Networks/Structure.typ"
=== Training a Hopfield network
#include "Neural/Hopfield Networks/Training.typ"
#pagebreak()

= Fuzzy logic
== Fuzzy sets
#include "Fuzzy/Fuzzy Sets/Sets.typ"
#pagebreak()
== $alpha$-cuts
#include "Fuzzy/Alpha Cuts/Alpha.typ"
#pagebreak()
== Relevant classes of fuzzy sets
#include "Fuzzy/Relevant Fuzzy Sets/Classes.typ"
#pagebreak()
== Fuzzy logic
#include "Fuzzy/Fuzzy Logic/Logic.typ"
#pagebreak()
== Extending set operators to fuzzy sets
#include "Fuzzy/Extending Set Operators/Extension.typ"
#pagebreak()
== Fuzzy reasoning
#include "Fuzzy/Inference.typ"
#pagebreak()

= Evolutionary computing
== Evolutionary algorithms
#include "Evolution/Algorithm.typ"
#pagebreak()
== Choosing a solution encoding
#include "Evolution/Encoding.typ"
#pagebreak()
== Choosing a selection method
#include "Evolution/Selection.typ"
#pagebreak()
== Choosing a genetic operator
#include "Evolution/Genetic Operators/Operator.typ"
#pagebreak()
// == The n-queens problem
// #include "Evolution/Queens.typ"
// #pagebreak()
== Improving performance through parallelization
#include "Evolution/Parallel.typ"
#pagebreak()
== Classes of evolutionary algorithms: evolutionary local search
#include "Evolution/Evolutionary Local Search/Ea_local.typ"
#pagebreak()
== Classes of evolutionary algorithms: swarm intelligence
#include "Evolution/Swarm Intelligence/Swarm.typ"
#pagebreak()
== Classes of evolutionary algorithms: genetic algorithms
#include "Evolution/Schemata.typ"
#pagebreak()
== Classes of evolutionary algorithms: genetic programming
#include "Evolution/Programming.typ"
#pagebreak()
== Classes of evolutionary algorithms: evolutionary strategies
#include "Evolution/Strategy.typ"
#pagebreak()
== Classes of evolutionary algorithms: finding Pareto-frontiers
#include "Evolution/Pareto.typ"
#pagebreak()
== Classes of evolutionary algorithms: solving behaviour simulations
#include "Evolution/Behaviour.typ"
