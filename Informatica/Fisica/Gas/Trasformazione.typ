#import "../Fisica_defs.typ": *

Nel caso in cui la trasformazione di un gas avvenga con una delle variabili
di stato tenute costanti, lo stato finale di tale trasformazione puó essere
predetto in maniera semplice applicando la legge di stato dei gas ideali e/o
il primo principio della termodinamica.

=== Caso di studio: trasformazione adiabatica

Una *trasformazione adiabatica* é una trasformazione che avviene in
un tempo cosí rapido da non permettere al gas di scambiare energia
con l'esterno sotto forma di calore.

Imponendo $Q = 0$ nell'equazione del primo principio della termodinamica:

$ Delta E_("int") = 0 - W => -Delta E_("int") = W $

Ovvero, la variazione di energia interna associata al gas é interamente
dovuta al lavoro. Nello specifico, tale variazione é negativa se il
lavoro é eseguito _dal_ gas (e quindi $W$ é positivo) mentre é positiva
se il lavoro é eseguito _sul_ gas (e quindi $W$ é negativo).

=== Caso di studio: trasformazione isobara

Una *trasformazione isobara* é una trasformazione in cui il valore
della pressione $P$ del gas é uguale sia nello stato iniziale che
in quello finale.

Siano pertanto $V_(i)$ e $V_(f)$ rispettivamente il volume del
gas allo stato iniziale e finale, e siano $T_(i)$ e $T_(f)$
rispettivamente la temperatura del gas allo stato iniziale e
finale. Applicando l'equazione di stato dei gas ideali, si ha:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ P V_(i) = n R T_(i) $],
	[$ P V_(f) = n R T_(f) $]
)

Essendo la pressione uguale in entrambe, é possibile scrivere:

$ P = frac(cancel(n R) T_(i), V_(i)) = frac(cancel(n R) T_(f), V_(f)) =>
  V_(f) = V_(i) (frac(T_(f), T_(i))) $

É possibile dimostrare sperimentalmente che, per un gas ideale:

$ frac(T_(f), T_(i)) approx (1 + alpha T_(f)) $

Dove $alpha = 3.663 times 10^(-3)$ é una costante chiamata *coefficiente
di espansione dei gas*. Si ha quindi:

$ V_(f) = V_(i) (1 + alpha T_(f)) $

Questa equazione prende anche il nome di *Legge di Charles*.

Si recuperi inoltre l'equazione per il calcolo del lavoro compiuto da
un gas. Essendo la pressione una costante, la risoluzione dell'integrale
é immediata:

$ W = integral_(V_(i))^(V_(f)) P d V =
      P integral_(V_(i))^(V_(f)) d V =
      P [V]_(V_(i))^(V_(f)) =
      P(V_(f) - V_(i)) =
      P Delta V $

#exercise[
	Si supponga che $1.00 times 10^(-3) kilogram$ di acqua a pressione 
	atmosferica $1.013 pascal$ si trasformi in vapore a pressione costante.
	Il volume dell'acqua allo stato liquido é $V_(i) = V_("liquido") = 
	1.00 times 10^(-6) metre^(3)$ e nello stato di vapore é $V_(f) = 
	V_("vapore") = 1.671 times 10^(-3) metre^(3)}$. Il calore latente
	di vaporizzazione dell'acqua é pari a $2.26 times 10^(6) joule /
	kilogram$. Si calcolino il lavoro compiuto nell'espansione e la
	variazione di energia interna del sistema (si trascuri ogni
	mescolamento tra il vapore e l'aria circostante).
]
#solution[
	La trasformazione é isobara, pertanto:

	$ W = P Delta V =
	  1.013 pascal dot (1.671 times 10^(-3) metre^(3)
	  - 1.00 times 10^(-6) metre^(3)) = -169 joule $

	Quello che sta avvenendo é un passaggio di stato, pertanto
	la temperatura del vapore (e dell'acqua) non varia, ma varia
	soltanto l'energia interna:

	$ Delta E_("int") = Q - W = L_(v) m - W =
	  2.26 times 10^(6) joule dot 10^(-3) kilogram - (-169 joule) =
	  2.09 times 10^(3) joule $
]

=== Caso di studio: trasformazione isocora

Una *trasformazione isocora* é una trasformazione in cui il valore
del volume $V$ del gas é uguale sia nello stato iniziale che in
quello finale.

