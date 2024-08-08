#import "../Metodi_defs.typ": *

Viene detta *congruenza lineare modulo* $n$ qualunque espressione nella forma:

$ a x equiv b mod n "   con " a, b, n in bb(Z) $

Dove $a$, $b$ ed $n$ sono termini noti ed $x$ é una incognita. Naturalmente,
le _soluzioni_ di una congruenza lineare sono tutti e soli quei $c in bb(Z)$
tali che, sostituiti ad $x$, rendono valida l'espressione. Se esiste almeno
un $c$ con queste caratteristiche, si dice che la congruenza lineare _ammette_
soluzione.

#example[
	Si consideri la congruenza lineare $2 x equiv 3 mod 7$. Una possibile soluzione
	per tale congruenza é $c = 5$, dato che $2 dot.op 5 = 10$ ed effettivamente
	$10 equiv 3 mod 7$. Anche $c = 26$ é una possibile soluzione, dato che $2 dot.op
	26 = 52 equiv 3 mod 7$.
] <Congruence>

#theorem[
	Siano $a$, $b$, $n in bb(Z)$, con $a != 0$. La congruenza lineare $a x equiv b
	mod n$ ammette soluzione se e soltanto se $"MCD"(a, n) | b$.
] <Congruence-solutions-exist>
#proof[
	Da definizione di congruenza modulo $n$, si ha che $a x equiv b mod n$ equivale
	a $n | a x - b$, che a sua volta equivale a $a x - b = n k$ per un certo $k in
	bb(Z)$. Spostando $b$ al secondo membro, si ha $a x - n k = b$; dato che tutti
	i numeri che figurano in questa equazione sono numeri interi, si sta avendo a
	che fare con una equazione diofantea, nello specifico nelle variabili $x$ e $k$.
	Per il @Diophantine-solutions-exist, l'equazione ha soluzione se e soltanto se
	$"MCD"(a, n) | b$, ma dato che tale equazione é solamente una riscrittura di
	$a x equiv b mod n$, allora anche quest'ultima avrá soluzione se e solo se sono
	rispettate tali condizioni.
]

#example[
	- La congruenza lineare dell'@Congruence ha soluzioni, perché
	  $"MCD"(a, n) = 1$ ed é vero che $1 | 3$;
	- La congruenza lineare $2 x equiv 3 mod 4$ non ha soluzioni, perché
	  $"MCD"(a, n) = 2$ ed é falso che $2 | 3$.
]

Il @Congruence-solutions-exist fornisce implicitamente un approccio
per cercare una soluzione particolare di una congruenza lineare,
ovvero costruendo una equazione diofantea a questa equivalente e
risolvendola. La soluzione particolare é data dalla componente $x$
della soluzione particolare di tale equazione.

#example[
	Si consideri la congruenza lineare $21 x equiv 6 mod 30$. L'equazione
	diofantea associata é $21 x - 30 k = 6$. Si ha:

	#set math.mat(delim: none)
	$
		mat(
			30 & = 21 dot.op 1 + 9;
			21 & = 9 dot.op 2 + 3;
			9 & = 3 dot.op 3 + 0;
		)
		space.fig space.fig space.fig
		mat(
			b & = a dot.op 1 + 9 => 9 = b - a;
			a & = 2 (b - a) + 3 => 3 = 3 a - 2 b;
		)
		space.fig space.fig space.fig
		(6) 21 - (4) 30 = 6
	$

	Da cui si ricava la soluzione particolare $c = 6$ per la congruenza lineare.
] <Example-congruence-solution>

