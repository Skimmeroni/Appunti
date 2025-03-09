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
#pagebreak()

= Termodinamica
== Temperatura e principio zero della termodinamica
#include "Termodinamica/Zero.typ"
== Espansione lineare e volumetrica
#include "Termodinamica/Espansione.typ"
== Capacitá termica e calore specifico
#include "Termodinamica/Calore.typ"
== Calore latente
#include "Termodinamica/Latente.typ"
#pagebreak()

= Teoria cinetica dei gas
== Equazione di stato dei gas ideali
#include "Gas/Ideale.typ"
== Primo principio della termodinamica
#include "Gas/Uno.typ"
== Trasformazioni termodinamiche particolari
#include "Gas/Trasformazione.typ"
//== Descrizione microscopica dei gas
//#include "Gas/Cinetica.typ"
== Entropia e secondo principio della termodinamica
#include "Gas/Entropia.typ"
#pagebreak()

= Elettricitá
== Elettrostatica e Legge di Coulomb
#include "Elettricita/Coulomb.typ"
== Campo elettrico
#include "Elettricita/Campo.typ"
== Teorema di Gauss
#include "Elettricita/Flusso.typ"
== Potenziale elettrico
#include "Elettricita/Potenziale.typ"
== Corrente elettrica
#include "Elettricita/Corrente.typ"
#pagebreak()

= Magnetismo
== Campo magnetico e Forza di Lorentz
#include "Magnetismo/Lorentz.typ"
//== Legge di Biot-Savart
//#include "Magnetismo/Biot-Savart.typ"
