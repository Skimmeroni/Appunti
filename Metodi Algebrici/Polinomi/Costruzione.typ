#import "../Metodi_defs.typ": *

Siano $K$ un campo e $g(x) in K[x]$ un polinomio fissato. Due
polinomi $f(x), h(x) in K[x]$ si dicono *congrui modulo* $g(x)$
se $g(x) | f(x) − h(x)$. Per indicare che $f(x)$ e $h(x)$ sono
congrui modulo $g(x)$ si usa la notazione $f(x) equiv h(x) mod
g(x)$.

#example[
	Si considerino i polinomi a coefficienti sul campo $RR$ nell'incognita
	$x$. Valendo:

	$ 3x^(5) + 2x^(4) - x^(3) + 3x^(2) - 4x + 7 =
	  (3x^(3) + 8x^(2) + 12x + 19)(x^(2) - 2x + 1) + (22x - 12) $

	É possibile scrivere:

	$ 3x^(5) + 2x^(4) - x^(3) + 3x^(2) - 4x + 7
	  equiv 22x - 12 mod x^(2) - 2x + 1 $
]

#theorem[
	Siano $K$ un campo e $g(x) in K[x]$ un polinomio fissato.
	La congruenza modulo $g(x)$ é una relazione di equivalenza.
] <Polynomial-modulo-is-congruence>
#proof[
	La congruenza modulo $g(x)$ é una relazione di equivalenza se é
	riflessiva, simmetrica e transitiva:

	- La congruenza modulo $g(x)$ é riflessiva se, per qualsiasi
	  $f(x) in K[x]$, si ha $f(x) equiv f(x) mod g(x)$.

	  $f(x) equiv f(x) mod g(x)$ equivale a $g(x) | f(x) - f(x)$, ovvero
	  esiste un polinomio $q(x) in K[x]$ tale per cui $f(x) - f(x) = q(x)
	  g(x)$. Si noti peró come $f(x) - f(x)$ sia il polinomio nullo, e
	  l'espressione $0 = q(x) g(x)$ é sempre verificata ponendo $q(x) = 0$;
	- La congruenza modulo $g(x)$ é simmetrica se, presi due polinomi
	  $f(x), h(x) in K[x]$, se vale $f(x) equiv h(x) mod g(x)$ questo
	  implica $h(x) equiv f(x) mod g(x)$.

	  Se vale $f(x) equiv h(x) mod g(x)$, allora esiste un polinomio
	  $q(x) in K[x]$ tale per cui $f(x) - h(x) = q(x) g(x)$. Moltiplicando
	  per $-1$ ambo i membri si ha $h(x) - f(x) = -q(x) g(x)$; essendo
	  $-q(x)$ certamente un polinomio appartenente a $K[x]$, é possibile
	  scrivere $g(x) | h(x) − f(x)$, ovvero $h(x) equiv f(x) mod g(x)$.
	- La congruenza modulo $g(x)$ é transitiva se, presi tre polinomi
	  $f(x), h(x), t(x) in K[x]$, se vale $f(x) equiv h(x) mod g(x)$ e
	  $h(x) equiv t(x) mod g(x)$ questo implica $f(x) equiv t(x) mod g(x)$.

	  Se valgono $f(x) equiv h(x) mod g(x)$ e $h(x) equiv t(x) mod g(x)$
	  allora esistono $q_(1)(x), q_(2)(x) in K[x]$ tali per cui $f(x) -
	  h(x) = q_(1)(x) g(x)$ e $h(x) - t(x) = q_(2)(x) g(x)$. Sommando la
	  seconda nella prima, si ha:

	  $ f(x) - cancel(h(x)) + cancel(h(x)) - t(x) =
	    q_(1)(x) g(x) + q_(2)(x) g(x) => f(x) - t(x) =
	    (q_(1)(x) + q_(2)(x)) g(x) $

	  Essendo $q_(1)(x) + q_(2)(x) in K[x]$, é possibile scrivere
	  $g(x) | f(x) - t(x)$, ovvero $f(x) equiv t(x) mod g(x)$.
]

