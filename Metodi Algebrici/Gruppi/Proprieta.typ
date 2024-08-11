#import "../Metodi_defs.typ": *

Per comoditá, verranno fatte delle semplificazioni di notazione. Se non
riportato diversamente:

- L'operazione che figura nei gruppi, a prescindere da quale sia,
  verrá denotata con $compose$;
- Per indicare $x compose y$ (con $x, y in G$) verrá usata la notazione
  abbreviata $x y$;
- L'elemento neutro per l'operazione $compose$ verrá indicato con $1$;
- L'applicazione reiterata $k$ volte dell'operazione $compose$ su un $x in G$,
  ovvero $underbrace(x compose x compose ... compose x, k)$, verrá indicata
  con $x^(k)$;
- Il reciproco di un $x in G$ rispetto a $compose$ viene indicato con $overline(x)$;
- Se $(G, compose)$ é un gruppo ed é noto dal contesto che l'operazione
  a cui ci si sta riferendo é $compose$, si indicherá con il solo $G$ la
  coppia $(G, compose)$.

#lemma[
	Sia $G$ un gruppo. Per qualsiasi $x, y, z in G$, vale:

	- Unicitá del reciproco: $exists! x^(-1) : x compose x^(-1) = 1$;
	- Unicitá dell'elemento neutro: $exists! 1 : x compose 1 = x$;
	- Legge di cancellazione (a destra): $x compose y = x compose z => y = z$;
	- Legge di cancellazione (a sinistra): $y compose x = z compose x => y = z$.
]

Dato un gruppo $G$, la struttura algebrica $(H, compose)$ si dice *sottogruppo*
di $G$ se $H$ é un sottoinsieme (anche improprio) di $G$ e se la coppia
$(H, compose)$ forma a sua volta un gruppo. In altre parole, $H = (H, compose)$
é un sottogruppo di $G = (G, compose)$ se:

- L'elemento neutro di $G$ appartiene ad $H$;
- L'insieme $H$ é _chiuso_ rispetto all'operazione $compose$, ovvero $forall h,
  k in H$ si ha $h compose k in H$;
- $forall h in H$, il reciproco $overline(h)$ di $h$ é a sua volta membro di $H$.

Per indicare che $H$ é un sottogruppo di $G$ si usa la notazione $H lt.eq G$.
Se $H$ é un sottogruppo di $G$ ed é distinto da $G$ si dice che $H$ é un
*sottogruppo proprio* di $G$, e si indica con $H < G$.

#lemma[
	Sia $G = (G, compose)$ un gruppo. Un sottoinsieme $H$ di $G$ é un sottogruppo di
	$G$ se e soltanto se, per ogni coppia di elementi (non necessariamente distinti)
	$h, k in H$, vale $h compose overline(k) in H$.
] <Is-a-subgroup>
#proof[
	Se é noto che $H$ sia un sottogruppo di $G$, allora $H$ rispetta certamente
	la proprietá richiesta. Infatti, se $(H, compose)$ é un gruppo, allora é
	chiuso rispetto a $compose$, e quindi $forall h, k in H$ vale $h compose k
	in H$. Inoltre, $forall h in H, overline(h) in H$, pertanto $overline(k) in
	H$, e si ha quindi $h compose overline(k) in H$ per ogni $h, k in H$.

	Viceversa, si supponga che $H$ sia un sottoinsieme di $G$ tale per cui
	$forall h, k in H$ vale $h compose overline(k) in H$:

	- Se $h = k$, allora, per l'unicitá del reciproco, $overline(h) =
	  overline(k)$, e quindi $h compose overline(h) = h compose overline(k)
	  = 1$, quindi l'elemento neutro di $(G, compose)$ appartiene ad $H$;
	- Se $h = 1$ (ed é lecito, avendo appena mostrato che appartiene ad $H$),
	  allora per un qualsiasi $k$ vale $1 compose overline(k) in H$, ma
	  $1 compose overline(k) = overline(k)$ per definizione di elemento
	  neutro. Si ha quindi che $forall h in H$, vale $overline(h) in H$;
	- Siano $h, k in H$. Avendo appena provato che $overline(k)$ appartiene
	  ad $H$ per un qualsiasi $k in H$, vale $h compose overline(overline(k))
	  in H$, ma $overline(overline(k)) = k$, pertanto $h compose k in H$.

	Si ha quindi che $H$ rispetta la definizione di sottogruppo, pertanto $H lt.eq G$.
]

Il @Is-a-subgroup é un possibile criterio che permette di determinare se,
dati due gruppi $G$ ed $H$, $H$ sia un sottogruppo di $G$.

#example[
	La struttura algebrica $(bb(Z), +)$ é un gruppo. La struttura algebrica
	$(n bb(Z), +)$, dove $n bb(Z) = {n k : k in bb(Z)}$ é l'insieme che contiene
	tutti i multipli (interi) di $n$, é un sottogruppo di $(bb(Z), +)$. Siano
	infatti $a$ e $b$ due elementi di $(n bb(Z))$. Si ha:

	$ a + overline(b) = n k_(1) + overline(n k_(2)) = n k_(1) - n k_(2) =
	n (k_(1) - k_(2)) $

	Dato che $(k_(1) - k_(2)) in bb(Z)$, si ha $n (k_(1) - k_(2)) in n bb(Z)$.
	Pertanto, per il @Is-a-subgroup si ha che $(n bb(Z), +)$ é sottogruppo di
	$(bb(Z), +)$.
]

#lemma[
	Per un qualsiasi gruppo $G = (G, compose)$, le strutture algebriche
	$(G, compose)$ e $({1}, compose)$ sono sottogruppi di $G$.
]
#proof[
	- L'insieme $G$ della struttura algebrica $(G, compose)$ é lo stesso
	  insieme che figura nell'insieme $G$ del gruppo $G = (G, compose)$.
	  Pertanto, il @Is-a-subgroup é certamente verificato;
	- L'unico elemento che figura nell'insieme ${1}$ della struttura
	  algebrica $({1}, compose)$ é precisamente $1$. A prescindere di come
	  $compose$ sia definita, si ha $overline(1) = 1$, pertanto $1 compose
	  overline(1) = 1 compose 1 = 1$. Dato che $1 in {1}$, il @Is-a-subgroup
	  é verificato.
]

Per un qualsiasi gruppo $G$, il sottogruppo $G$ viene detto
*sottogruppo improprio*, mentre il sottogruppo ${1}$ viene
detto *sottogruppo banale*.

/*
#lemma[
	Sia $G$ un gruppo $H$ un suo sottogruppo. L'elemento neutro per $G$, oltre
	ad appartenere ad $H$, é anche l'elemento neutro per $H$.
]
#proof[
	L'elemento neutro di un gruppo $G$ é definito rispetto alla sua operazione.
	Pertanto, un sottogruppo $H$ di $G$, dovendo venire definito rispetto alla
	medesima operazione, deve avere lo stesso elemento neutro. Inoltre, per
	definizione di gruppo, tale elemento é unico, pertanto l'unico elemento
	elemento neutro di $H$ é il medesimo (ed unico) elemento neutro per $G$.
]
*/
