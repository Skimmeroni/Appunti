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

Essendo $compose$ l'operazione piú "interessante" da applicare
alle permutazioni, si usa chiamare _prodotto_ di due permutazioni
la loro composizione. Pertanto, se $sigma$ e $tau$ sono due permutazioni
in $S_(X)$, la scrittura $sigma compose tau$ puó anche venire riportata
come $sigma tau$.

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
di *supporto* di $sigma$. Due permutazioni $sigma, tau in
S_(n)$ si dicono *disgiunte* se i loro supporti sono insiemi disgiunti.

#example[
	Si considerino le tre permutazioni $sigma, tau, upsilon
	in S_(6)$:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[
			$ sigma = mat(
				1, 2, 3, 4, 5, 6;
				1, 6, 2, 3, 5, 4;
			) $
		],
		[
			$ tau = mat(
				1, 2, 3, 4, 5, 6;
				5, 2, 3, 4, 1, 6;
			) $
		],
		[
			$ upsilon = mat(
				1, 2, 3, 4, 5, 6;
				1, 2, 3, 5, 6, 4;
			) $
		]
	)

	Il supporto di $sigma$ é ${2, 3, 4, 6}$, quello di $tau$
	é ${1, 5}$ mentre quello di $upsilon$ é ${4, 5, 6}$. Si ha quindi
	che $sigma$ e $tau$ sono disgiunte.
]

#theorem[
	Se $sigma$ e $tau$ sono due permutazioni disgiunte,
	si ha $sigma tau = tau sigma$.
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
*ciclo* di lunghezza $r$, con $r gt.eq 2$.

Per denotare un ciclo é sufficiente denotare quali elementi vengono
mossi ed in quale posizione, perché tutti gli elementi non menzionati
sono implicitamente fissati. Un ciclo $sigma$ di lunghezza $r$ viene
denotato con $sigma = (x_(1), x_(2), ..., x_(r))$; tale scrittura
sta ad indicare che in corrispondenza di ciascun elemento $x_(i)$
viene messo l'elemento $x_(i + 1)$, ad eccezione dell'$r$-esimo
elemento che viene messo in corrispondenza con $x_(1)$.

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
		1, 2, 3, 4, 5,  6, 7, 8, 9, 10, 11, 12;
		9, 2, 3, 6, 5, 11, 7, 8, 4, 10,  1, 12;
	) $

	Tale ciclo mette $1$ in corrispondenza con $9$, $9$ corrispondenza
	con $4$, $4$ in corrispondenza con $6$, $6$ in corrispondenza con
	$11$ e $11$ in corrispondenza con $1$. Pertanto, viene denotato come
	$(1, 9, 4, 6, 11)$. Si noti come tale scrittura possa essere formulata
	in $5$ modi, tutti equivalenti:

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
	La permutazione $sigma in S_(13)$ a sinistra puó essere scomposta
	nel prodotto dei tre cicli $upsilon_(1), upsilon_(2), upsilon_(3)$
	a destra:

	#grid(
		columns: (0.7fr, 0.3fr),
		[
			$ sigma = mat(
				1,  2,  3, 4, 5,  6, 7, 8, 9, 10, 11, 12, 13;
				9, 12, 13, 6, 7, 11, 2, 3, 4, 10,  1,  5,  8;
			) $
		],
		[
			$upsilon_(1) = (1, 9, 4, 6, 11)$,
			$upsilon_(2) = (2, 12, 5, 7)$,
			$upsilon_(3) = (3, 13, 8)$
		]
	)

	Per convincersene, é sufficiente comporre (in ordine arbitrario) i
	tre cicli. Si consideri, per esempio, $upsilon_(1) compose upsilon_(2)
	compose upsilon_(3)$:

	$
		upsilon_(1) compose upsilon_(2) compose upsilon_(3) =
		upsilon_(1) upsilon_(2) upsilon_(3) =
		upsilon_(1)(upsilon_(2)(upsilon_(3)))&=
		upsilon_(1)(upsilon_(2)(mat(
			1, 2,  3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13;
			1, 2, 13, 4, 5, 6, 7, 3, 9, 10, 11, 12,  8;
		))) \ =
		upsilon_(1)(mat(
			1,  2,  3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13;
			1, 12, 13, 4, 7, 6, 2, 3, 9, 10, 11,  5,  8;
		))&=
		mat(
			1,  2,  3, 4, 5,  6, 7, 8, 9, 10, 11, 12, 13;
			9, 12, 13, 6, 7, 11, 2, 3, 4, 10,  1,  5,  8;
		)
	$
]
