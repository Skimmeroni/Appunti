#import "../Metodi_defs.typ": *

Sia $X$ un insieme. Una funzione biettiva $sigma: X |-> X$ si dice
*permutazione* su $X$. L'insieme di tutte le permutazioni che é
possibile costruire per $X$ viene indicato con $S_(X)$.

#lemma[
	Sia $X$ un insieme e sia $S_(X)$ l'insieme di tutte le permutazioni
	costruibili per $X$. Se $X$ é un insieme finito di cardinalitá $n$,
	allora $|S_(X)| = n!$.
]
#proof[
	Se $sigma$ é una permutazione su $X$ e $X = {x_(1), ..., x_(n)}$,
	allora esistono $n$ possibili scelte per l'immagine $sigma(x_(1))$.
	Scelto poi un secondo elemento $x_(2) != x_(1)$, questo avrá $n - 1$
	scelte per $sigma(x_(2))$, perché $sigma$ é per definizione iniettiva
	(essendo biettiva, quindi iniettiva e suriettiva) ed una delle scelte
	é giá occupata da $x_(1)$. Ripetendo questo ragionamento per tutti gli
	elementi di $X$, si ha che il numero di permutazioni su $X$ é esattamente
	$n dot (n - 1) dot ... dot 1 = n!$.
]

#theorem[
	Sia $X$ un insieme e sia $S_(X)$ l'insieme di tutte le permutazioni
	costruibili per $X$. La struttura algebrica $(S_(X), compose)$, dove
	$compose$ é l'operazione di composizione di funzioni, costituisce un
	gruppo.
]
#proof[
	La struttura algebrica $(S_(X), compose)$ forma un semigruppo perché,
	per il @Composition-is-associative, l'operazione di composizione gode
	della proprietá associativa. É inoltre un monoide, perché l'operazione
	di composizione ha nella funzione identitá l'elemento neutro, come da
	@Composition-identity-is-neutral. É infine un gruppo perché, essendo
	biettiva per definizione, per ogni permutazione ne esiste una inversa,
	e la funzione inversa é l'inverso rispetto alla composizione, come da
	@Composition-inverse-is-inverse.
]

Per un insieme $X$, il gruppo $(S_(X), compose)$ viene chiamato
*gruppo simmetrico* o *gruppo delle permutazioni*.

In genere, quando si parla di permutazioni su un insieme $X$, si ha
interesse a considerare $X$ come i primi $n$ numeri interi, ovvero
come  $X = {1, 2, ..., n}$. Per tal motivo, viene usata la notazione
$S_(n)$ per indicare l'insieme di tutte le permutazioni su $X = {1,
2, ..., n}$, sottointentendo che l'insieme a cui $S_(n)$ si riferisce
sia quest'ultimo. Una certa permutazione $sigma in S_(n)$ viene spesso
indicata anche come:

$ sigma = mat(
	x_(1), x_(2), ..., x_(i), ..., x_(n);
	y_(1), y_(2), ..., y_(i), ..., y_(n);
) $

Dove, per ogni $i$, si ha $y_(i) = sigma (x_(i))$. L'ordinamento della
prima riga puó essere arbitrario, ma per convenzione viene in genere
ordinata in ordine crescente.

#example[
	- Con $n = 3$, si hanno $3! = 6$ permutazioni possibili, che possono
	  pertanto essere facilmente enumerate:

	  $ S_(3) = { mat(1, 2, 3; 1, 2, 3), mat(1, 2, 3; 1, 3, 2),
	    mat(1, 2, 3; 3, 2, 1), mat(1, 2, 3; 3, 1, 2), mat(1, 2, 3; 2, 1, 3),
	    mat(1, 2, 3; 2, 3, 1) } $
	- Con $n = 12$, si hanno $12! = 479001600$ permutazioni possibili. Una
	  di queste é:

	  $ sigma in S_(12) =
	    mat(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12;
	    8, 1, 2, 7, 12, 5, 9, 3, 11, 4, 6, 10) $
]

Si dice che la permutazione $sigma in S_(n)$ _muove_ un elemento
$a$ se $sigma(a) != a$, ovvero se "sposta" l'elemento $a$ in una
posizione diversa da quella in cui si trova. In caso contrario,
ovvero se $sigma(a) = a$, si dice che $sigma$ _fissa_ $a$.

L'insieme costituito dagli elementi mossi da $sigma$ prende il nome
di *supporto* di $sigma$. Due permutazioni $sigma_(1), sigma_(2) in
S_(n)$ si dicono *disgiunte* se i loro supporti sono insiemi disgiunti.

