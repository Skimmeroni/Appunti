#import "../Metodi_defs.typ": *

Sia $ZZ_(p)^(n)$ lo spazio vettoriale delle $n$-uple di $ZZ_(p)$, con $p$
numero primo. La somma tra due vettori su tale spazio vettoriale é definita
come:

$ ([x_(1)]_(p), ..., [x_(n)]_(p)) + ([y_(1)]_(p), ..., [y_(n)]_(p)) =
  ([x_(1) + y_(1)]_(p), ..., [x_(n) + y_(n)]_(p)) $

Mentre il prodotto fra un vettore ed uno scalare come:

$ [lambda]_(p) ([x_(1)]_(p), ..., [x_(n)]_(p)) =
  ([lambda x_(1)]_(p), ..., [lambda x_(n)]_(p)) $

É infine possibile definire un prodotto scalare come:

$ ([x_(1)]_(p), ..., [x_(n)]_(p)) dot ([y_(1)]_(p), ..., [y_(n)]_(p)) =
  sum_(i = 1)^(n) x_(i) y_(i) $

Se due vettori hanno nullo il loro prodotto scalare, si dicono *ortogonali*.

#lemma[
	Siano $x, y, z in ZZ_(p)^(n)$ e $lambda in ZZ_(p)$. Si ha:

	- $x dot y = y dot x$;
	- $x dot (y + z) = x dot y + x dot z$;
	- $(lambda x) dot y = lambda (x dot y)$.
]

La base canonica di tale spazio vettoriale viene definita come:

$ ([1]_(p), [0]_(p), dots, [0]_(p), [0]_(p)),
  ([0]_(p), [1]_(p), dots, [0]_(p), [0]_(p)),
  dots,
  ([0]_(p), [0]_(p), dots, [1]_(p), [0]_(p)),
  ([0]_(p), [0]_(p), dots, [0]_(p), [1]_(p)) $

Per semplicitá, quando é desumibile dal contesto, una classe di resto
$[x]_(p)$ verrá semplicemente denotata con $x$.

#example[
	Lo spazio vettoriale $ZZ_(2)^(5)$, é costituito da tutte e sole le
	quintuple che hanno per elementi gli elementi di $ZZ_(2) = {0, 1}$
	(si noti come con $0$ si intenda $[0]_(2)$, mentre con $1$ si intenda
	$[1]_(2)$).
]

// #theorem[
//	Lo spazio vettoriale $ZZ_(p)^(n)$ ha dimensione $n$.
// ]

Un qualsiasi sottospazio vettoriale di $ZZ_(p)^(n)$ viene detto
*codice lineare*.

#example[
	A partire dallo spazio vettoriale $ZZ_(2)^(5)$ é possibile
	definire il codice $C$ come il suo sottospazio avente base
	$B = {b_(1) = 10111, b_(2) = 11110}$. I vettori che costituiscono
	$C$ sono tutti e i soli vettori generati dalla combinazione lineare
	$lambda_(1) b_(1) + lambda_(2) b_(2)$, con $lambda_(1), lambda_(2)
	in ZZ_(2)$. Essendo $ZZ_(2)$ e $B$ due insiemi finiti, é possibile
	enumerare $C$ esplicitamente:

	#set math.mat(delim:none)

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat(
			0(10111) + 0(11110) = (00000);
			1(10111) + 0(11110) = (10111)
		) $],
		[$ mat(
			0(10111) + 1(11110) = (11110);
			1(10111) + 1(11110) = (01001)
		) $]
	)
]

#lemma[
	Sia $C subset.eq ZZ_(p)^(n)$ un codice lineare di dimensione $k$.
	Si ha $|C| = p^(k)$.
]
#proof[
	Sia $B = {b_(1), b_(2), ..., b_(k)}$ una base di $C$. Ogni elemento
	di $C$ puó essere generato a partire da una ed una sola combinazione
	lineare dei vettori di $B$, ovvero

	$ lambda_(1) b_(1) + lambda_(2) b_(2) + ··· + lambda_(k) b_(k)
	  space "con" space lambda_(i) in ZZ_(p), space i = {1, ..., k} $

	Essendo i $lambda_(i)$ esattamente $p$ e dovendone scegliere $k$ per
	generare ciascun vettore, anche ripetuti, il numero totale di vettori
	di $C$ é $p^(k)$.
]

