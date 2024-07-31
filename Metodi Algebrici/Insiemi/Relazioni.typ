#import "../Metodi_defs.typ": *

Dati due insiemi $A$ e $B$, viene detta *corrispondenza* fra
$A$ e $B$ un sottoinsieme $cal(R)$ del loro prodotto cartesiano;
nel caso particolare in cui $A = B$, viene detta *relazione* su
$A$.

Dato un insieme $A$ ed una relazione $cal(R)$ su $A$, per indicare
che una coppia $(a, b) in A times A$ appartiene a $cal(R)$ si usa
dire che $a$ é in _relazione_ con $b$ e si usa la dicitura $a cal(R)
b$.

#example[
	Sia $A = {"rosso", "verde", "blu"}$. Si ha:

	$ A times A = {&("rosso", "rosso"), ("rosso", "verde"), ("rosso", "blu"), ("verde", "rosso"), \
	&("verde", "verde"), ("verde", "blu"), ("blu", "rosso"), ("blu", "verde"), ("blu", "blu")} $

	Una relazione $cal(R)$ su $A$ potrebbe essere:

	$ cal(R) subset.eq A times A =
	{("rosso", "rosso"), ("rosso", "verde"), ("verde", "verde"), ("blu", "verde")} $
]

Dato un insieme $A$ ed una relazione $cal(R)$ su di esso, si dice
che $cal(R)$ é una relazione:

- *riflessiva* se $forall a in A$ si ha $a cal(R) a$;
- *simmetrica* se $forall a, b in A$ $a cal(R) b$ implica $b cal(R) a$;
- *transitiva* se $forall a, b, c in A$ $a cal(R) b$ e $b cal(R) c$ implicano $a cal(R) c$;
- *antisimmetrica* se $forall a, b in A$ $a cal(R) b$ e $b cal(R) a$ implicano $a = b$.

Una relazione puó rientrare in una, piú di una o anche nessuna di queste
categorie.

#example[
	Sia $A = {"rosso", "verde", "blu"}$. Sia:

	$ cal(R)_(1) = {("rosso", "rosso"), ("verde", "verde"), ("rosso", "verde"),
	("verde", "rosso"), ("verde", "blu")} $

	- Non é riflessiva, perché $("blu", "blu") in.not cal(R)_(1)$;
	- Non é simmetrica, perché $("verde", "blu") in cal(R)_(1)$ ma
	  $("blu", "verde") in.not cal(R)_(1)$;
	- Non é transitiva, perché $("rosso", "verde") in cal(R)_(1)$ e
	  $("verde", "blu") in cal(R)_(1)$ ma $("blu", "rosso") in.not cal(R)_(1)$;
	- Non é antisimmetrica, perché $("rosso", "verde") in cal(R)_(1)$ e
	  $("verde", "rosso") in cal(R)_(1)$ ma $"rosso" != "verde"$.

	Sia invece:

	$ cal(R)_(2) = {&("rosso", "rosso"), ("verde", "verde"), ("blu", "blu"),
	("rosso", "verde"), \ &("verde", "rosso"), ("verde", "blu"), ("blu", "verde"),
	("rosso", "blu"), ("blu", "rosso")} $

	Tale relazione é riflessiva, simmetrica e transitiva, ma non é antisimmetrica.
	Sia infine:

	$ cal(R)_(3) = {("rosso", "rosso"), ("verde", "verde"), ("blu", "blu")} $

	Tale relazione é riflessiva, simmetrica, transitiva e antisimmetrica.
]

Dato un insieme $A$, una relazione $cal(R)$ su $A$ che é (almeno)
simmetrica, riflessiva e transitiva viene detta *relazione di equivalenza*.
Le relazioni di equivalenza vengono anche spesso indicate con il simbolo
$tilde.op$.

Siano $A$ un insieme e $tilde.op$ una relazione di equivalenza su $A$. Preso un
qualsiasi elemento $a in A$, si definisce *classe di equivalenza* di $a$
rispetto ad $tilde.op$ l'insieme:

$ [a]_(tilde.op) = {b: b in A and b tilde.op a} $

Ovvero, l'insieme che contiene tutti gli elementi di $A$ che sono in
relazione con $a$. Un qualsiasi elemento di una classe di equivalenza
viene detto *rappresentante* di tale classe.

