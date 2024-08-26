#import "../Metodi_defs.typ": *

Sia dato un certo campo $K$. Prende il nome di *polinomio* a coefficienti
in $K$ e incognita in $x$ qualunque espressione nella forma:

$ p(x) = sum_(i = 0)^(n) a_(i) x^(i) =
  a_(n) x^(n) + a_(n − 1) x^(n − 1) + ... + a_(1) x + a_(0)
  space "con" space n in NN, a_(i) in K space forall i in {0, ..., n} $

Dove l'intero non negativo $n$ si dice *grado* di $p(x)$ e lo si indica
con $diff (p(x))$. Al polinomio $p(x) = 0$, anche detto *polinomio nullo*,
si attribusce grado $−1$. Il coefficiente $a_(n)$ si dice *coefficiente
direttore* di $p(x)$. Se $a_(n) = 1$, si dice che $p(x)$ è *monico*.

Sui polinomi é possibile definire delle operazioni di somma e di prodotto.
Siano $p(x) = sum_(i = 0)^(n) a_(i) x^(i)$ e $q(x) = sum_(i = 0)^(n) b_(i)
x^(i)$ due polinomi a coefficienti in un campo $K$, di grado rispettivamente
$n$ e $m$. Si assuma, senza perdita di generalitá, che $n gt.eq m$. La somma
fra $p(x)$ e $q(x)$ viene definita come:

$ p(x) + q(x) = (a_(n) x^(n) + ... + a_(1) x + a_(0)) +
  (b_(m) x^(m) + ... + b_(1) x + b_(0)) =
  sum_(i = m + 1)^(n) a_(i) x^(i) +
  sum_(i = 0)^(m) (a_(i) + b_(i)) x^(i) $

Mentre il prodotto come:

$ p(x) q(x) = (a_(n) x^(n) + ... + a_(1) x + a_(0))
  (b_(m) x^(m) + ... + b_(1) x + b_(0)) =
  sum_(i = 0)^(n) sum_(j = 0)^(m) a_(i) b_(j) x^(i + j) $

#lemma[
	Siano $p(x)$ e $q(x)$ due polinomi non nulli. Valgono le seguenti
	proprietá:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ diff(p(x) + q(x)) lt.eq max{diff(p(x)), diff(q(x))} $],
		[$ diff(p(x) q(x)) lt.eq diff(p(x)) + diff(q(x)) $]
	)
]
#proof[
	Segue direttamente dal modo in cui somma e prodotto fra polinomi
	sono state definite.
]

La struttura algebrica $(K, +, dot)$, che ha per sostegno l'insieme di tutti
i polinomi a coefficienti in $K$ e incognita in $x$ e per operazioni la somma
fra polinomi ed il prodotto fra polinomi cosí definite si indica con $K[x]$.

#lemma[
	La struttura algebrica $K[x]$ é un anello commutativo. L'elemento neutro
	per la somma fra polinomi é il polinomio $p(x) = 0$, mentre l'elemento
	neutro per il prodotto fra polinomi é $p(x) = 1$.
]

Per l'anello $K[x]$ é possibile sviluppare una teoria parallela a quella
dell'anello $ZZ$.

#theorem("Algoritmo della divisione per polinomi")[
	Siano $a(x), b(x) in K[x]$, con $b(x)$ non nullo. Esiste una ed
	una sola coppia di polinomi $q(x), r(x) in K[x]$ tali che:

	+ $a(x) = b(x) q(x) + r(x)$
	+ $diff (r(x)) < diff (b(x))$
] <Division-of-polynomials>
// #proof[
// Dimostrabile, da aggiungere
// ]

Dati $a(x), b(x) in K[x]$, i due polinomi $q(x), r(x) in K[x]$ che figurano
nel @Division-of-polynomials sono chiamati rispettivamente *quoziente* e
*resto* della divisione fra $a(x)$ e $b(x)$. Se $r(x) = 0$, si dice che
$b(x)$ _divide_ $a(x)$, e si indica con $b(x) | a(x)$; se invece $b(x)$
non divide $a(x)$, si indica con $b(x) divides.not a(x)$.

Il @Division-of-polynomials fornisce implicitamente un algoritmo che permette
di calcolare la divisione fra due polinomi.

