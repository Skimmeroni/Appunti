#import "../Metodi_defs.typ": *

Sia $A$ un insieme non vuoto. La funzione $*$ viene detta *operazione
binaria* su $A$ se ha come dominio il prodotto cartesiano di $A$ con
sé stesso ed il codominio coincidente con $A$:

$ * : A times A |-> A $

#example[
	- La funzione $f: ZZ times NN |-> ZZ,
	  f(a, b) = a^(b)$ non é un'operazione binaria;
	- La funzione $f: ZZ times ZZ |-> ZZ,
	  f(a, b) = root(b, a)$ é un'operazione binaria.
]

Sia $*$ una operazione su un insieme $a$, e siano $a, b, c in A$ tre suoi
elementi. Si dice che $*$ gode della *proprietá associativa* se applicare
a $c$ il risultato dell'applicazione di $*$ ad $a$ e a $b$ equivale
all'applicare ad $a$ il risultato dell'applicazione di $*$ a $b$ e a
$c$. In altri termini:

$ (a * b) * c = a * (b * c) $

Dove le parentesi tonde determinano l'_ordine di precedenza_
dell'applicazione di $*$.

Sia $*$ una operazione su un insieme $a$, e siano $a, b in A$ due suoi
elementi. Si dice che $*$ gode della *proprietá commutativa* se applicare
$a$ a $b$ equivale ad applicare $b$ ad $a$. In altri termini:

$ a * b = b * a $

#example[
	- L'operazione $f: ZZ times ZZ |-> ZZ, f(a, b) = a + b$
	  gode sia della proprietá associativa che della proprietá commutativa;
	- L'operazione $f: ZZ times ZZ |-> ZZ, f(a, b) = a - b$
	  non gode né della proprietá associativa né della proprietá commutativa;
	- L'operazione $f: ZZ times ZZ |-> ZZ, f(a, b) = 2^(a + b)$
	  gode della proprietá commutativa, ma non di quella associativa.
	  Infatti, sebbene sia vero che $f(a, b) = f(b, a)$ in quanto $2^(a
	  + b) = 2^(b + a)$, non é vero che $f(a, f(b, c)) = f(f(a, b), c)$,
	  in quanto $2^(a + 2 b + c) != 2^(2 a + b + c)$.
	- L'operazione $f: ZZ times ZZ |-> ZZ, f(a, b) = b$ gode della
	  proprietá associativa, ma non di quella commutativa. Infatti, sebbene
	  valga $f(a, f(b, c)) = f(f(a, b), c) = c$, si ha $f(a, b) = b$ e
	  $f(b, a) = a$, pertanto $f(a, b) != f(b, a)$.
]

Se $*$ é una operazione sull'insieme $A$, un elemento $e in A$ viene detto
*elemento neutro* per $*$ se, per qualsiasi $a in A$, vale $e * a = a * e
= a$. Se $*$ é una operazione sull'insieme $A$ che ammette elemento neutro
$e$, per ciascun $a in A$ esiste un $overline(a) in A$ chiamato *inverso* di
$a$ tale per cui $a * overline(a) = overline(a) * a = e$.

#example[
	L'operazione $f: ZZ times ZZ |-> ZZ, f(a, b) = a + b$ ha come
	elemento neutro $e = 0$. Infatti, preso un $a in Z$ qualsiasi, si ha
	$a + 0 = 0 + a = a$. L'elemento inverso di $a$ rispetto a tale operazione
	é $-a$, in quanto $a + (-a) = (-a) + a = 0$.
]

Sia $A$ un insieme e siano $f_(1), ..., f_(n)$ una collezione di $n$
operazioni definite su $A$. La $n+1$-pla $(A, f_(1), ..., f_(n))$,
formata dall'insieme $A$ e dalle $n$ operazioni su questo definite,
prende il nome di *struttura algebrica*.

L'insieme $A$ viene detto *insieme sostegno*, o semplicemente *sostegno*,
della struttura algebrica. Dato che, nella maggior parte dei casi, le
operazioni $f_(1), ..., f_(n)$ delle strutture algebriche sono operazioni
binarie, se non viene diversamente specificato con "operazione" si intende
implicitamente "operazione binaria".

Una struttura algebrica $(S, *)$, formata da un insieme $S$ e da una
operazione $*$ su questo definita, prende il nome di *semigruppo* se
$*$ gode della proprietá associativa.

Un semigruppo $(M, *)$ viene detto *monoide* se l'operazione $*$ definita
sull'insieme $M$ ammette elemento neutro.

#example[
	- La coppia $(NN, +)$, dove $+$ indica la somma sui numeri interi
	  comunemente intesa, é un semigruppo, perché $+$ gode della proprietá
	  associativa. É anche un monoide, perché $+$ ammette elemento neutro
	  (il numero $0$);
	- La coppia $(QQ, dot)$, dove $dot$ indica il prodotto sui
	  numeri razionali comunemente inteso, é un semigruppo, perché $dot$
	  gode della proprietá associativa. É anche un monoide, perché $dot$
	  ammette elemento neutro (il numero $1$).
] <Some-groups>

Un semigruppo $(S, *)$ dove $*$ gode della proprietá commmutativa viene
detto *semigruppo abeliano*. Allo stesso modo, un monoide $(M, *)$ dove
$*$ gode della proprietá commmutativa viene detto *monoide abeliano*.
