#import "../Metodi_defs.typ": *

Prende il nome di *insieme* una qualsiasi collezione di oggetti, detti
_elementi_ o _membri_ dell'insieme. In genere, gli insiemi vengono denotati
con le lettere maiuscole dell'alfabeto latino, mentre i loro elementi con le
lettere minuscole. Per indicare che l'oggetto $a$ é membro dell'insieme $A$
viene usata la notazione $a in A$, e si dice che $a$ _appartiene_ ad $A$.

Per rappresentare gli elementi che appartengono ad un insieme é possibile
sia in maniera *estensionale*, ovvero semplicemente "elencandoli", oppure
in maniera *intensionale*, ovvero specificando una certa proprietá che é
posseduta da tutti ed i soli elementi di quell'insieme. Formalmente, viene
usata questa notazione:

$ underbracket(A = {a_(1)\, a_(2)\, a_(3)\, ...}, "forma estensionale") space.fig space.fig space.fig
  underbracket(A = {a : a "possiede la proprietá caratteristica di" A}, "forma intensionale") $

#example[
	Sia $A$ l'insieme che contiene i colori che possono comparire in un pixel.
	$A$ puó venire descritto equivalentemente nei due modi:

	$ A = {"rosso", "verde", "blu"} space.fig space.fig space.fig
	  A = {a : a "é uno dei colori presenti in un pixel"} $
]

Si noti come un insieme possa essere a sua volta trattato come un oggetto,
e quindi essere membro di un'altro insieme. Inoltre, non é ammesso che un
insieme contenga piú "copie" dello stesso oggetto. Infine, l'ordine in cui
gli elementi di un insieme sono disposti non é rilevante.

Dato un insieme $A$, il numero di elementi che questo contiene é detto
*cardinalitá* e si indica con $|A|$. La cardinalitá di un insieme puó
essere sia _finita_ che _infinita_, pertanto é ammesso che un insieme
possa contenere infiniti elementi.

Siano $A$ e $B$ due insiemi. Si dice che $B$ é un *sottoinsieme* di $A$ se
ogni membro di $B$ é anche membro di $A$, e si indica con $B subset.eq A$.
Equivalentemente, si dice che $A$ é un *soprainsieme* di $B$ se ogni membro
di $B$ é anche membro di $A$, e si indica con $A supset.eq B$. Formalmente:

$ B subset.eq A "se e solo se" forall x in B, x in A
  space.fig space.fig space.fig
  A supset.eq B "se e solo se" forall x in B, x in A $

Due insiemi $A$ e $B$ sono *uguali* se contengono gli stessi elementi, ovvero se
$A subset.eq B$ e $B subset.eq A$, e si indica con $A = B$. Due insiemi $A$ e $B$
sono diversi se esiste almeno un elemento di $A$ che non é contenuto in $B$ oppure
se esiste almeno un elemento di $B$ non contenuto in $A$, e si indica con $A != B$.
Si noti come non sia ammesso che due insiemi siano uguali e distinti. Ovvero, se
per due insiemi $A$ e $B$ vale $A = B$, allora $A$ e $B$ sono lo stesso insieme.

Siano $A$ e $B$ due insiemi. Se $B$ é un sottoinsieme di $A$ ed al contempo non é
uguale ad $A$ si dice che $B$ é un *sottoinsieme proprio* di $A$, e si indica con
$B subset A$. Equivalentemente, se $A$ é un soprainsieme di $B$ ed al contempo non
é uguale a $B$, si dice che $A$ é un *soprainsieme proprio* di $B$, e si indica con
$A supset B$. Formalmente:

$ B subset A "se e solo se" forall x in B, x in A " e " B != A
  space.fig space.fig space.fig
  A supset B "se e solo se" forall x in B, x in A " e " B != A $

Per indicare che l'insieme $B$ _non_ é un sottoinsieme di $A$ viene usata la notazione
$B subset.eq.not A$, mentre per indicare che $B$ _non_ é un sottoinsieme proprio di $A$
viene usata la notazione $B subset.not A$. Similmente, per indicare che l'insieme $A$
_non_ é un soprainsieme di $B$ viene usata la notazione $A supset.eq.not B$, mentre
per indicare che $A$ _non_ é un soprainsieme proprio di $B$ viene usata la notazione
$A supset.not B$.