#lemma[
	Ogni codice lineare $C$ contiene #footnote[É inoltre vero per
	definizione, dato che $underline(0)$ é il vettore nullo di
	$ZZ_(p)^(n)$ e qualsiasi sottospazio vettoriale deve contenerlo.]
	la parola $underline(0) = 00...0$.
] <Null-word-always-in>
#proof[
	Sia $B = {b_(1), b_(2), ..., b_(k)}$ una base di $C$ e sia $k$ la sua
	dimensione. Per generare $00...0$ occorre costruire una combinazione
	lineare dove tutti gli elementi sono nulli. Questo é sempre possibile
	perché, per qualsiasi $p$, l'elemento $[0]_(p)$ appartiene a $ZZ_(p)$,
	ed quindi é sempre possibile costruire una combinazione lineare del
	tipo:

	$ 0 b_(1) + 0 b_(2) + ··· + 0 b_(k) space "ovvero" space
	  lambda_(1) = lambda_(2) = ... = lambda_(k) = 0 $
]

Sia $x = (x_(1) x_(2) ... x_(n))$ un elemento di $ZZ_(p)^(n)$. Prende il
nome di *peso di Hamming* il numero di componenti $w(x)$ di $x$ diverse
da $0$, ovvero:

$ w(x) = {i | x_(i) != 0} $

Dato che in questo contesto verrá sempre usato il peso di Hamming come
nozione di peso, si sottointenderá con il solo termine "peso" il peso
di Hamming.

#lemma[
	Sia $C$ un codice lineare, e siano $x, y$ due suoi elementi. Allora
	$d(x, y) = w(x - y)$.
]
#proof[
	Per il @Null-word-always-in, la parola $underline(0)$ appartiene
	sempre a $C$. Pertanto, per qualsiasi $y in C$, vale $d(underline(0),
	y) = w(y)$, perché di fatto le due definizioni coincidono. Poichè
	$d(C)$ è la distanza minima di $C$ esistono certamente $x, y in C$
	con $d(C) = d(x, y) = w(x − y)$.
]

#lemma[
	 Sia $C$ un codice lineare. La distanza minima $d(C)$ è pari al
	 peso della parola non nulla di $C$ avente, fra tutte, il peso
	 minimo. Ovvero:

	 $ d(C) = min{w(z) : z in C, z != underline(0)} $
]
#proof[
	Si supponga per assurdo che $d(C) < min{w(z) : z in C, z !=
	underline(0)}$. Se cosí fosse, potrebbe esisterebbe un $z_(0)
	in C$ tale per cui $w(z_(0)) = d(z_(0), underline(0)) < d(C)$,
	ma questo non é possibile, perché $d(C)$ é la minima distanza
	fra tutte le parole di $C$.
]

Sia $C in ZZ_(p)^(n)$ un codice lineare di dimensione $k$. Siano
poi $cal(B)_(C) = {b_(1), b_(2), ..., b_(k)}$ una base di $C$ e
$cal(B) = {e_(1), e_(2), ..., e_(n)}$ una base di $ZZ_(p)^(n)$.
Dato che ogni parola in $cal(B)_(C)$ (e quindi in $C$) appartiene
a $ZZ_(p)$, ogni $b_(i) in cal(B)_(C)$ puó essere scritto come
combinazione lineare a coefficienti in $ZZ_(p)$ dei vettori di
$cal(B)$:

$ cases(
	b_(1) = lambda_(1, 1) e_(1) + lambda_(1, 2) e_(2) + dots +
			lambda_(1, n) e_(n),
	b_(2) = lambda_(2, 1) e_(1) + lambda_(2, 2) e_(2) + dots +
			lambda_(2, n) e_(n),
	dots.v,
	b_(k) = lambda_(k, 1) e_(1) + lambda_(k, 2) e_(2) + dots +
	        lambda_(k, n) e_(n)
) space "con" space lambda_(i, j) in ZZ_(p) space forall i, j = {1, ..., k} $

La matrice $G$ costituita dai coefficienti $lambda_(i, j)$ di tali
combinazioni lineari, ovvero:

$ G = mat(
	lambda_(1, 1), lambda_(1, 2), dots, lambda_(1, n);
	lambda_(2, 1), lambda_(2, 2), dots, lambda_(2, n);
	dots.v, dots, dots.down, dots.v;
	lambda_(k, 1), lambda_(k, 2), dots, lambda_(k, n);
) in "Mat"(k times n, ZZ_(p)) $

