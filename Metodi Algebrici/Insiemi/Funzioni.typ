#import "../Metodi_defs.typ": *

Siano $A$ e $B$ due insiemi. Una *funzione* (o *applicazione*) da $A$
a $B$ é una legge $f$ che ad ogni elemento di $A$ associa uno ed un
solo elemento di $B$:

$ f : A |-> B, f(a) = b $

Dove $A$ é detto *dominio* di $f$ e $B$ é detto *codominio* di $f$.

Di fatto, una funzione $f$ da $A$ a $B$ é un caso particolare di una
corrispondenza $cal(R)_(f)$ da $A$ a $B$ dove il secondo termine di
ciascuna coppia ordinata che la compone é sempre univoco:

$ f : A |-> B " equivale a " cal(R)_(f) : forall a in A,
  exists ! b = f(a) in B : (a, b) in cal(R)_(f) $

Per ogni $a in A$, il suo "corrispettivo" in $B$, ovvero $b = f(a)$,
si dice *immagine* di $A$. L'insieme che contiene l'immagine di ciascun
elemento dell'insieme $A$, ovvero $f(A) = {f(a): a in A}$, viene chiamato
*immagine* di $f$, e viene indicato anche semplicemente con $Im(f)$.

Per ogni $b in B$, l'elemento $a$ di $A$ per il quale $b$ ne é il
"corrispettivo", ovvero $a: f(a) = b$, viene detto *controimmagine*
di $b$. L'insieme che contiene le controimmagini di ciascun elemento
dell'insieme $B$, ovvero ${a in A: f(a) in B}$, viene chiamato
*controimmagine* di $f$, e viene indicato anche semplicemente con
$Im^(-1) (f)$.

#example[
	- La legge che associa a ciascun numero razionale $frac(a, b)$ associa
	  un numero intero $a + b$ non é una funzione. Questo perché $frac(a, b)
	  = frac(h a, h b) forall h != 0$, pertanto ad ogni $frac(a, b)$ é
	  associata una moltitudine di valori, non uno soltanto. Ad esempio,
	  alla frazione $frac(2, 3)$ viene associato sia $5$, sia $10$;
	- La legge $f : ZZ -> ZZ, f(z) = z^(2)$, che associa a ciascun
	  numero intero il suo quadrato, é una funzione;
	- Il sottoinsieme ${(z, 7), z in ZZ} subset.eq ZZ times ZZ$,
	  ovvero l'insieme composto da tutte le coppie ordinate del prodotto
	  cartesiano di $ZZ$ con sé stesso che hanno 7 come secondo elemento,
	  é una funzione. Tale sottoinsieme puó essere scritto in maniera piú
	  esplicita nella forma di legge come $f: ZZ -> ZZ, f(z) = 7$.
]

Siano dati due insiemi $A$ e $B$ ed una funzione $f : A |-> B$. Si
dice che $f$ é *iniettiva* se ad elementi distinti di $A$ vengono
sempre associati elementi distinti di $B$:

$ a_(1), a_(2) in A : a_(1) != a_(2) ==> f(a_(1)) != f(a_(2)) $

Si dice che $f$ é *suriettiva* se il codominio $B$ e l'insieme $f(A)$
coincidono, ovvero se ogni elemento di $B$ ha almeno una controimmagine:

$ forall b in B, exists a in A : f(a) = b $

Si dice che $f$ é *biettiva*, o *biunivoca*, se é sia iniettiva sia
suriettiva. In altre parole, $f$ é biettiva se ad elementi distinti
di $A$ vengono associati elementi distinti di $B$ e se ciascun
elemento di $B$ ha sempre una controimmagine:

$ forall b in B, exists ! a in A : f(a) = b $

#example[
	- La funzione $f: ZZ -> ZZ, f(z) = 0$ non é iniettiva, perché ogni
	  elemento di $ZZ$ viene sempre associato allo stesso elemento di
	  $ZZ$ (lo $0$, in questo caso). Inoltre, non é suriettiva, perché
	  tutti gli elementi del codominio al di fuori di $0$ non hanno una
	  controimmagine;
	- La funzione $f: ZZ |-> ZZ, f(z) = z^(2)$ non é iniettiva, perché
	  se per un certo $a in ZZ$ vale $b = f(a)$, anche per $-a in ZZ$
	  vale $b = f(-a)$. Ad esempio, $f(4) = f(-4) = 16$). Inoltre, non é
	  suriettiva, perché tutti gli elementi di $ZZ$ che non sono quadrati
	  perfetti non hanno una controimmagine. Ad esempio, non esiste un $a in
	  ZZ$ tale per cui $f(a) = 13$. Infatti, sebbene esistano due $a$ tali
	  per cui $f(a) = 13$, ovvero $plus.minus sqrt(13)$, questi non sono
	  numeri interi, pertanto non appartengono al dominio;
	- La funzione $f: NN |-> ZZ, f(z) = z^(2)$ é iniettiva, perché
	  ad ogni elemento di $NN$ viene associato un elemento distinto di
	  $ZZ$. Non é peró suriettiva, perché tutti gli elementi di $ZZ$
	  che non sono quadrati perfetti non hanno una controimmagine;
	- La funzione $f: ZZ |-> ZZ, f(z) = z + 1$ é iniettiva, perché
	  per ogni numero intero esiste uno ed un solo numero intero ottenuto
	  sommandovi uno. É inoltre anche suriettiva, perché per ogni numero
	  intero é sempre possibile trovare un'altro numero intero ottenuto
	  a partire dal precedente avendovi sommato uno. Pertanto, é una
	  funzione biettiva.
]

