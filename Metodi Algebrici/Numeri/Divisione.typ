#import "../Metodi_defs.typ": *

Dati due numeri interi $n$ e $m$, con $n > m > 0$, l'operazione di *divisione*
permette due interi q e r, chiamati rispettivamente _quoziente_ e _resto_, tali
che il prodotto fra $m$ e $q$ é il multiplo di $m$ che piú si avvicina ad $n$ per
difetto ed il resto $r = n - m q$ misura lo scarto.

#theorem[
	Siano $n$ e $m$ due numeri interi, con $m != 0$. Esiste una ed una sola coppia
	di interi $q$ ed $r$ tali per cui $n = m q + r$ e $0 lt.eq r < |m|$
] /*
#proof[
	Si supponga che $n gt.eq 0$. Fissato arbitrariamente $m$, si proceda per
	induzione su $n$:

	- Se $n = 0$, si ha $0 = m q + r$, ovvero $m q = -r$. In effetti, esiste una
	  ed una sola coppia di numeri interi $q$ ed $r$ per i quali tale uguaglianza é
	  verificata, ovvero $0, 0$. Infatti, $m dot.op 0 = -0 = 0$ e $0 lt.eq 0 < |m|$;
	- Assumendo che esista una ed una sola coppia di numeri interi $q$ ed $r$ tali
	  per cui $n = m q + r$ e $0 lt.eq r < |m|$, si dimostri che esista una ed una
	  sola coppia di numeri interi $q'$ ed $r'$ tali per cui $(n + 1) = m q' + r'$
	  e $0 lt.eq r' < |m|$

	  Se $n gt.eq |m|$, ovvero se $n > n − |m| gt.eq 0$, per l’ipotesi di induzione
	  esistono $q'$ e $r'$ in $bb(Z)$ tali che $n − |m| = m q' + r'$ con $0 lt.eq r'
	  < |m|$.

	  Allora $n = m q' + |m| + r'$ e, essendo $|m| = plus.minus m$, si ha $n = m(q'
	  plus.minus 1) + r'$ con $0 lt.eq r < |m|$.

	Per quanto riguarda l'unicitá
] */

Siano $a$ e $b$ due numeri interi. Se esiste $c in bb(Z)$ tale che $a = b c$,
si dice che $b$ _divide_ $a$, oppure analogamente che $a$ é _divisibile_ per
$b$. Per indicare che $b$ divide $a$ viene usata la notazione $b | a$. Se $b$
divide $a$, si dice anche che $b$ é _multiplo_ di $a$. É immediato verificare
che, dato $a in bb(Z)$, sia $plus.minus 1$ che $plus.minus a$ sono certamente
divisori di $a$.

Siano $a, b in bb(Z)$ non entrambi nulli; si dice che $d in bb(Z)$ é un *Massimo
Comun Divisore* tra $a$ e $b$ se sono verificate entrambe le seguenti due condizioni:

+ $d | a$ e $d | b$. Ovvero, $d$ é divisore sia di $a$ che di $b$;
+ Se $c in bb(Z)$ é tale che $c | a$ e $c | b$, allora $c | d$. Ovvero,
  tutti i divisori di $a$ che sono anche divisori di $b$ sono anche
  divisori di $d$.

#theorem[
	Dati due numeri $a, b in bb(Z)$ non entrambi nulli, se $d$ e $tilde(d)$
	sono due Massimi Comun Divisori fra $a$ e $b$ allora devono essere uguali
	in modulo, ovvero deve aversi $d = plus.minus tilde(d)$.
]
#proof[
	Essendo $d$ un Massimo Comun Divisore per $a$ e $b$, deve valere
	$d | a$ e $d | b$. Inoltre, deve valere anche che se $c in bb(Z)$
	é tale che $c | a$ e $c | b$, allora $c | d$.

	Essendo peró anche $tilde(d)$ un Massimo Comun Divisore per $a$ e
	$b$, deve valere $tilde(d) | a$ e $tilde(d) | b$. Allora é possibile
	sostituire $c$ con $tilde(d)$ nella seconda espressione ed ottenere
	che $tilde(d) | d$.

	É peró possibile operare anche in senso contrario: essendo $tilde(d)$
	un Massimo Comun Divisore per $a$ e $b$, deve valere anche che se $c
	in bb(Z)$ é tale che $c | a$ e $c | b$, allora $c | tilde(d)$, e valendo
	$d | a$ e $d | b$ deve aversi che $d | tilde(d)$.

	Esistono allora due numeri $h, k in bb(Z)$ tali per cui $tilde(d) = h d$
	e $d = tilde(d)$. Ne segue $tilde(d) = (h k) tilde(d)$, e quindi $h k = 1$.
	Deve allora aversi $h = k = 1$ e quindi $d = tilde(d)$ oppure $h = k = -1$
	e quindi $d = -tilde(d)$.
]

