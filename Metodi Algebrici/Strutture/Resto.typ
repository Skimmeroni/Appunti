#import "../Metodi_defs.typ": *

Il @Congruence-mod-is-equivalence stabilisce che la congruenza modulo
$n$ una relazione di equivalenza su $ZZ$. Pertanto, deve essere possibile
identificare delle classi di equivalenza per la congruenza modulo $n$.

Preso $n$ intero con $n > 0$ ed un certo $a in ZZ$, la classe di
equivalenza di $a$ rispetto alla congruenza modulo $n$ viene indicata
con $[a]_(n)$. Tale classe di equivalenza corrisponde all'insieme ${b:
b in ZZ and a equiv b mod n}$, ovvero all'insieme che contiene tutti i
numeri interi che, divisi per $n$, restituiscono lo stesso resto della
divisione fra $n$ e $a$.

#lemma[
	Sia $n$ un numero intero maggiore di $0$. Sia $a$ un numero intero
	qualsiasi e sia $b$ il resto della divisione di $a$ per $n$. Vale
	$[a]_(n) = [b]_(n)$.
] <Residue-class-and-itself>
#proof[
	Se $b$ é il resto della divisione di $a$ per $n$, allora vale
	$a = n k + b$ per un certo $k in ZZ$, da cui si ha $a - b = n k$,
	che é la definizione di congruenza modulo $n$.
]

Il @Residue-class-and-itself definisce una "forma standard" per
rappresentare le classi di equivalenza per la congruenza modulo
$n$.

Le classi di equivalenza indotte dalla congruenza modulo $n$ vengono
anche chiamate *classi di resto*. L'insieme quoziente di $ZZ$ rispetto
alla relazione di congruenza modulo $n$ con $n > 0$ si dice *insieme
delle classi di resti modulo* $n$ e si denota con $ZZ_(n)$.

#theorem[
	Per ogni numero intero $n > 0$, l'insieme delle classi di resti modulo
	$n$ distinte ha cardinalitá $n$. In particolare, tale insieme é:

	$ ZZ_(n) = {[0]_(n), [1]_(n), ..., [n − 1]_(n)} =
	  {{n k : k in ZZ},
	  {1 + n k : k in ZZ},
	  ...,
	  {n - 1 + n k : k in ZZ}} $
] <Distinct-residue-classes>
#proof[
	Sia $a in ZZ$. La divisione con resto fornisce $a = n q + r$ con
	$0 lt.eq r < n$. Poichè $a − r = q n$ si ha che $a equiv r mod n$.
	Ciò mostra che ogni intero $a$ è congruo, modulo $n$, a uno degli
	interi $0, 1, ..., n − 1$. D'altra parte se $i$ e $j$ sono interi,
	con $0 lt.eq i < n$ e $0 lt.eq j < n$ si ha, assumendo $i gt.eq j$,
	che $0 lt.eq i − j lt.eq n − 1$ e quindi $i − j = k n$ se e solo
	se $k = 0$, cioè $i = j$.
]

#example[
	#grid(
		columns: (0.5fr, 0.5fr),
		[
			Con $n = 2$, si ha $ZZ_(2) = {[0]_(2), [1]_(2)}$:

			$ [0]_(2)&= {..., −6, −4, −2, 0, 2, 4, 6, ...} \
			  [1]_(2)&= {..., −5, −3, −1, 1, 3, 5, 7, ...} $
		],
		[
		Con $n = 3$, si ha $ZZ_(3) = {[0]_(3), [1]_(3), [2]_(3)}$:

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

#lemma[
	Sia $[a]_(n)$ con $n in NN$ una classe di resto. Se vale $[a]_(n) =
	[0]_(n)$, allora $n | a$.
] <Class-as-divisibility>
#proof[
	Per la definizione di classe di resto, l'espressione $[a]_(n) = [0]_(n)$
	equivale a dire che la divisione fra $a$ e $n$ ha lo stesso resto della
	divisione fra $0$ ed $n$. Dato che la divisione fra $0$ ed un qualsiasi
	numero (intero) ha quoziente $0$ e resto $0$, si ha che la divisione fra
	$a$ e $n$ ha resto $0$, ovvero che $n | a$.
]

Sull'insieme delle classi di resto modulo $n$ é possibile definire le
operazioni di somma e di prodotto. Siano $[a]_(n)$ e $[b]_(n)$ due classi
di resto modulo $n$. La somma ed il prodotto sono definiti come:

$ [a]_(n) + [b]_(n) = [a + b]_(n) space space space
  [a]_(n) dot [b]_(n) = [a b]_(n) $

#example[
	in $ZZ_(5)$, si ha $[1]_(5) + [3]_(5) = [3 + 1]_(5) = [4]_(5)$ e
	$[2]_(5) dot [3]_(5) = [2 dot 3]_(5) = [6]_(5)$
]

