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
//#show raw.where(block: false): box.with(
//  fill: luma(240),
//  inset: (x: 3pt, y: 0pt),
//  outset: (y: 3pt),
// radius: 2pt,
//)
#outline(indent: auto)
#pagebreak()

= Introduzione
== Hello, World!
#include "Introduzione/HelloWorld.typ"
== Tipi di dato elementari
#include "Introduzione/Tipi.typ"
== Dichiarazione e definizione
#include "Introduzione/Dichiarazione.typ"
== Tipi di dato composti
#include "Introduzione/Array.typ"
== Scope e namespace
#include "Introduzione/Scope.typ"
== Typedef, const, Casting
#include "Introduzione/Casting.typ"
== Ciclo di vita delle variabili
#include "Introduzione/Ciclo.typ"
== Funzioni
#include "Introduzione/Funzioni.typ"
== Processo di compilazione
#include "Introduzione/Compilazione.typ"
#pagebreak()

= Programmazione ad oggetti
== Classi
#include "Oggetti/Classi.typ"
== Ridefinizione degli operatori
#include "Oggetti/Operatori.typ"
// == Eccezioni
// #include "Oggetti/Eccezioni.typ"
== Template e funtori
#include "Oggetti/Template.typ"
== Iteratori
#include "Oggetti/Iteratori.typ"
#pagebreak()

= Appendice
== Doxygen
#include "Appendice/Doxygen.typ"
// == Makefile
// #include "Introduzione/Makefile.typ"
// == Valgrind
// #include "Introduzione/Valgrind.typ"
