#import "../Metodi_defs.typ": *

La struttura algebrica $(A, *, diamond.small)$ prende il nome di *anello*
se sono rispettate le seguenti proprietá:

- $(A, *)$ é un gruppo abeliano;
- $(A, diamond.small)$ é un semigruppo;
- L'operazione $diamond.small$ gode della *proprietá distributiva* rispetto
  a $*$, ovvero:

  $ a diamond.small (b * c) = (a diamond.small b) * (a diamond.small c)
    space " e " space
    (a * b) diamond.small c = (a diamond.small c) * (b diamond.small c)
    space space space forall a, b in A $

Se $diamond.small$ gode inoltre della proprietá commutativa, ovvero se
$(A, diamond.small)$ é abeliano, allora si dice che $(A, *, diamond.small)$
é un *anello commutativo*.

Se $(A, diamond.small)$ é un monoide (oltre che un semigruppo), ovvero se
esiste per $diamond.small$ un elemento neutro, $(A, *, diamond.small)$ é un
*anello unitario*. Se non diversamente specificato, nel parlare di "anelli"
in generale si stará sottointendendo di stare considerando anelli unitari.

#example[
	- $(ZZ, +, dot)$, $(QQ, +, dot)$ e $(ZZ_(n) , +, dot)$
	  sono anelli commutativi;
	- $("Mat"(2 times 2, QQ), +, ·)$ é un anello,
	  ma non é commutativo.
]

L'anello $(A, *, diamond.small)$ prende il nome di *campo* se é commutativo,
unitario e se $(A - {1_(diamond.small)}, diamond.small)$ é un gruppo.

#example[
	- $(QQ, +, dot)$ é un campo;
	- $(ZZ_(n) , +, dot)$ é un campo solamente se $n$ é un numero primo;
	- $(ZZ, +, dot)$ non é un campo.
]

Le proprietá che le operazioni di un anello devono rispettare sono analoghe
alle proprietá che possiedono rispettivamente la somma ed il prodotto fra
interi. Per tal motivo, gli anelli vengono spesso scritti semplicemente come
$(A, +, dot)$, dove le due operazioni sono chiamate "somma" e "prodotto",
anche se queste non sono necessariamente la somma ed il prodotto comunemente
intesi.

#lemma[
	Sia $(A, *, diamond.small)$ un anello. Per ogni $a, b in A$ e per ogni
	$n in ZZ$, si ha:

	- $1_(*) diamond.small a = a diamond.small 1_(*) = 1_(*)$;
	- $a diamond.small b^(-1)_(*) =
	   a^(-1)_(*) diamond.small b =
	   (a diamond.small b)^(-1)_(*)$;
	- $(n diamond.small a) diamond.small b =
	   a diamond.small (n diamond.small b) =
	   n diamond.small (a diamond.small b)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Sia $(A, *, diamond.small)$ un anello. L'anello $(B, *, diamond.small)$
si dice *sottoanello* di $A$ se:

- $B$ é un sottoinsieme di $A$;
- $(B, *)$ é un sottogruppo di $(A, *)$;
- $B$ é un insieme chiuso rispetto a $diamond.small$;
- $B$ contiene $1_(diamond.small)$.

Per indicare che l'anello $(B, *, diamond.small)$ é un sottoanello
dell'anello $(A, *, diamond.small)$ si usa la notazione $(B, *,
diamond.small) lt.eq (A, *, diamond.small)$.

#lemma[
	Sia $(A, *, diamond.small)$ un anello. La struttura algebrica
	$(B, *, diamond.small)$ é un sottoanello di $(A, *, diamond.small)$
	se e soltanto se:

	- $B subset.eq A$;
	- Per qualsiasi $h, k in B$, si ha $h * k^(-1)_(*) in B$.
	- Per qualsiasi $h, k in B$, si ha $h diamond.small k in B$.
	- $1_(diamond.small) in B$.
] <Is-a-subring>