#lemma[
	Sia $n in ZZ$ con $n > 0$. Siano poi $a, b, c, d in ZZ$,
	tali per cui $[a]_(n) = [b]_(n)$ e $[c]_(n) = [d]_(n)$. Allora vale:

	$ [a]_(n) + [c]_(n) = [b]_(n) + [d]_(n) space space space
	  [a]_(n) dot [c]_(n) = [b]_(n) dot [d]_(n) $
]
#proof[
	Poichè $[a]_(n) = [b]_(n)$ e $[c]_(n) = [d]_(n)$ si ha, per definizione
	di classe di equivalenza, $a = b + n k$ e $c = d + n h$ per $k, h in
	ZZ$. Sommando e moltiplicando l'una all'altra, si ha:

	#set math.mat(delim: none)
	$ mat(
	  a + c = b + n k + d + n h =>
	  a + c = (b + d) + n(h + k);
	  a dot c = (b + n k) dot (d + n h) =>
	  a c = b d + b n h + n k d + n^(2) k h =>
	  a c = b d + n(b h + d k + n k h)
	) $

	Essendo $ZZ$ chiuso rispetto alla somma e al prodotto, si ha
	$k + h in ZZ$ e $b h + d k + k h n in ZZ$, siano questi
	rispettivamente $alpha$ e $beta$. Si ha:

	$ (a + c) = (b + d) + n alpha space space space a c = b d + n beta $

	Applicando nuovamente la definizione di classe di equivalenza, si ha
	che $[a + c]_(n) = [b + d]_(n)$ e $[a c]_(n) = [b d]_(n)$. Per come
	sono state definite la somma ed il prodotto rispetto alle classi di
	equivalenza, si ha infine $[a]_(n) + [c]_(n) = [b]_(n) + [d]_(n)$ e
	$[a]_(n) [c]_(n) = [b]_(n) [d]_(n)$.
]

#theorem[
	La struttura algebrica $(ZZ_(n), +)$, formata dalle classi di resto
	modulo $n$ e dalla somma su queste definita, é un gruppo abeliano.
] <Residue-classes-sum-group>
#proof[
	La struttura algebrica $(ZZ_(n), +)$ é:

	- un semigruppo, perché l'operazione $+$ cosí definita gode della
	  proprietá associativa. Questo é determinato dal fatto che l'usuale
	  somma in $ZZ$ gode di tale proprietá:

	  $ ([a]_(n) + [b]_(n)) + [c]_(n) = & [a + b]_(n) + [c]_(n) =
	    [(a + b) + c]_(n) = [a + (b + c)]_(n) \ = & [a]_(n) + [b + c]_(n) =
	    [a]_(n) + ([b]_(n) + [c]_(n)) $

	- un monoide, perché per l'operazione $+$ cosí definita esiste l'elemento
	  neutro. Tale elemento é $[0]_(n)$, infatti preso un qualsiasi $[a]_(n)
	  in ZZ_(n)$:

	  $ [0]_(n) + [a]_(n) = [a]_(n) + [0]_(n) = [a + 0]_(n) = [0 + a]_(n) =
	    [a]_(n) $

	- un gruppo, perché per l'operazione $+$ cosí definita esiste un elemento
	  inverso per qualsiasi elemento di $ZZ_(n)$. Preso un qualsiasi $[a]_(n)
	  in ZZ_(n)$, tale elemento inverso é $[n - a]_(n)$, in quanto:

	  $ [a]_(n) + [n - a]_(n) = [n - a]_(n) + [a]_(n) = [(n - a) + a]_(n) =
	    [a + (n - a)]_(n) = [n]_(n) = 0 $

	Inoltre, $+$ gode della proprietá commutativa. Infatti:

	$ [a]_(n) + [b]_(n) = [a + b]_(n) = [b + a]_(n) = [b]_(n) + [a]_(n) $

	Pertanto, $(ZZ_(n), +)$ é un gruppo abeliano.
]

