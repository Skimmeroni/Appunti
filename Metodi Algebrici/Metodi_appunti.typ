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

= Strutture algebriche
== Strutture algebriche di base
#include "Strutture/Strutture.typ"
== Proprietá dei gruppi
#include "Strutture/Gruppi.typ"
== Permutazioni
#include "Strutture/Permutazioni.typ"
== Insiemi di generatori
#include "Strutture/Generatori.typ"
== Anelli
#include "Strutture/Anelli.typ"
#pagebreak()

= Polinomi
== Polinomi su un campo
#include "Polinomi/Polinomi.typ"
== Radici di un polinomio
#include "Polinomi/Radici.typ"
// Costruzione di campi
// #include "Polinomi/Costruzione.typ"
#pagebreak()

= Crittografia
== Introduzione alla crittografia
#include "Crittografia/Introduzione.typ"
== Algoritmo RSA
#include "Crittografia/RSA.typ"
== Firma digitale tramite RSA
#include "Crittografia/Firma.typ"
// == Logaritmo discreto
// #include "Crittografia/Logaritmo.typ"
#pagebreak()

= Teoria dei codici
== Introduzione alla teoria dei codici
#include "Codici/Introduzione.typ"
== Codici a blocchi
#include "Codici/Blocchi.typ"
// == Codici lineari
// #include "Codici/Lineari.typ"
// == Codici ciclici
// #include "Codici/Ciclici.typ"