Il @Is-a-subring fornisce un metodo alternativo e piú semplice per
determinare se due anelli siano l'uno un sottoanello dell'altro.

#example[
	+ L'anello $(ZZ, +, dot)$ é un sottoanello di $(QQ, +, dot)$. Infatti:
	  - $ZZ$ é un sottoinsieme di $QQ$;
	  - Presi due interi $a$ e $b$, si ha $a + (-b) = a - b in ZZ$;
	  - Presi due interi $a$ e $b$, si ha $a dot b = a b in ZZ$;
	  - L'elemento neutro di $1_(dot)$ é $1$, che appartiene a $ZZ$;
	+ L'anello $(QQ, +, dot)$ é un sottoanello di $(RR, +, dot)$. Infatti:
	  - $QQ$ é un sottoinsieme di $RR$;
	  - Presi due razionali $a$ e $b$, si ha $a + (-b) = a - b in QQ$;
	  - Presi due razionali $a$ e $b$, si ha $a dot b = a b in QQ$;
	  - L'elemento neutro di $1_(dot)$ é $1$, che appartiene a $QQ$;
]

Sia $(A, *, diamond.small)$ un anello. Un sottoinsieme $I$ di $A$ si dice un
*ideale* di $(A, *, diamond.small)$ se:

- $I != emptyset$;
- $(I, *)$ é un sottogruppo di $(A, *)$;
- Per ogni $a in A$ e $i in I$, si ha $a diamond.small i in I$ e
  $i diamond.small a in I$.

Per indicare che un sottoinsieme $I$ di $A$ é un ideale dell'anello
$(A, *, diamond.small)$ si usa la notazione $I triangle.l (A, *,
diamond.small)$.

#lemma[
	Per un qualsiasi anello $(A, *, diamond.small)$, gli insiemi $A$ e
	${1_(*)}$ sono ideali di $(A, *, diamond.small)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#lemma[
	Sia $(A, *, diamond.small)$ un anello commutativo e sia $x$ un
	elemento di $A$. L'insieme $I = {a diamond.small x : a in A}$ é
	un ideale di $(A, *, diamond.small)$.
] <Principal-ideal-generated>
#proof[
	L'insieme $I$ é un ideale in quanto:
	- $1_(diamond.small) diamond.small x = x$, e $1_(diamond.small)
	  diamond.small x in I$ perché rispetta la definizione. Pertanto,
	  $I$ non puó essere vuoto;
	- Per ogni $a diamond.small x, b diamond.small x in I$,
	  si ha $a diamond.small x * (b diamond.small x)^(-1)_(*)
	  = (a * b^(-1)_(*)) diamond.small x in I$;
	- Per ogni $b in A$ e per ogni $a diamond.small x in I$, si ha
	  $b diamond.small (a diamond.small x) = (b diamond.small a)
	  diamond.small x in I$ e $(a diamond.small x) diamond.small b
	  = (a diamond.small b) diamond.small x in I$;
]

In particolare, per un anello commutativo $(A, *, diamond.small)$ l'insieme
$I$ dell'@Principal-ideal-generated viene chiamato *ideale principale generato
da* $A$.

#lemma[
	Sia $(A, *, diamond.small)$ un anello e sia $I$ un suo ideale.
	$(I, *)$ é un sottogruppo normale di $(A, *)$;
] <Ideal-is-normal>
#proof[
	Affinché $I$ sia un ideale di $(A, *, diamond.small)$ é (anche)
	necessario che, per ogni $i, j in I$, si ha $i * j^(-1)_(*) in I$.
	Questo é peró precisamente il criterio espresso nel @Is-a-subgroup
	rispetto all'operazione $*$, pertanto $(I, *)$ é un sottogruppo di
	$(A, *)$. Inoltre, affinché $(A, *, diamond.small)$ possa essere un
	anello si richiede che $(A, *)$ sia un gruppo abeliano; per il
	@Abelian-normal-subgroups si ha che $(I, *)$ é un sottogruppo
	normale di $(A, *)$.
]