Essendo, per il @Polynomial-modulo-is-congruence, la congruenza modulo
$g(x)$ una relazione di equivalenza, é possibile definire su questa delle
classi di equivalenza ed un insieme quoziente. La classe di equivalenza
per la congruenza modulo $g(x)$ avente rappresentante $f(x) in K[x]$ si
indica con $[f(x)]_(g(x))$, mentre l'insieme quoziente con $K[x] slash
g(x)$. In particolare:

$ [f(x)]_(g(x)) &= {h(x) in K[x] : h(x) equiv f(x) mod g(x)} \
  &= {h(x) in K[x] : h(x) − f(x) = g(x) q(x) "per un certo" q(x) in K[x]} \
  &= {h(x) in K[x] : h(x) = f(x) + g(x) q(x) "per un certo" q(x) in K[x]} \
  &= {f(x) + g(x) q(x) : q(x) in K[x]} $

E naturalmente $K[x] slash g(x) = {[f(x)]_(g(x)) : f(x) in K[x]}$.

Sull'insieme quoziente $K[x] slash g(x)$ é possibile definire delle operazioni
di somma e di prodotto come segue:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ [f(x)]_(g(x)) + [h(x)]_(g(x)) = [f(x) + h(x)]_(g(x)) $],
	[$ [f(x)]_(g(x)) dot [h(x)]_(g(x)) = [f(x) dot h(x)]_(g(x)) $]
)

#lemma[
	La struttura algebrica $(K[x] slash g(x), +, dot)$, dove le due
	operazioni sono la somma ed il prodotto sopra definite, é un anello
	commutativo con unitá $[1]_(g(x))$.
] <Remainders-polynomials-is-ring>
// #proof[
// Dimostrabile, da aggiungere
// ]

#theorem[
	Siano $K$ un campo e $g(x) in K[x]$ un polinomio fissato. Se
	vale $diff(g(x)) > 0$, ogni elemento $f(x) in K[x] slash g(x)$
	puó essere scritto in maniera univoca nella forma $[r(x)]_(g(x))$,
	dove $r(x)$ é il resto della divisione fra $f(x)$ e $g(x)$.
] <Polynomial-class-is-unique>
#proof[
	Data una generica classe di equivalenza $[f(x)]_(g(x)) in K[x]
	slash g(x)$, dividendo $f(x)$ per $g(x)$ si ottiene $f(x) =
	q(x) g(x) + r(x)$, con $diff(r(x)) < diff(g(x))$. Spostando
	$f(x) - r(x)$ a primo membro si ottiene $f(x) - r(x) = q(x) g(x)$,
	ovvero $g(x) | f(x) - r(x)$ cioé $f(x) equiv r(x) mod g(x)$. Questo
	significa che $f(x)$ e $r(x)$ appartengono alla medesima classe di
	equivalenza per la congruenza modulo $g(x)$, pertanto $[f(x)]_(g(x))
	= [r(x)]_(g(x))$. Tale scrittura é univoca perché non soltanto $r(x)$
	é univoco per definizione, ma é anche non ulteriormente divisibile
	per $g(x)$.
]

La forma presentata in @Polynomial-class-is-unique per le classi di
equivalenza puó essere considerata la "forma standard" per rappresentarle.

#example[
	Si considerino i polinomi

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ p(x) = 3x^(5) + 2x^(4) - x^(3) + 3x^(2) - 4x + 7 $],
		[$ q(x) = 7x^(3) + 9x^(2) - 17x + 11 $]
	)

	Per entrambi la divisione per $g(x) = x^(2) - 2x + 1$ da resto
	$r(x) = 22x - 12$. Per il @Polynomial-class-is-unique, é allora
	possibile scrivere:

	$ [3x^(5) + 2x^(4) - x^(3) + 3x^(2) - 4x + 7]_(x^(2) - 2x + 1) =
	  [7x^(3) + 9x^(2) - 17x + 11]_(x^(2) - 2x + 1) =
	  [22x - 12]_(x^(2) - 2x + 1) $
]

