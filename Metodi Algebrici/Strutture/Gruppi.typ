#import "../Metodi_defs.typ": *

Un monoide $(G, *)$ viene detto *gruppo* se l'operazione $*$ definita
sull'insieme $G$ ammette inverso per ogni elemento di $G$. Un gruppo
$(G, *)$ dove $*$ gode della proprietá commutativa viene detto *gruppo
abeliano*.

#example[
	- La coppia $(QQ, dot)$ é un semigruppo ed un monoide, ma non un
	  gruppo. Questo perché non esiste l'inverso di $0$ rispetto a
	  $dot$ (richiederebbe di dividere per $0$, che non é possibile);
	- La coppia $(QQ - {0}, dot)$ é, per gli stessi motivi per cui lo
	  é $(QQ, dot)$, sia un semigruppo che un monoide. É peró anche un
	  gruppo, perché per ogni $a in QQ$ esiste sempre un $frac(1, a) in
	  QQ$ tale per cui $a dot frac(1, a) = frac(1, a) dot a = 1$;
	- Sia $"GL"(n, RR) = {A in "Mat"(n, RR): det(A) != 0}$ l'insieme che
	  contiene tutte le matrici quadrate di dimensione $n$ che hanno il
	  determinante non nullo. La struttura algebrica $("GL"(n, RR), dot)$,
	  dove $dot$ indica l'operazione di prodotto fra matrici, forma un
	  semigruppo, in quanto il prodotto fra matrici gode della proprietá
	  associativa. É inoltre un monoide, in quanto il prodotto fra matrici
	  ammette elemento neutro nella forma della matrice identitá. É infine
	  anche un gruppo, in quanto il prodotto fra matrici ammette inverso
	  nella forma della matrice inversa (che esiste per tutte le matrici
	  che hanno il determinante non nullo, pertanto ogni matrice in
	  $"GL"(n, RR)$ ha per definizione una inversa). Il gruppo $("GL"(n,
	  RR), dot)$ prende il nome di *gruppo lineare generale*.
]

Per comoditá, verranno fatte delle semplificazioni di notazione. Se non
riportato diversamente:

- Se ci si sta riferendo ad un gruppo ed é noto dal contesto quale sia
  l'operazione che figura nel gruppo, ci si riferirá al gruppo solo con
  il suo insieme sostegno. In altre parole, se $(G, *)$ é un gruppo ed
  é noto dal contesto che l'operazione a cui ci si riferisce é $*$, si
  indicherá con il solo $G$ la coppia $(G, *)$;
- Quando l'operazione $*$ é nota dal contesto, per indicare $x * y$
  (con $x$ e $y$ membri dell'insieme su cui $*$ é definita) verrá usata
  la notazione abbreviata $x y$;
- Se é noto dal contesto a quale gruppo e a quale operazione ci si sta
  riferendo, l'elemento neutro di tale gruppo per tale operazione viene
  indicato con $1$.

#lemma[
	Sia $(G, diamond.small)$ un gruppo. Per qualsiasi $x, y, z in G$, vale:

	- Unicitá dell'inverso:
	  $exists! x^(-1) : x diamond.small x^(-1) = 1$;
	- Unicitá dell'elemento neutro:
	  $exists! 1 : x diamond.small 1 = x$;
	- Legge di cancellazione (a destra):
	  $x diamond.small y = x diamond.small z => y = z$;
	- Legge di cancellazione (a sinistra):
	  $y diamond.small x = z diamond.small x => y = z$.
]

Dato un gruppo $G$, la struttura algebrica $(H, diamond.small)$ si
dice *sottogruppo* di $G$ se $H$ é un sottoinsieme (anche improprio)
di $G$ e se la coppia $(H, diamond.small)$ forma a sua volta un gruppo.
In altre parole, $H = (H, diamond.small)$ é un sottogruppo di $G =
(G, diamond.small)$ se:

- L'elemento neutro di $G$ appartiene ad $H$;
- L'insieme $H$ é _chiuso_ rispetto all'operazione $diamond.small$,
  ovvero $forall h, k in H$ si ha $h diamond.small k in H$;