#theorem[
	La struttura algebrica $(ZZ_(n), dot)$, formata dalle classi di resto
	modulo $n$ e dal prodotto su queste definito, é un monoide abeliano.
] <Residue-classes-product-monoid>
#proof[
	La struttura algebrica $(ZZ_(n), dot)$ é:

	- un semigruppo, perché l'operazione $dot$ cosí definita gode della
	  proprietá associativa. Questo é determinato dal fatto che l'usuale
	  prodotto in $ZZ$ gode di tale proprietá:

	  $ ([a]_(n) dot [b]_(n)) dot [c]_(n) = & [a dot b]_(n) dot [c]_(n) =
	    [(a dot b) dot c]_(n) = [a dot (b dot c)]_(n) \ = & [a]_(n) dot
	    [b dot c]_(n) = [a]_(n) dot ([b]_(n) dot [c]_(n)) $

	- un monoide, perché per l'operazione $dot$ cosí definita esiste
	  l'elemento neutro. Tale elemento é $[1]_(n)$, infatti preso un
	  qualsiasi $[a]_(n) in ZZ_(n)$:

	  $ [1]_(n) dot [a]_(n) = [a]_(n) dot [1]_(n) = [a dot 1]_(n) =
	    [1 dot a]_(n) = [a]_(n) $

	Inoltre, $dot$ gode della proprietá commutativa. Infatti:

	$ [a]_(n) dot [b]_(n) = [a dot b]_(n) = [b dot a]_(n) =
	  [b]_(n) dot [a]_(n) $

	Pertanto, $(ZZ_(n), dot)$ é un monoide abeliano.
]

Il @Residue-classes-sum-group ed il @Residue-classes-product-monoid
suggeriscono che per qualsiasi classe di resto in $ZZ_(n)$ esista
un inverso per la somma, ma non per tutte esiste un inverso per
il prodotto.

#lemma[
	Siano $a, n$ due numeri interi, dove $n > 1$. La classe di resto
	$[a]_(n)$ ammette inverso in $ZZ_(n)$ rispetto al prodotto se e
	soltanto se $a$ ed $n$ sono coprimi, ovvero se $"MCD"(a, n) = 1$.
]
#proof[
	Se la classe di resto $[a]_(n)$ è invertibile, allora esiste $[b]_(n)
	in ZZ_(n)$ tale per cui $[a]_(n) [b]_(n) = [1]_(n)$, ovvero $[a b]_(n)
	= [1]_(n)$. Per come la somma sulle classi di resto é stata definita,
	é possibile sommare $[-1]_(n)$ ad entrambi i membri, ottenendo $[a b]_(n)
	+ [-1]_(n) = [1]_(n) + [-1]_(n)$, da cui si ricava $[a b - 1]_(n) =
	[0]_(n)$. Per il @Class-as-divisibility, si ha $n | a b - 1$. Deve allora
	esistere un $k in ZZ$ tale per cui $a b - 1 = n k$, ovvero $a b - n k =
	1$. Dato che sia $b$ sia $k$ sono certamente esistenti, é possibile
	applicare il @Coprime-as-Bézout per provare che $a$ ed $n$ sono coprimi.

	Viceversa, si assuma che $a$ ed $n$ siano coprimi. Per l'identitá di
	Bézout esistono $s, t in ZZ$ tali per cui $a s + n t = 1$, ovvero
	$a s = 1 - n t$. Questo equivale a dire che $a s equiv 1 mod n$,
	ovvero che $[a s]_(n) = [a]_(n) [s]_(n) = [1]_(n)$. Si ha quindi
	che per $[a]_(n)$ esiste l'invertibile.
]

#example[
	In $ZZ_(51)$ l'elemento $[13]_(51)$ è invertibile perchè
	$"MCD"(13, 51) = 1$. D'altro canto, $[15]_(51)$ non lo é,
	perché $"MCD"(15, 51) = 3$.
]

#lemma[
	Il numero di classi di resto in $ZZ_(n)$ (con $n > 0$ numero intero)
	che ammettono inverso rispetto al prodotto é pari a $phi(n)$.
]

#theorem[
	La struttura algebrica $(ZZ_(n) - {[0]_(n)}, dot)$, formata dalle
	classi di resto modulo $n$ esclusa $[0]_(n)$ e dal prodotto su queste
	definito, é un gruppo abeliano se e soltanto se $n$ é un numero primo.
	In altre parole, le classi di resto modulo $n$ (tranne $[0]_(n)$)
	ammettono sempre inversa solamente se $n$ é un numero primo.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Sia $[a]_(n)$ una classe di resto invertibile, e si supponga di
volerne trovarne l'inverso $[a]^(-1)_(n)$. É sufficiente osservare
come l'espressione $[a]_(n) [a]^(-1)_(n) = [1]_(n)$ equivalga a $a
dot a^(-1) equiv 1 mod n$. Pertanto, occorre risolvere tale congruenza
lineare con $a^(-1)$ come incognita e sceglierne una soluzione qualsiasi,
essendo tutte equivalenti.

#example[
	In $ZZ_(9)$, la classe di resto $[7]_(9)$ é invertibile, in quanto
	$"MCD"(7, 9) = 1$. L'inverso é ricavato dal risolvere la congruenza
	lineare $7 x equiv 1 mod 9$, che ha come soluzione $4 + 9 k$ con $k in
	ZZ$. Pertanto, l'inverso di $[7]_(9)$ é $[4]_(9)$.
]
