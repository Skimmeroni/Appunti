#import "../Metodi_defs.typ": *

Sia $(G, *)$ un gruppo e sia $n$ un numero intero. Viene detta *potenza
n-esima* di $g$ l'elemento $g^(n) in G$ ottenuto ricorsivamente nel seguente
modo:

$ g^(n) = cases(
	1_(G) & "se" n = 0,
	g^(n - 1) * g & "se" n > 0,
	(g^(-1))^(-n) & "se" n < 0
) $

#example[
	- Si consideri il gruppo $G = (ZZ, +)$. Ricordando che, in questo caso,
	  $1_(G) = 0$, l'elemento $3^(4)$ di $ZZ$ viene calcolato come:

	  $ 3^(4) = 3^(3) + 3 = 3^(2) + 3 + 3 =
	    3^(1) + 3 + 3 + 3 = 3^(0) + 3 + 3 + 3 + 3 = 0 + 3 + 3 + 3 + 3 = 12 $
	- Si consideri il gruppo $G = (ZZ_(7), +)$. Ricordando che, in questo
	  caso, $1_(G) = [0]_(7)$, l'elemento $([4]_(7))^(4)$ di $ZZ_(7)$ viene
	  calcolato come:

	  $ ([4]_(7))^(4) = ([4]_(7))^(3) + [4]_(7) = ([4]_(7))^(2) + [4]_(7) +
	    [4]_(7) = ([4]_(7))^(1) + [4]_(7) + [4]_(7) + [4]_(7) = \
	    ([4]_(7))^(0) + [4]_(7) + [4]_(7) + [4]_(7) + [4]_(7) =
	    [0]_(7) + [4]_(7) + [4]_(7) + [4]_(7) + [4]_(7) = [16]_(7) =
	    [2]_(7) $
	- Si consideri il gruppo $G = (QQ - {0}, dot)$. Ricordando che, in questo
	  caso, $1_(G) = 1$, l'elemento $(frac(3, 2))^4$ di $QQ - {0}$ viene
	  calcolato come:

	  $ (frac(3, 2))^(4) = (frac(3, 2))^(3) dot frac(3, 2) = (frac(3, 2))^(2)
	    dot frac(3, 2) dot frac(3, 2) = (frac(3, 2))^(1) dot frac(3, 2) dot
	    frac(3, 2) dot frac(3, 2) = (frac(3, 2))^(0) dot frac(3, 2) dot
	    frac(3, 2) dot frac(3, 2) dot frac(3, 2) = 1 dot frac(3, 2) dot
	    frac(3, 2) dot frac(3, 2) dot frac(3, 2) = frac(81, 16) $
]

#lemma[
	Sia $(G, *)$ un gruppo e siano $m$ e $n$ due numeri naturali. Per un
	qualsiasi $g in G$, valgono:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ g^(m) * g^(n) = g^(m + n) $],
		[$ (g^(m))^(n) = g^(m dot n) $]
	)
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Dato un gruppo $(G, *)$ e scelto $g in G$ si definisce *sottogruppo
ciclico generato da* g il sottogruppo di $G$ cosí definito:

$ (angle.l g angle.r, *) space "dove" space angle.l g angle.r =
  {g^(n): n in ZZ} $

#example[
	- Si consideri il gruppo $(ZZ^(+), dot)$. Si ha $angle.l 3 angle.r
	  = {3^(n) : n in ZZ} = {1, 3, 9, 27, 81, ...} subset.eq ZZ^(+)$;
	- Si consideri il gruppo $(ZZ_(5), +)$. Si ha $angle.l [3]_(5) angle.r
	  = {([3]_(5))^(n) : n in ZZ} = {[0]_(5), [3]_(5), [1]_(5), [4]_(5),
	  [2]_(5), ...} subset.eq ZZ_(5)$;
	- Si consideri il gruppo $(RR, +)$. Si ha $angle.l pi angle.r
	  = {pi^(n) : n in ZZ} = {0, pi, 2 pi, 3 pi, 4 pi, ...} subset.eq RR$.
]

#lemma[
	Dato un gruppo $(G, *)$ e scelto $g in G$, il sottogruppo
	$angle.l g angle.r$ di $(G, *)$ é abeliano.
]

#lemma[
	Sia $(G, *)$ un gruppo e sia $(H, *)$ un suo sottogruppo.
	Se $H$ contiene $g in G$, allora contiene anche $angle.l
	g angle.r$.
]
#proof[
	Innanzitutto, si noti come $g^(0) = 1_(G)$ sia certamente membro
	di $H$ per per definizione di sottogruppo. Sempre per definizione
	di sottogruppo, per qualsiasi $h, k in H$ vale $h * k in H$.
	Essendo $g in H$ per ipotesi, certamente vale $g * g in H$, ma
	$g * g = g^(2)$. Allo stesso modo, se $g^(2) in H$, allora $g^(2)
	* g in H$, ma $g^(2) * g = g^(3)$, e via dicendo. Si ha quindi per
	induzione che $H$ contiene $angle.l g angle.r = {g^(n): n in ZZ}$.
]

