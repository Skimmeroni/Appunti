#import "../Metodi_defs.typ": *

Sia $C$ un codice in $ZZ_(p)^(n)$ di dimensione $k$. L'insieme $C^(perp)
subset.eq ZZ_(p)^(n)$ che contiene tutti i vettori ortogonali ad ogni
vettore di $C$ si dice *codice duale* di $C$. In particolare, se $C =
C^(perp)$, il codice$C$ si dice *autoduale*.

$ C^(perp) = {x in ZZ_(p)^(n) : x dot c = 0, space forall c in C} $

#example[
	Sia $C in ZZ_(2)^(4) = {0000, 1110, 1011, 0101}$ un codice. Si voglia
	costruire il codice duale:

	$ C^(perp) =
	  cases(
		0 dot A + 0 dot B + 0 dot C + 0 dot D = 0,
		1 dot A + 1 dot B + 1 dot C + 0 dot D = 0,
		1 dot A + 0 dot B + 1 dot C + 1 dot D = 0,
		0 dot A + 1 dot B + 0 dot C + 1 dot D = 0
	  )	=
	  cases(
		0 = 0,
		A + B + C = 0,
		A + C + D = 0,
		B + D = 0
	  ) =
	  cases(
		A + C - D = 0,
		A + C + D = 0,
		B = -D
	  ) $

	Ricordando che $[a]_(2) = [-a]_(2)$ per qualsiasi $a$, si ha
	$C^(perp) = {x in ZZ_(2)^(4) : x = (A, B, A + B, B)}$. Essendo
	$ZZ_(2)^(4)$ un insieme finito, é possibile esplicitare il codice
	duale di $C$ come $C^(perp) = {0000, 0111, 1010, 1101}$.
]

#lemma[
	Sia $C$ un codice in $ZZ_(p)^(n)$. $C^(perp)$ è un sottospazio
	vettoriale di $ZZ_(p)^(n)$.
]
#proof[
	Si noti innanzitutto come la parola nulla sia necessariamente parte
	di $C^(perp)$. Infatti:

	$ cases(
		0 dot x_(1, 1) + 0 dot x_(2, 1) + dots + 0 dot x_(n, 1) = 0,
		0 dot x_(1, 2) + 0 dot x_(2, 2) + dots + 0 dot x_(n, 2) = 0,
		dots.v,
		0 dot x_(1, k) + 0 dot x_(2, k) + dots + 0 dot x_(n, k) = 0
	) $

	Inoltre, per $x, y in C^(perp)$ e $lambda in ZZ_(p)$ si ha

	$ cases(
		(x + y) dot c = x dot c + y dot c = 0,
		(lambda x) dot c = lambda (x dot c) = 0
	) space forall c in C $

	Pertanto, $x + y in C^(perp)$ e $lambda x in C^(perp)$.
]

#lemma[
	Sia $C$ un codice in $ZZ_(p)^(n)$. Vale $(C^(perp))^(perp) = C$.
] <Double-perp-is-none>
// #proof[
// Dimostrabile, da aggiungere
// ]

#theorem[
	Sia $C in ZZ_(p)^(n)$ un codice lineare con dimensione $k$ e matrice
	generatrice $G$. Un vettore $x in ZZ_(p)^(n)$ appartiene a $C^(perp)$
	se e soltanto se $x$ è ortogonale ad ogni vettore riga di $G$, ovvero
	se e soltanto se il prodotto matriciale $x (G^(t))$ é il vettore nullo.
] <Perp-matrix-product-null>
#proof[
	Siano $cal(B)_(C) = {b_(1), b_(2), ..., b_(k)}$ una base qualsiasi
	di $C$ e $cal(B) = {e_(1), e_(2), ..., e_(n)}$ una qualsiasi base
	di $ZZ_(p)^(n)$. I coefficienti della matrice $G$ sono i coefficienti
	della combinazione lineare usata per esprimere i vettori della base
	$cal(B)_(C)$ in funzione della base $cal(B)$:

	#grid(
		columns: (0.65fr, 0.35fr),
		[$ b_(i) = sum_(j = 1)^(n) lambda_(i, j) e_(i)
		   space "con" space lambda_(i, j) in ZZ_(p) space
		   forall i = {1, ..., n}, j = {1, ..., k} $],
		[$ G = mat(
			lambda_(1, 1), lambda_(1, 2), dots, lambda_(1, n);
			lambda_(2, 1), lambda_(2, 2), dots, lambda_(2, n);
			dots.v, dots, dots.down, dots.v;
			lambda_(k, 1), lambda_(k, 2), dots, lambda_(k, n);
		) $]
	)

	È chiaro che $x = (x_(1), dots, x_(n)) in ZZ_(p)^(n)$ appartiene a
	$C^(perp)$ se e soltanto se è ortogonale ai vettori di $cal(B)_(C)$.
	Si ha:

	$ x(G^(t)) = (x_(1), dots, x_(n))
		mat(
		lambda_(1, 1), lambda_(2, 1), dots, lambda_(k, 1);
		lambda_(1, 2), lambda_(2, 2), dots, lambda_(k, 2);
		dots.v, dots, dots.down, dots.v;
		lambda_(1, n), lambda_(2, n), dots, lambda_(k, n)
		) = (x_(1) lambda_(1, 1) + dots + x_(n) lambda_(1, n), dots,
		x_(1) lambda_(k, 1) + dots + x_(n) lambda_(k, n))
	$

	Inoltre:

	$ cases(
		x_(1) lambda_(1, 1) + dots + x_(n) lambda_(1, n) =
		(x_(1), dots, x_(n)) dot (lambda_(1, 1), dots, lambda_(1, n)) =
		x dot b_(1),
		dots.v,
		x_(1) lambda_(k, 1) + dots + x_(n) lambda_(k, n) =
		(x_(1), dots, x_(n)) dot (lambda_(k, 1), dots, lambda_(k, n)) =
		x dot b_(k)
	) $

	Combinando i due risultati, si ha:

	$ x(G^(t)) = (x dot b_(1), dots, x dot b_(k)) $
]

