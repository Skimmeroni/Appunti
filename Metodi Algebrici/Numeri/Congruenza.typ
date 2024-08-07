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

Sull'insieme delle classi di resto modulo $n$ é possibile definire le operazioni
di somma e di prodotto. Siano $[a]_(n)$ e $[b]_(n)$ due classi di resto modulo
$n$. La somma ed il prodotto sono definiti come:

$ [a]_(n) + [b]_(n) = [a + b]_(n) space.fig space.fig space.fig
  [a]_(n) dot.op [b]_(n) = [a b]_(n) $

#example[
	in $bb(Z)_(5)$, si ha $[1]_(5) + [3]_(5) = [3 + 1]_(5) = [4]_(5)$ e
	$[2]_(5) dot.op [3]_(5) = [2 dot.op 3]_(5) = [6]_(5)$
]

#lemma[
	Sia $n in bb(Z)$ con $n gt.eq 1$. Siano poi $a, b, c, d in bb(Z)$,
	tali per cui $[a]_(n) = [b]_(n)$ e $[c]_(n) = [d]_(n)$. Allora vale:

	$ [a]_(n) + [c]_(n) = [b]_(n) + [d]_(n) space.fig space.fig space.fig
	  [a]_(n) dot.op [c]_(n) = [b]_(n) dot.op [d]_(n) $
]
#proof[
	Poichè $[a]_(n) = [b]_(n)$ e $[c]_(n) = [d]_(n)$ si ha, per definizione
	di classe di equivalenza, $a = b + n k$ e $c = d + n h$ per $k, h in
	bb(Z)$. Sommando e moltiplicando l'una all'altra, si ha:

	#set math.mat(delim: none)
	$ mat(
	  a + c = b + n k + d + n h =>
	  a + c = (b + d) + n(h + k);
	  a dot.op c = (b + n k) dot.op (d + n h) =>
	  a c = b d + b n h + n k d + n^(2) k h =>
	  a c = b d + n(b h + d k + n k h)
	) $

	Essendo $bb(Z)$ chiuso rispetto alla somma e al prodotto, si ha
	$k + h in bb(Z)$ e $b h + d k + k h n in bb(Z)$, siano questi
	rispettivamente $alpha$ e $beta$. Si ha:

	$ a + c = b + d + n alpha space.fig space.fig space.fig a c = b d + n beta $

	Applicando nuovamente la definizione di classe di equivalenza, si ha che
	$[a + c]_(n) = [b + d]_(n)$ e $[a c]_(n) = [b d]_(n)$. Per come sono state
	definite la somma ed il prodotto rispetto alle classi di equivalenza, si ha
	infine $[a]_(n) + [c]_(n) = [b]_(n) + [d]_(n)$ e $[a]_(n) [c]_(n) = [b]_(n)
	[d]_(n)$.
]

#theorem[
	La struttura algebrica $(bb(Z)_(n), +)$, formata dalla classe di resti
	modulo $n$ e dalla somma su questi definita, é un gruppo abeliano.
]
#proof[
	La struttura algebrica $(bb(Z)_(n), +)$ é:

	- un semigruppo, perché l'operazione $+$ cosí definita gode della proprietá
	  associativa. Questo é determinato dal fatto che l'usuale somma in $bb(Z)$
	  gode di tale proprietá:

	  $ ([a]_(n) + [b]_(n)) + [c]_(n) = & [a + b]_(n) + [c]_(n) =
	    [(a + b) + c]_(n) = [a + (b + c)]_(n) \ = & [a]_(n) + [b + c]_(n) =
	    [a]_(n) + ([b]_(n) + [c]_(n)) $

	- un monoide, perché per l'operazione $+$ cosí definita esiste l'elemento
	  neutro. Tale elemento é $[0]_(n)$, infatti preso un qualsiasi $[a]_(n)
	  in bb(Z)_(n)$:

	  $ [0]_(n) + [a]_(n) = [a]_(n) + [0]_(n) = [a + 0]_(n) = [0 + a]_(n) = [a]_(n) $

	- un gruppo, perché per l'operazione $+$ cosí definita esiste un elemento
	  opposto per qualsiasi elemento di $bb(Z)_(n)$. Preso un qualsiasi $[a]_(n)
	  in bb(Z)_(n)$, tale elemento opposto é $[n - a]_(n)$, in quanto:

	  $ [a]_(n) + [n - a]_(n) = [n - a]_(n) + [a]_(n) = [(n - a) + a]_(n) =
	    [a + (n - a)]_(n) = [n]_(n) = 0 $

	Inoltre, valendo per $+$ la proprietá commutativa, é un gruppo abeliano.
]

#theorem[
	La struttura algebrica $(bb(Z)_(n), dot.op)$, formata dalla classe di resti
	modulo $n$ e dal prodotto su questi definito, é un monoide abeliano.
]
#proof[
	La struttura algebrica $(bb(Z)_(n), dot.op)$ é:

	- un semigruppo, perché l'operazione $dot.op$ cosí definita gode della
	  proprietá associativa. Questo é determinato dal fatto che l'usuale
	  prodotto in $bb(Z)$ gode di tale proprietá:

	  $ ([a]_(n) dot.op [b]_(n)) dot.op [c]_(n) = & [a dot.op b]_(n) dot.op [c]_(n) =
	    [(a dot.op b) dot.op c]_(n) = [a dot.op (b dot.op c)]_(n) \ = & [a]_(n) dot.op
	    [b dot.op c]_(n) = [a]_(n) dot.op ([b]_(n) dot.op [c]_(n)) $

	- un monoide, perché per l'operazione $dot.op$ cosí definita esiste l'elemento
	  neutro. Tale elemento é $[1]_(n)$, infatti preso un qualsiasi $[a]_(n)
	  in bb(Z)_(n)$:

	  $ [1]_(n) dot.op [a]_(n) = [a]_(n) dot.op [1]_(n) = [a dot.op 1]_(n) = [1 dot.op a]_(n) = [a]_(n) $

	Inoltre, valendo per $dot.op$ la proprietá commutativa, é un monoide abeliano.
]
