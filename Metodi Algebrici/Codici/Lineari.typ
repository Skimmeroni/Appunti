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