#example[
	Si considerino le tre permutazioni $sigma_(1), sigma_(2), sigma_(3)
	in S_(6)$:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[
			$ sigma_(1) = mat(
				1, 2, 3, 4, 5, 6;
				1, 6, 2, 3, 5, 4;
			) $
		],
		[
			$ sigma_(2) = mat(
				1, 2, 3, 4, 5, 6;
				5, 2, 3, 4, 1, 6;
			) $
		],
		[
			$ sigma_(3) = mat(
				1, 2, 3, 4, 5, 6;
				1, 2, 3, 5, 6, 4;
			) $
		]
	)

	Il supporto di $sigma_(1)$ é ${2, 3, 4, 6}$, quello di $sigma_(2)$
	é ${1, 5}$ mentre quello di $sigma_(3)$ é ${4, 5, 6}$. Si ha quindi
	che $sigma_(1)$ e $sigma_(2)$ sono disgiunte.
]

#theorem[
	Se $sigma_(1)$ e $sigma_(2)$ sono due permutazioni disgiunte,
	si ha $sigma_(1) compose sigma_(2) = sigma_(2) compose sigma_(1)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Una permutazione nella forma:

$ mat(
	x_(1), x_(2), ..., x_(r - 1), x_(r), x_(r + 1), ..., x_(n);
	x_(2), x_(3), ..., x_(r),     x_(1), x_(r + 1), ..., x_(n);
) $

Viene detta *permutazione ciclica* di lunghezza $r$, o semplicemente
*ciclo* di lunghezza $r$, con $r gt.eq 2$. Intuitivamente, un ciclo
"sposta" un elemento $x_(a)$ nella posizione in cui si trovava $x_(b)$,
l'elemento $x_(b)$ nella posizione in cui si trovava $x_(c)$, ..., e
l'elemento $x_(r)$ nella posizione in cui si trovava $x_(a)$.

Dato che un ciclo o fissa o muove ciascun suo elemento, per denotare
un ciclo é sufficiente denotare quali elementi vengono mossi ed in
quale posizione, perché tutti gli elementi non menzionati sono
implicitamente fissati. Un ciclo $sigma$ di lunghezza $r$ viene
denotato con $sigma = (x_(1), x_(2), ..., x_(r))$; tale scrittura
sta ad indicare che ciascun elemento $x_(i)$ viene mosso nella
posizione in cui si trovava $x_(i + 1)$, ad eccezione dell'$r$-esimo
elemento che viene portato nella posizione in cui si trovava $x_(1)$.

Si noti come la scrittura $(x_(1), x_(2), x_(3), ..., x_(r))$ sia
equivalente alla scrittura $(x_(r), x_(1), x_(2), ..., x_(r - 1))$
e alla scrittura $(x_(r - 1), x_(r), x_(1), ..., x_(r - 2))$, ecc...
perché sono tutti cicli che inducono il medesimo "spostamento",
semplicemente si prende come "riferimento iniziale" un suo elemento
diverso. Nello specifico, ogni ciclo puó essere scritto in tanti modi
diversi quant'é la sua lunghezza.

#example[
	Quello presentato di seguito é un ciclo di lunghezza 5, appartenente
	all'insieme delle permutazioni $S_(12)$:

	$ sigma = mat(
		1,  2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12;
		11, 2, 3, 9, 5, 4, 7, 8, 1, 10,  6, 12;

	) $

	Tale ciclo muove $1$ in posizione $9$, $9$ in posizione $4$, $4$
	in posizione $6$, $6$ in posizione $11$ e $11$ in posizione $1$.
	Pertanto, viene denotato come $(1, 9, 4, 6, 11)$. Si noti come
	tale scrittura possa essere formulata in $5$ modi, tutti equivalenti:

	#grid(
		columns: (0.2fr, 0.2fr, 0.2fr, 0.2fr, 0.2fr),
		[$ (1, 9, 4, 6, 11) $],
		[$ (11, 1, 9, 4, 6) $],
		[$ (6, 11, 1, 9, 4) $],
		[$ (4, 6, 11, 1, 9) $],
		[$ (9, 4, 6, 11, 1) $]
	)
]

#theorem[
	Ogni permutazione di $S_(n)$, diversa dalla identità, è un ciclo
	oppure è il prodotto di cicli disgiunti, univocamente determinati
	a meno dell’ordine.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#example[
	Si consideri la permutazione $sigma in S_(13)$ cosí definita:

	$ sigma = mat(
		1, 2,  3,  4, 5, 6,  7, 8, 9, 10, 11, 12, 13;
		9, 12, 13, 6, 7, 11, 2, 3, 4, 10, 1,  5,  8;
	) $

	La permutazione in questione puó essere decomposta nel prodotto
	di tre cicli. Nello specifico: $(1, 9, 4, 6, 11)(2, 12, 5, 7)
	(3, 13, 8)$.
]
