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
	$(G, diamond.small)$ e $({1}, diamond.small)$ sono sottogruppi di $G$.
]
#proof[
	- L'insieme $G$ della struttura algebrica $(G, diamond.small)$ é lo stesso
	  insieme che figura nell'insieme $G$ del gruppo $G = (G, diamond.small)$.
	  Pertanto, il @Is-a-subgroup é certamente verificato;
	- L'unico elemento che figura nell'insieme ${1}$ della struttura
	  algebrica $({1}, diamond.small)$ é precisamente $1$. A prescindere
	  di come $diamond.small$ sia definita, si ha $overline(1) = 1$,
	  pertanto $1 diamond.small overline(1) = 1 diamond.small 1 = 1$.
	  Dato che $1 in {1}$, il @Is-a-subgroup é verificato.
]

Per un qualsiasi gruppo $G$, il sottogruppo $G$ viene detto
*sottogruppo improprio*, mentre il sottogruppo ${1}$ viene
detto *sottogruppo banale*.

/*
#lemma[
	Sia $G$ un gruppo $H$ un suo sottogruppo. L'elemento neutro per $G$,
	oltre ad appartenere ad $H$, é anche l'elemento neutro per $H$.
]
#proof[
	L'elemento neutro di un gruppo $G$ é definito rispetto alla sua operazione.
	Pertanto, un sottogruppo $H$ di $G$, dovendo venire definito rispetto alla
	medesima operazione, deve avere lo stesso elemento neutro. Inoltre, per
	definizione di gruppo, tale elemento é unico, pertanto l'unico elemento
	elemento neutro di $H$ é il medesimo (ed unico) elemento neutro per $G$.
]
*/
