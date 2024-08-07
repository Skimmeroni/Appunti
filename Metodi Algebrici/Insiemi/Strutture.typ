#import "../Metodi_defs.typ": *

Un insieme $A$ su cui sono definite $n$ operazioni $f_(1), ..., f_(n)$
prende il nome di *struttura algebrica* e si indica con $(A, f_(1), ...,
f_(n))$. Dato che, nella maggior parte dei casi, le operazioni $f_(1),
..., f_(n)$ delle strutture algebriche sono operazioni binarie, se non
viene diversamente specificato con "operazione" si intende implicitamente
"operazione binaria".

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
	- La coppia $(bb(Q), dot.op)$, dove $dot.op$ indica il prodotto sui
	  numeri razionali comunemente inteso, é un semigruppo, perché $dot.op$
	  gode della proprietá associativa. É anche un monoide, perché $dot.op$
	  ammette elemento neutro (il numero $1$). Non é peró un gruppo, perché
	  non esiste l'inverso di $0$ rispetto a $dot.op$ (richiederebbe di dividere
	  per $0$, che non é possibile);
	- La coppia $(bb(Q) - {0}, dot.op)$ é, per gli stessi motivi per cui lo
	  é $(bb(Q), dot.op)$, sia un semigruppo che un monoide. É peró anche un
	  gruppo, perché per ogni $a in bb(Q)$ esiste sempre un $frac(1, a) in
	  bb(Q)$ tale per cui $a dot.op frac(1, a) = frac(1, a) dot.op a = 1$.
]

Un semigruppo, un monoide ed un gruppo si dicono, rispettivamente, *semigruppo
abeliano*, *monoide abeliano* e *gruppo abeliano* se l'operazione su questi
definita gode della proprietá commutativa.
