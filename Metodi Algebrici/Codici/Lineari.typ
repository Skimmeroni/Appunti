#import "../Metodi_defs.typ": *

Sia $ZZ_(p)^(n)$ lo spazio vettoriale delle $n$-uple di $ZZ_(p)$, con $p$
numero primo. La somma tra due vettori su tale spazio vettoriale é definita
come:

$ ([x_(1)]_(p), ..., [x_(n)]_(p)) + ([y_(1)]_(p), ..., [y_(n)]_(p)) =
  ([x_(1) + y_(1)]_(p), ..., [x_(n) + y_(n)]_(p)) $

Mentre il prodotto fra un vettore ed uno scalare come:

$ [lambda]_(p) ([x_(1)]_(p), ..., [x_(n)]_(p)) =
  ([lambda x_(1)]_(p), ..., [lambda x_(n)]_(p)) $

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

#theorem[
	Lo spazio vettoriale $ZZ_(p)^(n)$ ha dimensione $n$.
]

Un qualsiasi sottospazio vettoriale di $ZZ_(p)^(n)$ viene detto
*codice lineare*.

#example[
	A partire dallo spazio vettoriale $ZZ_(2)^(5)$ é possibile definire
	il codice $C$ come il suo sottospazio avente base $B = {b_(1) = 10111,
	b_(2) = 11110}$. I vettori che costituiscono $C$ sono tutti e i soli
	vettori generati dalla combinazione lineare $lambda_(1) b_(1) + lambda_(2)
	b_(2)$, con $lambda_(1), lambda_(2) in ZZ_(2)$. Essendo $ZZ_(2)$ e $B$
	due insiemi finiti, é possibile enumerare $C$ esplicitamente:

	#set math.mat(delim:none, column-gap: 2.5em)
	$ mat(
		0(10111) + 0(11110) = (00000),
		1(10111) + 0(11110) = (10111);
		0(10111) + 1(11110) = (11110),
		1(10111) + 1(11110) = (01001),
	) $
]

#lemma[
	Sia $C subset.eq ZZ_(p)^(n)$ un codice lineare di dimensione $k$.
	Si ha $|C| = p^(k)$.
]
#proof[
	Sia $B = {b_(1), b_(2), ..., b_(k)}$ una base di $C$. Ogni elemento di
	$C$ puó essere generato a partire da una ed una sola combinazione lineare
	dei vettori di $B$, ovvero

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
	ed quindi é sempre possibile costruire una combinazione lineare del tipo:

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
	y) = w(y)$, perché di fatto le due definizioni coincidono. Poichè $d(C)$
	è la distanza minima di $C$ esistono certamente $x, y in C$ con $d(C) =
	d(x, y) = w(x − y)$.
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

Sia $C in ZZ_(p)^(n)$ un codice lineare di dimensione $k$. Siano poi
$cal(B)_(C) = {b_(1), b_(2), ..., b_(k)}$ una base di $C$ e $cal(B)
= {e_(1), e_(2), ..., e_(k)}$ una base di $ZZ_(p)^(n)$. Ciascun vettore
$b_(i) in cal(B)_(C)$ puó essere scritto come combinazione lineare a
coefficienti $ZZ_(p)$ dei vettori di $cal(B)$:

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

La matrice $G$ puó essere usata per la codifica dei messaggi, ovvero
per associare ad un vettore $m in Z_(p)^(k)$ una parola in $C subset.eq
Z_(p)^(k)$. Dato un vettore $m = (m_(1), m_(2), dots, m_(k)) in Z_(p)^(k)$,
la codifica di $m$ è rispetto a $G$ é data dal prodotto matriciale fra
$m$ e $G$, ovvero:

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

	Sia infine $m = (1, 0, 1) in ZZ_(2)^(3)$ il messaggio da codificare.
	La codifica di $m$ rispetto a $C$ é:

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