#example[
	Siano $a(x) = x^(3) −2x^(2) +x −1$ e $b(x) = 2x^(2) -5$ polinomi sull'anello
	$QQ[x]$. Si ha:

	#set math.mat(delim: none)
	$
		mat(
			x^(3),  −2x^(2), +x,           −1,    2x^(2),      −5;
			-x^(3), space,   +frac(5, 2)x, space, space,       space;
			space,  -2x^(2), +frac(7, 2)x, -1,    space,       space;
			space,  2x^(2),  space,        -5,    space,       space;
			space,  space,   +frac(7, 2)x, -6,    frac(1, 2)x, -1;
			augment: #(vline: 4, hline: (2, 4))
		)
		space space space space space space
		p(x) = (frac(1, 2)x - 1)
		space space space space space space
		q(x) = (frac(7, 2)x - 6)
	$

	Siano $a(x) = [2]_(7)x^(4) + [-1]_(7)x^(2) +[1]_(7)$ e
	$b(x) = [3]_(7)x^(3) + [-2]_(7)$ polinomi sull'anello
	$ZZ_(7)[x]$. Si ha:

	#set math.mat(delim: none)
	$
		mat(
			[2]_(7)x^(4), +[−1]_(7)x^(2), space, +[1]_(7),    [3]_(7)x^(3), +[−2]_(7);
			[-2]_(7)x^(4), space,  +[6]_(7)x,   space, space,  space;
			space,   [-1]_(7)x^(2), +[6]_(7)x,   +[1]_(7),    [3]_(7)x,     space;
			augment: #(vline: 4, hline: 2)
		)
		space space space space space space
		p(x) = [3]_(7)x
		space space space space space space
		q(x) = [-1]_(7)x^(2) + [6]_(7)x + [1]_(7)
	$
]

Siano $a(x)$ e $b(x)$ due polinomi non nulli in $K[x]$. Si dice *massimo comun
divisore* tra $a(x)$ e $b(x)$ ogni polinomio $d(x)$ in $K[x]$ tale che:

+ $d(x) | a(x)$ e $d(x) | b(x)$;
+ Se $c(x) in K[x]$ tale per cui $c(x) | a(x)$ e
  $c(x) | b(x)$, allora $c(x) | d(x)$.

#theorem("Esistenza di un massimo comun divisore per i polinomi")[
	Per qualsiasi $a(x), b(x) in K[x]$ esiste sempre un massimo
	comun divisore $d(x)$ fra $a(x)$ e $b(x)$. Esistono inoltre
	due polinomi $f(x), g(x) in K[x]$ tali per cui:

	$ a(x) f(x) + b(x) g(x) = d(x) $

	Che non é altro che l'identitá di Bézout rispetto ai polinomi.
] <MCD-polynomials-exists>
// #proof[
// Dimostrabile, da aggiungere
// ]

#lemma[
	Siano $a(x)$ e $b(x)$ due polinomi su $K[x]$, e sia $d(x)$ un massimo
	comun divisore fra $a(x)$ e $b(x)$. Allora $tilde(d)(x)$ è un massimo
	comun divisore tra $a(x)$ e $b(x)$ se e soltanto se $tilde(d)(x) = k
	d(x)$ con $k in K - {0_(K)}$. In altre parole, il massimo comun divisore
	tra due polinomi è univocame determinato a meno di una costante
	moltiplicativa non nulla.
] <MCD-polynomials>
// #proof[
// Dimostrabile, da aggiungere
// ]

#corollary[
	Dati due polinomi $a(x)$ e $b(x)$ su $K[x]$, esiste uno ed un
	solo polinomio monico $d(x)$ che sia massimo comun divisore
	tra $a(x)$ e $b(x)$.
]
#proof[
	Se per il @MCD-polynomials i massimi comuni divisori fra due
	polinomi sono determinati a meno di una costante, allora esiste
	un solo polinomio che abbia $1$ come coefficiente direttore,
	ovvero un solo polinomio monico.
]

Per comoditá, con $"MCD"(a(x), b(x))$ si indica il massimo comun
divisore fra i polinomi $a(x)$ e $b(x)$ su $K[x]$ che ha $1$ come
coefficiente direttore. In particolare, se il grado del massimo
comun divisore è zero, allora tale massimo comun divisore è 1.
In questo caso, i polinomi $a(x)$ e $b(x)$ si dicono *coprimi* o
*primi fra di loro*.