- $forall h in H$, l'inverso $overline(h)$ di $h$ é a sua volta
  membro di $H$.

Per indicare che $H$ é un sottogruppo di $G$ si usa la notazione
$H lt.eq G$. Se $H$ é un sottogruppo di $G$ ed é distinto da $G$
si dice che $H$ é un *sottogruppo proprio* di $G$, e si indica
con $H < G$.

Si noti come le notazioni $<$ e $lt.eq$ non hanno nulla a che vedere
con le relazioni d'ordine "minore" e "minore o uguale" rispetto ai
numeri, cosí come non si riferiscono alla cardinalitá dei sostegni
dei gruppi. Infatti, é accettato che due gruppi possano essere l'uno
il sottogruppo dell'altro pur avendo la stessa cardinalitá.

#example[
	É stato provato nell'@Some-groups che la struttura algebrica
	$("GL"(n, RR), dot)$ sia un gruppo. Sia $"SL"(n, RR) = {A in
	"Mat"(n, RR): det(A) != 1}$ l'insieme che contiene tutte le
	matrici quadrate di dimensione $n$ che hanno il determinante
	pari ad $1$. Naturalmente, $"SL"(n, RR)$ é un sottoinsieme di
	$"GL"(n, RR)$, perché se una matrice ha il determinate pari
	ad $1$ allora tale determinante é evidentemente diverso da $0$.
	Inoltre, l'elemento neutro di $("GL"(n, RR), dot)$ é la matrice
	identitá di dimensione $n$, che avendo determinante pari ad $1$
	é membro di $"SL"(n, RR)$. Inoltre, dato che per qualsiasi $A, B
	in "SL"(n, RR)$ vale $det(A) = det(B) = 1$, anche la matrice
	ottenuta dal loro prodotto ha determinante $1$, perché il
	determinante é una funzione moltiplicativa e quindi $det(A B) =
	det(A) det(B) = 1 dot 1 = 1$. Infine, se $A$ é una matrice con
	determinante pari ad $1$, anche la sua inversa ha determinante
	pari ad $1$. É possibile allora concludere che $"SL"(n, RR)$ sia
	un sottogruppo di $"GL"(n, RR)$. Il (sotto)gruppo $("SL"(n, RR), dot)$
	prende il nome di *gruppo lineare speciale*.
]

#lemma[
	Sia $G = (G, diamond.small)$ un gruppo. Un sottoinsieme $H$ di $G$
	é un sottogruppo di $G$ se e soltanto se, per ogni coppia di elementi
	(non necessariamente distinti) $h, k in H$, vale $h diamond.small
	overline(k) in H$.
] <Is-a-subgroup>
#proof[
	Se é noto che $H$ sia un sottogruppo di $G$, allora $H$ rispetta
	certamente la proprietá richiesta. Infatti, se $(H, diamond.small)$
	é un gruppo, allora é chiuso rispetto a $diamond.small$, e quindi
	$forall h, k in H$ vale $h diamond.small k in H$. Inoltre, $forall
	h in H, overline(h) in H$, pertanto $overline(k) in H$, e si ha quindi
	$h diamond.small overline(k) in H$ per ogni $h, k in H$.

	Viceversa, si supponga che $H$ sia un sottoinsieme di $G$ tale per
	cui $forall h, k in H$ vale $h diamond.small overline(k) in H$:

	- Se $h = k$, allora, per l'unicitá dell'inverso, $overline(h) =
	  overline(k)$, e quindi $h diamond.small overline(h) = h diamond.small
	  overline(k) = 1$, quindi l'elemento neutro di $(G, diamond.small)$
	  appartiene ad $H$;
	- Se $h = 1$ (ed é lecito, avendo appena mostrato che appartiene ad
	  $H$), allora per un qualsiasi $k$ vale $1 diamond.small overline(k)
	  in H$, ma $1 diamond.small overline(k) = overline(k)$ per definizione
	  di elemento neutro. Si ha quindi che $forall h in H$, vale $overline(h)
	  in H$;
	- Siano $h, k in H$. Avendo appena provato che $overline(k)$
	  appartiene ad $H$ per un qualsiasi $k in H$, vale $h diamond.small
	  overline(overline(k)) in H$, ma $overline(overline(k)) = k$, pertanto
	  $h diamond.small k in H$.

	Si ha quindi che $H$ rispetta la definizione di sottogruppo,
	pertanto $H lt.eq G$.
]