Viene detta *matrice generatrice* di $G$.

Naturalmente, preso un qualsiasi $m = (m_(1), m_(2), dots, m_(k))
in ZZ_(p)^(k)$, si avrá che il prodotto matriciale fra $m$ e $G$
appartiene a $C$:

$ m G = mat(m_(1), m_(2), dots, m_(k))
	   mat(
		   lambda_(1, 1), lambda_(1, 2), dots, lambda_(1, n);
		   lambda_(2, 1), lambda_(2, 2), dots, lambda_(2, n);
		   dots.v, dots, dots.down, dots.v;
		   lambda_(k, 1), lambda_(k, 2), dots, lambda_(k, n);
	   ) in C
$

#example[
	Si consideri il codice lineare $C subset.eq ZZ_(2)^(5)$ di dimensione
	$3$. Sia $cal(B)_(C)$ la base di $C$ costituita dai vettori ${b_(1) =
	10001, b_(2) = 11010, b_(3) = 11101}$. Sia poi $cal(B)$ la base canonica
	di $ZZ_(2)^(5)$.

	La matrice $G$ é cosí costruita:

	$ cases(
		10001 = lambda_(1, 1) 10000 + lambda_(1, 2) 01000 +
		lambda_(1, 3) 00100 + lambda_(1, 4) 00010 + lambda_(1, 5) 00001,
		11010 = lambda_(2, 1) 10000 + lambda_(2, 2) 01000 +
		lambda_(2, 3) 00100 + lambda_(2, 4) 00010 + lambda_(2, 5) 00001,
		11101 = lambda_(3, 1) 10000 + lambda_(3, 2) 01000 +
		lambda_(3, 3) 00100 + lambda_(3, 4) 00010 + lambda_(3, 5) 00001
	) space => G = mat(
		1, 0, 0, 0, 1;
		1, 1, 0, 1, 0;
		1, 1, 1, 0, 1;
	) $

	Sia $m = (1, 0, 1) in ZZ_(2)^(3)$. Si osservi come:

	$ m G =
	  mat(
		1, 0, 1
	  )
	  mat(
		1, 0, 0, 0, 1;
		1, 1, 0, 1, 0;
		1, 1, 1, 0, 1)
	  =
	  mat(
		1 dot 1 + 0 dot 1 + 1 dot 1;
		1 dot 0 + 0 dot 1 + 1 dot 1;
		1 dot 0 + 0 dot 0 + 1 dot 1;
		1 dot 0 + 0 dot 1 + 1 dot 0;
		1 dot 1 + 0 dot 0 + 1 dot 1;
	  )
	  =
	  mat(
		1 + 0 + 1;
		0 + 0 + 1;
		0 + 0 + 1;
		0 + 0 + 0;
		1 + 0 + 1;
	  )
	  = mat(2; 1; 1; 0; 2)
	  = mat(0; 1; 1; 0; 0) in C
	$
]

*Codificare* un messaggio consiste semplicemente nell'associare ad
un vettore $m in Z_(p)^(k)$ (il messaggio in chiaro) una parola in
$C subset.eq ZZ_(p)^(k)$ (il messaggio cifrato). La codifica di $m$
rispetto ad una matrice generatrice $G$ é data da $m G$, che come
giá visto appartiene a $C$.

D'altro canto, *decodificare* un messaggio consiste nel ricostruire
a ritroso $m in Z_(p)^(k)$ a partire dalla parola in $C subset.eq
ZZ_(p)^(k)$ associata. Si noti come debba venire anche messa in
conto la possibilitá che si siano verificati degli errori durante
la trasmissione, pertanto per determinare quale sia la parola in
$C$ associata ad $m$ non basta svolgere il prodotto matriciale
all'inverso.

Si costruisca pertanto una matrice di conversione operando il
seguente algoritmo:

#line(length: 100%)
+ Si inizializzi una matrice (vuota) $Sigma = (sigma_(i,j))$;
+ Si inizializzi un insieme $Delta$ al valore $ZZ_(p)^(n) - C$;
+ Si inizializzi un indice $i$ al valore $1$;
+ Si inseriscano nella prima riga di $Sigma$ le parole di $C$.
  La parola nulla (che é sempre presente in qualsiasi $C$) deve
  essere obbligatoriamente posta in $sigma_(1, 1)$, mentre le
  altre parole possono essere inserite in ordine qualsiasi.
