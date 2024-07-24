#set text(font: "Gentium Plus", size: 12pt, lang: "it")
#set page(paper: "a4")
#set par(justify: true)
#set heading(numbering: "1.")

#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/ctheorems:1.1.2": *

#show: thmrules.with(qed-symbol: $square$)

#let example(title, content) = {
	colorbox(
		title: title,
		color: "blue",
		radius: 2pt,
		width: auto
	)[#content]
}

// #let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let theorem = thmbox("theorem", "Teorema", fill: rgb("#e6eef5"))
#let principle = thmbox("principle", "Principio", fill: rgb("#e6eef5"))
#let proof = thmproof("proof", "Dimostrazione")

= I numeri

== Sistemi numerici

Sia $bb(N)$ un insieme non vuoto, in cui si fissa un elemento detto _zero_,
indicato con 0, ed una funzione $+$ da $bb(N)$ in $bb(N)$. Indicata con $a^(+)$
l'immagine di $a$ tramite $+$ al variare di $a in bb(N)$, si dice che $a^(+)$
é _elemento successivo_, o _successore_, di $a$. Si assuma che per l'insieme
$bb(N)$ valgano i seguenti assiomi, detti *Assiomi di Peano*:

+ $0 != a^(+)$ $forall a in bb(N)$. Ovvero, non esiste alcun elemento di
  $bb(N)$ avente 0 come successore;
+ La funzione $+$ é iniettiva. Ovvero, non esistono due $a_(1), a_(2) in S$
  distinti che abbiano uno stesso $a^(+)$ come successore;
+ Se $S subset.eq bb(N), 0 in S$ e $s^(+) in S$ $forall s in S$,
  allora $S = bb(N)$. Ovvero, se $S$ é un sottoinsieme anche
  improprio di $bb(N)$ che contiene (almeno) 0 e che, per ciascun
  elemento di $S$, ne contiene anche l'immagine tramite $+$, allora
  $S$ e $bb(N)$ sono lo stesso insieme.

L'insieme $bb(N)$ cosí definito prende il nome di *insieme dei numeri naturali*.

/*
#theorem("Teorema di Ricorrenza")[
	Dati un insieme $S$, un elemento $a$ di $S$ ed una funzione $phi.alt$ da $S$ in
	sé stesso, esiste una ed una sola funzione $f: bb(N) -> S$ tale che

	$ f(0) = a, f(n^(+)) = phi.alt(f(n)) $
]
#proof[
		Sia $X$ il prodotto cartesiano di $bb(N)$ e $S$. Si consideri l'insieme
		$Gamma subset.eq cal(P) (X)$, costituito dai sottoinsiemi $U$ di $X$ che
		godono delle seguenti proprietá:

		+ $(0, a) in U$;
		+ Se $(n, b) in U$ allora anche $(n^(+), phi.alt(b)) in U$.
]

Ogni funzione definita a partire da tale teorema viene detta _definita per ricorrenza_.
In particolare, le due operazioni principali che é possibile definire per ricorrenza
sull'insieme $bb(N)$ sono la *somma* ed il *prodotto*.

Definizione dell'insieme $bb(Z)$
*/

#principle("Principio di induzione")[
	Dato un numero fissato $n_(0) in bb(Z)$, sia $P(n)$ una proposizione
	dipendente da $n in bb(Z)$, con $n gt.eq n_(0)$. Si supponga che siano
	verificate le seguenti ipotesi:

	+ $P(n_(0))$ é vera;
	+ $forall n$, supponendo che sia vera $P(n)$ é possibile dimostrare che
	  lo sia anche $P(n + 1)$.

	Allora $P(n)$ é vera $forall n in bb(Z)$
]

#example[Principio di induzione][
	Si consideri la seguente proposizione, dipendente da $n$:

	$ sum_(i = 1)^(n) (2i - 1) = n^(2), forall n gt.eq 1 $

	É possibile applicarvi il principio di induzione ponendo
	$n_(0) = 1$. Nello specifico:

	- $P(1)$ é vera. Infatti, $sum_(i = 1)^(1) (2i - 1) = (2 dot.op 1)
	  - 1 = 2 - 1 = 1$ e $1^(2) = 1$;
	- Supponendo che sia vera $P(n)$, si dimostri che é vera $P(n + 1)$,
	  ovvero che sia vera $sum_(i = 1)^(n + 1) (2i - 1) = (n + 1)^(2)$.
	  Si ha:

	  $ sum_(i = 1)^(n + 1) (2i - 1) = (2(n + 1) - 1) + sum_(i = 1)^(n) (2i - 1) =
	  2n + 1 + sum_(i = 1)^(n) (2i - 1) = 2n + 1 + n^(2) $

	  Che é peró proprio la formula per il calcolo del quadrato di binomio.
	  Pertanto $n^(2) + 1 + 2n = (n + 1)^(2) = sum_(i = 1)^(n + 1) (2i - 1)$

	Essendo verificate entrambe le ipotesi del principio di inudzione, si ha
	che $P(n)$ é vera $forall n gt.eq 1$
]
