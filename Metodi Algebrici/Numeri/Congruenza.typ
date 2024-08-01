#import "../Metodi_defs.typ": *

Sia $n in bb(Z)$ con $n > 0$. Dati due interi $a$ e $b$ sono *congrui
modulo* $n$ se $n | a - b$, e si scrive $a equiv b mod n$. In altre
parole, $a equiv b mod n$ vale se e solo se esiste un certo $k in
bb(Z)$ tale per cui $a - b = n k$. In maniera equivalente, é possibile
dire che due numeri $a$ e $b$ sono congruenti modulo $n$ se la loro
divisione per $n$ restituisce il medesimo resto.

#example[
	Avendosi $12 | 38 - 14$, é possibile scrivere $38 equiv 14 mod
	12$. Si noti inoltre come sia $38$ sia $14$, divisi per $12$,
	diano resto $2$.
]

La definizione puó essere estesa anche al caso in cui $n = 0$. Si noti
infatti come, se vale $n = 0$, si ha $a - b = 0 dot.op k$, ovvero $a = b$.
Pertanto, la congruenza modulo 0 coincide semplicemente con la relazione
di uguaglianza in $bb(Z)$.

La definizione puó essere inoltre estesa anche al caso in cui $n < 0$.
Infatti, basta osservare che $n | a − b$ se e solo se $−n | a − b$ per
concludere che $a equiv b mod n$ se e solo se $a equiv b mod − n$. Per
questo motivo, non é limitativo considerare $n > 0$.

#lemma[
	Sia $n in bb(Z)$ con $n > 0$. Dati quattro interi $a$, $b$, $c$ e $d$,
	se vale $a equiv b mod n$ e $c equiv d mod n$ allora vale $a + b equiv
	c + d mod n$.
]

#lemma[
	Sia $n in bb(Z)$ con $n > 0$. Dati quattro interi $a$, $b$, $c$ e $d$,
	se vale $a equiv b mod n$ e $c equiv d mod n$ allora vale $a b equiv
	c d mod n$.
]

#theorem[
	Per ogni numero intero $n > 0$, la congruenza modulo $n$ é una
	relazione di equivalenza su $bb(Z)$.
]
#proof[
	La congruenza modulo $n$ definisce su $bb(Z)$ la relazione $cal(R)$
	data da:

	$ forall a, b in bb(Z), (a, b) in cal(R) "se e solo se" a equiv b mod n $

	La relazione in questione é:

	+ Riflessiva: $forall a in bb(Z)$ vale $a equiv a mod n$. Infatti,
	  $a equiv a mod n$ equivale a dire $a - a = 0 = k n$, che é valido
	  per $k = 0$ e per qualsiasi $a in bb(Z)$;
	+ Simmetrica: $forall a, b in bb(Z)$, $a equiv b mod n$ implica $b equiv
	  a mod n$. Infatti, $a equiv b mod n$ equivale a dire $a − b = k n$ per
	  un certo $k in bb(Z)$. Moltiplicando per $-1$ ambo i membri si ha $-(a − b)
	  = -(k n)$, ovvero $b − a = (−k) n$, cioé $b equiv a mod n$;
	+ Transitiva: $forall a, b, c in bb(Z)$, $a equiv b mod n$ e $b equiv c mod n$
	  implicano $a equiv c mod n$. Infatti, $a equiv b mod n$ e $b equiv c mod n$
	  equivalgono a dire, rispettivamente, $a − b = k n$ e $b − c = h n$ per certi
	  $h, k in bb(Z)$. Sommando la seconda alla prima:

	  $ a − b + (b - c) = k n + (b − c) => a - cancel(b) + cancel(b) - c = k n + h n
	    => a - c = (k + h) n => a equiv c mod n $

	Pertanto, é una relazione di equivalenza.
]

Essendo la congruenza modulo $n$ una relazione di equivalenza, é possibile
identificare delle classi di equivalenza. Preso $n$ intero con $n > 0$ ed
un certo $a in bb(Z)$, la classe di equivalenza di $a$ rispetto alla congruenza
modulo $n$ viene indicata con $[a]_(n)$.

Tale classe di equivalenza corrisponde all'insieme ${b : b in bb(Z) and a equiv
b mod n}$, ovvero all'insieme che contiene tutti i numeri interi che, divisi per
$n$, restituiscono lo stesso resto della divisione fra $n$ e $a$.

#lemma[
	Sia $n$ un numero intero maggiore di $0$. Sia $a$ un numero intero qualsiasi
	e sia $b$ il resto della divisione di $a$ per $n$. Vale $[a]_(n) = [b]_(n)$.
]
#proof[
	Se $b$ é il resto della divisione di $a$ per $n$, allora vale $a = n k + b$
	per un certo $k in bb(Z)$, da cui si ha $a - b = n k$, che é la definizione
	di congruenza modulo $n$.
]

L'insieme quoziente di $bb(Z)$ rispetto alla relazione di congruenza modulo $n$
con $n > 0$ si dice *insieme delle classi di resti modulo* $n$ e si denota con
$bb(Z)_(n)$.

#theorem[
	Per ogni numero intero $n > 0$, l'insieme delle classi di resti modulo $n$ ha
	cardinalitá $n$. In particolare, tale insieme é:

	$ bb(Z)_(n) = {[0]_(n), [1]_(n), ..., [n − 1]_(n)} =
	  {{n k : k in bb(Z)},
	  {1 + n k : k in bb(Z)},
	  ...,
	  {n - 1 + n k : k in bb(Z)}} $
]
#proof[
	Sia $a in bb(Z)$. La divisione con resto fornisce $a = n q + r$ con $0 lt.eq r < n$.
	Poichè $a − r = q n$ si ha che $a equiv r mod n$. Ciò mostra che ogni intero $a$ è
	congruo, modulo $n$, a uno degli interi $0, 1, ..., n − 1$. D'altra parte se $i$ e
	$j$ sono interi, con $0 lt.eq i < n$ e $0 lt.eq j < n$ si ha, assumendo $i gt.eq j$,
	che $0 lt.eq i − j lt.eq n − 1$ e quindi $i − j = k n$ se e solo se $k = 0$, cioè
	$i = j$.
]

#example[
	#grid(columns: (0.5fr, 0.5fr),
		block[
			Con $n = 2$, si ha $bb(Z)_(2) = {[0]_(2), [1]_(2)}$:

			$ [0]_(2)&= {..., −6, −4, −2, 0, 2, 4, 6, ...} \
			  [1]_(2)&= {..., −5, −3, −1, 1, 3, 5, 7, ...} $
		],
		block[
		Con $n = 3$, si ha $bb(Z)_(3) = {[0]_(3), [1]_(3), [2]_(3)}$:

			$ [0]_(3)&= {..., −9, −6, −3, 0, 3, 6, 9, ...} \
			  [1]_(3)&= {..., −8, −5, −2, 1, 4, 7, 10, ...} \
			  [2]_(3)&= {..., −7, −4, −1, 2, 5, 8, 11, ...} $
		]
	)

	Ad esempio, la classe di resto $[5]_(7)$ rappresenta, oltre al numero $5$,
	anche il numero $12$ $(1 times 7 + 5)$, il numero $19$ $(2 times 7 + 5)$,
	il numero $2308$ $(329 times 7 + 5)$, il numero $-2$ $(-1 times 7 + 5)$
	il numero $-9$ $(-2 times 7 + 5)$, ecc...
]