Siano pertanto $P_(i)$ e $P_(f)$ rispettivamente la pressione del
gas allo stato iniziale e finale, e siano $T_(i)$ e $T_(f)$
rispettivamente la temperatura del gas allo stato iniziale e
finale. Applicando l'equazione di stato dei gas ideali, si ha:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ P_(i) V = n R T_(i) $],
	[$ P_(f) V = n R T_(f) $]
)

Essendo il volume uguale in entrambe, é possibile scrivere:

$ V = frac(cancel(n R) T_(i), P_(i)) = frac(cancel(n R) T_(f), P_(f)) =>
  P_(f) = P_(i) (frac(T_(f), T_(i))) $

Anche in questo caso é possibile dimostrare sperimentalmente
che, per un gas ideale:

$ frac(T_(f), T_(i)) approx (1 + alpha T_(f)) $

Si ha quindi:

$ P_(f) = P_(i) (1 + alpha T_(f)) $

Questa equazione prende anche il nome di *legge di Gay-Lussac*.

Si recuperi inoltre l'equazione per il calcolo del lavoro compiuto
da un gas. Essendo volume iniziale e finale gli estremi di integrazione
ed essendo uguali, si ha:

$ W = integral_(V_(i))^(V_(f)) P d V = integral_(V)^(V) P d V = 0 $

Ovvero, durante una trasformazione isocora, il lavoro compiuto
dal/sul gas é nullo. Sostituendo nella legge del primo principio
della termodinamica, si ha:

$ Delta E_("int") = Q - 0 = Q $

Ovvero, la variazione di energia interna associata al gas é interamente
dovuta al calore. Nello specifico, tale variazione é positiva se il gas
assorbe calore dall'esterno mentre é negativa se il gas cede calore
all'esterno.

=== Caso di studio: trasformazione isoterma

Una *trasformazione isoterma* é una trasformazione in cui il valore
della temperatura $T$ del gas é uguale sia nello stato iniziale che
in quello finale.

Siano pertanto $V_(i)$ e $V_(f)$ rispettivamente il volume del
gas allo stato iniziale e finale, e siano $P_(i)$ e $P_(f)$
rispettivamente la pressione del gas allo stato iniziale e
finale. Applicando l'equazione di stato dei gas ideali, si ha:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ P_(i) V_(i) = n R T $],
	[$ P_(f) V_(f) = n R T $]
)

Essendo il membro di destra uguale in entrambe, é possibile scrivere:

$ P_(i) V_(i) = P_(f) V_(f) $

Questa equazione prende anche il nome di *Legge di Boyle*.

Si recuperi inoltre l'equazione per il calcolo del lavoro compiuto da
un gas. Sapendo che la temperatura $T$ é costante, é possibile sostituire
$P$ come:

$ W = integral_(V_(i))^(V_(f)) P d V =
  integral_(V_(i))^(V_(f)) frac(n R T, V) d V =
  n R T integral_(V_(i))^(V_(f)) frac(1, V) d V =
  n R T [ln(V)]_(V_(i))^(V_(f)) =
  n R T ln(frac(V_(i), V_(f))) $

#exercise[
	$1.0 mole$ di gas perfetto é mantenuta a $273.0 kelvin$ durante
	un'espansione dal volume $3.0 litre$ al volume $10.0 litre$. Quanto
	lavoro é compiuto dal gas durante l'espansione?
]
#solution[
	La trasformazione é isoterma, pertanto:

	$ W = n R T ln(V_(i), V_(f)) =
	  (1.0 mole) dot (8.314 joule / mole dot kelvin)
	  dot 273.0 kelvin dot ln(3.0 litre, 10.0 litre) =
	  2.7 dot 10^(3) joule $
]

=== Caso di studio: trasformazione ciclica

Una *trasformazione ciclica* é una trasformazione in cui lo stato
iniziale e finale coincidono. In tale scenario, le variabili di
stato per entrambi gli stati avranno ovviamente gli stessi valori,
compresa l'energia interna. Sostituendo nella legge del primo principio
della termodinamica, si ha:

$ 0 = Q - W => Q = W $

Ovvero, il calore acquisito/ceduto dal gas deve coincidere esattamente
con il lavoro compiuto da/su quest'ultimo.
