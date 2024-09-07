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

#lemma[
	Sia $(A, +, dot)$ un anello. Per ogni $a, b in A$ e per ogni $n in ZZ$,
	si ha:

	- $0_(A) dot a = a dot 0_(A) = 0_(A)$;
	- $a dot overline(b) = overline(a) dot b = overline(a dot b)$;
	- $(n dot a) dot b = a dot (n dot b) = n dot (a dot b)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Sia $(A, +, dot)$ un anello. L'anello $(B, +, dot)$ si dice *sottoanello*
di $A$ se:

- $B$ é un sottoinsieme di $A$;
- $(B, +)$ é un sottogruppo di $(A +)$;
- $B$ é un insieme chiuso rispetto a $dot$;
- $B$ contiene $1_(A)$.

Per indicare che l'anello $(B, +, dot)$ é un sottoanello dell'anello
$(A, +, dot)$ si usa la notazione $(B, +, dot) lt.eq (A, +, dot)$.

#lemma[
	Sia $(A, +, dot)$ un anello. La struttura algebrica $(B, +, dot)$ é un
	sottoanello di $(A, +, dot)$ se e soltanto se:

	- $B subset.eq A$;
	- Per qualsiasi $b_(1), b_(2) in B$, si ha $b_(1) + overline(b_(2)) in B$.
	- Per qualsiasi $b_(1), b_(2) in B$, si ha $b_(1) dot b_(2) in B$.
	- $1_(A) in B$.
] <Is-a-subring>

Il @Is-a-subring fornisce un metodo alternativo e piú semplice per
determinare se due anelli siano l'uno un sottoanello dell'altro.

#example[
	+ L'anello $(ZZ, +, dot)$ é un sottoanello di $(QQ, +, dot)$. Infatti:
	  - $ZZ$ é un sottoinsieme di $QQ$;
	  - Presi due interi $a$ e $b$, si ha $a + overline(b) = a + (-b) =
	    a - b in ZZ$;
	  - Presi due interi $a$ e $b$, si ha $a dot b = a b in ZZ$;
	  - L'elemento neutro di $1_(QQ)$ é $1$, che appartiene a $ZZ$;
	+ L'anello $(QQ, +, dot)$ é un sottoanello di $(RR, +, dot)$. Infatti:
	  - $QQ$ é un sottoinsieme di $RR$;
	  - Presi due razionali $a$ e $b$, si ha $a + overline(b) = a + (-b) =
	    a - b in QQ$;
	  - Presi due razionali $a$ e $b$, si ha $a dot b = a b in QQ$;
	  - L'elemento neutro di $1_(RR)$ é $1$, che appartiene a $QQ$;
]

Sia $(A, +, dot)$ un anello. Un sottoinsieme $I$ di $A$ si dice un
*ideale* di $(A, +, dot)$ se:

- $I$ non é l'insieme vuoto;
- Per ogni $i_(1), i_(2) in I$, si ha $i_(1) + overline(i_(2)) in I$;
- Per ogni $a in A$ e $i in I$, si ha $a dot i in I$ e $i dot a in I$.

Per indicare che un sottoinsieme $I$ di $A$ é un ideale dell'anello
$(A, +, dot)$ si usa la notazione $I triangle.l (A, +, dot)$.

#lemma[
	Per un qualsiasi anello $(A, +, dot)$, gli insiemi $A$ e ${0_(A)}$
	sono ideali di $(A, +, dot)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#example[
	+ Sia $(A, +, dot)$ un anello commutativo e sia $x$ un elemento di
	  $A$. L'insieme $I = {a x : a in A}$ é un ideale di $(A, +, dot)$,
	  chiamato *ideale principale generato da* $A$.

	  Si noti innanzitutto infatti che $I$ non puó essere l'insieme
	  vuoto, perché $1_(A) x = x$, e $1_(A) x in I$ perché rispetta
	  la definizione. Inoltre, per ogni $a_(1) x, a_(2) x in I$, si
	  ha $a_(1) x - a_(2) x = (a_(1) - a_(2)) x in I$. Infine, per
	  ogni $b in A$ e per ogni $a x in I$, si ha $b(a x) = (b a)x
	  in I$ e $(a x)b = (a b)x in I$;
	+ Sia $K[x]$ l'anello dei polinomi nell'incognita $x$ a coefficienti
	  in un campo $K$. Per un certo $g(x) in K[x]$ fissato, l'insieme
	  $I = {a(x) g(x) : a(x) in K[x]}$ é un ideale di $K[x]$.
]

