#import "../Metodi_defs.typ": *

Sia dato un certo campo $K$. Prende il nome di *polinomio* a coefficienti
in $K$ e incognita in $x$ qualunque espressione nella forma:

$ p(x) = sum_(i = 0)^(n) a_(i) x^(i) = a_(n) x^(n) + a_(n − 1) x^(n − 1) + ... + a_(1) x + a_(0)
  space "con" space n in bb(N), a_(i) in K space forall i in {0, ..., n} $

Dove l'intero non negativo $n$ si dice *grado* di $p(x)$ e lo si indica
con $diff p(x)$. Al polinomio nullo $p(x) = 0$ si attribusce, per convenzione,
grado $−1$. Il coefficiente $a_(n)$ si dice *coefficiente direttore* di $p(x)$.
Se $a_(n) = 1$, si dice che $p(x)$ è *monico*.

Sui polinomi é possibile definire delle operazioni di somma e di prodotto.
Siano $p(x)$ e $q(x)$ due polinomi a coefficienti in un campo $K$, di grado
rispettivamente $n$ e $m$. Assumendo, senza perdita di generalitá, che $n
gt.eq m$, la somma fra $p(x)$ e $q(x)$ viene definita come:

$ p(x) + q(x) = sum_(i = min(n, m) + 1)^(n) a_(i) x^(i) + sum_(i = 0)^(min(n, m)) (a_(i) + b_(i)) x^(i) $

Mentre il prodotto come:

$ p(x) q(x) = sum_(0)^(n + m) (sum_(i + j = k) a_(i) b_(i)) x^(i) $

#lemma[
	La struttura algebrica $K[x]$, che ha per sostegno l'insieme di tutti
	i polinomi a coefficienti in $K$ e incognita in $x$ e per operazioni
	la somma fra polinomi ed il prodotto fra polinomi, é un anello commutativo.
	L'elemento neutro per la somma é il polinomio $p(x) = 0$, mentre l'elemento
	neutro per il prodotto é $p(x) = 1$.
]

Per l'anello $K[x]$ é possibile sviluppare una teoria parallela a quella
dell'anello $bb(Z)$

#theorem("Algoritmo della divisione per polinomi")[
	Siano $a(x), b(x) in K[x]$, con $b(x)$ non nullo. Esiste una ed
	una sola coppia di polinomi $q(x), r(x) in K[x]$ tali che:

	+ $a(x) = b(x) q(x) + r(x)$
	+ $diff r(x) < diff b(x)$
] <Division-of-polynomials>
// #proof[
// Dimostrabile, da aggiungere
// ]

Dati $a(x), b(x) in K[x]$, i due polinomi $q(x), r(x) in K[x]$ che figurano
nel @Division-of-polynomials sono chiamati rispettivamente *quoziente* e
*resto* della divisione fra $a(x)$ e $b(x)$. Se $r(x) = 0$, si dice che
$b(x)$ _divide_ $a(x)$, e si indica con $b(x) | a(x)$.

Il @Division-of-polynomials fornisce implicitamente un algoritmo che permette
di calcolare la divisione fra due polinomi.

#example[
	Siano $a(x) = x^(3) −2x^(2) +x −1$ e $b(x) = 2x^(2) -5$ polinomi sull'anello
	$bb(Q)[x]$. Si ha:

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
	$bb(Z)_(7)[x]$. Si ha:

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
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Il massimo comun divisore tra due polinomi è determinato a meno di una
costante moltiplicativa non nulla.

