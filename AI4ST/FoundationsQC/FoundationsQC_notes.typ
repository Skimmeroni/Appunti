#import "FoundationsQC_definitions.typ": *

#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "en"
)
#set page(
	paper: "a4",
	header: align(right)[_Foundations of Quantum Computing_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)
#set document(
        title: "Notes on Foundations of Quantum Computing",
        author: "Shania",
        date: auto
)

#show: thmrules.with(qed-symbol: $square$)
#show heading: set block(above: 1.4em, below: 1em)
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
== Quantum circuits for known states
#include "Qubits/Circuits.typ"
== Quantum algorithms
#include "Qubits/Algorithms.typ"
//== Density matrices
//#include "Qubits/Density.typ"
#pagebreak()

= Quantum Theory
== Basics
#include "Quantum/Basics.typ"
== Complexity
#include "Quantum/Kolmogorov.typ"