Il @Is-a-subgroup é un possibile criterio che permette di determinare
se, dati due gruppi $G$ ed $H$, $H$ sia un sottogruppo di $G$.

#example[
	É stato provato nell'@Some-groups che la struttura algebrica $(ZZ, +)$
	sia un gruppo. La struttura algebrica $(n ZZ, +)$, dove $n ZZ = {n k
	: k in ZZ}$ é l'insieme che contiene tutti i multipli (interi) di $n$,
	é un sottogruppo di $(ZZ, +)$. Siano infatti $a$ e $b$ due elementi di
	$(n ZZ)$. Si ha:

	$ a + overline(b) = n k_(1) + overline(n k_(2)) = n k_(1) - n k_(2) =
	n (k_(1) - k_(2)) $

	Dato che $(k_(1) - k_(2)) in ZZ$, si ha $n (k_(1) - k_(2)) in n ZZ$.
	Pertanto, per il @Is-a-subgroup si ha che $(n ZZ, +)$ é sottogruppo di
	$(ZZ, +)$. Si noti inoltre come i due insiemi sostegno, $ZZ$ e
	$n ZZ$, abbiano la stessa cardinalitá.
] <nZ-is-subgroup-Z>

#lemma[
	Per un qualsiasi gruppo $G = (G, diamond.small)$, le strutture algebriche
	$(G, diamond.small)$ e $({1_(G)}, diamond.small)$ sono sottogruppi di $G$.
]
#proof[
	- L'insieme $G$ della struttura algebrica $(G, diamond.small)$ é
	  lo stesso insieme che figura nell'insieme $G$ del gruppo $G =
	  (G, diamond.small)$. Pertanto, il @Is-a-subgroup é certamente
	  verificato;
	- L'unico elemento che figura nell'insieme ${1_(G)}$ della
	  struttura algebrica $({1_(G)}, diamond.small)$ é precisamente
	  $1_(G)$. A prescindere di come $diamond.small$ sia definita,
	  si ha $overline(1)_(G) = 1_(G)$, pertanto $1_(G) diamond.small
	  overline(1)_(G) = 1_(G) diamond.small 1_(G) = 1_(G)$. Dato che
	  $1_(G) in {1_(G)}$, il @Is-a-subgroup é verificato.
]

Per un qualsiasi gruppo $G$, il sottogruppo $G$ viene detto
*sottogruppo improprio*, mentre il sottogruppo ${1_(G)}$
viene detto *sottogruppo banale*.

#lemma[
	Per qualsiasi gruppo $G$, l'intersezione di piú sottogruppi di $G$
	é a sua volta un sottogruppo di $G$.
]

Siano $(G, *)$ e $(K, diamond.small)$ due gruppi. Una funzione
$phi.alt: G |-> K$ si dice *omomorfismo* (da $G$ a $K$) se vale:

$ forall g_(1), g_(2) in G, space phi.alt(g_(1) * g_(2)) =
  phi.alt(g_(1)) diamond.small phi.alt(g_(2)) $

Un omomorfismo iniettivo si dice *monomorfismo*, un omomorfismo suriettivo
si dice *epimorfismo*, un omomorfismo biettivo si dice *isomorfismo* ed un
isomorfismo che mappa due insiemi uguali si dice *automorfismo*.

Se esiste (almeno) un isomorfismo fra due gruppi $G$ e $K$, si dice che tali
gruppi sono _isomorfi_, e si indica con $G tilde.eq K$.

