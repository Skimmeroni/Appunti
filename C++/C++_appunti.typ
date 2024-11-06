#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "it"
)
#set page(
	paper: "a4",
	header: align(right)[_Programmazione C++_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)

#show par: set block(spacing: 0.55em)

#set raw(lang: "c++")
#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)
#show raw.where(block: true): box.with(
  inset: 20pt
)

#outline(indent: auto)
#pagebreak()

= Introduzione
// == Filosofia del C++
// #include "Introduzione/Filosofia.typ"
// == Processo di compilazione
// #include "Introduzione/Compilazione.typ"
== Dichiarazione e definizione
#include "Introduzione/Dichiarazione.typ"
== Tipi di dato elementari
#include "Introduzione/Tipi.typ"
== Array
#include "Introduzione/Array.typ"
== Struct, enum, typedef
#include "Introduzione/Struct.typ"
== Stringhe
#include "Introduzione/Stringhe.typ"
== Casting
#include "Introduzione/Casting.typ"
== Ciclo di vita delle variabili
#include "Introduzione/Ciclo.typ"
== Funzioni
#include "Introduzione/Funzioni.typ"
= Appendice
== Doxygen
#include "Introduzione/Doxygen.typ"
// == Makefile
// #include "Introduzione/Makefile.typ"
// == Valgrind
// #include "Introduzione/Valgrind.typ"