#theorem[
	Siano $a$, $b$, $n in bb(Z)$, con $a != 0$. Si consideri la congruenza
	lineare $a x equiv b mod n$: se $x_(0) in bb(Z)$ ne é una soluzione,
	allora lo sono anche tutti ed i soli numeri interi $x_(h)$ nella forma:

	$ x_(h) = x_(0) + h (frac(n, "MCD"(a, n))) "   con" h in bb(Z) $

	In particolare, fra queste ne esistono esattamente $"MCD"(a, n)$
	non congruenti modulo $n$ fra di loro.
]
#proof[
	Per il @Congruence-solutions-exist, $a x equiv b mod n$ ha soluzione se
	e soltanto se ha soluzione l'equazione diofantea equivalente $a x - n k
	= b$ con $k in bb(Z)$. Per il @Diophantine-all-solutions si ha che se
	$(x_(0), k_(0)) in bb(Z) times bb(Z)$ é una soluzione particolare di
	tale equazione, allora lo sono tutte e sole le coppie $(x_(h), k_(h))
	in bb(Z) times bb(Z)$ nella forma:

	$ x_(h) = x_(0) + h (frac(n, "MCD"(a, n))) space.fig space.fig space.fig
	  k_(h) = k_(0) - h (frac(n, "MCD"(a, n)))
	  "   con" h in bb(Z) $

	L'espressione per $x_(h)$ é quella cercata. Per provare che la congruenza
	lineare ha esattamente $"MCD"(a, n)$ soluzioni non congruenti modulo $n$
	fra di loro, si consideri $h_(1), h_(2) in bb(Z)$. Si ha:

	$ x_(0) + h_(1) (frac(n, "MCD"(a, n))) equiv x_(0) + h_(2) (frac(n, "MCD"(a, n))) mod n <==>
	  (frac(n, "MCD"(a, n))) (h_(1) - h_(2)) equiv 0 mod n $

	Deve allora esistere un certo $q in bb(Z)$ tale per cui:

	$ (frac(n, "MCD"(a, n))) (h_(1) - h_(2)) equiv 0 mod n =>
	  (frac(cancel(n), "MCD"(a, n))) (h_(1) - h_(2)) = q cancel(n) =>
	  h_(1) - h_(2) = q "MCD"(a, n) $

	Pertanto, le $"MCD"(a, n)$ soluzioni non congruenti modulo $n$ fra di loro
	che si stavano cercando sono tutte e sole le soluzioni con $h = 0, 1, ...,
	("MCD"(a, n) - 1)$.
]

#example[
	La congruenza lineare dell'@Example-congruence-solution, che aveva
	per soluzione particolare $c = 5$. Avendosi $"MCD"(21, 30) = 3$, si
	ha $frac(30, 3) = 10$. Pertanto, tale congruenza lineare ha per
	soluzioni ogni intero nella forma $6 + 10 h$ con $h in bb(Z)$. In
	particolare, le soluzioni non congruenti modulo $n$ fra di loro sono
	$c = 6$, $c = 16$ e $c = 26$.
]

Sia $[a]_(n)$ una classe di resto invertibile, e si supponga di volerne
trovarne l'inverso $[a]^(-1)_(n)$. É sufficiente osservare come l'espressione
$[a]_(n) [a]^(-1)_(n) = [1]_(n)$ equivalga a $a dot.op a^(-1) equiv 1 mod n$.
Pertanto, occorre risolvere tale congruenza lineare con $a^(-1)$ come incognita
e sceglierne una soluzione qualsiasi, essendo tutte equivalenti. Per convenzione,
si preferisce scegliere la soluzione piú piccola.

#example[
	In $bb(Z)_(9)$, la classe di resto $[7]_(9)$ é invertibile, in quanto
	$"MCD"(7, 9) = 1$. L'inverso é ricavato dal risolvere la congruenza
	lineare $7 x equiv 1 mod 9$, che ha come soluzione $4 + 9 k$ con $k in
	bb(Z)$. Pertanto, l'inverso di $[7]_(9)$ é $[4]_(9)$.
]

Viene detto *sistema di congruenze lineari* qualunque espressione nella forma:

$
	A_(i) x equiv B_(i) mod N_(i) =
	cases(
		a_(1) x equiv b_(1) & mod n_(1),
		a_(2) x equiv b_(2) & mod n_(2),
		dots.v,
		a_(m) x equiv b_(m) & mod n_(m)
	) " con " a_(1), ..., a_(m), b_(1), ..., b_(m), n_(1), ..., n_(m) in bb(Z)
$