#example[
	- Rispetto ai gruppi $(RR^(+), dot)$ e $(RR, +)$, la funzione
	  $f: RR^(+) |-> RR, f(x) = ln(x)$ é un omomorfismo. Infatti:

	  $ ln(x_(1) dot x_(2)) = ln(x_(1)) + ln(x_(2)) $

	  Inoltre, essendo $f$ biettiva, si ha $(RR^(+), dot) tilde.eq (RR, +)$.
	- Rispetto ai gruppi $(RR, dot)$ e $(RR, +)$, la funzione
	  $f: RR |-> RR, f(x) = sin(x)$ non é un omomorfismo. Infatti:

	  $ sin(x_(1) dot x_(2)) != sin(x_(1)) + sin(x_(2)) $
	- Rispetto ai gruppi $(RR^(+), +)$ e $(RR, dot)$, la funzione
	  $f: RR^(+) |-> RR, f(x) = ln(x)$ non é un omomorfismo. Infatti:

	  $ ln(x_(1) + x_(2)) != ln(x_(1)) dot ln(x_(2)) $
] <ln-is-homomorphism>

#theorem[
	L'isomorfismo fra gruppi é una relazione di equivalenza.
]
#proof[
	Per provare che l'isomorfismo fra gruppi é una relazione di
	equivalenza, occorre provare che tale relazione é riflessiva,
	simmetrica e transitiva.

	- L'isomorfismo fra gruppi é riflessivo se, per un qualsiasi
	  gruppo $(G, *)$, si ha $(G, *) tilde.eq (G, *)$.

	  Si consideri, a tal proposito, la funzione identitá $id_(g)
	  (x)$, definita come $f: G |-> G, f(x) = x$. Tale funzione,
	  oltre che biettiva, é chiaramente un omomorfismo da $(G, *)$
	  a $(G, *)$, in quanto:

	  $ f(g_(1) * g_(2)) = f(g_(1)) * f(g_(2)) =>
	    g_(1) * g_(2) = g_(1) * g_(2) space forall g_(1), g_(2) in G $

	  Pertanto, $id_(G)$ é un isomorfismo da $(G, *)$ a $(G, *)$, e
	  quindi $(G, *) tilde.eq (G, *)$;
	- L'isomorfismo fra gruppi é riflessivo se, per una qualsiasi
	  coppia di gruppi $(G, *)$ e $(K, diamond.small)$, si ha che
	  $(G, *) tilde.eq (K, diamond.small)$ implica $(K, diamond.small)
	  tilde.eq (G, *)$.

	  Se $(G, *)$ e $(K, diamond.small)$ sono isomorfi, allora per
	  definizione esiste (almeno) un isomorfismo da $(G, *)$ a $(K,
	  diamond.small)$, sia questo $phi.alt: G |-> K$. Essendo $phi.alt$
	  un isomorfismo, ed essendo quindi una funzione biettiva, esiste
	  certamente la funzione inversa di $phi.alt$, ovvero $phi.alt^(-1):
	  K |-> G$. Tale funzione, oltre che biettiva a sua volta, é anche
	  un omomorfismo da $(K, diamond.small)$ a $(G, *)$, in quanto:

	  $ phi.alt^(-1)(k_(1) diamond.small k_(2)) =
	    phi.alt^(-1)(phi.alt(g_(1)) diamond.small phi.alt(g_(2))) =
	    phi.alt^(-1)(phi.alt(g_(1) * g_(2))) = g_(1) * g_(2) =
	    phi.alt^(-1)(k_(1)) * phi.alt^(-1)(k_(2))
	    space forall k_(1), k_(2) in K $

	  Pertanto, $phi.alt^(-1)$ é un isomorfismo da $(K, diamond.small)$
	  a $(G, *)$, e quindi se vale $(G, *) tilde.eq (K, diamond.small)$
	  allora vale anche $(K, diamond.small) tilde.eq (G, *)$;
	- L'isomorfismo fra gruppi é transitivo se, per una qualsiasi
	  tripla di gruppi $(G, *)$, $(K, diamond.small)$ e $(H, dot.circle)$,
	  si ha che $(G, *) tilde.eq (K, diamond.small)$ e $(K, diamond.small)
	  tilde.eq (H, dot.circle)$ implicano $(G, *) tilde.eq (H, dot.circle)$.

	  Se $(G, *)$ e $(K, diamond.small)$ sono isomorfi, allora per
	  definizione esiste (almeno) un isomorfismo da $(G, *)$ a $(K,
	  diamond.small)$, sia questo $f: G |-> K$. Allo stesso modo,
	  se $(K, diamond.small)$ e $(H, dot.circle)$ sono isomorfi,
	  allora per definizione esiste (almeno) un isomorfismo da
	  $(K, diamond.small)$ a $(H, dot.circle)$, sia questo $g: K
	  |-> H$. Si consideri a tal proposito la composizione di $f$
	  e di $g$, ovvero $f compose g: G |-> H$. Tale funzione esiste
	  certamente, essendo $f$ e $g$ biettive in quanto isomorfismi,
	  ed é biettiva a sua volta per il @Composition-preserves-jection.
	  Inoltre, é un omomorfismo da $(G, *)$ a $(H, dot.circle)$, in
	  quanto:

	  $ (f compose g)(h_(1) * h_(2)) = f(g(h_(1)) diamond.small g(h_(2))) =
	    f(g(h_(1))) dot.circle f(g(h_(2))) = (f compose g)(h_(1))
	    dot.circle (f compose g)(h_(2)) space forall h_(1), h_(2) in H $

	  Pertanto, $f compose g$ é un isomorfismo da $(G, *)$ a
	  $(H, dot.circle)$, e quindi se valgono $(G, *) tilde.eq
	  (K, diamond.small)$ e $(K, diamond.small) tilde.eq (H,
	  dot.circle)$ allora vale anche $(G, *) tilde.eq (H, dot.circle)$.
]