Un gruppo $(G, *)$ si dice *ciclico* se esiste $g in G$ tale per cui
$angle.l g angle.r = G$, ovvero se esiste (almeno) un suo elemento
il cui sottogruppo generato coincide con l'intero $G$.

#example[
	- Il gruppo $(ZZ, +)$ é ciclico. Infatti, $angle.l 1 angle.r
	  = {0, -1, 1, -2, 2, -3, 3, ...} = ZZ$;
	- Il gruppo $(ZZ_(n), +)$ con $n in NN$ é ciclico. Infatti,
	  $angle.l [1]_(n) angle.r = {[0]_(n), [1]_(n), ..., [n - 1]_(n),
	  [0]_(n), [1]_(n), ...} = ZZ_(n)$;
]

Dato un gruppo $(G, *)$ e scelto $g in G$, la cardinalitá di $angle.l g
angle.r$ prende il nome di *ordine* o di *periodo* di $g$, e viene indicata
con $o(g)$. Se $o(g)$ é infinito, si dice che $g$ é _di ordine_ (_di periodo_)
infinito, altrimenti si dice che é _di ordine_ (_di periodo_) finito.

#theorem[
	Sia $(G, *)$ un gruppo e sia $g$ un suo elemento. Se esiste un numero
	intero positivo $m$ tale per cui $g^(m) = 1_(G)$, allora $angle.l g
	angle.r$ é un insieme finito, e l'ordine di $g$ coincide con il piú
	piccolo di questi $m$. Se non esiste alcun $m$ con queste caratteristiche,
	allora $angle.l g angle.r$ é un insieme infinito.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#example[
	  #set math.mat(delim: none)
	- Il gruppo $(ZZ, +)$ ha un solo elemento con ordine finito. Tale
	  elemento é $0$, il cui ordine é $1$, in quanto $angle.l 0 angle.r
	  = {0, 0, 0 + 0, 0 + 0 + 0, ...} = {0, 0, 0, 0, ...} = {0}$;
	- Il gruppo $(QQ - {0}, dot)$ ha due soli elementi con ordine finito.
	  Tali elementi sono $1$ e $-1$, rispettivamente di ordine $1$ e $2$.
	  Infatti:

	  $ mat(angle.l 1 angle.r &= {1, 1, 1 dot 1, 1 dot 1 dot 1, ...} =
	    {1, 1, 1, 1, ...} = {1};
	    angle.l -1 angle.r &= {1, (-1), (-1) dot (-1), (-1) dot (-1) dot
	    (-1), ...} = {1, -1, 1, -1, ...} = {1, -1}) $
	- Il gruppo $(ZZ_(6), +)$ é interamente costituito da elementi con ordine
	  finito. Infatti:

	  $ mat(
		o([0]_(6)) &=
		abs({[0]_(6)\, [0]_(6)\, [0]_(6) + [0]_(6)\, [0]_(6) + [0]_(6) + [0]_(6)\, ...}) =
		abs({[0]_(6)}) = 1;
		o([1]_(6)) &=
		abs({[0]_(6)\, [1]_(6)\, [1]_(6) + [1]_(6)\, [1]_(6) + [1]_(6) + [1]_(6)\, ...}) =
		abs({[0]_(6)\, [1]_(6)\, [2]_(6)\, [3]_(6)\, [4]_(6)\, [5]_(6)}) = 6;
		o([2]_(6)) &=
		abs({[0]_(6)\, [2]_(6)\, [2]_(6) + [2]_(6)\, [2]_(6) + [2]_(6) + [2]_(6)\, ...}) =
		abs({[0]_(6)\, [2]_(6)\, [4]_(6)}) = 3;
		o([3]_(6)) &=
		abs({[0]_(6)\, [3]_(6)\, [3]_(6) + [3]_(6)\, [3]_(6) + [3]_(6) + [3]_(6)\, ...}) =
		abs({[0]_(6)\, [3]_(6)}) = 2;
		o([4]_(6)) &=
		abs({[0]_(6)\, [4]_(6)\, [4]_(6) + [4]_(6)\, [4]_(6) + [4]_(6) + [4]_(6)\, ...}) =
		abs({[0]_(6)\, [2]_(6)\, [4]_(6)}) = 3;
		o([5]_(6)) &=
		abs({[0]_(6)\, [5]_(6)\, [5]_(6) + [5]_(6)\, [5]_(6) + [5]_(6) + [5]_(6)\, ...}) =
		abs({[0]_(6)\, [1]_(6)\, [2]_(6)\, [3]_(6)\, [4]_(6)\, [5]_(6)}) = 6
	  ) $
]