Dal teorema si evince immediatamente che se $d$ é un Massimo Comun Divisore
positivo di due numeri interi $a$ e $b$, allora $d$ é univoco. Tale valore
viene indicato con $"MCD"(a, b)$.

#theorem[
	Per una qualsiasi coppia di numeri interi $a$ e $b$ non entrambi nulli
	esiste sempre ed é univoco $d = "MCD"(a, b)$
]
#proof[
	É immediato riconoscere che se $d = "MCD"(a, b)$, allora é vero anche
	$d = "MCD"(-a, -b)$. É altrettanto immediato riconoscere che che $"MCD"(a, b)
	= "MCD"(b, a)$ per qualsiasi $a, b$. Pertanto, senza perdita di generalitá, é
	possibile assumere che $a$ e $b$ siano numeri naturali con $a gt.eq b$.

	Se $a = 0$ e $b != 0$ si verifica facilmente che $"MCD"(a, b) = a$; allo
	stesso modo, se $b = 0$ e $a != 0$ si ha $"MCD"(a, b) = b$. Si consideri
	pertanto il caso piú generale in cui $a != 0$ e $b != 0$. Devono allora
	esistere un quoziente $q_(1)$ ed un resto $r_(1)$ tali per cui é possibile
	eseguire la divisione:

	$ a = b q_(1) + r_(1) , 0 lt.eq r_(1) < b $

	Se $r_(1) = 0$, allora $"MCD"(a, b) = b$, perché $a = b q_(1)$ é la
	definizione stessa di $b | a$ e $q_(1)$ é arbitrario. Se cosí non é,
	é possibile ripetere l'operazione e risvolgere i calcoli con un nuovo
	resto ed un nuovo quoziente. Piú in generale:

	#set math.mat(column-gap: 2.5em)
	#set math.mat(delim: none)
	$ mat(
	  & (1), & a = b q_(1) + r_(1), & r_(1) != 0;
	  & (2), & b = r_(1) q_(2) + r_(2), & r_(2) != 0;
	  & (3), & r_(1) = r_(2) q_(3) + r_(3), & r_(3) != 0;
	  & , & ..., &;
	  & (k - 1), & r_(k - 3) = r_(k - 2) q_(k - 1) + r_(k - 1), & r_(k - 1) != 0;
	  & (k), & r_(k - 2) = r_(k - 1) q_(k), &;
	) $

	Il fatto che prima o poi si giunga ad una $k$-esima iterazione in cui $r_(k) = 0$
	é garantito dal fatto che tale successione é una successione strettamente crescente
	di numeri non negativi.

	L'ultimo resto non nullo, ovvero $r_(k - 1)$, é precisamente $"MCD"(a, b)$. Per
	convincersene, é sufficiente osservare che tale resto possiede entrambe le proprietá
	enunciate nella definizione di Massimo Comun Divisore:

	-
	-
]

Se due numeri interi hanno 1 come Massimo Comun Divisore, allora si dice che
tali numeri sono *coprimi* o *primi fra di loro*.

#theorem("Identitá di Bézout")[
	Se $a$ e $b$ sono due numeri interi non entrambi nulli, allora esistono
	due numeri interi $x$ e $y$ tali per cui vale:

	$ a x + b y = "MCD"(a, b) $
]
#proof[

]