#lemma[
	Per qualsiasi insieme $A$ valgono: $A subset.eq A$, $A supset.eq A$, $A = A$,
	$A subset.not A$, $A supset.not A$.
] <A-subsupset-itself>
#proof[
	+ Per definizione, $A subset.eq A "se e solo se" forall x in A, x in A$.
	  Essendo $forall x in A, x in A$ una tautologia, si ha $A subset.eq A$;
	+ Analoga alla precedente;
	+ Dato che $A subset.eq A$ e $A supset.eq A$, si ha $A = A$;
	+ Dato che $A subset.eq A$ e $A = A$, si ha $A subset.not A$;
	+ Analoga alla precedente.
]

L'insieme che non contiene alcun elemento viene detto *insieme vuoto*, e si indica
con $emptyset$ oppure con ${}$.

#lemma[
	L'insieme vuoto é sottoinsieme di ogni insieme (compreso di sé stesso).
] <emptyset-subset-every-set>
#proof[
	Dato un qualsiasi insieme $A$, $emptyset$ é un sottoinsieme di $A$ se ogni membro
	di $emptyset$ é anche membro di $A$. Dato che $emptyset$ é l'insieme che non ha
	alcun membro, di fatto rispetta sempre questa definizione, anche nel caso in cui
	$A = emptyset$.
]

A partire da un insieme $A$ é possibile costruire l'*insieme potenza* di $A$, o *insieme
delle parti* di $A$, come l'insieme che contiene tutti i sottoinsiemi di $A$. L'insieme
potenza di $A$ viene indicato con $cal(P) (A)$.

#lemma[
	Per qualsiasi insieme $A$ (compreso $emptyset$), valgono $emptyset in cal(P) (A)$
	e $A in cal(P) (A)$.
]
#proof[
	Dal @A-subsupset-itself si ha $emptyset subset.eq A$, mentre dal
	@emptyset-subset-every-set si ha $A subset.eq A$. Avendo definito
	$cal(P) (A)$ come l'insieme che contiene tutti i sottoinsiemi di
	$A$, $cal(P) (A)$ conterrá certamente (almeno) questi due.
]

#example[
	Sia $A = {"rosso", "verde", "blu"}$. Si ha:

	$ cal(P) (A) = {emptyset, {"rosso"}, {"verde"}, {"blu"}, {"rosso", "verde"},
	  {"rosso", "blu"}, {"verde", "blu"}, {"rosso", "verde", "blu"}} $
]

Dati due insiemi $A$ e $B$, viene detto *unione* di $A$ e di $B$ l'insieme che
contiene tutti gli elementi o di $A$ o di $B$, e si indica con $A union B$:

$ A union B = {x : x in A or x in B} $

Si noti come "$or$" non vada inteso in senso disgiuntivo. Ovvero, un certo elemento
$x$ appartiene ad $A union B$ se appartiene ad $A$, se appartiene a $B$ oppure
se appartiene ad entrambi.

#example[
	Siano $A = {"rosso", "verde", "blu"}$ e $B = {"verde", "giallo", "rosa", "nero"}$.
	Si ha:

	$ A union B = {"rosso", "verde", "blu", "giallo", "rosa", "nero"} $
]

Dati due insiemi $A$ e $B$, viene detto *intersezione* di $A$ e di $B$ l'insieme che
contiene tutti gli elementi di $A$ e di $B$, e si indica con $A sect B$:

$ A sect B = {x : x in A and x in B} $

Si noti come "$and$" vada inteso in senso disgiuntivo. Ovvero, un certo elemento
$x$ appartiene ad $A sect B$ se e soltanto se appartiene contemporaneamente sia
ad $A$ che a $B$.

Se l'intersezione di due insiemi é l'insieme vuoto, ovvero se non esiste alcun
elemento che sia presente contemporaneamente in entrambi gli insiemi, si dice
che tali insiemi sono *disgiunti*.

#example[
	Siano $A = {"rosso", "verde", "blu"}$ e $B = {"verde", "giallo", "rosa", "nero"}$.
	Si ha:

	$ A sect B = {"verde"} $
]