#corollary[
	Se $C$ è un codice lineare in $ZZ_(p)^(n)$ di dimensione
	$k$, allora $C^(perp)$ è un codice lineare in $ZZ_(p)^(n)$
	di dimensione $n − k$.
] <Perp-dimension>
#proof[
	Per il @Perp-matrix-product-null si ha che $x = (x_(1), dots,
	x_(n)) in ZZ_(p)^(n)$ appartiene a $C^(perp)$ se e soltanto
	se $x(G^(t)) = 0$. Allora i vettori di $C^(perp)$ sono tutte
	e sole le soluzioni del sistema lineare omogeneo $x(G^(t)) =
	0$ nelle incognite $x_(1), dots, x_(n)$. La matrice $G$ é
	certamente invertibile, e di conseguenza lo é anche $G^(t)$.
	Pertanto, entrambe devono essere a rango pieno, che in questo
	caso equivale ad avere rango $k$, e lo spazio delle soluzioni
	ha pertanto dimensione $n − k$.
]

Sia $C$ un codice lineare in $ZZ_(p)^(n)$ di dimensione $k$. Si dice
*matrice di controllo* per $C$ una qualsiasi matrice $H$ che genera
$C^(perp)$.

#theorem[
	Sia $C$ un codice e $H$ una sua matrice di controllo. Un vettore
	$x = (x_(1), dots, x_(n)) in ZZ_(p)^(n)$ appartiene a $C$ se e
	soltanto se il prodotto matriciale $x(H^(t))$ é il vettore nullo.
] <Control-matrix-product-null>
#proof[
	Se $H$ é matrice di controllo per $C$, allora é matrice generatrice
	per $C^(perp)$. Per il @Perp-matrix-product-null, $x$ appartiene a
	$(C^(perp))^(perp)$ se e soltanto se il prodotto matriciale $x (H^(t))$
	é il vettore nullo. Tuttavia, per il @Double-perp-is-none, $C =
	(C^(perp))^(perp)$, pertanto $x$ appartiene a $C$ se e soltanto se
	il prodotto matriciale $x (H^(t))$ é il vettore nullo.
]

Sia $C$ un codice e $H$ una sua matrice di controllo.
Il @Control-matrix-product-null fornisce un metodo per
determinare se un elemento $x in ZZ_(p)^(n)$ appartenga
a $C$.

#lemma[
	Sia $C$ un codice di dimensione $k$, e sia $S = (I_(k) | A)$ una sua
	matrice in forma standard. Allora la matrice $H = (−A^(t) | I_(n − k))$
	è una matrice di controllo per $C$.
]
//#proof[
//	$ H S^(t) = (−A^(t) | I_(n − k)) (I_(k) | A)^(t) =
//	  (−A^(t) | I_(n − k)) (frac(I_(k), (A^(t))^(-1))) =
//	  -A^(t) + A^(t) = underline(0) $
//]

#theorem[
	Sia $C in ZZ_(p)^(n)$ un codice di dimensione $k$ e sia $H$ una sua
	matrice di controllo. La distanza minima di $C$ è uguale al minimo
	ordine di un insieme linearmente dipendente di colonne della matrice
	$H$. In particolare, se $d(C)$ è la distanza minima di $C$, si ha
	che $H$ ha almeno $d(C) - 1$ colonne linearmente indipendenti.
]
//#proof[
// Dimostrabile, da aggiungere
//]

#example[
	Sia $C in ZZ_(3)^(5)$ un codice lineare di dimensione $k$, e sia $H$
	la matrice di controllo per $C$ cosí definita:

	$ H = mat(
	  2, 0, 0, 1, 1;
	  0, 2, 0, 0, 2;
	  0, 0, 1, 2, 0) $

	Si voglia determinare $k = dim(C)$. Per il @Perp-dimension, si ha
	$dim(H) = n - dim(C)$. Essendo $H$ di dimensione $3 times 5$, si
	ha $dim(C) = n - dim(H) = 5 - 3 = 2$.

	Si voglia determinare $d(C)$. Le colonne di $H$ sono a $2$ a $2$
	linearmente indipendenti. Invece, le colonne $1$, $2$ e $5$ sono
	linearmente dipendenti. Pertanto, $d(C) = 3$.
]