#example[
	Sia $A = {"rosso", "verde", "blu", "giallo"}$. Si consideri la relazione di equivalenza:

	$ tilde.op space = {&("rosso", "rosso"), ("verde", "verde"), ("blu", "blu"), ("giallo", "giallo"), ("rosso", "giallo"), \
	&("giallo", "blu"), ("rosso", "blu"), ("blu", "rosso"), ("giallo", "rosso"), ("blu", "giallo")} $

	Si hanno le seguenti quattro classi di equivalenza:

	#set math.mat(column-gap: 2.5em, delim: none)
	$ mat(["verde"]_(tilde.op) = {"verde"}, ["blu"]_(tilde.op) = ["giallo"]_(tilde.op) =
	  ["rosso"]_(tilde.op) = {"rosso", "giallo", "blu"}) $
] <Equiv-classes>

#lemma[
	Per qualsiasi insieme $A$, per qualsiasi relazione di equivalenza $tilde.op$
	su $A$ e per qualsiasi $a in A$, si ha $[a]_(tilde.op) != emptyset$.
] <Equiv-not-empty>
#proof[
	Essendo $tilde.op$ una relazione di equivalenza, deve essere anche riflessiva,
	ovvero deve valere $a tilde.op a$. Pertanto, $[a]_(tilde.op)$ deve contenere
	almeno $a$, e quindi non é un insieme vuoto.
]

#lemma[
	Siano $A$ un insieme non vuoto e $tilde.op$ una relazione di equivalenza
	su $A$. Per ogni $a, b in A$, si ha $[a]_(tilde.op) = [b]_(tilde.op)$
	oppure $[a]_(tilde.op) sect [b]_(tilde.op) = emptyset$. Ovvero, o le
	classi di equivalenza di $a$ e di $b$ sono lo stesso insieme o sono due
	insiemi disgiunti.
] <Equiv-disjoint>
#proof[
	Si supponga $[a]_(tilde.op) sect [b]_(tilde.op) != emptyset$, e sia $c
	in [a]_(tilde.op) sect [b]_(tilde.op)$. Per definizione di intersezione,
	si ha $c in [a]_(tilde.op)$ e $c in [b]_(tilde.op)$, ma questo equivale
	a dire $c tilde.op a$ e $c tilde.op b$. Essendo $tilde.op$ una relazione
	di equivalenza, deve essere simmetrica, pertanto valendo $c tilde.op a$
	vale anche $a tilde.op c$. Per lo stesso motivo, deve essere anche
	transitiva, pertanto valendo $a tilde.op c$ e $c tilde.op b$ allora
	vale anche $a tilde.op b$, cioè $a in [b]_(tilde.op)$. Essendo $tilde.op$
	simmetrica, se vale $a tilde.op b$ allora vale anche $b tilde.op a$.

	Sia $x in A$ un elemento generico per cui vale $x in [a]_(tilde.op)$, ovvero
	$x tilde.op a$. Avendo provato che vale $a tilde.op b$ ed essendo $tilde.op$
	transitiva, vale anche $x tilde.op b$, ovvero $x in [b]_(tilde.op)$. Essendo
	$x$ un elemento generico, significa che questa proprietá vale per qualsiasi
	elemento di $[a]_(tilde.op)$, ovvero che qualsiasi elemento di $[a]_(tilde.op)$
	é anche elemento di $[b]_(tilde.op)$. In altre parole, $[a]_(tilde.op)
	subset.eq [b]_(tilde.op)$.

	Sia $y in A$ un elemento generico per cui vale $y in [b]_(tilde.op)$, ovvero
	$y tilde.op b$. Avendo provato che vale $b tilde.op a$ ed essendo $tilde.op$
	transitiva, vale anche $y tilde.op a$, ovvero $y in [a]_(tilde.op)$. Essendo
	$y$ un elemento generico, significa che questa proprietá vale per qualsiasi
	elemento di $[b]_(tilde.op)$, ovvero che qualsiasi elemento di $[b]_(tilde.op)$
	é anche elemento di $[a]_(tilde.op)$. In altre parole, $[b]_(tilde.op)
	subset.eq [a]_(tilde.op)$.

	Avendo provato che vale sia $[a]_(tilde.op) subset.eq [b]_(tilde.op)$ sia
	$[b]_(tilde.op) subset.eq [a]_(tilde.op)$, per definizione di uguaglianza
	fra insiemi vale $[a]_(tilde.op) = [b]_(tilde.op)$. É stato allora provato
	che se $[a]_(tilde.op) sect [b]_(tilde.op) != emptyset$, allora $[a]_(tilde.op)
	= [b]_(tilde.op)$. Ma questa proposizione equivale ad asserire che vale o
	$[a]_(tilde.op) = [b]_(tilde.op)$ o $[a]_(tilde.op) sect [b]_(tilde.op) =
	emptyset$, e pertanto il lemma é provato.
]