Dove $a_(1), ..., a_(m)$, $b_(1), ..., b_(m)$ e $n_(1), ..., n_(m)$
sono termini noti ed $x$ é una incognita. Le _soluzioni_ di un sistema
di congruenze lineari sono tutti e soli quei $c in bb(Z)$ tali che,
sostituiti ad $x$, verificano contemporaneamente tutte le $m$ congruenze
lineari modulo $n_(i)$ che lo compongono. Se esiste almeno un $c$ con
queste caratteristiche, si dice che il sistema di congruenze lineari
_ammette_ soluzione.

#lemma("Condizione necessaria per la solubilitá di un sistema di congruenze lineari")[
	Un sistema di congruenze lineari $A_(i) x equiv B_(i) mod N_(i)$ ha soluzione
	soltanto se, per ogni $i = 1, ..., m$, si ha $"MCD"(a_(i), n_(i)) | b_(i)$.
] <System-sufficient-condition>
#proof[
	Per il @Congruence-solutions-exist, si ha che $a x equiv b mod n$ ha soluzione
	se e soltanto se $"MCD"(a, n) | b$. Dato che un sistema di congruenze lineari
	ha soluzione soltanto se tutte le congruenze che lo compongono hanno soluzione,
	tale sistema avrá soluzione soltanto se $"MCD"(a_(i), n_(i)) | b_(i)$ é valido
	per ogni $i = 1, ..., m$.
]

Si noti come il @System-sufficient-condition sia una implicazione a senso unico,
ovvero potrebbero esistere dei sistemi di congruenze lineari che lo verificano
ma che comunque non hanno soluzione. Infatti, le congruenze lineari che costituiscono
un sistema potrebbero essere solubili individualmente, ma nessuna di queste avere una
soluzione che sia comune a tutte.

#theorem("Teorema Cinese del Resto")[
	Si consideri un sistema di congruenze lineari come quello presentato di seguito:

	$
		cases(
			x equiv b_(1) & mod n_(1),
			dots.v,
			x equiv b_(2) & mod n_(2),
			x equiv b_(m) & mod n_(m)
		) " con " b_(1), ..., b_(m), n_(1), ..., n_(m) in bb(Z)
	$

	Ovvero, dove i termini $a_(1), ..., a_(m)$ sono tutti pari ad 1. Si assuma
	inoltre che i termini $n_(1), ..., n_(m)$ siano tutti positivi e che siano
	a due a due coprimi, ovvero $"MCD"(n_(i), n_(j)) = 1$ per ogni $1 lt.eq i
	lt.eq m$ e $1 lt.eq j lt.eq m$ tali per cui $i != j$.

	Allora il sistema é risolubile. In particolare, se $c$ e $c'$ sono due
	soluzioni, allora vale:

	$ c equiv c' mod N " dove " N = n_(1) dot.op n_(2) dot.op ... dot.op n_(m) =
	  product_(i = 1)^(m) n_(i) $
] <Chinese-remainder-theorem>
#proof[
	Per ogni $i = 1, ..., m$, sia $N_(i) = frac(N, n_(i))$ (essendo $N =
	product_(i = 1)^(m) n_(i)$ é garantito che $N_(i)$ sia un numero intero,
	perché $n_(i)$ é uno dei fattori di $N$). Per ipotesi, si ha $"MCD"(n_(i),
	n_(j)) = 1$ per $i != j$. Tuttavia, é facile verificare che anche $"MCD"(N_(i),
	n_(i)) = 1$.

	Infatti, si supponga per assurdo che $"MCD"(N_(i), n_(i)) != 1$. Deve allora
	esistere un numero primo $p$ tale per cui $p | n_(i)$ e $p | N_(i)$, ovvero
	che é divisore sia di $n_(i)$ che di $N_(i)$. Essendo $N_(i) = n_(1) dot.op
	... dot.op n_(i - 1) dot.op n_(i + 1) dot.op ... dot.op n_(m)$, per il
	@Euclid-lemma deve esistere un $n_(j)$ con $j != i$ tale per cui $p | n_(j)$.
	Ma allora, valendo sia $p | n_(i)$ sia $p | n_(j)$, si ha che $n_(i)$ ed $n_(j)$
	hanno un divisore in comune, e quindi non sono primi, contro l'ipotesi che invece
	lo siano. Occorre allora assumere che $"MCD"(N_(i), n_(i)) = 1$.

	Si consideri la congruenza lineare $N_(i) y equiv 1 mod n_(i)$ nell'incognita
	$y$, che ha $y_(i)$ per soluzione. Per il @Congruence-solutions-exist, tale
	congruenza lineare ha soluzione se vale $"MCD"(N_(i), n_(i)) | 1$, ed é stato
	appena mostrato che $"MCD"(N_(i), n_(i)) = 1$, pertanto é garantito che $y_(i)$
	esista. Sia $c$ definito come:

	$ c = sum_(i = 1)^(m) N_(i) y_(i) b_(i) =
	  N_(1) y_(1) b_(1) + ... + N_(m) y_(m) b_(m) $

	// Da rivedere gli ultimi due paragrafi, mi sembrano un po' a caso.

	É possibile verificare che $c$ é una soluzione del sistema, ovvero che $c equiv
	b_(j) mod n_(j)$ per $j != i$. Valendo $n_(j) | N_(i)$ per qualsiasi $j != i$, é
	possibile scrivere $N_(i) equiv 0 mod n_(j)$, e quindi $c equiv N_(j) y_(j) b_(j)
	mod n_(j)$. Avendo trovato che vale $N_(j) n_(j) equiv 1 mod n_(j)$, moltiplicando
	ambo i membri per $b_(j)$ si ha $N_(j) n_(j) b_(j) equiv b_(j) mod n_(j)$ (questo
	é legittimo perché $N_(j) n_(j)$ e $1$ sono primi fra di loro, esiste un lemma
	che lo prova).

	Avendosi la soluzione $c$, sia $c'$ un'altra soluzione del sistema. Allora deve
	valere $c equiv c' mod n_(i)$, ovvero $n_(i) | c − c'$ per ogni i = $1, ..., m$.
	Poichè gli $n_(i)$ sono a due a due coprimi, segue che anche $N$ é divisore di
	$c − c'$, ovvero $c equiv c' mod N$. Questo dimostra che $c$ è l'unica soluzione
	del sistema modulo $N$, a meno di multipli di $N$.
]

