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
