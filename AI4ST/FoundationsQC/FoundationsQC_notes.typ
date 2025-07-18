#import "../../University-Notes-Template.typ": university-notes
#show: university-notes.with(
	title: "Foundations of Quantum Computing"
)

#import "FoundationsQC_definitions.typ": *
#show: thmrules.with(qed-symbol: $square$)
#show table.cell: set text(size: 8pt, font: "Noto Sans")

#outline(indent: auto)
#pagebreak()

= Mathematical Background
== Complex numbers
#include "Principles/Complex.typ"
== Hilbert spaces
#include "Principles/Hilbert.typ"
== Operators
#include "Principles/Operators.typ"
== Bra-ket notation
#include "Principles/Braket.typ"
#pagebreak()

= Qubits
== Single qubit systems
#include "Qubits/Single.typ"
== Multiple qubits systems
#include "Qubits/Multiple.typ"
== Qubit measurement
#include "Qubits/Measurement.typ"
== Qubit manipulations
#include "Qubits/Manipulations.typ"
//== Density matrices
//#include "Qubits/Density.typ"
#pagebreak()

= Quantum Algorithms
== Introduction to algorithms
#include "Algorithms/Introduction.typ"
== Quantum circuits for known states
#include "Algorithms/States.typ"
== Deutsch-Josza Algorithm
#include "Algorithms/Deutsch-Josza.typ"
== Bernstein-Vazirani Algorithm
#include "Algorithms/Bernstein-Vazirani.typ"
== Grover Algorithm
#include "Algorithms/Grover.typ"
== Representing graphs with quantum circuits
#include "Algorithms/Hypergraphs.typ"
== Quantum teleportation
#include "Algorithms/Teleportation.typ"
== Quantum Fourier Transform
#include "Algorithms/Fourier.typ"
== Quantum phase estimation
#include "Algorithms/Phase.typ"
== Swap test
#include "Algorithms/Swap.typ"
== Hadamard test
#include "Algorithms/Hadamard.typ"
#pagebreak()

= Quantum Theory
== Basics
#include "Quantum/Basics.typ"
== Complexity
#include "Quantum/Kolmogorov.typ"
