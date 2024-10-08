#import "../Metodi_defs.typ": *

Sia $p in ZZ$, con $p gt.eq 2$. Il numero intero $p$ si dice
*primo* se, per qualsiasi $a, b in ZZ$, $p | a b$ implica $p
| a$ oppure $p | b$. Un numero intero non primo viene
detto *numero composto*.

Il numero intero $p$ con $p gt.eq 2$ viene detto *irriducibile* se
i suoi divisori sono solo e soltanto $plus.minus p$ e $plus.minus
1$. In altre parole, se vale $a | p$ con $a in ZZ$, allora $a =
plus.minus p$ oppure $a = plus.minus 1$. Un numero intero non
irriducibile viene detto *riducibile*.

#theorem[
	Il numero $p in ZZ$, con $p gt.eq 2$ é primo se e solo se é
	irriducibile (ovvero, le due definizioni sono equivalenti).
]
#proof[
	- Si supponga che $p$ sia un numero primo. Sia $a in ZZ$ un
	  divisore di $p$, la cui esistenza é garantita per definizione.
	  Deve allora esistere un certo $b in ZZ$ tale per cui $p =
	  a b$; avendosi $p | p$ per qualsiasi numero intero, si ha $p
	  | a b$. Essendo $p$ un numero primo, per definizione deve aversi
	  $p | a$ oppure $p | b$:

	  - Se $p | a$, allora $p = plus.minus a$, perché avendo scelto $a$
	    come divisore di $p$ si ha sia $a | p$ che $p | a$;
	  - Se $p | b$, allora deve esistere un certo $c in ZZ$ tale per
	    cui $b = p c$. Ma per ipotesi $p = a b$, pertanto $p = a (p c)$,
	    ovvero $plus.minus 1 = a c$, da cui si ha $a = plus.minus 1$.

	  In entrambi i casi, $p$ risponde alla definizione di numero
	  irriducibile.
	- Si supponga che $p$ sia un numero irriducibile. Siano allora $a, b
	  in ZZ$ tali per cui $p | a b$; deve allora esistere un certo
	  $q in ZZ$ tale per cui $a b = p q$. Sia $d = "MCD"(a, b)$: per
	  definizione, $d | p$. Essendo $p$ un numero irriducibile, deve
	  aversi o $d = p$ oppure $d = 1$:

	  - Se $d = p$, allora $p$ é uno dei divisori di $a$, e quindi $p | a$;
	  - Se $d = 1$, allora esistono due numeri interi $x$ e $y$ tali per cui
	    é valida l'identitá di Bézout, ovvero $1 = a x + p y$. Moltiplicando
	    tale identitá per $b$, si ha $b = a b x + p b y$, da cui si deduce
	    $p | b$.

	  In entrambi i casi, $p$ risponde alla definizione di numero primo.
]

#lemma("Lemma di Euclide")[
	Sia $p$ un numero primo. Se $p$ é il divisore del prodotto di
	$n gt.eq 2$ numeri interi, allora $p$ é divisore di almeno uno
	dei fattori.
] <Euclid-lemma>
#proof[
	Si applichi il principio di induzione su $n$. Se $n = 2$, si ha $p | a b$
	con $a, b in ZZ$, e per definizione $p | a$ oppure $p | b$.

	Si supponga che la proposizione sia vera per $n$, ovvero che $p$ sia
	il divisore di almeno uno dei fattori del prodotto $a_(1) dot a_(2)
	dot ... dot a_(n)$, con $a_(1), ..., a_(n) in ZZ$ sapendo che
	é divisore del prodotto stesso. Si dimostri pertanto che $p$ sia il
	divisore di almeno uno dei fattori del prodotto $a_(1) dot a_(2)
	dot ... dot a_(n + 1)$ sapendo che vale $p | (a_(1) dot ...
	dot a_(n + 1))$. Sia $b = a_(1) dot a_(2) dot ... dot a_(n)$:
	é possibile allora scrivere $p | b dot a_(n + 1)$. Si ha quindi $p |
	a_(n + 1)$ oppure $p | b$: se vale $p | a_(n + 1)$ il lemma é provato
	immediatamente, mentre se vale $p | b$ allora $p$ divide almeno uno
	dei fattori di $b$ per l'ipotesi induttiva, ed il lemma é provato
	comunque.
]

Si dice che un numero naturale viene *fattorizzato in numeri primi*
quando tale numero viene scritto come prodotto di soli numeri primi
(non necessariamente distinti). In genere, una fattorizzazione viene
espressa raccogliendo a fattor comune i numeri primi per mettere in
evidenza la loro molteplicitá.

#example[
	Il numero $386672$ puó venire riscritto come $11 dot 13 dot 13 dot
	13 dot 2 dot 2 dot 2 dot 2$. Questa é una fattorizzazione in numeri
	primi, perché 11, 13 e 2 sono numeri primi. Tale fattorizzazione
	viene in genere scritta come $11 dot 13^(3) dot 2^(4)$.
]

