#import "../../University-Notes-Template.typ": university-notes
#show: university-notes.with(
	title: "AI Models for Physics"
)

#import "AIModels_definitions.typ": *

#outline(indent: auto)
#pagebreak()

= Graph neural networks
== Graph definition
#include "Graphs/Definition.typ"
== Graph embedding
#include "Graphs/Embedding.typ"
#pagebreak()

= Reinforcement learning
== Agents and environments
#include "Reinforcement/Agent.typ"
//== Markov Decision Processes
//#include "Reinforcement/MDP.typ"