+ Si ponga in $sigma_(i, 1)$ una qualsiasi delle parole di
  $ZZ_(p)^(n)$ che hanno peso minimo tra le parole di $Delta$;
+ In ciascuna cella $sigma_(i, j)$ con $0 lt.eq j lt.eq n$ si
  inserisca la parola $sigma_(i, 1) + sigma_(1, j)$;
+ Si sostituisca $Delta$ con $Delta - {sigma_(i, j) : 0 lt.eq j lt.eq n}$;
+ Se $Delta$ non é l'insieme vuoto, $i$ viene incrementato di $1$
  e l'algoritmo riprende dal punto 5, altrimenti termina.
#line(length: 100%)

La matrice $Sigma$ è costruita in modo tale che ogni parola di $ZZ_(p)^(n)$
compaia una e una sola volta in una riga di $Sigma$. Quando viene ricevuta
la parola $y in ZZ_(p)^(n)$, tale parola viene corretta con la parola di $C$
che in $Sigma$ appartiene alla stessa colonna di $y$.

#example[
	Sia $C in ZZ_(2)^(4) = {0000, 1110, 1011, 0101}$ un codice, e sia
	$y = 1111$ la parola da decodificare (e correggere). Si costruisca
	una matrice $Sigma$ come presentato nell'algoritmo. Si ha:

	$ Delta = ZZ_(2)^(4) - C = {0001, 0010, 0100, 1000, 1001, 1010, 1100,
	  0110, 0011, 1101, 0111, 1111} $

	La prima riga é data dalle parole di $C$, ponendo $sigma_(1,1) = 0000$
	e disponendo le altre a piacere. Siano queste disposte ordinatamente
	come $1011, 0101, 1110$.

	Per quanto riguarda la seconda riga, si osservi come le parole in
	$Delta$ con distanza minima sono $0001$, $0010$, $0100$ e $1000$.
	Si scelga $1000$. Si ha quindi che le parole della seconda riga
	sono, ordinatamente:

	#set math.mat(column-gap: 2em)
	$ mat(
	  1000 + 0000 = 1000,
	  1000 + 1011 = 0011,
	  1000 + 0101 = 1101,
	  1000 + 1110 = 0110
	) $

	Si ha poi $Delta := Delta - {1000, 0011, 1101, 0110} =
	{0001, 0010, 0100, 1001, 1010, 1100, 0111, 1111}$

	Per quanto riguarda la terza riga, si osservi come le parole in
	$Delta$ con distanza minima sono $0001$, $0010$, $0100$. Si scelga
	$0100$. Si ha quindi che le parole della terza riga sono, ordinatamente:

	$ mat(
	  0100 + 0000 = 0100,
	  0100 + 1011 = 1111,
	  0100 + 0101 = 0001,
	  0100 + 1110 = 1010
	) $

	Si ha poi $Delta := Delta - {1000, 0011, 1101, 0110} =
	{0010, 1001, 1100, 0111}$

	Per quanto riguarda la quarta riga, si osservi come la parola in
	$Delta$ con distanza minima é $0010$. Si ha quindi che le parole
	della quarta riga sono, ordinatamente:

	$ mat(
	  0010 + 0000 = 0010,
	  0010 + 1011 = 1001,
	  0010 + 0101 = 0111,
	  0010 + 1110 = 1100
	) $

	Si ha poi $Delta := Delta - {0010, 1001, 1100, 0111} = {}$.

	Essendo $Delta$ l'insieme vuoto, l'algoritmo termina. La matrice
	risultante é:

	#set math.mat(column-gap: 1em)
	$ mat(
		0000, 1011, 0101, 1110;
		1000, 0011, 1101, 0110;
		0100, 1111, 0001, 1010;
		0010, 1001, 0111, 1100;
	) $

	Trovandosi $y$ nella seconda colonna, questa viene corretta con $1011$.
]

Siano $C_(1)$ e $C_(2)$ due codici lineari in $ZZ_(p)^(n)$ di stessa
dimensione. Si dice che $C_(1)$ e $C_(2)$ sono *equivalenti* se è possibile
ottenere tutte le parole di uno a partire da quelle dell'altro applicando:

+ Una permutazione delle posizioni $1, 2, ..., n$ a tutte le parole;
+ La moltiplicazione dei simboli che compaiono in una data posizione
  per un elemento non nullo $lambda in ZZ_(p)$ a tutte le parole;