#theorem("Teorema fondamentale dell'aritmetica")[
	Per ogni numero $n in NN$ tale che $n gt.eq 2$ esiste uno ed
	un solo modo per fattorizzarlo in numeri primi (a meno dell'ordine
	in cui si dispongono i fattori).
] <Fundamental-Arithmetic>
#proof[
	Per provare l'esistenza della fattorizzazione in numeri primi di $n$,
	si proceda per induzione forte su $n$. Sia $P(n)$ la proposizione
	_esiste una fattorizzazione in numeri primi per il numero_ $n$, con
	$n_(0) = 2$.

	La proposizione $P(n_(0))$ é verificata, perché 2 é un numero primo
	ed é quindi fattorizzabile in numeri primi. Si consideri pertanto
	la validitá della proposizione $P(n)$ assumendo che questa sia valida
	per tutti gli $m$ tali per cui $2 lt.eq m < n$. Se $n$ é un numero primo,
	allora $P(n)$ é verificata immediatamente; se invece é un numero composto,
	allora sará certamente scrivibile come prodotto di due interi, siano
	questi $a$ e $b$. Si ha allora $n = a b$, con $2 lt.eq a$ e $b < n$.
	Essendo sia $a$ che $b$ minori di $n$, vale per questi l'ipotesi
	induttiva, ed esiste quindi una fattorizzazione in numeri primi
	sia per $a$ che per $b$, siano queste rispettivamente $a_(1) dot ...
	dot a_(h)$ e $b_(1) dot ... dot b_(k)$. É allora possibile fattorizzare
	$n$ in numeri primi come $(a_(1) dot ... dot a_(h)) dot (b_(1) dot ...
	dot b_(k))$, pertanto (almeno) una fattorizzazione in numeri primi per
	$n$ esiste.

	Per provare l'unicitá della fattorizzazione in numeri primi di $n$,
	si proceda nuovamente per induzione forte su $n$. Sia $P(n)$ la
	proposizione _esiste una sola fattorizzazione in numeri primi per
	il numero_ $n$, con $n_(0) = 2$. La proposizione $P(n_(0))$ é verificata,
	perché 2 é un numero primo ed é quindi fattorizzabile in numeri primi in
	un solo modo (sé stesso). Si dimostri quindi che esista un solo modo per
	fattorizzare in numeri primi $n$ assumendo che esista un solo modo per
	fattorizzare tutti gli $m$ con $0 lt.eq m < n$. Dato che almeno una
	fattorizzazione in numeri primi per $n$ esiste, si supponga $n = p_(1)
	p_(2) ... p_(s) = q_(1) q_(2) ... q_(t)$, dove ciascun $p_(i)$ con $1
	lt.eq i lt.eq s$ e ciascun $q_(j)$ con $1 lt.eq j lt.eq t$ é un numero
	primo (non necessariamente distinto dagli altri). Si vuole dimostrare
	sia che $s = t$, ovvero che entrambe le fattorizzazioni sono costituite
	dallo stesso numero di elementi, sia che ogni $p_(i)$ ha un $q_(j)$ al
	quale é equivalente, e che quindi le due fattorizzazioni sono equivalenti
	membro a membro. Poiché $p_(1) | p_(1), p_(2), ..., p_(s)$ si ha che
	$p_(1) | q_(1) q_(2) ... q_(t)$, e dunque esiste almeno un $j$ con $1
	lt.eq j lt.eq t$ per il quale vale $p_(1) | q_(j)$. Senza perdita di
	generalitá, é possibile assumere che il $j$ in questione sia 1
	(eventualmente, é sufficiente riordinare i fattori $q_(1), ..., q_(t)$
	per fare in modo che sia cosí), ed é quindi possibile assumere che valga
	$p_(1) | q_(1)$. Essendo peró entrambi numeri primi, se ne deduce che
	$p_(1) = q_(1)$. Ma allora:

	$ n = p_(1) p_(2) ... p_(s) = q_(1) q_(2) ... q_(t) =>
	  cancel(p_(1)) p_(2) ... p_(s) = cancel(p_(1)) q_(2) ... q_(t) =>
	  p_(2) ... p_(s) = q_(2) ... q_(t) $

	Che essendo necessariamente entrambe minori di $n$, vale per queste
	l'ipotesi induttiva.
]

Per calcolare la (univoca) fattorizzazione di un numero primo occorre
trovare un numero primo qualsiasi che ne sia un divisore e ripetere
il procedimento sul risultato di tale divisione fintanto che é possibile
procedere, ovvero fintanto che tale risultato sia diverso da 1.

#example[
	#set math.mat(delim: none)
	$ mat(
	  13796146 div 13 &= 1061242;
	  1061242 div 13 &= 81634;
	  81634 div 17 &= 4802;
	  4802 div 7 &= 686;
	  686 div 7 &= 98;
	  98 div 7 &= 14;
	  14 div 7 &= 2;
	  2 div 2 &= 1;
	) $
]

#theorem("Teorema di Euclide sui numeri primi")[
	Esistono infiniti numeri primi.
]
#proof[
	Si supponga per assurdo che questo non sia vero, e che i numeri
	primi siano quindi un insieme finito: sia tale insieme ${p_(1),
	p_(2), ..., p_(k)}$. Sia $M = 1 + (p_(1) dot p_(2) dot ... dot
	p_(k))$: essendo 2 il numero primo piú piccolo, si avrá certamente
	$M gt.eq 2$. Essendo poi l'insieme $ZZ$ chiuso rispetto al prodotto
	e alla somma, si ha $M in ZZ$. Sono allora valide le ipotesi del
	@Fundamental-Arithmetic, ed esiste quindi una ed una sola fattorizzazione
	in numeri primi per $M$. Se tale fattorizzazione esiste, allora ciascun
	elemento $p_(i)$ di tale fattorizzazione deve esserne anche un divisore.
	Questo peró non é possibile, perché se si avesse $p_(i) | M$ per un
	qualsiasi $1 lt.eq i lt.eq k$ allora si avrebbe anche $p_(i) | 1 =
	M - (p_(1) dot p_(2) dot ... dot p_(k))$, e non esiste alcun numero
	che sia divisore di 1. Occorre pertanto assumere che i numeri primi
	siano infiniti.
]
