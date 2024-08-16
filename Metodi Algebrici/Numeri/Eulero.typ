#import "../Metodi_defs.typ": *

Viene detta *funzione di Eulero* la funzione $phi : (NN - {0}) |->
(NN - {0})$ cosí definita:

$ phi(n) = cases(
	1 & "se" n = 1,
	|{k in NN : 0 < k < n, "MCD"(k, n) = 1}| & "se" n > 1
) $

Ovvero, che per l'argomento $1$ restituisce $1$ mentre per un generico
argomento $n$, numero naturale maggiore di $1$, restituisce il numero
di numeri naturali coprimi ad $n$ che si trovano nell'intervallo $(0,
n)$, estremi esclusi.

#example[
	Per $n = 26$, si ha:

	$ phi(26) = |{k in ZZ : 0 < k < 26, (k, 26) = 1}| =
	|{1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25}| = 12 $
]

#lemma[
	Se $p in NN$ é un numero primo maggiore di $1$, allora $phi(p) = p - 1$.
] <Euler-function-single-prime>
#proof[
	Per un generico $p$ numero naturale con $p > 1$, $phi(p)$ é il numero
	di numeri naturali maggiori di 0 e minori di $p$ con cui $p$ é coprimo.
	Se peró $p$ é primo, allora sará certamente coprimo a tutti i numeri
	che costituiscono tale intervallo; essendo tale intervallo di lunghezza
	$p - 1$, si ha $phi(p) = p - 1$.
]

#lemma[
	Siano $p$ e $alpha$ due numeri naturali maggiori di 0, con $p$ primo. Allora:

	$ phi(p^(alpha)) = p^(alpha) − p^(alpha - 1) = p^(alpha − 1) (p − 1) $
] <Euler-function-primes>
#proof[
	Sia $m$ un qualsiasi numero naturale diverso da $0$ e inferiore a $p^(alpha)$.
	Essendo $p$ un numero primo, gli unici possibili valori di $"MCD"(p^(alpha), m)$
	sono $p^(0), p^(1), p^(2), ..., p^(alpha - 1)$. Affinché $"MCD"(p^(alpha), m)$
	non sia $1$, $m$ deve necessariamente essere un multiplo di $p$, ed il numero di
	multipli $p$ minori di $p^(alpha)$ é $p^(alpha - 1)$. Tutti i restanti numeri
	compresi (estremi esclusi) fra $0$ e $p^(alpha)$ sono coprimi a $p^(alpha)$,
	ed il numero di tali numeri deve quindi essere $p^(alpha) - p^(alpha - 1)$.
]

#theorem("Moltiplicativitá della funzione di Eulero")[
	La funzione di Eulero é moltiplicativa. Ovvero, presi $a, b in NN - {0}$
	primi fra di loro, si ha $phi(a b) = phi(a) phi(b)$.
] <Euler-function-multiplicative>
#proof[
	Siano $r$ e $s$ due numeri interi, scelti con queste caratteristiche:

	$ 0 < r < a space space space
	  "MCD"(r, a) = 1 space space space
	  0 < s < b space space space
	  "MCD"(s, b) = 1 $

	Per il @Chinese-remainder-theorem, il sistema di congruenze

	$ cases(
		x equiv r mod a,
		x equiv s mod b
	) $

	ammette soluzioni. In particolare, ne ammette una ed una sola compresa
	tra $0$ e $a b$ (estremi esclusi); sia $c$ questa soluzione.

	É possibile verificare che $"MCD"(c, a b) = 1$. Si assuma infatti per
	assurdo che questo non sia vero, e che esista pertanto un numero primo
	$p$ divisore sia di $c$ che di $a b$. Valendo $p | a b$, é possibile
	applicare il @Euclid-lemma, pertanto deve valere almeno un assunto fra
	$p | a$ e $p | b$. Si supponga che sia vera $p | a$. Essendo $c$ soluzione
	del sistema di congruenze, deve valere $c equiv r mod a$, ovvero che esiste
	un $k in ZZ$ tale per cui $c - r = a k$. Riscrivendo l'espressione
	come $r = c - a h$, si evince che $p | r$, ma si ha assunto che valesse
	$p | a$ e che $"MCD"(r, a) = 1$, e le due assunzioni sono incompatibili.
	É facile verificare che assumendo invece che sia vera $p | b$, si ricade
	in una contraddizione analoga, pertanto occorre assumere che effettivamente
	$"MCD"(c, a b) = 1$.

	Poiché ogni coppia di interi $r$ ed $s$ definiti come sopra dá luogo ad
	un intero $c$ tale che $0 < c < a b$ e $"MCD"(c, a b) = 1$ abbiamo che
	$phi(a) phi(b) lt.eq phi(a b)$.

	Viceversa, sia $t$ un numero intero scelto di modo che valga $0 < t < a b$
	e $"MCD"(t, a b) = 1$. Dividendo $t$ per $a$, si ha $t = a q + r$ con $0
	lt.eq r < a$ e $q in ZZ$.

	É possibile verificare che $"MCD"(a, r) = 1$. Innanzitutto, si osservi come
	debba per forza aversi $r != 0$; se cosí fosse, si avrebbe $a | t$, ma questo
	non é possibile perché per come $t$ é stato definito deve valere $"MCD"(t, a b)
	= 1$. Si supponga per assurdo che $"MCD"(a, r) > 1$: se cosí fosse, deve valere
	sia $"MCD"(a, r) | a$ che $"MCD"(a, r) | r$, da cui si ha $"MCD"(a, r) | a b$ e
	$"MCD"(a, r) | t$, che é una contraddizione. Occorre pertanto assumedere che
	effettivamente $"MCD"(a, r) = 1$.

	In maniera analoga, si mostra che dividendo $t$ per $b$ e scrivendo $t = b
	overline(q) + s$ con $0 < s lt.eq b$ si ha $"MCD"(b, s) = 1$. In totale, si
	ha che $t$ é soluzione del sistema di congruenze:

	$ cases(
		x equiv r mod a,
		x equiv s mod b
	) $

	Da cui si conclude che $phi(a) phi(b) = phi(a b)$.
]