#corollary[
	Sia $g(x) in ZZ_(p)[x]$ un polinomio fissato, con $p$ numero primo.
	$ZZ_(p)[x] slash g(x)$ ha esattamente $p^(diff(g(x)))$ elementi
	distinti, con $diff(g(x)) > 0$.
]
#proof[
	Per il @Polynomial-class-is-unique, é possibile scrivere
	in maniera univoca ogni elemento di $K[x] slash g(x)$ come
	$[r(x)]_(g(x))$, con $diff(r(x)) < diff(g(x))$. Le possibili
	scelte per $r(x) = [a_(n - 1)]_(p) x^(n - 1) + ... + [a_(1)]_(p)
	x + [a_(0)]_(p)$ dipendono esclusivamente dai valori di $[a_(n - 1)]_(p),
	..., [a_(1)]_(p), [a_(0)]_(p)$, dato che le incognite sono le medesime
	per ogni $r(x)$. Per il @Distinct-residue-classes, ciascun $[a_(i)]$
	contiene $p$ elementi, pertanto complessivamente esistono $p^(diff(g(x)))$
	modi per scegliere i coefficienti di $r(x)$.
]

#example[
	Sia $g(x) = [1]_(3) x^(2) - [2]_(3) x + [1]_(3)$ un polinomio
	a coefficienti in $ZZ_(3)$. Essendo $diff(g(x)) = 2$ e $p = 3$
	(con $3$ numero primo), l'insieme quoziente $ZZ_(3) slash
	[1]_(3) x^(2) - [2]_(3) x + [1]_(3)$ contiene esattamente
	$3^(2) = 9$ elementi distinti. Essendo pochi, possono essere
	enumerati esplicitamente:

	#set math.mat(delim:none, column-gap: 1.25em)
	$ mat([0]_(3), [1]_(3), [2]_(3), -[1]_(3) x, -[2]_(3) x,
	  -[1]_(3) x + [1]_(3), -[1]_(3) x + [2]_(3),
	  -[2]_(3) x + [1]_(3), -[2]_(3) x + [2]_(3)) $
]