#example[
	#set math.mat(delim: none)

	Siano $a(x) = x^(3) + 1$ e $b(x) = x^(2) + 1$
	polinomi sull'anello $QQ[x]$. Si ha:

	$
		mat(
			x^(3),  space, +1,    x^(2), +1;
			-x^(3), -x,    space, space, space;
			space,  -x,    +1,    x,     space;
			augment: #(vline: 3, hline: 2)
		)
		space space space space space
		mat(
			x^(2),  space, +1,    -x,    +1;
			-x^(2), +x,    space, space, space;
			space,  x,     +1,    space, space;
			space,  -x,    +1,    space, space;
			space,  space, 2,     -x,    -1;
			augment: #(vline: 3, hline: (2, 4))
		)
		space space space space space
		mat(
			a(x) &= b(x)(x) + (-x + 1);
			b(x) &= (-x + 1)(-x - 1) + 2
		)
	$

	Un massimo comun divisore fra $a(x)$ e $b(x)$ é $d(x) = 2$,
	pertanto $"MCD"(a(x), b(x)) = frac(d(x), 2) = 1$. É poi
	possibile costruire l'identitá di Bézout come:

	$
		a(x) =& b(x)(x) + (-x + 1) => (-x + 1) = a(x) - b(x)(x) \
		b(x) =& (-x + 1)(-x - 1) + 2 => b(x) - [a(x) - b(x)(x)](-x - 1) = 2 => \
		      & b(x) + a(x)x + a(x) - b(x)(x^(2)) - b(x)(x) = 2 => \
		      & a(x)(x + 1) + b(x)(- x^(2) - x + 1) = 2 => \
		      & frac(a(x)(x + 1) + b(x)(- x^(2) - x + 1), 2) =
		        frac(cancel(2), cancel(2)) => \
		      & a(x)(frac(x, 2) + frac(1, 2)) +
		        b(x)(- frac(x^(2), 2) - frac(x, 2) + frac(1, 2)) = 1
	$

	Siano $a(x) = [1]_(5)x^(3) + [1]_(5)x^(2) + [1]_(5)x + [1]_(5)$ e
	$b(x) = [3]_(5)x^(2) + [2]_(5)x + [2]_(5)$ polinomi sull'anello
	$ZZ_(5)[x]$. Si ha:

	$
		mat(
			[1]_(5)x^(3),  +[1]_(5)x^(2),  +[1]_(5)x,  +[1]_(5),  [3]_(5)x^(2), +[2]_(5)x, +[2]_(5);
			[-6]_(5)x^(3), +[-4]_(5)x^(2), +[-4]_(5)x, space,     space,        space,     space;
			space,         [2]_(5)x^(2),   +[2]_(5)x,  +[1]_(5),  space,        space,     space;
			space,         [-12]_(5)x^(2), +[-8]_(5)x, +[-8]_(5), space,        space,     space;
			space,         space,          [4]_(5)x,   +[3]_(5),  [2]_(5)x,     +[4]_(5),  space;
			augment: #(vline: 4, hline: (2, 4))
		)
		space space space space space
		mat(
			[3]_(5)x^(2),  +[2]_(5)x,  +[2]_(5),   [4]_(5)x, +[3]_(5);
			[-8]_(5)x^(2), +[-6]_(5)x, space,      space,    space;
			space,         [1]_(5)x,   +[2]_(5),   space,    space;
			space,         [-16]_(5)x, +[-12]_(5), space,    space;
			space,         space,      0,          [2]_(5)x, +[4]_(5);
			augment: #(vline: 3, hline: (2, 4))
		)
	$

	$ a(x) = b(x)([2]_(5)x + [4]_(5)) + ([4]_(5)x + [3]_(5)) =>
	  a(x)[1]_(5) - b(x)([2]_(5)x + [4]_(5)) = [4]_(5)x + [3]_(5) $

	Un massimo comun divisore fra $a(x)$ e $b(x)$ é $d(x) = [4]_(5)x +
	[3]_(5)$, pertanto $"MCD"(a(x), b(x)) = frac(d(x), [4]_(5)) = [1]_(5)x
	+ [3]_(5)$. É poi possibile costruire l'identitá di Bézout come:

	$ frac(a(x)[1]_(5) - b(x)([2]_(5)x + [4]_(5)), [4]_(5)) =
	  frac([4]_(5)x + [3]_(5), [4]_(5)) => a(x)[4]_(5) -
	  b(x)([3]_(5)x + [1]_(5)) = [1]_(5)x +[3]_(5) $
]

