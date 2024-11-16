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
#show par: set block(spacing: 0.55em)

#outline(indent: auto)
#pagebreak()

= Cinematica
== Punto materiale unidimensionale
#include "Cinematica/Punto.typ"
== Punto materiale bidimensionale
#include "Cinematica/Proiettile.typ"
== Moto circolare
#include "Cinematica/Circolare.typ"
== Principio di relativitá
#include "Cinematica/Relativita.typ"
