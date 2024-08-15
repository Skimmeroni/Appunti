#import "../Metodi_defs.typ": *

Viene detta *equazione diofantea* una equazione nella forma:

$ a x + b y = c "   con" a, b, c, x, y in bb(Z) " e " a, b, c != 0 $

Dove $a, b, c$ sono i _termini noti_ e $x, y$ sono le _incognite_.

Essendo $x$ e $y$ interi, le _soluzioni_ di tale equazione sono
tutte e sole le coppie $(x_(0), y_(0)) in bb(Z) times bb(Z)$ tali
per cui $a x_(0) + b y_(0) = c$.

#example[
	Si consideri l'equazione diofantea $6x + 5y = 3$. Le coppie $(3, −3)$
	e $(8, −9)$ sono sue possibili soluzioni.
]

#theorem("Condizione necessaria e sufficiente per la solubilitá delle equazioni diofantee")[
	Si consideri l'equazione diofantea $a x + b y = c$, con termini noti non nulli $a, b, c
	in bb(Z)$ e incognite $x, y in bb(Z)$. Tale equazione ammette soluzione se e soltanto se
	$"MCD"(a, b) | c$.
] <Diophantine-solutions-exist>
#proof[
	Si supponga che $a x + b y = c$ ammetta una certa soluzione $(x_(0), y_(0)) in bb(Z)
	times bb(Z)$. Deve allora valere $a x_(0) + b y_(0) = c$. Valendo $"MCD"(a, b) | a
	x_(0) + b y_(0)$ si ha $"MCD"(a, b) | c$. Pertanto, se una equazione diofantea
	$a x + b y = c$ é risolubile, allora $"MCD"(a, b) | c$.

	Viceversa, si supponga che per l'equazione diofantea $a x + b y = c$ valga
	$"MCD"(a, b) | c$. Questo equivale a dire che vale $c = "MCD"(a, b) tilde(c)$
	per un qualche $tilde(c) in bb(Z)$. Per l'identità di Bezout esistono certi
	$s, t in bb(Z)$ tali per cui $"MCD"(a, b) = a s + b t$. Sostituendo nell'equazione
	precedente, si ha $c = (a s + b t) tilde(c) = a s tilde(c) + b t tilde(c)$. Ponendo
	$x_(0) = s tilde(c)$ e $y_(0) = t tilde(c)$, si ha $c = a x_(0) + b y_(0)$. Essendo
	$(x_(0) , y_(0)) in bb(Z) times bb(Z)$, tale coppia é una possibile soluzione per
	l'equazione. Pertanto, se per l'equazione diofantea $a x + b y = c$ vale $"MCD"(a, b)
	| c$, allora tale equazione ha (almeno) una soluzione.
]

#example[
	Si consideri l'equazione diofantea $74 x + 22 y = 10$. Ci si chiede se tale equazione
	ammetta soluzione. Si calcoli pertanto $"MCD"(a, b)$:

	#set math.mat(delim: none)
	$ mat(
		74 & = 22 dot 3 + 8;
		22 & = 8 dot 2 + 6;
		8  & = 6 dot 1 + 2;
		6  & = 2 dot 3;
	) $

	Da cui si ricava $"MCD"(74, 22) = 2$. Essendo $2 | 10$, si ha che l'equazione ammette
	soluzione.
]

#corollary("Determinare una soluzione particolare di una equazione diofantea")[
	Si consideri l'equazione diofantea risolubile $a x + b y = c$, con termini
	noti non nulli $a, b, c in bb(Z)$ e incognite $x, y in bb(Z)$. Una soluzione
	particolare $(x_(0), y_(0)) in bb(Z) times bb(Z)$ di tale equazione puó essere
	ottenuta dall'identitá di Bézout che ha $a$ e $b$ per termini noti.
] <Diophantine-one-solution>
#proof[
	Sia $a x + b y = "MCD"(a, b)$ l'identitá di Bézout per $a$ e $b$. Moltiplicando
	ambo i membri per un certo $tilde(c) in bb(Z)$, si ha $(a x + b y) tilde(c) =
	a x tilde(c) + b y tilde(c) = "MCD"(a, b) tilde(c)$. Sostituendo $x tilde(c) =
	x_(0)$, $y tilde(c) = y_(0)$ e $"MCD"(a, b) tilde(c) = c$, si ha $a x_(0) + b
	y_(0) = c$. Questa é una equazione diofantea, essendo costituita da soli
	coefficienti interi, e la coppia $(x_(0), y_(0))$ ne é soluzione. Tale
	equazione é infatti risolubile perché essendo $"MCD"(a, b) tilde(c) = c$,
	si ha $c | "MCD"(a, b)$.
]

Il @Diophantine-one-solution suggerisce che per ricavare una soluzione particolare
di una equazione diofantea risolubile $a x + b y = c$ sia sufficiente trovare una
soluzione particolare dell'identitá di Bézout che ha $a $ e $b$ per termini noti
e moltiplicare il risultato per $frac(c, "MCD"(a, b))$.

