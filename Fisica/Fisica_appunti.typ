#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "it"
)
#set page(
	paper: "a4",
	header: align(right)[_Fisica_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)

#import "Fisica_defs.typ": *

#show: thmrules.with(qed-symbol: $square$)

#outline(indent: auto)
#pagebreak()

= Introduzione
== Cos'é la fisica?
#include "Introduzione/Fisica.typ"
== Grandezze fondamentali 
#include "Introduzione/Grandezze.typ"
== Errore di misurazione
#include "Introduzione/Errore.typ"
#pagebreak()

= Cinematica
== Moto unidimensionale
#include "Cinematica/Punto.typ"
== Moto bidimensionale
#include "Cinematica/Proiettile.typ"
== Moto circolare
#include "Cinematica/Circolare.typ"
== Moti relativi e sistemi inerziali
#include "Cinematica/Relativita.typ"
#pagebreak()

= Dinamica
== Leggi di Newton
#include "Dinamica/Newton.typ"
== Energia cinetica
#include "Dinamica/Cinetica.typ"
== Energia potenziale
#include "Dinamica/Potenziale.typ"
== Energia meccanica
#include "Dinamica/Meccanica.typ"

= Termodinamica
== Temperatura e principio zero
#include "Termodinamica/Zero.typ"
== Espansione lineare e volumetrica
#include "Termodinamica/Espansione.typ"
