#import "../Metodi_defs.typ": *

Un codice lineare $C in ZZ_(p)^(n)$ si dice ciclico se per ogni parola
di $C$ esiste in $C$ ogni sua possibile permutazione ciclica.

#example[
	- Si consideri il codice lineare $C = {000, 011, 101, 110} subset.eq
	  ZZ_(2)^(3)$. Si considerino tutte le permutazioni cicliche (distinte)
	  degli elementi di $C$:

	  #grid(
		  columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
		  [$ angle.l 000 angle.r = {000, 000, 000} $],
		  [$ angle.l 011 angle.r = {011, 101, 110} $],
		  [$ angle.l 101 angle.r = {101, 110, 011} $],
		  [$ angle.l 110 angle.r = {110, 011, 101} $])

	  Dato che ogni permutazione ciclica di ogni parola di $C$ é a sua volta
	  membro di $C$, si ha che $C$ è un codice ciclico.
	- Si consideri il codice lineare $C = {0000, 0110, 1001, 1111} subset.eq
	  ZZ_(2)^(4)$. Si osservi come, ad esempio, $angle.l 0110 angle.r = {0110,
	  0011, 1001, 1100}$, ma $1100 in.not C$. Pertanto, $C$ non è un codice
	  ciclico.
]

É possibile vedere le componenti di ciascun elemento di $ZZ_(p)^(n)$ come i
coefficienti di un polinomio. Ovvero, all'elemento $(a_(0), dots, a_(n − 1))
in ZZ_(p)^(n)$ é associabile il polinomio:

$ a(t) = a_(0) + a_(1) t + dots + a_(n − 1) t^(n − 1) in ZZ_(p) [t] $

Nell'anello dei polinomi a coefficienti in $ZZ_(p)$ nell'incognita $t$.
É poi possibile definire un insieme quoziente come $R_(n) = ZZ_(p) [t]
slash t^(n − 1)$. La struttura algebrica $(R_(n), +, dot)$ forma un
anello, ma non un campo, perché $t^(n - 1)$ é un polinomio riducibile.
Gli elementi di $R_(n)$ sono le classi $[a(t)]_(t^(n − 1))$, dove
$a(t) in ZZ_(p)[t]$ e $diff a(t) lt.eq n − 1$.

La congruenza modulo $t^(n − 1)$ è molto semplice da descrivere:

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ t^(n) equiv 1 mod t^(n − 1) $],
	[$ t^(n + 1) = t^(n) t equiv t mod t^(n − 1) $],
	[$ t^(n + 2) = t^(n) t^(2) equiv t^(2) mod t^(n − 1) $]
)

In particolare, se vale $a(t) = a_(0) + a_(1) t + dots + a_(n − 1) t^(n − 1)$,
risulta:

$ a(t) t = a_(0) t + a_(1) t^(2) + dots + a_(n − 1) t^(n) equiv
  a_(n − 1) + a_(0) t + a_(1) t_(2) + dots + a_(n − 2) t^(n − 1) mod t^(n − 1) $

É possibile identificare $ZZ_(p)^(n)$ con $R_(n)$ tramite:

$ a_(0) a_(1) dots a_(n − 1) |-> a_(0) + a_(1) t + dots + a_(n − 1) t^(n − 1) $

#lemma[
	Un sottoinsieme $C$ di $R_(n)$ è un codice ciclico se e soltanto se:

	+ Per ogni $a(t), b(t) in C$, vale $a(t) + b(t) in C$;
	+ Per ogni $a(t) in C$ e per ogni $r(t) in R_(n)$, vale $a(t) r(t) in C$.
]
#proof[
	Si assuma che $C$ sia un codice ciclico. Essendo $C$ un codice lineare,
	è un sottospazio di $R_(n)$. Segue quindi dalla definizione di spazio
	vettoriale che per ogni $a(t), b(t) in C$, vale $a(t) + b(t) in C$, e
	per ogni $lambda in ZZ_(p)$ e per ogni $a(t) in C$, si ha $lambda a(t)
	in C$. Essendo $C$ un codice ciclico, per ogni $a(t) in C$, si ha

	#grid(
		columns: (0.25fr, 0.3fr, 0.45fr),
		[$ a(t)t in C $],
		[$ a(t) t^(2) = (a(t) t) t in C $],
		[$ a(t) t^(n − 1) = (((a(t) t) t) dots) t in C $]
	)

	Se $r(t) = r_(0) + r_(1) t + dots + r_(n − 1) t^(n − 1) in R_(n)$,
	risulta:

	$ a(t) r(t) = a(t) (r_(0) + r_(1) t + dots + r_(n − 1) t^(n − 1)) =
	  a(t) r_(0) + r_(1) a(t) t + dots + r_(n − 1) a(t) t^(n − 1) $

	Allora $a(t) r(t) in C$ perchè $a(t) r(t)$ è una combinazione lineare
	con coefficienti $r_(0), dots, r_(n)$ di parole di $C$.

	Viceversa, sia $C$ un sottoinsieme di $R_(n)$ che soddisfa le condizioni
	sopracitate. Allora $C$ è un sottospazio di $R_(n)$, perchè la prima
	condizione assicura che $C$ sia chiuso rispetto alla somma e la seconda
	condizione, scegliendo $r(t) = r_(0) in ZZ_(p)$, assicura che $C$ sia
	chiuso rispetto al prodotto vettore per scalare. Per ogni $a(t) = a_(0)
	+ a_(1) t + dots + a_(n − 1) t^(n − 1) in C$, applicando la seconda
	condizione scegliendo $r(t) = t$, si ha $a(t)t = a_(n − 1) + a_(0) t +
	a_(1) t^(2) + dots + a_(n − 2) t^(n − 1) in C$. Segue che $C$ è un codice
	ciclico.
]
