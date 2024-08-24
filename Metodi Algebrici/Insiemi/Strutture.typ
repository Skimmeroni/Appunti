#import "../Metodi_defs.typ": *

Un insieme $A$ su cui sono definite $n$ operazioni $f_(1), ..., f_(n)$
prende il nome di *struttura algebrica* e si indica con $(A, f_(1), ...,
f_(n))$. L'insieme $A$ viene detto *insieme sostegno*, o semplicemente
*sostegno*, della struttura algebrica.

Dato che, nella maggior parte dei casi, le operazioni $f_(1), ..., f_(n)$
delle strutture algebriche sono operazioni binarie, se non viene diversamente
specificato con "operazione" si intende implicitamente "operazione binaria".

La struttura algebrica $(S, *)$, formata dall'insieme $S$ e da una operazione
$*$ definita su $S$, prende il nome di *semigruppo* se $*$ gode della
proprietá associativa.

Un semigruppo $(M, *)$ viene detto *monoide* se l'operazione $*$ definita
sull'insieme $M$ ammette elemento neutro.

Un monoide $(G, *)$ viene detto *gruppo* se l'operazione $*$ definita
sull'insieme $G$ ammette inverso per ogni elemento di $G$.

#example[
	- La coppia $(NN, +)$, dove $+$ indica la somma sui numeri interi
	  comunemente intesa, é un semigruppo, perché $+$ gode della proprietá
	  associativa. É anche un monoide, perché $+$ ammette elemento neutro
	  (il numero $0$). Non é peró un gruppo;
	- La coppia $(ZZ, +)$ é, per gli stessi motivi per cui lo é $(NN,
	  +)$, sia un semigruppo che un monoide. É peró anche un gruppo: per
	  ogni $a in ZZ$ esiste sempre un $-a in ZZ$ tale per cui $a +
	  (-a) = (-a) + a = 0$;
	- La coppia $(QQ, dot)$, dove $dot$ indica il prodotto sui
	  numeri razionali comunemente inteso, é un semigruppo, perché $dot$
	  gode della proprietá associativa. É anche un monoide, perché $dot$
	  ammette elemento neutro (il numero $1$). Non é peró un gruppo, perché
	  non esiste l'inverso di $0$ rispetto a $dot$ (richiederebbe di dividere
	  per $0$, che non é possibile);
	- La coppia $(QQ - {0}, dot)$ é, per gli stessi motivi per cui lo
	  é $(QQ, dot)$, sia un semigruppo che un monoide. É peró anche un
	  gruppo, perché per ogni $a in QQ$ esiste sempre un $frac(1, a) in
	  QQ$ tale per cui $a dot frac(1, a) = frac(1, a) dot a = 1$.
	- Sia $"GL"(n, RR) = {A in "Mat"(n, RR): det(A) != 0}$ l'insieme che
	  contiene tutte le matrici quadrate di dimensione $n$ che hanno il
	  determinante non nullo. La struttura algebrica $("GL"(n, RR), dot)$,
	  dove $dot$ indica l'operazione di prodotto fra matrici, forma un
	  semigruppo, in quanto il prodotto fra matrici gode della proprietá
	  associativa. É inoltre un monoide, in quanto il prodotto fra matrici
	  ammette elemento neutro nella forma della matrice identitá. É infine
	  anche un gruppo, in quanto il prodotto fra matrici ammette inverso
	  nella forma della matrice inversa (che esiste per tutte le matrici
	  che hanno il determinante non nullo, pertanto ogni matrice in
	  $"GL"(n, RR)$ ha per definizione una inversa). Il gruppo $("GL"(n, RR),
	  dot)$ prende il nome di *gruppo lineare generale*.
] <Some-groups>

Un semigruppo, un monoide ed un gruppo si dicono, rispettivamente, *semigruppo
abeliano*, *monoide abeliano* e *gruppo abeliano* se l'operazione su questi
definita gode della proprietá commutativa.

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
unitario e se $(A - {0}, diamond.small)$ é un gruppo.

#example[
	- $(QQ, +, dot)$ é un campo;
	- $(ZZ_(n) , +, dot)$ é un campo solamente se $n$ é un numero primo;
	- $(ZZ, +, dot)$ non é un campo.
]

Sia $X$ un insieme e siano $*$ e $tilde.op$ rispettivamente una operazione
ed una relazione di equivalenza definite su $X$. Si dice che $tilde.op$ é
*compatibile* con $*$ se vale:

$ a tilde.op b and c tilde.op d => (a * c) tilde.op (b * d)
  space forall a, b, c, d in X $

#lemma[
	Sia $X$ un insieme e siano $*$ e $tilde.op$ rispettivamente una
	operazione ed una relazione di equivalenza definite su $X$. Se
	$tilde.op$ é compatibile con $*$, é possibile costruire l'operazione
	$*_(tilde.op)$ sull'insieme quoziente $X_(tilde.op)$ in questo modo:

	$ [x]_(tilde.op) *_(tilde.op) [y]_(tilde.op) = [x * y]_(tilde.op)
	  space forall x, y in X $
]