Di conseguenza, due matrici generatrici $G_(1)$ e $G_(2)$ in $"Mat"(k
times n, ZZ_(p))$ danno luogo a due codici lineari equivalenti se una
delle due può essere ottenuta dall'altra tramite un numero finito delle
seguenti operazioni:

+ Scambiare due righe;
+ Moltiplicare gli elementi di una riga per un elemento non nullo di
  $ZZ_(p)$;
+ Sommare a una riga un'altra riga moltiplicata per un elemento non
  nullo di $ZZ_(p)$;
+ Permutare le colonne;
+ Moltiplicare gli elementi di una colonna per un elemento non nullo
  di $ZZ_(p)$.

Dove le prime tre operazioni corrispondono a cambiare la base del codice
mentre le ultime due corrispondono alle operazioni nella definizione di
codici equivalenti.

Sia $C subset.eq ZZ_(p)^(n)$ un codice lineare di dimensione $k$. Dato
che esistono diverse matrici che generano $C$, é ragionevole sceglierne
una che renda i calcoli piú agevoli possibili. In particolare, si
consideri la matrice del tipo:

$ S = mat(
	1, 0, dots, 0,
	Lambda_(1, k + 1), Lambda_(1, k + 2), dots, Lambda_(1, k + n);
	0, 1, dots, 0,
	Lambda_(2, k + 1), Lambda_(2, k + 2), dots, Lambda_(2, k + n);
	dots.v, dots, dots.down, dots.v, dots.v, dots, dots.down, dots.v;
	0, 0, dots, 1,
	Lambda_(k, k + 1), Lambda_(k, k + 2), dots, Lambda_(k, k + n);
  ) $

Per indicare una matrice in questa forma, detta *forma standard*,
si usa la notazione $S = (I_(k) | A)$.

Per convincersi che le matrici in forma standard sono effettivamente
vantaggiose, si osservi come:

$ m S &= mat(m_(1), m_(2), dots, m_(k)) mat(
	  1, 0, dots, 0,
	  Lambda_(1, k + 1), Lambda_(1, k + 2), dots, Lambda_(1, k + n);
	  0, 1, dots, 0,
	  Lambda_(2, k + 1), Lambda_(2, k + 2), dots, Lambda_(2, k + n);
	  dots.v, dots, dots.down, dots.v, dots.v, dots, dots.down, dots.v;
	  0, 0, dots, 1,
	  Lambda_(k, k + 1), Lambda_(k, k + 2), dots, Lambda_(k, k + n);
	  ) = \
	  &= mat(m_(1), m_(2), dots, m_(k),
	  sum_(i = 1)^(k) m_(i) Lambda_(i, k + 1), dots,
	  sum_(i = 1)^(k) m_(i) Lambda_(i, k + n)) $

Ovvero, dove le prime $k$ componenti della codifica coincidono con i primi
$k$ elementi del messaggio originale e la ridondanza è tutta nelle ultime
componenti. Dunque se nella trasmissione non occorrono errori la parola
ricevuta viene facilmente decodificata: basta considerare le prime $k$
componenti per ottenere $m$.

Sia $C$ un codice in $ZZ_(p)^(n)$ di dimensione $k$. L'insieme di tutti i
vettori in $ZZ_(p)^(n)$ che sono ortogonali ad ogni vettore di $C$, ovvero:

$ C^(perp) = {x in ZZ_(p)^(n) : x dot c = 0, space forall c in C} $

Si dice *codice duale* di $C$. In particolare, se $C = C^(perp)$, il codice
$C$ si dice *autoduale*.

#example[
	Sia $C in ZZ_(2)^(4) = {0000, 1110, 1011, 0101}$ un codice. Si voglia
	costruire il codice autoduale:

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
]
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
]
#proof[
	Per il <Perp-matrix-product-null> si ha che $x = (x_(1), dots,
	x_(n)) in ZZ_(p)^(n)$ appartiene a $C^(perp)$ se e soltanto
	se $x(G^(t)) = 0$. Allora i vettori di $C^(perp)$ sono tutte
	e sole le soluzioni del sistema lineare omogeneo $x(G^(t)) =
	0$ nelle incognite $x_(1), dots, x_(n)$. La matrice $G$ é
	certamente invertibile, e di conseguenza lo é anche $G^(t)$.
	Pertanto, entrambe devono essere a rango pieno, che in questo
	caso equivale ad avere rango $k$, e lo spazio delle soluzioni
	ha pertanto dimensione $n − k$.
]
