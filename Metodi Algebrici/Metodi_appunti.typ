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

#outline(indent: auto)
#pagebreak()

= Insiemi
== Definizione di insieme
#include "Insiemi/Definizione.typ"
== Corrispondenze e relazioni
#include "Insiemi/Relazioni.typ"
== Funzioni
#include "Insiemi/Funzioni.typ"
== Strutture algebriche
#include "Insiemi/Strutture.typ"
#pagebreak()

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
== Congruenza Modulo $n$
#include "Numeri/Congruenza.typ"
== Congruenze lineari
#include "Numeri/Lineare.typ"
== Funzione di Eulero
#include "Numeri/Eulero.typ"
// == Binomio di Newton
// #include "Numeri/Newton.typ"
== Teorema di Fermat-Eulero
#include "Numeri/Fermat.typ"
== Test di primalitá
#include "Numeri/Primalita.typ"
// == Numeri di Carmichael
// #include "Numeri/Carmichael.typ"
#pagebreak()

= Gruppi
== Proprietá dei gruppi
#include "Gruppi/Proprieta.typ"
== Polinomi su un campo
#include "Gruppi/Polinomi.typ"
== Radici di un polinomio
#include "Gruppi/Radici.typ"
#pagebreak()

// = Crittografia

/*
Permutazioni
Sottogruppi. Ideali. Morfismi
Costruzione di campi
*/

/*
Crittografia
Firma digitale tramite RSA
Teoria dei Codici: introduzione
Codici Lineari
Codici Ciclici
*/
