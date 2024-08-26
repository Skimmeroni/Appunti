#import "../Metodi_defs.typ": *

Si consideri un anello di polinomi $K[x]$. Ad un qualsiasi polinomio
$f(x) = a_(n)x^(n) + ... + a_(1)x + a_(0)$ appartenente a $K[x]$ é
possibile associare la funzione $F: K |-> K$ cosí definita:

$ F : K |-> f(alpha) =
  a_(n) dot alpha^(n) + ... + a_(1) dot alpha + a_(0) space
  forall alpha in K $

Siano $f(x) in K[x]$ e $alpha in K$. Se $f(alpha) = 0$, $alpha$ si
dice *radice* del polinomio $f(x)$.

#theorem("Teorema di Ruffini")[
	Siano $K$ un campo, $f(x)$ un polinomio in $K[x]$ e $alpha$ un
	elemento di $K$. $alpha$ è una radice di $f(x)$ se e soltanto
	se $(x − alpha)$ é divisore di $f(x)$.
]
#proof[
	Se vale $(x − alpha) | f(x)$, allora si ha $f(x) = (x − alpha)q(x)$
	per un certo $q(x) in K[x]$. Pertanto, $f(alpha) = (alpha −
	alpha)q(alpha) = 0 dot q(alpha) = 0$.

	Viceversa, si supponga che $alpha$ sia una radice di $f(x)$,
	ovvero che $f(alpha) = 0$. Per la divisione euclidea fra
	$f(x)$ e $(x - alpha)$, esistono due polinomi $p(x)$ e $q(x)$
	tali per cui

	$ f(x) = (x − alpha)q(x) + r(x) "con" diff(r(x)) < 1 $

	Poiché $diff(r(x)) < 1$, il polinomio $r(x)$ puó avere
	esclusivamente grado $0$ oppure $-1$. Nel primo caso,
	il polinomio é nella forma $r(x) = k$ con $k in (K - {0})$,
	nel secondo caso il polinomio é il polinomio nullo.

	Si noti peró come solamente il secondo caso sia ammissibile.
	Infatti, se fosse $r(x) = k$ con $k in (K - {0})$, si avrebbe

	$ f(x) = (x − alpha)q(x) + k =>
	  f(alpha) = (alpha − alpha)q(alpha) + k =>
	  k = 0 $

	Ma questo entra in contraddizione con l'ipotesi che $k$ non sia
	l'elemento nullo. Pertanto, se ne deduce che $r(x)$ debba per
	forza essere il polinomio nullo, e che quindi $(x - alpha)$
	divida $f(x)$ senza resto.
]

#corollary[
	Un polinomio $f(x) = a x + b in K[x]$ di grado $1$ (quindi con
	$a != 0$) è irriducibile in $K[x]$ ed ha una ed una sola radice
	$alpha in K$. In particolare, $alpha = -b dot a^(-1)$.
]

#corollary[
	Sia $f(x)$ un polinomio in $K[x]$ con $diff(f(x)) > 1$. Se $f(x)$ ammette
	radice $alpha in K$ allora è riducibile in $K[x]$.
] <Poly-radix-is-reduceable>

Si noti come il @Poly-radix-is-reduceable non sia una doppia implicazione.
Possono infatti esistere dei polinomi $f(x) in K[x]$ che sono riducibili
in $K[x]$ ma che non ammettono radici in $K$.

#example[
	Il polinomio $x^(4) + 3x^(2) + 2 in RR[x]$ si fattorizza come
	$(x^(2) + 1)(x^(2) + 2)$ e quindi è riducibile in $RR[x]$, ma
	non ha radici in $RR$.
]

#corollary[
	Un polinomio $f(x) in K[x]$ di grado $2$ oppure $3$ è riducibile in
	$K[x]$ se e solo se ammette una radice in $K$.
]

Siano $f(x) in K[x]$ e $alpha in K$. Si dice che $alpha$ é una radice
di $f(x)$ di *molteplicitá algebrica* $r$, con $r in NN$ e $r gt.eq
1$, se $(x − alpha)^(r) | f(x)$ ma $(x − alpha)^(r + 1) divides.not f(x)$.
In particolare, una radice di molteplicità algebrica $1$ si dice *radice
semplice*.

In altre parole, la molteplicità algebrica di una radice $alpha$ di un
polinomio $p(x) in K[x]$ indica quante volte il polinomio $(x - alpha)$
figura come fattore nella fattorizzazione di $p(x)$.

#example[
	- Il polinomio $f(x) = x^(4) − 2x^(2) + 1 = (x − 1)^(2)(x + 1)^(2)
	  in QQ[x]$ ha in $QQ$ le radici $alpha_(1) = −1$ e $alpha_(2) = 1$
	  entrambe di molteplicità $2$;
	- Il polinomio $f(x) = [1]_(2)x^(4) + [1]_(2) = ([1]_(2)x + [1]_(2))^(4)
	  in ZZ_(2)[x]$ ha in $ZZ_(2)$ la radice $alpha = [1]_(2)$
	  con molteplicità $4$.
]

#theorem[
	Siano $K$ un campo e $f(x) in K[x]$ un polinomio non nullo di grado $n$.
	La somma delle molteplicità delle radici di $f(x)$ è minore o uguale a
	$n$.
]
#proof[
	Se $n = 0$, per definizione $f(x)$ non ha radici in $K$, pertanto la
	somma delle molteplicitá delle sue radici é $0$. In questo caso il
	teorema é quindi verificato, perché $n = 0$ e ovviamente $0 lt.eq 0$.

	Se invece $n > 0$, si fattorizzi $f(x)$ in polinomi irriducibili in
	$K[x]$. Se nessuno di questi ha grado $1$, $f(x)$ non ha radici in $K$.
	Altrimenti, sia:

	$ f(x) = k(x − alpha_(1))^(r_(1)) (x − alpha_(2))^(r_(2)) ...
	  (x − alpha_(t))^(r_(t)) g_(1)(x) ... g_(m)(x) $

	Dove $k in (K - {0}), alpha_(1), ..., alpha_(t)$ sono elementi distinti
	di $K$ e $g_(1)(x), ..., g_(m)(x)$ sono (se esistono) polinomi di grado
	maggiore di $1$, irriducibili in $K[x]$.

	Le radici di $f(x)$ in $K$ sono pertanto $alpha_(1), ..., alpha_(t)$
	con molteplicità $r_(1), ..., r_(t)$ rispettivamente. É infatti chiaro
	che $alpha_(i)$ è radice con molteplicità $r_(i)$, per ciascun $i in
	{1, ..., t}$. D'altra parte, $f(x)$ non ha altre radici all'infuori
	di queste, perché se esistesse una radice $beta in K$ distinta da ogni
	$alpha_(i)$ si avrebbe:

	$ f(beta) = k(beta − alpha_(1))^(r_(1)) ... (beta − alpha_(t))^(r_(t))
	  g_(1)(beta) ... g_(m)(beta) != 0 $

	Che non potrebbe quindi essere una radice.

	Confrontando infine il grado di $f(x)$ con il grado di
	$(x − alpha_(1))^(r_(1)) ... (x − alpha_(t))^(r_(t))
	g_(1)(x) ... g_(m)(x)$ si trova $r_(1) + r_(2) + ... + r_(t)
	lt.eq n$.
]