#example[
	Si consideri l'equazione diofantea risolubile $74 x + 22 y = 10$. É giá stato
	calcolato che $"MCD"(74, 22) = 2$, pertanto l'identitá di Bézout che ha 74 e
	22 come termini noti é $74 x' + 22 y' = 2$. Se ne determini una soluzione
	particolare $(x_(0) ', y_(0) ')$:

	#set math.mat(delim: none)
	$ mat(
		74 & = 22 dot 3 + 8 => a = 3 b + 8 => a - 3 b = 8;
		22 & = 8 dot 2 + 6 => b = 2(a - 3 b) + 6 => 7 b - 2a = 6;
		8  & = 6 dot 1 + 2 => (a - 3 b) = (7 b - 2 a) + 2 => 3 a - 10 b = 2;
	) $

	Si ha quindi $(x_(0) ', y_(0) ') = (3, -10)$. Essendo $frac(10, "MCD"(74, 22)) = 5$,
	si ha che una soluzione particolare dell'equazione diofantea $74 x + 22 y = 10$ é
	$(15, -50)$.
]

#theorem("Soluzioni di una equazione diofantea")[
	Si consideri l'equazione diofantea risolubile $a x + b y = c$, con termini noti non
	nulli $a, b, c in bb(Z)$ e incognite $x, y in bb(Z)$. Se la coppia $(x_(0), y_(0))
	in bb(Z) times bb(Z)$ é soluzione per tale equazione, allora lo sono tutte e sole le
	coppie $(x_(h), y_(h)) in bb(Z) times bb(Z)$ cosí costruite:

	$ x_(h) = x_(0) + h (frac(b, "MCD"(a, b))) space space space
	  y_(h) = y_(0) - h (frac(a, "MCD"(a, b)))
	  "   con" h in bb(Z) $
] <Diophantine-all-solutions>
#proof[
	Le coppie $(x_(h), y_(h))$ cosí costruite sono certamente soluzioni di $a x + b y = c$,
	dato che sostituendo si ha:

	$ a x_(h) + b y_(h) = c & => a(x_(0) + h (frac(b, "MCD"(a, b)))) +
	b(y_(0) - h (frac(a, "MCD"(a, b)))) = c \ & => a x_(0) + cancel(frac(a h b, "MCD"(a, b))) +
	b y_(0) - cancel(frac(a h b, "MCD"(a, b))) = c => a x_(0) + b y_(0) = c $

	Viceversa, sia $(overline(x), overline(y))$ una generica soluzione di $a x + b y = c$.
	Dato che anche $(x_(0), y_(0))$ lo é, é possibile scrivere:

	#set math.mat(delim: none)
	$ a overline(x) + b overline(y) = c = a x_(0) + b y_(0) =>
	a(overline(x) - x_(0)) = -b(overline(y) - y_(0)) =>
	overline(a) (overline(x) - x_(0)) = overline(b) (y_(0) - overline(y))
	space space "con" space space
	mat(
		overline(a) = frac(a, "MCD"(a, b));
		overline(b) = frac(b, "MCD"(a, b))
	) $

	Dall'espressione si ricava che $overline(a) | overline(b) (y_(0) − overline(y))$,
	da cui si ha $overline(a) | y_(0) − overline(y)$. Ma allora esiste un certo $h in
	bb(Z)$ tale per cui $y_(0) − overline(y) = h overline(a)$, cioé $overline(y) =
	y_(0) - h overline(a)$. Sostituendo nella precedente, si ha:

	$ overline(a) (overline(x) - x_(0)) = overline(b) (cancel(y_(0)) - cancel(y_(0))
	+ h overline(a)) => cancel(overline(a)) (overline(x) - x_(0)) = overline(b) h
	cancel(overline(a)) => overline(x) - x_(0) = overline(b) h => overline(x) = x_(0)
	+ overline(b) h $

	Risostituendo il valore di $overline(a)$ e $overline(b)$ nelle rispettive formule,
	si ottiene la forma presente nell'enunciato del teorema:

	$ overline(x) = x_(0) + h (frac(b, "MCD"(a, b))) space space space
	  overline(y) = y_(0) - h (frac(a, "MCD"(a, b)))
	  "   con" h in bb(Z) $

	Essendo $(overline(x), overline(y)) in bb(Z) times bb(Z)$ una soluzione generica,
	si ha quindi che qualsiasi soluzione puó essere espressa in tale forma.
]

#example[
	Si consideri l'equazione diofantea risolubile $74 x + 22 y = 10$, del quale
	é nota la soluzione particolare $(15, -50)$ ed é noto che $"MCD"(74, 22) = 2$.
	Avendosi $frac(74, 2) = 37$ e $frac(22, 2) = 11$, é possibile ricavare la
	famiglia di soluzioni $(x_(h), y_(h)) in bb(Z) times bb(Z)$:

	$ x_(h) = 15 + 11 h space space space
	  y_(h) = -50 - 37 h
	  "   con" h in bb(Z) $
]
