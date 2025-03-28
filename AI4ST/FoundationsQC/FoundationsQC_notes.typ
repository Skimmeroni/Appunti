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

= Principles of Quantum Mechanics
== Complex numbers
#include "Principles/Complex.typ"
== Hilbert spaces
#include "Principles/Hilbert.typ"
== Bra-ket notation
#include "Principles/Braket.typ"
#pagebreak()

= Qubits
== Definition of a qubit
#include "Qubits/Qubits.typ"
== Multiple qubits
#include "Qubits/Multiple.typ"
== Qubit manipulations
#include "Qubits/Manipulations.typ"
#pagebreak()

= Quantum Theory
== Basics
#include "Quantum/Basics.typ"
== Complexity
#include "Quantum/Kolmogorov.typ"