É possibile generalizzare l'unione di $k$ insiemi $A_(1), A_(2), A_(3), ..., A_(k)$
come l'insieme che contiene tutti gli $x$ che compaiono in almeno uno dei $k$ insiemi:

$ union.big_(i = 1)^(k) A_(i) = (... (A_(1) union (A_(2) union (A_(3) union ...)))) union A_(k) =
{x : exists i in {1, 2, ..., k} : x in A_(i)} $

Allo stesso modo, é possibile generalizzare l'intersezione di $k$ insiemi $A_(1), A_(2),
A_(3), ..., A_(k)$ come l'insieme che contiene tutti gli $x$ che compaiono in tutti e $k$
gli insiemi:

$ sect.big_(i = 1)^(k) A_(i) = (... (A_(1) sect (A_(2) sect (A_(3) sect ...)))) sect A_(k) =
{x : x in A_(i) forall i in {1, 2, ..., k}} $

#lemma[
	Siano $A$, $B$ e $C$ tre insiemi. Per la loro unione e la loro intersezione
	valgono le proprietá:

	#grid(columns: (0.625fr, 0.875fr, 1fr),
		block[
			*Commutativa*:
			- $A sect B = B sect A$;
			- $A union B = B union A$.
		],
		block[
			*Associativa*:
			- $(A sect B) sect C = A sect (B sect C)$;
			- $(A union B) union C = A union (B union C)$.
		],
		block[
			*Distributiva*:
			- $A sect (B union C) = (A sect B) union (A sect C)$;
			- $A union (B sect C) = (A union B) sect (A union C)$.
		]
	)

	Il risultato viene generalizzato a $k$ insiemi.
]

Dati due insiemi $A$ e $B$, viene detta *differenza* di $A$ e $B$ l'insieme che
contiene tutti gli elementi di $A$ che non sono contenuti in $B$, e si indica
con $A backslash B$:

$ A backslash B = {x: x in A and x in.not B} $

Siano $A$ e $B$ due insiemi tali per cui $B subset.eq A$. L'insieme $A - B$ viene
detto *complemento* di $B$ rispetto ad $A$, e si indica con $overline(B)$. Quando
é noto dal contesto rispetto a quale insieme un certo insieme viene complementato,
questo viene omesso.

#theorem("Leggi di De Morgan")[
	Siano $A$ e $B$ due sottoinsiemi di un certo insieme $U$. Si ha:

	$ overline(A sect B) = overline(A) union overline(B)
	  space.fig space.fig space.fig
	  overline(A union B) = overline(A) sect overline(B) $

	Il risultato viene generalizzato a $k$ insiemi.
]

Siano $A$ e $B$ due insiemi. Viene detto *prodotto cartesiano* di $A$ e di $B$ l'insieme
costituito da tutte le possibili coppie ordinate costruite a partire dagli elementi di
$A$ e di $B$, e si indica con $A times B$.

$ A times B = {(a, b) : a in A and b in B} $

#example[
	Siano $A = {"rosso", "verde", "blu"}$ e $B = {"verde", "giallo", "rosa", "nero"}$.
	Si ha:

	$ A times B = {&("rosso", "verde"), ("rosso", "giallo"), ("rosso", "rosa"), ("rosso", "nero"), \
	&("verde", "verde"), ("verde", "giallo"), ("verde", "rosa"), ("verde", "nero"), \
	&("blu", "verde"), ("blu", "giallo"), ("blu", "rosa"), ("blu", "nero")} $
]

Il prodotto cartesiano fra due insiemi puó essere generalizzato a $k$ insiemi
$A_(1), A_(2), ..., A_(k)$ come all'insieme costruito da tutte le possibili
$k$-uple ordinate costruite a partire dagli elementi di ogni $A_(i)$ per $i = {1,
..., k}$:

$ product_(i = 1)^(k) A_(i) = A_(1) times A_(2) times ... times A_(k) =
{(a_(1), a_(2), ..., a_(k)) : a_(1) in A_(1) and a_(2) in A_(2) and ... and a_(k) in A_(k)} $

Nel caso particolare in cui tutti e $k$ gli insiemi $A_(1), A_(2), ..., A_(k)$ siano
tutti uguali ad un certo insieme $A$, per indicare il loro prodotto cartesiano si scrive
semplicemente $A^(k)$.