Sia $(A, *, diamond.small)$ un anello e sia $I$ un suo ideale. Per il
@Ideal-is-normal, $(I, *)$ é un sottogruppo normale di $(A, *)$, ed é
quindi possibile definire, come é stato fatto per i gruppi, un insieme
quoziente $A slash I = {a * I: a in A}$. É possibile definire delle
operazioni di somma e di prodotto (entrambe ben definite) su $A slash I$
in questo modo:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ (a * I) + (b * I) = (a * b) * I $],
	[$ (a * I) dot (b * I) = (a diamond.small b) * I $]
)

#theorem[
	Siano $(A, *, diamond.small)$ un anello ed $I$ un suo ideale.
	La struttura algebrica $(A slash I, +, dot)$ é un anello.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Siano $(A, *, diamond.small)$ un anello ed $I$ un suo ideale. L'anello
$(A slash I, +, dot)$ prende il nome di *anello quoziente* di $(A, *,
diamond.small)$ rispetto a $I$.

Siano $(A, *, diamond.small)$ e $(B, star.op, dot.circle)$ due anelli con
unitá. Un'applicazione $phi.alt : A |-> B$ si dice *omomorfismo di anelli*
(con unitá) se preserva le due operazioni e l'unitá rispetto alla seconda
operazione, ovvero se:

+ Per ogni $a_(1), a_(2) in A$, si ha
  $phi.alt(a_(1) * a_(2)) = phi.alt(a_(1)) star.op phi.alt(a_(2))$;
+ Per ogni $a_(1), a_(2) in A$, si ha
  $phi.alt(a_(1) diamond.small a_(2)) =
  phi.alt(a_(1)) dot.circle phi.alt(a_(2))$;
+ $phi.alt(1_(diamond.small)) = 1_(dot.circle)$.

Un omomorfismo di anelli iniettivo si dice monomorfismo, un
omomorfismo di anelli suriettivo si dice epimorfismo, ed un
omomorfismo di anelli biettivo si dice isomorfismo.

#lemma[
	Siano $(A, *, diamond.small)$ e $(B, star.op, dot.circle)$ due anelli
	con unitá, per i quali esiste un omomorfismo $phi.alt : A |-> B$. Si
	ha $phi.alt(1_(*)) = 1_(star.op)$ e $phi.alt(a^(-1)_(*)) =
	(phi.alt(a))^(-1)_(*)$ per qualsiasi $a in A$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Sia $phi.alt: A |-> B$ un omomorfismo tra gli anelli $(A, *, diamond.small)$
e $(B, star.op, dot.circle)$. Prende il nome di *nucleo* di $phi.alt$,
denotato con $ker(phi.alt)$, il sottoinsieme di $A$ cosí definito:

$ ker(phi.alt) = {a in A: phi.alt(a) = 1_(star.op)} $

Prende invece il nome di *immagine* di $phi.alt$, denotata con
$Im(phi.alt)$, il sottoinsieme di $B$ cosí definito:

$ Im(phi.alt) = {b in B: exists a in A, phi.alt(a) = b} $

#lemma[
	Sia $phi.alt: A |-> B$ un omomorfismo tra gli anelli
	$(A, *, diamond.small)$ e $(B, star.op, dot.circle)$.
	Il nucleo di $phi.alt$ é un ideale di $(A, *, diamond.small)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#lemma[
	Sia $phi.alt: A |-> B$ un omomorfismo tra gli anelli
	$(A, *, diamond.small)$ e $(B, star.op, dot.circle)$.
	L'immagine di $phi.alt$ é un sottoanello di $(B, star.op,
	dot.circle)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#theorem[
	Sia $phi.alt: A |-> B$ un omomorfismo tra gli anelli
	$(A, *, diamond.small)$ e $(B, star.op, dot.circle)$.
	Il gruppo quoziente $(A slash ker(phi.alt), dot)$ é
	isomorfo a $(Im(phi.alt), dot.circle)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]