#example[
	Si consideri il seguente sistema di congruenze lineari, e lo si risolva:

	$ cases(x equiv 2 mod 3, x equiv 3 mod 5, x equiv 2 mod 7) $

	Tale sistema rispetta le ipotesi del @Chinese-remainder-theorem, dato che
	tutti i termini noti a sinistra dell'equivalenza sono pari ad $1$, i termini
	noti a destra sono tutti positivi e sono tutti coprimi fra di loro a due a
	due.

	Si ha allora $N = 3 dot.op 5 dot.op 7 = 105$. Per ciascuna congruenza lineare
	del sistema si calcoli $N_(i) = frac(N, n_(i))$:

	$ N_(1) = frac(N, n_(1)) = frac(105, 3) = 35 space.fig space.fig space.fig
	  N_(2) = frac(N, n_(2)) = frac(105, 5) = 21 space.fig space.fig space.fig
	  N_(3) = frac(N, n_(3)) = frac(105, 7) = 15 $

	Da cui si ottengono le congruenze lineari:

	#set math.mat(delim: none)
	$ mat(
		N_(1) y equiv 1 mod n_(1) & => 35 y equiv 1 mod 3 & => 2 y equiv 1 mod 3 & => y_(1) = 2;
		N_(2) y equiv 1 mod n_(2) & => 21 y equiv 1 mod 5 & =>   y equiv 1 mod 5 & => y_(2) = 1;
		N_(3) y equiv 1 mod n_(3) & => 15 y equiv 1 mod 7 & =>   y equiv 1 mod 7 & => y_(3) = 1
	) $

	La soluzione del sistema é allora data da:

	$ c = sum_(i = 1)^(3) N_(i) y_(i) b_(i) =
	  35 dot.op 2 dot.op 2 + 21 dot.op 1 dot.op 3 + 15 dot.op 1 dot.op 2 = 233 $

	E da tutti gli interi a questo congruenti modulo $N$.
]