#lemma[
	Siano $a(x)$ e $b(x)$ due polinomi su $K[x]$, e sia $d(x)$ un massimo
	comun divisore fra $a(x)$ e $b(x)$. Allora $tilde(d)(x)$ è un massimo
	comun divisore tra $a(x)$ e $b(x)$ se e soltanto se $tilde(d)(x) = k
	d(x)$ con $k in K - {0}$.
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
	polinomi sull'anello $bb(Q)[x]$. Si ha:

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

	Un massimo comun divisore fra $a(x)$ e $b(x)$ é $2$, pertanto
	$"MCD"(a(x), b(x)) = 1$. É poi possibile costruire l'identitá
	di Bézout come:

	$
		a(x) =& b(x)(x) + (-x + 1) => (-x + 1) = a(x) - b(x)(x) \
		b(x) =& (-x + 1)(-x - 1) + 2 => b(x) - [a(x) - b(x)(x)](-x - 1) = 2 => \
		      & b(x) + a(x)x + a(x) - b(x)(x^(2)) - b(x)(x) = 2 => \
		      & a(x)(x + 1) + b(x)(- x^(2) - x + 1) = 2 => \
		      & a(x)(frac(x, 2) + frac(1, 2)) + b(x)(- frac(x^(2), 2) - frac(x, 2) + frac(1, 2)) = 1
	$

	Siano $a(x) = [1]_(5)x^(3) + [1]_(5)x^(2) + [1]_(5)x + [1]_(5)$ e
	$b(x) = [3]_(5)x^(2) + [2]_(5)x + [2]_(5)$ polinomi sull'anello
	$bb(Z)_(5)[x]$. Si ha:

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

	Si ha quindi che un massimo comun divisore fra $a(x)$ e $b(x)$ é
	$[4]_(5)x + [3]_(5)$. Il massimo comun divisore di $a(x)$ e $b(x)$
	che ha $[1]_(5)$ come coefficiente direttore, ovvero $"MCD"(a(x),
	b(x))$, si ottiene dividendo $[4]_(5)x + [3]_(5)$ per $[4]_(5)$,
	ovvero $[1]_(5)x + [2]_(5)$.

	$ a(x)[4]_(5) + b(x)([2]_(5)x + [4]_(5)) = [1]_(5)x + [2]_(5) $
]

Sia $p(x)$ un polinomio in $K[x]$, con $diff p(x) > 0$. Il polinomio
$p(x)$ si dice *primo* se, per qualsiasi $a(x), b(x) in K[x]$, $p(x)
| a(x) b(x)$ implica $p(x) | a(x)$ oppure $p(x) | b(x)$.

Il polinomio $p(x) in K[x]$ con $diff p(x) > 0$ viene detto *irriducibile*
se i suoi divisori sono solo e soltanto i polinomi di grado $0$ ed i
polinomi nella forma $h p(x)$, con $h in (K - {0})$.

#theorem[
	Il polinomio $p(x) in K[x]$, con $diff p(x) > 0$ é primo se e
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
	- Il polinomio $a(x) = x^(2) − 2$ è irriducibile in $bb(Q)[x]$. Non lo
	  é peró in $bb(R)[x]$, perché ha $b(x) = x + sqrt(2)$ come divisore,
	  e puó essere infatti fattorizzato come $x^(2) − 2 = (x − sqrt(2))
	  (x + sqrt(2))$;
	- Il polinomio $a(x) = x^(2) + 1$ è irriducibile in $bb(R)[x]$. Non lo
	  è peró in $bb(C)[x]$, perché ha $b(x) = x + i$ come divisore, e puó
	  essere infatti fattorizzato come $x^(2) + 1 = (x − i)(x + i)$.
]

#theorem("Teorema fondamentale dell'aritmetica per i polinomi")[
	Per ogni polinomio $p(x) in K[x]$ tale che $diff p(x) > 0$ esiste
	uno ed un solo modo per fattorizzarlo in polinomi primi in $K[x]$
	(a meno dell’ordine in cui si dispongono i fattori).
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#corollary[
	Ogni polinomio $a(x) in K[x]$ di grado $diff p(x) > 0$ puó essere
	fattorizzato come $a(x) = k a_(1) (x) ... a_(m) (x)$, dove $k in
	(K - {0})$ è il coefficiente direttore di $a(x)$ ed i polinomi
	$a_(1) (x), ..., a_(m) (x)$ sono monici e irriducibili. Tale
	scrittura è unica, a meno dell'ordine dei fattori.
]
// #proof[
// Dimostrabile, da aggiungere
// ]