Per un qualsiasi insieme non vuoto $A$ é possibile costruire la *funzione
identitá* $i_(A)$ come la funzione che ad ogni elemento di $A$ associa sé
stesso. Formalmente:

$ i_(A): A |-> A, space i_(A)(a) = a space forall a in A $

Siano $A$, $B$, $C$ e $D$ quattro insiemi. Siano poi $f: A |-> B$ e
$g: C |-> D$ due funzioni, dove $Im(f) subset.eq C$. Viene detta *funzione
composta* di $f$ e di $g$ la funzione che si ottiene applicando la funzione
$g$ al risultato della funzione $f$, ovvero:

$ g compose f : A |-> D, space (g compose f)(a) = g(f(a)) space forall a in A $

#theorem[
	La composizione di funzioni gode della proprietá associativa. Ovvero,
	Siano $A$, $B$, $C$, $D$, $E$ e $F$ sei insiemi. Siano poi $f: A |-> B$,
	$g: C |-> D$ e $h: E |-> F$ tre funzioni, dove $Im(f) subset.eq C$ e
	$Im(g) subset.eq E$. Allora $h compose (g compose f) = (h compose g)
	compose f$.
] <Composition-is-associative>
// #proof[
// Dimostrabile, da aggiungere
// ]

#lemma[
	Siano $A$ e $B$ due insiemi, e sia $f: A |-> B$ una funzione su questi
	definita. Allora, per qualsiasi $f$, $i_(B) compose f = f$ e $f compose
	i_(A) = f$.
] <Composition-identity>
// #proof[
// Dimostrabile, da aggiungere
// ]

#corollary[
	Sia $A$ un insieme e sia $f: A |-> A$ una funzione. La composizione di
	funzioni ha nella funzione identitá l'elemento neutro rispetto all'insieme
	$A^(A)$.
] <Composition-identity-is-neutral>
#proof[
	Per il @Composition-identity, se $f: A |-> B$ é una funzione da un
	insieme $A$ ad un insieme $B$, allora $i_(B) compose f = f$ e $f compose
	i_(A) = f$. Nel caso particolare in cui $A = B$, si ha $f compose i_(A)
	= i_(A) compose f = f$.
]

#theorem[
	Siano $f: A |-> B$ e $g: B |-> C$ due funzioni, e sia $g compose f$ la
	funzione composta di tali funzioni. Si ha allora:

	+ Se $f$ e $g$ sono iniettive, allora $g compose f$ é iniettiva;
	+ Se $f$ e $g$ sono suriettive, allora $g compose f$ é suriettiva;
	+ Se $f$ e $g$ sono biettive, allora $g compose f$ é biettiva;
] <Composition-preserves-jection>
// #proof[
// Dimostrabile, da aggiungere
// ]

Dati due insiemi $A$ e $B$ ed una funzione $f: A |-> B$, si dice *funzione
inversa* di $f$ la funzione $f^(-1)$ tale che, per ogni elemento $b in B$,
$f^(-1)(b)$ é quell'unico $a in A$ tale per cui $f(a) = b$. Se per una
funzione $f$ é possibile costruire la funzione inversa $f^(-1)$, si dice
che $f$ é *invertibile*.

#theorem[
	Una funzione $f: A |-> B$ é invertibile se e solo se é biettiva.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

#lemma[
	Sia $f: A |-> B$ una funzione invertibile e sia $g: B |-> A$ la sua
	inversa. Allora $g compose f = i_(A)$ e $f compose g = i_(B)$. Nel
	caso particolare in cui $A = B$, si ha $f compose g = g compose f
	= i_(A)$.
] <Composition-inverse>
// #proof[
// Dimostrabile, da aggiungere
// ]

#corollary[
	Sia $f: A |-> A$ una funzione invertibile e sia $g: A |-> A$ la sua
	inversa. La composizione di funzioni ha nella funzione inversa l'inverso
	rispetto all'insieme $A^(A)$.
] <Composition-inverse-is-inverse>
#proof[
	Per il @Composition-inverse, se $f: A |-> B$ é una funzione invertibile e
	$g: B |-> A$ é la sua inversa, allora $g compose f = i_(A)$ e $f compose g
	= i_(B)$. Nel caso particolare in cui $A = B$, si ha $f compose g = g
	compose f = i_(A)$.
]

Le funzioni biettive permettono di estendere la nozione di equipotenza anche
agli insiemi a cardinalitá infinita. Infatti, se per confrontare la cardinalitá
di insiemi a cardinalitá finita é sufficiente "contare" quanti elementi ha
ciascun insieme e comparare i due numeri (naturali) cosí ottenuti, per gli
insiemi a cardinalitá infinita questo non é possibile.

In particolare, siano $A$ e $B$ due insiemi. Tali insiemi sono equipotenti
se e soltanto se esiste (almeno) una funzione biettiva che ha $A$ per dominio
e $B$ per codominio.

#example[
	Sia $f: NN |-> ZZ$ la funzione cosí definita:

	$ f(n) = cases(
		frac(n, 2) & "se" 2 | n,
		frac(-n -1, 2) & "se" 2 divides.not n
	) $

	Tale funzione é biettiva, pertanto $NN$ e $ZZ$ sono equipotenti.
]
