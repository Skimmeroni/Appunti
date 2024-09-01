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
