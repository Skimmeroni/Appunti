#import "../Metodi_defs.typ": *

Un insieme $A$ su cui sono definite $n$ operazioni $f_(1), ..., f_(n)$
prende il nome di *struttura algebrica* e si indica con $(A, f_(1), ...,
f_(n))$. L'insieme $A$ viene detto *insieme sostegno*, o semplicemente
*sostegno*, della struttura algebrica.

Dato che, nella maggior parte dei casi, le operazioni $f_(1), ..., f_(n)$
delle strutture algebriche sono operazioni binarie, se non viene diversamente
specificato con "operazione" si intende implicitamente "operazione binaria".

La coppia ordinata $(S, *)$, formata dall'insieme $S$ e da una operazione
$*$ definita su $S$, prende il nome di *semigruppo* se $*$ gode della
proprietá associativa.

Un semigruppo $(M, *)$ viene detto *monoide* se l'operazione $*$ definita
sull'insieme $M$ ammette elemento neutro.

Un monoide $(G, *)$ viene detto *gruppo* se l'operazione $*$ definita
sull'insieme $G$ ammette opposto per ogni elemento di $G$.

#example[
	- La coppia $(bb(N), +)$, dove $+$ indica la somma sui numeri interi
	  comunemente intesa, é un semigruppo, perché $+$ gode della proprietá
	  associativa. É anche un monoide, perché $+$ ammette elemento neutro
	  (il numero $0$). Non é peró un gruppo;
	- La coppia $(bb(Z), +)$ é, per gli stessi motivi per cui lo é $(bb(N),
	  +)$, sia un semigruppo che un monoide. É peró anche un gruppo: per
	  ogni $a in bb(Z)$ esiste sempre un $-a in bb(Z)$ tale per cui $a +
	  (-a) = (-a) + a = 0$;
	- La coppia $(bb(Q), dot)$, dove $dot$ indica il prodotto sui
	  numeri razionali comunemente inteso, é un semigruppo, perché $dot$
	  gode della proprietá associativa. É anche un monoide, perché $dot$
	  ammette elemento neutro (il numero $1$). Non é peró un gruppo, perché
	  non esiste l'inverso di $0$ rispetto a $dot$ (richiederebbe di dividere
	  per $0$, che non é possibile);
	- La coppia $(bb(Q) - {0}, dot)$ é, per gli stessi motivi per cui lo
	  é $(bb(Q), dot)$, sia un semigruppo che un monoide. É peró anche un
	  gruppo, perché per ogni $a in bb(Q)$ esiste sempre un $frac(1, a) in
	  bb(Q)$ tale per cui $a dot frac(1, a) = frac(1, a) dot a = 1$.
]

Un semigruppo, un monoide ed un gruppo si dicono, rispettivamente, *semigruppo
abeliano*, *monoide abeliano* e *gruppo abeliano* se l'operazione su questi
definita gode della proprietá commutativa.

La struttura algebrica $(A, *, compose)$ prende il nome di *anello* se sono
rispettate le seguenti proprietá:

- $(A, *)$ é un gruppo abeliano;
- $(A, compose)$ é un semigruppo;
- L'operazione $compose$ gode della *proprietá distributiva* rispetto a $*$, ovvero:

  $ a compose (b * c) = (a compose b) * (a compose c) space.fig " e " space.fig
    (a * b) compose c = (a compose c) * (b compose c) space.fig space.fig space.fig
    forall a, b in A $

Se $compose$ gode inoltre della proprietá commutativa, ovvero se $(A, compose)$
é abeliano, allora si dice che $(A, *, compose)$ é un *anello commutativo*.

Se $(A, compose)$ é un monoide (oltre che un semigruppo), ovvero se esiste per
$compose$ un elemento neutro, $(A, *, compose)$ é un *anello unitario*. Se non
diversamente specificato, nel parlare di "anelli" in generale si stará sottointendendo
di stare considerando anelli unitari.

#example[
	- $(bb(Z), +. dot)$, $(bb(Q), +, dot)$ e $(bb(Z)_(n) , +, dot)$
	  sono anelli commutativi;
	- $("Mat"(2 times 2, bb(Q)), +, ·)$ é un anello,
	  ma non é commutativo.
]

L'anello $(A, *, compose)$ prende il nome di *campo* se é commutativo,
unitario e se $(A - {0}, compose)$ é un gruppo.

#example[
	- $(bb(Q), +, dot)$ é un campo;
	- $(bb(Z)_(n) , +, dot)$ é un campo solamente se $n$ é un numero primo;
	- $(bb(Z), +, dot)$ non é un campo.
]