#corollary[
	Sia $n > 1$ un numero naturale, e sia $n = p_(1)^(alpha_(1)) p_(2)^(alpha_(2)) ...
	p_(m)^(alpha_(m))$ la sua fattorizzazione in numeri primi, dove ciascun $p_(i)$
	con $1 lt.eq i lt.eq m$ é un numero primo distinto, elevato ad un certo esponente
	$alpha_(i)$. L'espressione di $phi(n)$ puó essere anche scritta come:

	$ phi(n) = product_(i = 1)^(m) p_(i)^(alpha_(i) − 1) (p_(i) − 1) =
	  p_(1)^(alpha_(1) − 1) (p_(1) − 1) p_(2)^(alpha_(2) − 1) (p_(2) − 1) ...
	  p_(m)^(alpha_(m) − 1) (p_(m) − 1) $
] <Euler-function-factored>
#proof[
	Questo risultato deriva direttamente dal @Euler-function-multiplicative. Infatti,
	se $phi$ é moltiplicativa, allora:

	$ phi(n) = phi(p_(1)^(alpha_(1))) phi(p_(2)^(alpha_(2))) ... phi(p_(m)^(alpha_(m))) =
	  product_(i = 1)^(m) phi(p_(i)^(alpha_(i))) $

	Applicando poi il @Euler-function-primes all'argomento della produttoria, si ha:

	$ product_(i = 1)^(m) phi(p_(i)^(alpha_(i))) =
	  product_(i = 1)^(m) p_(i)^(alpha_(i) − 1) (p_(i) − 1) =
	  p_(1)^(alpha_(1) − 1) (p_(1) − 1) p_(2)^(alpha_(2) − 1) (p_(2) − 1) ...
	  p_(m)^(alpha_(m) − 1) (p_(m) − 1) $
]

Il @Euler-function-factored permette di calcolare la funzione di Eulero in maniera
molto piú semplice rispetto al calcolarla direttamente a partire dalla definizione,
soprattutto per numeri molto grandi, perché richiede solamente la fattorizzazione
in numeri primi e semplici moltiplicazioni.

#example[
	Sia $n = 246064$. La sua fattorizzazione in numeri primi é $2^(4) dot 7
	dot 13^(3)$. Si ha:

	$ phi(246064) = product_(i = 1)^(3) p_(i)^(alpha_(i) − 1) (p_(i) − 1) =
	  2^(4 − 1) (2 − 1) dot 7^(1 − 1) (7 − 1) dot 13^(3 − 1) (13 − 1) = 97344 $
]

#theorem[
	Sia $n in NN$ con $n > 0$. Il valore di $phi(n)$ equivale al numero di
	elementi invertibili di $ZZ_(n)$.
]