Sia $phi.alt: G |-> K$ un omomorfismo tra i gruppi $(G, *)$ e
$(K, diamond.small)$. Prende il nome di *nucleo* di $phi.alt$,
denotato con $ker(phi.alt)$, il sottoinsieme di $G$ cosí definito:

$ ker(phi.alt) = {g in G: phi.alt(g) = 1_(K)} $

Dove $1_(K)$ é l'elemento neutro dell'operazione $diamond.small$.

Prende invece il nome di *immagine* di $phi.alt$, denotata con
$Im(phi.alt)$, il sottoinsieme di $K$ cosí definito:

$ Im(phi.alt) = {k in K: exists g in G, phi.alt(g) = k} $

#example[
	Come mostrato nell'@ln-is-homomorphism, la funzione $f: RR^(+)
	|-> RR, f(x) = ln(x)$ é un omomorfismo per i gruppi $(RR^(+),
	dot)$ e $(RR, +)$.

	Essendo $0$ l'elemento neutro rispetto alla somma in $RR$, il
	nucleo di $phi.alt$ é l'insieme che contiene tutti gli elementi
	$x in RR^(+)$ tali per cui $ln(x) = 0$. L'unico valore che soddisfa
	tale espressione é $1$, pertanto $ker(phi.alt) = {1}$.

	L'immagine di $phi.alt$ é l'insieme che contiene tutti gli elementi
	di $y in RR$ tali per cui $y = ln(x)$. Essendo il logaritmo naturale
	una funzione suriettiva, si ha $Im(phi.alt) = RR$.
]

#lemma[
	Sia $phi.alt: G |-> K$ un omomorfismo tra i gruppi $(G, *)$ e
	$(K, diamond.small)$. Il nucleo di $phi.alt$ é un sottogruppo
	di $(G, *)$
] <Kernel-is-subgroup>
// #proof[
// Dimostrabile, da aggiungere
// ]

#lemma[
	$phi.alt: G |-> K$ un omomorfismo tra i gruppi $(G, *)$ e
	$(K, diamond.small)$. L'immagine di $phi.alt$ é un sottogruppo
	di $(K, diamond.small)$
]
// #proof[
// Dimostrabile, da aggiungere
// ]
