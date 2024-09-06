#import "../Metodi_defs.typ": *

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
] <Lagrange-theorem>
#proof[
	Per la definizione di divisore, $abs(H)$ é divisore di $abs(G)$ se
	esiste un $k in ZZ$ tale per cui $abs(G) = k abs(H)$.

	Siano $H g_(1), H g_(2), ..., H g_(r)$ i laterali destri distinti
	di $H$ in $G$ (essendo $G$ un insieme finito, é possibile enumerarli).
	Per il @Right-lateral-same-cardinality, tutti gli $H g_(i)$ con
	$i in {1, ..., n}$ sono equipotenti ad $H$. Inoltre, per il
	@Right-left-is-partition, tali insiemi formano una partizione,
	e quindi a due a due disgiunti. Si ha allora:

	$ abs(G) = abs(union.big_(i = 1)^(r) H g_(i)) = sum_(i = 1)^(r) abs(H g_(i))
	  = sum_(i = 1)^(r) abs(H) = r abs(H) $

	Essendo $r$ chiaramente un numero intero, si ha che $abs(H)$ é divisore
	di $abs(G)$.
]

Si noti come il @Lagrange-theorem indichi che, dato un gruppo, la
cardinalitá di qualsiasi suo sottogruppo é divisore della cardinalitá
del gruppo, ma non indica che tali sottogruppi necessariamente esistano.

#example[
	Sia $(G, *)$ un gruppo di cardinalitá $6$. Il @Lagrange-theorem implica
	che un qualsiasi sottogruppo di $(G, *)$ debba avere cardinalitá pari ad
	un divisore di $6$, ovvero $1$, $2$, $3$ oppure $6$, ma non implica che
	effettivamente esistano dei sottogruppi di $(G, *)$ aventi cardinalitá
	$1$, $2$, $3$ oppure $6$. Sia peró, ad esempio, $H$ un sottoinsieme di
	$G$ avente cardinaliá $4$: il @Lagrange-theorem implica che $(H, *)$
	non possa essere un sottogruppo di $(G, *)$, perché $4 divides.not 6$.
]

Siano $G$ un gruppo ed $N$ un suo sottogruppo. $N$ si dice *sottogruppo
normale* (di $G$) se, per qualsiasi $g in G$, i laterali destri e sinistri
di $g$ coincidono, ovvero $g N = N g$. Per indicare che $N$ é un sottogruppo
normale di $G$ si usa la notazione $N triangle.l G$.

#lemma[
	Se $(G, *)$ é un gruppo abeliano, allora qualsiasi suo sottogruppo
	é un sottogruppo normale.
] <Abelian-normal-subgroups>
// #proof[
// Dimostrabile, da aggiungere
// ]

#theorem[
	Sia $phi.alt: G |-> K$ un omomorfismo tra i gruppi $(G, *)$ e
	$(K, diamond.small)$. Il nucleo di $phi.alt$ é un sottogruppo
	normale di $(G, *)$.
] <Kernel-is-normal-subgroup>
#proof[
	Si osservi innanzitutto come per il @Kernel-is-subgroup, si ha
	$ker(phi.alt) lt.eq (G, *)$.

	Sia $g ker(phi.alt)$ il laterale destro di $ker(phi.alt)$. Per ogni
	$g * k in g ker(phi.alt)$, risulta:

	$ phi.alt((g * k) * g^(-1)) = (phi.alt(g) * phi.alt(k))
	  diamond.small phi.alt(g^(-1)) = (phi.alt(g) * 1_(G))
	  diamond.small phi.alt(g^(-1)) = phi.alt(g) diamond.small
	  phi.alt(g^(-1)) = 1_(H) $

	Ovvero, $g * k * g^(-1) in ker(phi.alt)$. Questo significa che esiste
	$overline(k) in ker(phi.alt)$ per il quale $g k g^(-1) = overline(k)$,
	e pertanto $g k = overline(k) g in ker(phi.alt)$.

	Questo implica $g ker(phi.alt) subset.eq ker(phi.alt) g$. In
	maniera analoga, é possibile provare che $ker(phi.alt) g subset.eq
	g ker(phi.alt)$. Questo significa che, per qualsiasi $g in G$,
	$g ker(phi.alt) = ker(phi.alt) g$, e quindi che $ker(phi.alt)$ é
	un sottogruppo normale di $(G, *)$.
]

Siano $G$ un gruppo ed $N$ un suo sottogruppo normale. Essendo $cal(R)_(N)$
e $cal(L)_(N)$ delle relazioni di equivalenza, per tali relazioni esiste
un insieme quoziente. Inoltre, essendo $N$ normale, tali relazioni coincidono.
Sia pertanto $G slash N = {N x : x in G}$ l'insieme quoziente dei laterali
destri (sinistri) di $G$. É possibile definire una legge $dot$ su $N slash G$
in questo modo:

$ N g_(1) dot N g_(2) = N g_(1) g_(2) space forall g_(1), g_(2) in G $

#lemma[
	Siano $G$ un gruppo ed $N$ un suo sottogruppo normale. La legge
	$dot$ definita come $N g_(1) dot N g_(2) = N g_(1) g_(2) space
	forall g_(1), g_(2) in G$ é una funzione.
]
// #proof[
//	Dimostrabile, da aggiungere
// ]

#theorem[
	Siano $G$ un gruppo ed $N$ un suo sottogruppo normale. La struttura
	algebrica $(G slash N, dot)$, dove $G slash N$ é l'insieme quoziente
	dei laterali destri (sinistri) di $G$ e $dot$ é l'operazione definita
	come $N g_(1) dot N g_(2) = N g_(1) g_(2) space forall g_(1), g_(2)
	in G$, é un gruppo.
]
#proof[
	Si consideri l'operazione $dot$ della struttura algebrica $(G slash N,
	dot)$:

	- Per ogni $N g_(1), N g_(2), N g_(3) in G slash N$, si ha:

	  $ (N g_(1) dot N g_(2)) dot N g_(3) = N (g_(1) g_(2)) z =
	    N g_(1) (g_(2) g_(3)) = N g_(1) dot (N g_(2) dot N g_(3)) $

	  Pertanto, $dot$ gode della proprietá associativa, e quindi $(G slash N,
	  dot)$ é un semigruppo;
	- $N = N 1_(G)$ é l'elemento neutro per $dot$. Infatti, per ogni $N g in
	  N slash G$, vale:

	  $ N dot N g = N 1 dot N g = N 1 dot g = N g = N g dot 1 = N g dot N 1 =
	    N g dot N $

	  Esistendo l'elemento neutro per $(G slash N, dot)$, questo é un monoide;
	- Per ogni elemento $N g in G slash N$, esiste il suo inverso $n g^(-1) in
	  G slash N$. Inoltre:

	  $ N g dot N g^(−1) = N = N g^(−1) dot N g $

	  Pertanto, $(G slash N, dot)$ é un gruppo.
]

Siano $G$ un gruppo ed $N$ un suo sottogruppo normale. Il gruppo $(G slash N,
dot)$ prende il nome di *gruppo quoziente* di $G$ rispetto a $N$.

#theorem("Teorema fondamentale degli omomorfismi")[
	Sia $phi.alt: G |-> K$ un omomorfismo tra i gruppi $(G, *)$ e
	$(K, diamond.small)$. Il gruppo quoziente $(G slash ker(phi.alt),
	dot)$ é isomorfo a $(Im(phi.alt), dot)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]
