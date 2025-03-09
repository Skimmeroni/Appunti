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
// == Insiemi numerici noti
// #include "Insiemi/Insiemi.typ"
#pagebreak()

= Numeri interi
== Principio di induzione
#include "Interi/Induzione.typ"
== Divisione euclidea
#include "Interi/Divisione.typ"
== Numeri in base $n$
#include "Interi/Basi.typ"
// == Stime temporali
// #include "Interi/Tempo.typ"
// == Binomio di Newton
// #include "Interi/Newton.typ"
== Numeri primi
#include "Interi/Primi.typ"
== Equazioni Diofantee
#include "Interi/Diofantee.typ"
== Congruenza Modulo $n$
#include "Interi/Congruenza.typ"
== Funzione di Eulero
#include "Interi/Eulero.typ"
== Teorema di Fermat-Eulero
#include "Interi/Fermat.typ"
== Metodo dei quadrati ripetuti
#include "Interi/Quadrati.typ"
#pagebreak()

= Strutture algebriche
== Semigruppi e monoidi
#include "Strutture/Strutture.typ"
== Gruppi
#include "Strutture/Gruppi.typ"
== Permutazioni
#include "Strutture/Permutazioni.typ"
== Classi di resto
#include "Strutture/Resto.typ"
== Insiemi di generatori
#include "Strutture/Generatori.typ"
== Sottogruppi normali
#include "Strutture/Normale.typ"
== Anelli e campi
#include "Strutture/Anelli.typ"
#pagebreak()

= Polinomi
== Polinomi su un campo
#include "Polinomi/Polinomi.typ"
== Radici di un polinomio
#include "Polinomi/Radici.typ"
== Costruzione di campi
#include "Polinomi/Costruzione.typ"
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
== Test di primalitá
#include "Crittografia/Primalita.typ"
#pagebreak()

= Teoria dei codici
== Introduzione alla teoria dei codici
#include "Codici/Introduzione.typ"
== Codici a blocchi
#include "Codici/Blocchi.typ"
== Codici lineari
#include "Codici/Lineari.typ"
== Codifica e decodifica
#include "Codici/Codifica.typ"
== Codice duale
#include "Codici/Duale.typ"
== Sindrome
#include "Codici/Sindrome.typ"
== Codici ciclici
#include "Codici/Ciclici.typ"