#lemma[
	Sia $(A, +, dot)$ un anello e sia $I$ un suo ideale. $(I, +)$ é un
	sottogruppo normale di $(A, +)$;
] <Ideal-is-normal>
#proof[
	Affinché $I$ sia un ideale di $(A, +, dot)$ é (anche) necessario
	che, per ogni $i_(1), i_(2) in I$, si ha $i_(1) + overline(i_(2))
	in I$. Questo é peró precisamente il criterio espresso nel
	@Is-a-subgroup rispetto all'operazione $+$, pertanto $(I, +)$ é
	un sottogruppo di $(A, +)$. Inoltre, affinché $(A, +, dot)$ possa
	essere un anello si richiede che $(A, +)$ sia un gruppo abeliano;
	per il @Abelian-normal-subgroups si ha che $(I, +)$ é un sottogruppo
	normale di $(A, +)$.
]

Sia $(A, +, dot)$ un anello e sia $I$ un suo ideale. Per il @Ideal-is-normal,
é possibile definire l'insieme quoziente $A slash I = {a + I: a in A}$. A
partire da questo, é possibile costruire un gruppo quoziente $(A slash I, +)$
similmente a come é stato fatto per i gruppi, con la differenza che
l'operazione $+$ é definita come:

$ (a + I) + (b + I) = (a + b) + I space forall a, b in A $

É possibile definire una legge $dot$ su $A slash I$ in questo modo:

$ (a + I) dot (b + I) = a dot b + I space
  forall (a + I), (b + I) in A slash I $

#lemma[
	Siano $(A, +, dot)$ un anello ed $I$ un suo ideale. La legge $dot$
	definita come $(a + I) dot (b + I) = a dot b + I space forall (a + I),
	(b + I) in A slash I$ é una funzione.
]
// #proof[
//	Dimostrabile, da aggiungere
// ]

#theorem[
	Siano $(A, +, dot)$ un anello ed $I$ un suo ideale. La struttura
	algebrica $(A slash I, +, dot)$, dove $+$ e $dot$ sono le due
	operazioni sull'insieme quoziente $A slash I$ come sopra definite,
	é un anello.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Siano $(A, +, dot)$ un anello ed $I$ un suo ideale. L'anello $(A slash I,
+, dot)$ prende il nome di *anello quoziente* di $(A, +, dot)$ rispetto a
$I$.

Siano $(A, +, dot)$ e $(B, +, dot)$ due anelli con unitá. Un'applicazione
$phi.alt : A |-> B$ si dice *omomorfismo di anelli* (con unitá) se preserva
le due operazioni e l'unitá, ovvero se:

+ Per ogni $a_(1), a_(2) in A$, si ha
  $phi.alt(a_(1) + a_(2)) = phi.alt(a_(1)) + phi.alt(a_(2))$;
+ Per ogni $a_(1), a_(2) in A$, si ha
  $phi.alt(a_(1) dot a_(2)) = phi.alt(a_(1)) dot phi.alt(a_(2))$;
+ $phi.alt(1_(A)) = 1_(B)$.

Un omomorfismo di anelli iniettivo si dice monomorfismo, un
omomorfismo di anelli suriettivo si dice epimorfismo, ed un
omomorfismo di anelli biettivo si dice isomorfismo.

#lemma[
	Siano $(A, +, dot)$ e $(B, +, dot)$ due anelli con unitá,
	per i quali esiste un omomorfismo $phi.alt : A |-> B$. Si
	ha $phi.alt(0_(A)) = 0_(B)$ e $phi.alt(overline(a)) =
	overline(phi.alt(a))$ per qualsiasi $a in A$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Sia $phi.alt: A |-> B$ un omomorfismo tra gli anelli $(A, +, dot)$
e $(B, +, dot)$. Prende il nome di *nucleo* di $phi.alt$, denotato
con $ker(phi.alt)$, il sottoinsieme di $A$ cosí definito:

$ ker(phi.alt) = {a in A: phi.alt(a) = 0_(B)} $

Prende invece il nome di *immagine* di $phi.alt$, denotata con
$Im(phi.alt)$, il sottoinsieme di $B$ cosí definito:

$ Im(phi.alt) = {b in B: exists a in A, phi.alt(a) = b} $

#lemma[
	Sia $phi.alt: A |-> B$ un omomorfismo tra gli anelli
	$(A, +, dot)$ e $(B, +, dot)$. Il nucleo di $phi.alt$
	é un ideale di $(A, +, dot)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#lemma[
	Sia $phi.alt: A |-> B$ un omomorfismo tra gli anelli
	$(A, +, dot)$ e $(B, +, dot)$. L'immagine di $phi.alt$
	é un sottoanello di $(B, +, dot)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#theorem[
	Sia $phi.alt: A |-> B$ un omomorfismo tra gli anelli $(A, +, dot)$
	e $(B, +, dot)$. Il gruppo quoziente $(A slash ker(phi.alt), dot)$
	é isomorfo a $(Im(phi.alt), dot)$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]