Dato un insieme $A$ ed una relazione di equivalenza $tilde.op$ su $A$, viene detto
*insieme quoziente* l'insieme $A slash tilde.op$ che contiene tutte le classi di
equivalenza (distinte) di $tilde.op$. Ovvero:

	$ A slash tilde.op space = {[a]_(tilde.op), a in A} $

#example[
	Nell'@Equiv-classes si ha $A slash tilde.op space = {["blu"]_(tilde.op),
	["verde"]_(tilde.op)}$.
]

Sia $A$ un insieme diverso da $emptyset$, e sia $cal(F) = {X_(1), X_(2), ...,
X_(k)}$ un insieme che contiene $k$ sottoinsiemi di $A$. $cal(F)$ viene detto
*partizione* di $A$ se:

- $forall i in {1, ..., k}$, si ha $X_(i) != emptyset$;
- $forall i, j in {1, ..., k}$ si ha $X_(i) sect X_(j) = emptyset$.
  Ovvero, ciascun sottoinsieme é disgiunto da tutti gli altri;
- $union.big_(i = 1)^(k) X_(i) = A$. Ovvero, l'unione di tutti i
  sottoinsiemi restituisce l'insieme di partenza.

#example[
	Sia $A = {"rosso", "verde", "blu", "giallo", "rosa", "nero", "bianco", "grigio"}$.
	Una possibile partizione di tale insieme é data da:

	$ cal(F) = {X_(1), X_(2), X_(3)} = {{"rosso", "nero", "bianco", "giallo", "grigio"},
	{"verde", "blu"}, {"rosa"}} $
]

#theorem("Equivalenza fra insieme quoziente e partizioni")[
	Sia $A$ un insieme e sia $tilde.op$ una relazione di equivalenza su $A$.
	L'insieme quoziente $A slash tilde.op$ determina una partizione su $A$.
	Allo stesso modo, sia $cal(F) = {X_(1), X_(2), ..., X_(k)}$ una partizione
	di $A$; la relazione $cal(R)$ definita come $a cal(R) b <==> {exists i in
	{1, ..., k} "t.c." a, b in X_(i)}$ é una relazione di equivalenza su $A$.
]
#proof[
	Si osservi come:

	- Per il @Equiv-not-empty, ogni classe di equivalenza di un qualsiasi insieme
	  non é l'insieme vuoto;
	- Per il @Equiv-disjoint, ogni classe di equivalenza di un qualsiasi insieme
	  é o uguale ad un'altra o disgiunta da questa. Essendo l'insieme quoziente
	  costituito da sole classi di equivalenza distinte, si ha che ciascuna
	  classe che lo compone é distinta da tutte le altre;
	- Dato che $[a]_(tilde.op) subset.eq A$ per qualsiasi $a in A$, é evidente
	  come $union.big_(a in A) [a]_(tilde.op) subset.eq A$. Inoltre, sempre per
	  il @Equiv-not-empty, ogni $a in A$ appartiene a $[a]_(tilde.op)$, e quindi
	  $A subset.eq union.big_(a in A) [a]_(tilde.op)$. Unendo questo risultato
	  al precedente, si ha $A = union.big_(a in A) [a]_(tilde.op)$.

	Ovvero, $A slash tilde.op$ risponde alla definizione di partizione. D'altra
	parte, sia $cal(R)$ la relazione definita come $a cal(R) b <==> {exists i in
	{1, ..., k} "t.c." a, b in X_(i)}$. Tale relazione é:

	- Riflessiva, perché per definizione di partizione ogni $X_(i)$ non é vuoto,
	  pertanto esiste sempre almeno un $a in A$ che vi appartenga, e quindi
	  $a cal(R) a$ é sempre verificato;
	- Simmetrica, perché se $a, b in X_(i)$ allora $b, a in X_(i)$, dato che
	  gli elementi di un insieme non sono ordinati;
	- Transitiva, perché se $a, b in X_(i)$ e $b, c in X_(i)$, allora $a, c in
	  X_(i)$.

	Pertanto, é una relazione di equivalenza.
]
