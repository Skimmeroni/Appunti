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
	- La legge $f : bb(Z) -> bb(Z), f(z) = z^(2)$, che associa a ciascun
	  numero intero il suo quadrato, é una funzione;
	- Il sottoinsieme ${(z, 7), z in bb(Z)} subset.eq bb(Z) times bb(Z)$,
	  ovvero l'insieme composto da tutte le coppie ordinate del prodotto
	  cartesiano di $bb(Z)$ con sé stesso che hanno 7 come secondo elemento,
	  é una funzione. Tale sottoinsieme puó essere scritto in maniera piú
	  esplicita nella forma di legge come $f: bb(Z) -> bb(Z), f(z) = 7$.
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
	- La funzione $f: bb(Z) -> bb(Z), f(z) = 0$ non é iniettiva, perché ogni elemento
	  di $bb(Z)$ viene sempre associato allo stesso elemento di $bb(Z)$ (lo $0$, in
	  questo caso). Inoltre, non é suriettiva, perché tutti gli elementi del codominio
	  al di fuori di $0$ non hanno una controimmagine;
	- La funzione $f: bb(Z) |-> bb(Z), f(z) = z^(2)$ non é iniettiva, perché se per un
	  certo $a in bb(Z)$ vale $b = f(a)$, anche per $-a in bb(Z)$ vale $b = f(-a)$. Ad
	  esempio, $f(4) = f(-4) = 16$). Inoltre, non é suriettiva, perché tutti gli elementi
	  di $bb(Z)$ che non sono quadrati perfetti non hanno una controimmagine. Ad esempio,
	  non esiste un $a in bb(Z)$ tale per cui $f(a) = 13$. Infatti, sebbene esistano due
	  $a$ tali per cui $f(a) = 13$, ovvero $plus.minus sqrt(13)$, questi non sono numeri
	  interi, pertanto non appartengono al dominio;
	- La funzione $f: bb(N) |-> bb(Z), f(z) = z^(2)$ é iniettiva, perché ad ogni elemento
	  di $bb(N)$ viene associato un elemento distinto di $bb(Z)$. Non é peró suriettiva,
	  perché tutti gli elementi di $bb(Z)$ che non sono quadrati perfetti non hanno una
	  controimmagine;
	- La funzione $f: bb(Z) |-> bb(Z), f(z) = z + 1$ é iniettiva, perché per ogni numero
	  intero esiste uno ed un solo numero intero ottenuto sommandovi uno. É inoltre anche
	  suriettiva, perché per ogni numero intero é sempre possibile trovare un'altro numero
	  intero ottenuto a partire dal precedente avendovi sommato uno. Pertanto, é una
	  funzione biettiva.
]

Sia $A$ un insieme non vuoto. La funzione $*$ viene detta *operazione binaria* su $A$ se
ha come dominio il prodotto cartesiano di $A$ con sé stesso ed il codominio coincidente
con $A$:

$ * : A times A |-> A $

#example[
	- La funzione $f: bb(Z) times bb(N) |-> bb(Z),
	  f(a, b) = a^(b)$ non é un'operazione binaria;
	- La funzione $f: bb(Z) times bb(Z) |-> bb(Z),
	  f(a, b) = root(b, a)$ é un'operazione binaria.
]

Sia $*$ una operazione su un insieme $a$, e siano $a, b, c in A$ tre suoi elementi.
Si dice che $*$ gode della *proprietá associativa* se applicare a $c$ il risultato
dell'applicazione di $*$ ad $a$ e a $b$ equivale all'applicare ad $a$ il risultato
dell'applicazione di $*$ a $b$ e a $c$. In altri termini:

$ (a * b) * c = a * (b * c) $

Dove le parentesi tonde determinano l'_ordine di precedenza_ dell'applicazione di $*$.

Sia $*$ una operazione su un insieme $a$, e siano $a, b in A$ due suoi elementi.
Si dice che $*$ gode della *proprietá commutativa* se applicare $a$ a $b$ equivale
ad applicare $b$ ad $a$. In altri termini:

$ a * b = b * a $

#example[
	- L'operazione $f: bb(Z) times bb(Z) |-> bb(Z), f(a, b) = a + b$
	  gode sia della proprietá associativa che della proprietá commutativa;
	- L'operazione $f: bb(Z) times bb(Z) |-> bb(Z), f(a, b) = a - b$
	  non gode né della proprietá associativa né della proprietá commutativa;
	- L'operazione $f: bb(Z) times bb(Z) |-> bb(Z), f(a, b) = 2^(a + b)$
	  gode della proprietá commutativa, ma non di quella associativa.
	  Infatti, sebbene sia vero che $f(a, b) = f(b, a)$ in quanto $2^(a
	  + b) = 2^(b + a)$, non é vero che $f(a, f(b, c)) = f(f(a, b), c)$,
	  in quanto $2^(a + 2 b + c) != 2^(2 a + b + c)$.
	- L'operazione $f: bb(Z) times bb(Z) |-> bb(Z), f(a, b) = b$ gode della
	  proprietá associativa, ma non di quella commutativa. Infatti, sebbene
	  valga $f(a, f(b, c)) = f(f(a, b), c) = c$, si ha $f(a, b) = b$ e
	  $f(b, a) = a$, pertanto $f(a, b) != f(b, a)$.
]

Se $*$ é una operazione sull'insieme $A$, un elemento $e in A$ viene detto *elemento
neutro* per $*$ se, per qualsiasi $a in A$, vale $e * a = a * e = a$. Se $*$ é una
operazione sull'insieme $A$ che ammette elemento neutro $e$, per ciascun $a in A$
esiste un $tilde(a) in A$ chiamato *opposto* di $A$ tale per cui $a * tilde(a) =
tilde(a) * a = e$.

#example[
	L'operazione $f: bb(Z) times bb(Z) |-> bb(Z), f(a, b) = a + b$ ha come elemento
	neutro $e = 0$. Infatti, preso un $a in Z$ qualsiasi, si ha $a + 0 = 0 + a = a$.
	L'elemento opposto di $a$ rispetto a tale operazione é $-a$, in quanto $a + (-a)
	= (-a) + a = 0$.
]

Le operazioni binarie possono venire generalizzate con prodotti cartesiani
$n$-dimensionali. La funzione $*$ viene detta *operazione n-aria* su $A$ se
ha come dominio $A^(n)$ e sé stesso come codominio:

$ * : A^(n) |-> A $
