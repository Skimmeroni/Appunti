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

/*
Nel caso in cui i termini noti di una congruenza lineare abbiano dei
fattori comuni, é possibile semplificarla per rendere piú semplice la
determinazione della soluzione.

#lemma[
	Siano $a$, $b$, $c$, $d in bb(Z)$ con $c != 0$, e si
	supponga che valga $a c equiv b c mod d$. Allora $a
	equiv b mod frac(d, "MCD"(c, d))$.
] <Cancel>
#proof[
	Siano $c = overline(c) "MCD"(c, d)$ e $d = overline(d)
	"MCD"(c, d)$. Per definizione, $a c equiv b c mod d$
	equivale a dire $d | a c - b c$, ovvero esiste un certo
	$k$ tale per cui $a c - b c = d k$. Sostituendo le espressioni
	per $c$ e $d$, si ha:

	$ a c - b c = d k => c (a - b) = d k => cancel("MCD"(c, d)) (a - b)
	overline(c) = cancel("MCD"(c, d)) overline(d) k => (a - b) overline(c)
	= overline(d) k $
]

Nel caso in cui i termini noti siano coprimi, questo é ancora piú semplice.

#corollary[
	Siano $a$, $b$, $c$, $d in bb(Z)$, con $c != 0$ e $c$
	e $d$ primi fra di loro, e si supponga che valga
	$a c equiv b c mod d$. Allora $a equiv b mod d$.
]
#proof[
	Per il @Cancel si ha che, se vale $a c equiv b c mod d$, allora $a equiv
	b mod frac(d, "MCD"(c, d))$. Essendo $c$ ed $d$ primi fra di loro, si ha
	$"MCD"(c, d) = 1$. Allora $a equiv b mod frac(n, "MCD"(c, d))$ si riduce
	a $a equiv b mod frac(d, 1)$, ovvero $a equiv b mod d$.
]
*/