#lemma[
	Per ogni gruppo $(G, *)$, l'unico elemento che ha ordine $1$ é
	l'elemento neutro rispetto a $*$.
]

#theorem[
	Nel gruppo simmetrico $S_(n)$, un ciclo di lunghezza r$$
	ha ordine $r$. Piú in generale, una permutazione $f$ del
	gruppo simmetrico $S_(n)$ che sia prodotto di $t$ cicli
	disgiunti di lunghezza $r_(1), r_(2), dots, r_(t)$ ha per
	ordine il minimo comune multiplo di $r_(1), r_(2), dots, r_(t)$.
]

Sia $(G, *)$ un gruppo e sia $S subset.eq G$. Il sottogruppo di
$G$ che contiene $S$ e che sia contenuto in ogni sottogruppo di
$G$ contenente $S$ prende il nome di *sottogruppo generato da*
$S$ e si indica con $angle.l S angle.r$:

$ angle.l S angle.r = sect.big_(H lt.eq G, S subset.eq H) H $

Nel caso particolare in cui $S$ sia costituito da un solo elemento,
il sottogruppo generato da $S$ coincide con il sottogruppo _ciclico_
generato da $S$.

#theorem[
	Sia $(G, *)$ un gruppo e sia $S subset.eq G$. Il sottogruppo
	generato da $S$ puó essere scritto come:

	$ angle.l S angle.r = {product_(i = 1)^(n) s_(i)^(epsilon_(i)):
	  s_(i) in S, epsilon_(i) = plus.minus 1, n in NN} $
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Siano $G$ un gruppo e $H$ un suo sottogruppo. Siano
poi $g_(1)$ e $g_(2)$ due elementi di $G$. Le relazioni
$cal(R)_(H)$ e $cal(L)_(H)$ vengono definite come:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ g_(1) cal(R)_(H) g_(2)
	   space "se e soltanto se" space
	   g_(1) g_(2)^(-1) in H $],
	[$ g_(1) cal(L)_(H) g_(2)
	   space "se e soltanto se" space
	   g_(1)^(-1) g_(2) in H $]
)

#theorem[
	Siano $G$ un gruppo e $H$ un suo sottogruppo. Le relazioni
	$cal(R)_(H)$ e $cal(L)_(H)$ sono relazioni di equivalenza.
] <Left-right-is-equivalence>
#proof[
	Per provare che $cal(R)_(H)$ sia una relazione di equivalenza, é
	necessario provare che sia riflessiva, simmetrica e transitiva:

	- $cal(R)_(H)$ é riflessiva se, preso un qualsiasi $g in G$, $g g^(-1)
	  in H$.

	  Questo é vero per definizione, perchè $g g^(-1) = 1_(G)$ e
	  l'elemento neutro é sempre membro di qualsiasi sottogruppo;
	- $cal(R)_(H)$ é simmetrica se, presi due $g_(1), g_(2) in G$
	  qualsiasi, $g_(1) cal(R)_(H) g_(2)$ implica $g_(2) cal(R)_(H)
	  g_(1)$.

	  Se $g_(1) cal(R)_(H) g_(2)$ allora $g_(1) g_(2)^(-1) in H$, ma
	  allora anche $(g_(1) g_(2)^(-1))^(-1) in H$. Si noti peró come
	  $(g_(1) g_(2)^(-1))^(-1) = g_(2) g_(1)^(-1)$, pertanto anche
	  $g_(2) g_(1)^(-1) in H$, ovvero $g_(2) cal(R)_(H) g_(1)$;
	- $cal(R)_(H)$ é transitiva se, presi tre $g_(1), g_(2), g_(3) in G$
	  qualsiasi, $g_(1) cal(R)_(H) g_(2)$ e $g_(2) cal(R)_(H) g_(3)$
	  implicano $g_(1) cal(R)_(H) g_(3)$.

	  Se $g_(1) cal(R)_(H) g_(2)$, allora $g_(1) g_(2)^(-1) in H$. Allo
	  stesso modo, se $g_(2) cal(R)_(H) g_(3)$, allora $g_(2) g_(3)^(-1)
	  in H$. Ricordando che, per qualsiasi $g in G$, vale $g g^(-1) =
	  g^(-1) g = 1_(G)$ Si ha:

	  $ g_(1) g_(3)^(-1) = g_(1) (g_(2)^(-1) g_(2)) g_(3)^(-1) =
	    g_(1) g_(2)^(-1) g_(2) g_(3)^(-1) = (g_(1) g_(2)^(-1))
	    (g_(2) g_(3)^(-1)) $

	  Per definizione di sottogruppo, il risultato dell'applicazione
	  dell'operazione a due membri del sottogruppo é a sua volta
	  membro del sottogruppo. Essendo $g_(1) g_(2)^(-1) in H$ e
	  $g_(2) g_(3)^(-1) in H$, il risultato dell'operazione su
	  questi, ovvero $g_(1) g_(3)^(-1)$, appartiene ad $H$. Avendosi
	  peró che $g_(1) g_(3)^(-1)$ corrisponde a $g_(1) cal(R)_(H)
	  g_(3)$, é provato che $cal(R)_(H)$ sia transitiva.

	La prova rispetto a $cal(L)_(H)$ é sostanzialmente analoga.
]