Sia $p(x)$ un polinomio in $K[x]$, con $diff (p(x)) > 0$. Il polinomio
$p(x)$ si dice *primo* se, per qualsiasi $a(x), b(x) in K[x]$, $p(x)
| a(x) b(x)$ implica $p(x) | a(x)$ oppure $p(x) | b(x)$.

Il polinomio $p(x) in K[x]$ con $diff (p(x)) > 0$ viene detto *irriducibile*
se i suoi divisori sono solo e soltanto i polinomi di grado $0$ ed i
polinomi nella forma $h p(x)$, con $h in (K - {0_(K)})$.

#theorem[
	Il polinomio $p(x) in K[x]$, con $diff (p(x)) > 0$ é primo se e
	solo se é irriducibile (ovvero, le due definizioni sono equivalenti).
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Si dice che un polinomio $p(x) in K[x]$ viene *fattorizzato in polinomi
primi* quando tale polinomio viene scritto come prodotto di soli polinomi
primi (non necessariamente distinti) appartenenti a $K[x]$. In genere, una
fattorizzazione viene espressa raccogliendo a fattor comune i polinomi primi
per mettere in evidenza la loro molteplicitá. Naturalmente, la fattorizzazione
in polinomi primi di un polinomio primo é sé stesso, a meno di una costante
moltiplicativa non nulla.

#example[
	- Il polinomio $a(x) = x^(2) − 2$ è irriducibile in $QQ[x]$. Non lo
	  é peró in $RR[x]$, perché ha $b(x) = x + sqrt(2)$ come divisore,
	  e puó essere infatti fattorizzato come $x^(2) − 2 = (x − sqrt(2))
	  (x + sqrt(2))$;
	- Il polinomio $a(x) = x^(2) + 1$ è irriducibile in $RR[x]$. Non lo
	  è peró in $CC[x]$, perché ha $b(x) = x + i$ come divisore, e puó
	  essere infatti fattorizzato come $x^(2) + 1 = (x − i)(x + i)$.
]

#theorem("Teorema fondamentale dell'aritmetica per i polinomi")[
	Per ogni polinomio $p(x) in K[x]$ tale che $diff (p(x)) > 0$
	esiste una sua fattorizzazione in polinomi primi in $K[x]$.
	Tale fattorizzazione é sostanzialmente unica, a meno dell'ordine
	in cui si dispongono i fattori e della "distribuzione" di costanti
	moltiplicative.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#corollary[
	Ogni polinomio $a(x) in K[x]$ di grado $diff (p(x)) > 0$ puó essere
	fattorizzato come $a(x) = k a_(1) (x) ... a_(m) (x)$, dove $k in
	(K - {0})$ è il coefficiente direttore di $a(x)$ ed i polinomi
	$a_(1) (x), ..., a_(m) (x)$ sono monici e irriducibili. Tale
	scrittura è unica, a meno dell'ordine dei fattori.
] <Completely-factored>
// #proof[
// Dimostrabile, da aggiungere
// ]

Un polinomio scritto nella forma presentata nel @Completely-factored si
dice *completamente fattorizzato*.

#example[
	Si consideri il polinomio a coefficienti in $QQ$:

	$ p(x) = frac(1, 3) x^(3) + frac(3, 4) x^(2) + frac(1, 8) x - frac(1, 12) $

	Tale polinomio puó essere fattorizzato in polinomi primi in diversi
	modi, tutti equivalenti. L'unica differenza fra questi sta nella scelta
	dell'ordine dei fattori e del modo in cui costanti moltiplicative comuni
	vengono raccolte. Ad esempio:

	#grid(
		columns: (0.34fr, 0.34fr, 0.31fr),
		[$ (frac(1, 3) x + frac(1, 6))(frac(1, 2) x - frac(1, 8))
		   (frac(1, 2) x + 1) $],
		[$ (frac(1, 12) x + frac(1, 24))(4 x - 1)
		   (x + 2) $],
		[$ (x - frac(1, 4))(x + 2)(frac(1, 3) x + frac(1, 6)) $]
	)

	Esiste peró un solo modo (ad eccezione, di nuovo, dell'ordine in cui i
	fattori sono disposti) per scrivere il polinomio in forma completamente
	fattorizzata, ed é il seguente:

	$ frac(1, 3)(x + frac(1, 2))(x - frac(1, 4))(x + 2) $
]
