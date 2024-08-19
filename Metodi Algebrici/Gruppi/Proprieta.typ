#import "../Metodi_defs.typ": *

Per comoditá, verranno fatte delle semplificazioni di notazione. Se non
riportato diversamente:

- L'operazione che figura nei gruppi, a prescindere da quale sia,
  verrá denotata con $diamond.small$;
- Per indicare $x diamond.small y$ (con $x, y in G$) verrá usata la notazione
  abbreviata $x y$;
- L'elemento neutro per l'operazione $diamond.small$ verrá indicato con $1$;
- L'applicazione reiterata $k$ volte dell'operazione $diamond.small$ su un $x
  in G$, ovvero $underbrace(x diamond.small x diamond.small ... diamond.small
  x, k)$, verrá indicata con $x^(k)$;
- Il reciproco di un $x in G$ rispetto a $diamond.small$ viene indicato con
  $overline(x)$;
- Se ci si sta riferendo ad un gruppo ed é noto dal contesto quale sia
  l'operazione che figura nel gruppo, ci si riferirá al gruppo solo con
  il suo insieme sostegno. In altre parole, se $(G, diamond.small)$ é un
  gruppo ed é noto dal contesto che l'operazione a cui ci si riferisce é
  $diamond.small$, si indicherá con il solo $G$ la coppia $(G, diamond.small)$.

#lemma[
	Sia $G$ un gruppo. Per qualsiasi $x, y, z in G$, vale:

	- Unicitá del reciproco:
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
- $forall h in H$, il reciproco $overline(h)$ di $h$ é a sua volta
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

	- Se $h = k$, allora, per l'unicitá del reciproco, $overline(h) =
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
	La struttura algebrica $(ZZ, +)$ é un gruppo. La struttura algebrica
	$(n ZZ, +)$, dove $n ZZ = {n k : k in ZZ}$ é l'insieme che
	contiene tutti i multipli (interi) di $n$, é un sottogruppo di $(ZZ,
	+)$. Siano infatti $a$ e $b$ due elementi di $(n ZZ)$. Si ha:

	$ a + overline(b) = n k_(1) + overline(n k_(2)) = n k_(1) - n k_(2) =
	n (k_(1) - k_(2)) $

	Dato che $(k_(1) - k_(2)) in ZZ$, si ha $n (k_(1) - k_(2)) in n ZZ$.
	Pertanto, per il @Is-a-subgroup si ha che $(n ZZ, +)$ é sottogruppo di
	$(ZZ, +)$. Si noti inoltre come i due insiemi sostegno, $ZZ$ e
	$n ZZ$, abbiano la stessa cardinalitá.
]

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

Siano $(G, *)$ e $(K, diamond.small)$ due gruppi. Una funzione
$phi.alt: G |-> K$ si dice *omomorfismo* (tra $G$ e $K$) se vale:

$ forall g_(1), g_(2) in G, space phi.alt(g_(1) * g_(2)) =
  phi.alt(g_(1)) diamond.small phi.alt(g_(2)) $

Un omomorfismo iniettivo si dice *monomorfismo*, un omomorfismo suriettivo
si dice *epimorfismo*, un omomorfismo biettivo si dice *isomorfismo* ed un
isomorfismo che mappa due insiemi uguali si dice *automorfismo*.

#example[
	- Si considerino i gruppi $(RR^(+), dot)$ e $(RR, +)$. La funzione
	  $f: RR^(+) |-> RR, ln(x)$ é un omomorfismo, in quanto:

	  $ ln(x_(1) dot x_(2)) = ln(x_(1)) + ln(x_(2)) $
	- Si considerino i gruppi $(RR, dot)$ e $(RR, +)$. La funzione
	  $f: RR |-> RR, sin(x)$ non é un omomorfismo, in quanto:

	  $ sin(x_(1) dot x_(2)) != sin(x_(1)) + sin(x_(2)) $
	- Si considerino i gruppi $(RR^(+), +)$ e $(RR, dot)$. La funzione
	  $f: RR^(+) |-> RR, ln(x)$ non é un omomorfismo, in quanto:

	  $ ln(x_(1) + x_(2)) != ln(x_(1)) dot ln(x_(2)) $
] <ln-is-homomorphism>

Se esiste un isomorfismo fra due gruppi $G$ e $K$, si dice che tali
gruppi sono _isomorfi_, e si indica con $G tilde.eq K$.

Sia $phi.alt: G |-> K$ un omomorfismo tra i gruppi $(G, *)$ e
$(K, diamond.small)$. Prende il nome di *nucleo* di $phi.alt$,
denotato con $ker(phi.alt)$, il sottoinsieme di $G$ cosí definito:

$ ker(phi.alt) = {g in G: phi.alt(g) = 1_(K)} $

Dove $1_(K)$ é l'elemento neutro dell'operazione $diamond.small$.

Prende invece il nome di *immagine* di $phi.alt$, denotata con
$im(phi.alt)$, il sottoinsieme di $K$ cosí definito:

$ im(phi.alt) = {k in K: exists g in G, phi.alt(g) = k} $

#example[
	Come mostrato nell'@ln-is-homomorphism, la funzione $f: RR^(+)
	|-> RR, ln(x)$ é un omomorfismo per i gruppi $(RR^(+), dot)$ e
	$(RR, +)$.

	Essendo $0$ l'elemento neutro rispetto alla somma in $RR$, il
	nucleo di $phi.alt$ é l'insieme che contiene tutti gli elementi
	$x in RR^(+)$ tali per cui $ln(x) = 0$. L'unico valore che soddisfa
	tale espressione é $1$, pertanto $ker(phi.alt) = {1}$.

	L'immagine di $phi.alt$ é l'insieme che contiene tutti gli elementi
	di $y in RR$ tali per cui $y = ln(x)$. Dato che qualsiasi numero reale
	puó essere il risultato dell'applicazione del logaritmo naturale,
	si ha $im(phi.alt) = RR$.
]

#lemma[
	Sia $phi.alt: G |-> K$ un omomorfismo tra i gruppi $(G, *)$ e
	$(K, diamond.small)$. Il nucleo di $phi.alt$ é un sottogruppo
	di $(G, *)$
]
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