#theorem[
	Siano $K$ un campo e $g(x) in K[x]$ un polinomio, tale che
	$diff(g(x)) > 0$. L'anello $(K[x] slash g(x), +, dot)$ è un
	campo se e soltanto se $g(x)$ è irriducibile in $K[x]$
] <Polynomial-ring-if-prime>
#proof[
	+ Sia $g(x)$ un polinomio irriducibile in $K[x]$. Per definizione
	  di campo, L'anello $(K[x] slash g(x), +, dot)$ é un campo se é
	  commutativo, unitario e se $(K[x] slash g(x) - {[0]_(g(x))}, dot)$
	  é un gruppo. Per il @Remainders-polynomials-is-ring é giá noto che
	  $(K[x] slash g(x), +, dot)$ sia commutativo ed unitario.

	  Affinché $(K[x] slash g(x) - {[0]_(g(x))}, dot)$ sia un gruppo,
	  é necessario che $dot$ possieda la proprietá associativa, che
	  ammetta un elemento neutro e che ammetta un inverso per ogni
	  elemento non nullo di $K[x] slash g(x)$. Il fatto che $dot$
	  possieda la proprietá associativa deriva direttamente dal modo
	  in cui questa é stata formulata, mentre l'esistenza dell'elemento
	  neutro é implicitamente derivante dal fatto che l'anello sia
	  unitario.

	  Sia $[f(x)]_(g(x))$ una classe di equivalenza non nulla.
	  Senza perditá di generalitá, é possibile assumere che $g(x)$
	  non divida $f(x)$; se cosí non fosse, sarebbe sufficiente
	  applicare il @Polynomial-class-is-unique e scegliere come
	  rappresentante della classe di equivalenza $[f(x)]_(g(x))$
	  il resto della divisione fra $f(x)$ e $g(x)$. Si consideri
	  $"MCD"(f(x), g(x))$; essendo $g(x)$ irriducibile per ipotesi,
	  $"MCD"(f(x), g(x))$ dev'essere uguale a $1$ oppure ad un
	  multiplo non nullo di $g(x)$. Rimane quindi solo da provare
	  che ogni elemento non nullo di $K[x] slash g(x)$ ammette inverso.

	  Si supponga che valga $"MCD"(f(x), g(x)) = k g(x)$ con $k in
	  K - {0_(K)}$. Se cosí fosse, si avrebbe $g(x) | f(x)$; infatti,
	  per definizione $"MCD"(f(x), g(x)) | f(x)$ ma se fosse vero che
	  $"MCD"(f(x), g(x)) = k g(x)$ allora si avrebbe $k g(x) | f(x)$,
	  ovvero $g(x) | f(x)$. Questo non é peró possibile, perché é
	  stato assunto che $g(x)$ non divida $f(x)$. Deve quindi aversi
	  $"MCD"(f(x), g(x)) = 1$. Per il @MCD-polynomials-exists, esistono
	  $t(x), s(x) in K[x]$ tali per i quali $s(x) f(x) + t(x) g(x) = 1$,
	  ovvero $s(x) f(x) = 1 - t(x) g(x)$. Si osservi come:

	  $ [f(x)]_(g(x)) dot [s(x)]_(g(x)) &= [f(x) dot s(x)]_(g(x)) =
	    [1 - t(x) g(x)]_(g(x)) = [1]_(g(x)) - [t(x)]_(g(x)) dot
	    [g(x)]_(g(x)) = \ &= [1]_(g(x)) - ([t(x)]_(g(x)) dot [0]_(g(x))) =
	    [1]_(g(x)) - [0]_(g(x)) = [1]_(g(x)) $

	  Se vale $[f(x)]_(g(x)) dot [s(x)]_(g(x)) = [1]_(g(x))$, allora
	  $[s(x)]_(g(x))$ é l'inverso di $[f(x)]_(g(x))$ rispetto a $dot$,
	  e che quindi per qualsiasi classe di equivalenza non nulla in
	  $K[x] slash g(x)$ esiste un inverso.

	+ Sia $(K[x] slash g(x), +, dot)$ un campo. Si supponga per assurdo
	  che $g(x)$ non sia un polinomio irriducibile: esiste allora una sua
	  fattorizzazione in polinomi (anche non primi):

	  $ g(x) = a(x) b(x) space "con" space 0 < diff(a(x)) < diff(g(x))
	    " e " space 0 < diff(b(x)) < diff(g(x)) $

	  Le classi di equivalenza $[a(x)]_(g(x))$ e $[b(x)]_(g(x))$ non
	  sono necessariamente nulle. Si noti peró come:

	  $ [a(x)]_(g(x)) dot [b(x)]_(g(x)) = [a(x) dot b(x)]_(g(x)) =
	    [g(x)]_(g(x)) = [0]_(g(x)) $

	  Questo non é peró possibile, perché in un campo non possono esistere
	  due elementi non nulli il cui prodotto restituisca l'elemento nullo.
	  Occorre quindi convenire che $g(x)$ sia un polinomio irriducibile.
]

#example[
	Sia $g(x) = x^(2) + 1$ un polinomio a coefficienti in $RR[x]$. Essendo
	$g(x)$ irriducibile in $RR[x]$, per il @Polynomial-ring-if-prime l'anello
	$RR[x] slash x^(2) + 1$ è un campo.
]