Dato un gruppo $G$ ed un suo sottogruppo $H$, la classe di equivalenza
$[g]_(cal(R)_(H))$ prende il nome di *laterale destro* di $H$ in $G$ di
rappresentante $g$. Similmente, la classe di equivalenza $[g]_(cal(L)_(H))$
prende il nome di *laterale sinistro* di $H$ in $G$ di rappresentante $g$.

#theorem[
	Dato un gruppo $G$ ed un suo sottogruppo $H$, le classi di equivalenza
	$[g]_(cal(R)_(H))$ e $[g]_(cal(L)_(H))$ possono essere scritte come:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ [g]_(cal(R)_(H)) = H g = {h g: g in H} $],
		[$ [g]_(cal(L)_(H)) = g H = {g h: g in H} $]
	)
]
#proof[
	Sia $g in G$. Si consideri la classe di equivalenza $[g]_(cal(R)_(H))$:

	$ [g]_(cal(R)_(H)) &= {j in G : j cal(R)_(H) g} = {j in G : j g^(−1) in H} =
	  {h in G : exists h in H "tale che" j g^(-1) = h} = \ &= {j in G : exists h
	  in H "tale che" j = h g} = {h g : h in H} = H g $

	La dimostrazione rispetto a $[g]_(cal(L)_(H))$ é sostanzialmente analoga.
]

#lemma[
	Siano $G$ un gruppo e $H$ un suo sottogruppo. L'insieme dei laterali
	destri/sinistri di $H$ costituisce una partizione di $G$.
] <Right-left-is-partition>
#proof[
	Per il @Left-right-is-equivalence, $cal(R)_(H)$ e $cal(L)_(H)$ sono
	delle relazioni di equivalenza. Pertanto, l'insieme dei laterali
	destri/sinistri di $H$ é un insieme quoziente. Il teorema é provato
	perché il @Equivalence-relation-is-partition stabilisce che gli
	insiemi quoziente siano partizioni.
]

#lemma[
	Siano $G$ un gruppo e $H$ un suo sottogruppo. Per un qualsiasi $g in G$,
	gli insiemi $H$ e $H g$ sono equipotenti.
] <Right-lateral-same-cardinality>
#proof[
	Per definizione di equipotenza, $H$ e $H g$ sono equipotenti se esiste
	(almeno) una funzione biettiva con $H$ come dominio e $H g$ come codominio.

	Si consideri a tal proposito la funzione $f: H |-> H g, f(h) = h g$. Tale
	funzione é iniettiva perché se vale $h_(1) g = h_(2) g$ per certi $h_(1),
	h_(2) in H$, la legge di cancellazione permette di scrivere $h_(1) = h_(2)$.
	In altre parole, $h_(1) g = h_(2) g$ nel solo caso in cui $h_(1) = h_(2)$,
	e quindi ogni coppia distinta $h_(1), h_(2)$ ha una distinta immagine per
	$f$. É peró anche suriettiva, perché per ciascun $h g$ é sempre possibile
	trovare un $h in H$ tale per cui $f(h) = h g$. Essendo $f$ sia iniettiva che
	suriettiva, é biettiva, e quindi $H$ e $H g$ sono equipotenti.
]

#theorem("Teorema di Lagrange")[
	Sia $G$ un gruppo finito e sia $H$ un suo sottogruppo. Allora $abs(H)$
	é divisore di $abs(G)$.
]
#proof[
	Per la definizione di divisore, $abs(H)$ é divisore di $abs(G)$ se esiste
	un $k in ZZ$ tale per cui $abs(G) = k abs(H)$.

	Siano $H g_(1), H g_(2), ..., H g_(r)$ i laterali destri distinti di $H$
	in $G$ (essendo $G$ un insieme finito, é possibile enumerarli). Per il
	@Right-lateral-same-cardinality, tutti gli $H g_(i)$ con $i in {1, ..., n}$
	sono equipotenti ad $H$. Inoltre, per il @Right-left-is-partition, tali
	insiemi formano una partizione, e quindi a due a due disgiunti. Si ha allora:

	$ abs(G) = abs(union.big_(i = 1)^(r) H g_(i)) = sum_(i = 1)^(r) abs(H g_(i))
	  = sum_(i = 1)^(r) abs(H) = r abs(H) $
]
