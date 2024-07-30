#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "it"
)
#set page(
	paper: "a4",
	header: align(right)[_Metodi Algebrici per l'Informatica_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)

#import "Metodi_defs.typ": *

#show: thmrules.with(qed-symbol: $square$)
#show par: set block(spacing: 0.55em)

= Insiemi
== Definizione di insieme
#include "Insiemi/Definizione.typ"
= Numeri interi
== Sistemi numerici
#include "Numeri/Insiemi.typ"
== Divisione
#include "Numeri/Divisione.typ"
== Basi
#include "Numeri/Basi.typ"
// == Stime temporali
// #include "Numeri/Tempo.typ"
== Teorema Fondamentale dell'Aritmetica
#include "Numeri/Primi.typ"
== Equazioni Diofantee
#include "Numeri/Diofantee.typ"
