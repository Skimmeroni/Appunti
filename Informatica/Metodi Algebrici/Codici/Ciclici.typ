#import "../Metodi_defs.typ": *

Un codice lineare $C in ZZ_(p)^(n)$ si dice *codice ciclico* se per ogni
parola di $C$ esiste in $C$ ogni sua possibile permutazione ciclica.

#example[
	- Si consideri il codice lineare $C = {000, 011, 101, 110} subset.eq
	  ZZ_(2)^(3)$. Si considerino tutte le permutazioni cicliche (distinte)
	  degli elementi di $C$:

	  #grid(
		  columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
		  [$ angle.l 000 angle.r = {000, 000, 000} $],
		  [$ angle.l 011 angle.r = {011, 101, 110} $],
		  [$ angle.l 101 angle.r = {101, 110, 011} $],
		  [$ angle.l 110 angle.r = {110, 011, 101} $])

	  Dato che ogni permutazione ciclica di ogni parola di $C$ é membro di $C$
	  a sua volta, $C$ è un codice ciclico.
	- Si consideri il codice lineare $C = {0000, 0110, 1001, 1111} subset.eq
	  ZZ_(2)^(4)$. Si osservi come, ad esempio, $angle.l 0110 angle.r = {0110,
	  0011, 1001, 1100}$, ma $1100 in.not C$. Pertanto, $C$ non è un codice
	  ciclico.
]

É possibile manipolare i codici ciclici in maniera piú semplice sfruttando
le proprietá dei polinomi. Si noti infatti come ad ogni parola in $ZZ_(p)^(n)$
sia associabile un polinomio a coefficienti in $ZZ_(p)$ nell'incognita $t$, e
viceversa. In particolare:

$ (a_(0), dots, a_(n − 1)) in ZZ_(p)^(n) <==>
  a_(0) + a_(1) t + dots + a_(n − 1) t^(n − 1) in ZZ_(p) [t] $

#example[
	- Alla parola $10022 in ZZ_(3)^(5)$ é associabile il polinomio
	  $1 + 2t^(3) + 2t^(4)$ a coefficienti in $ZZ_(3)$;
	- Al polinomio $t + t^(2) + t^(4)$ a coefficienti in $ZZ_(2)$
	  é associabile la parola $01101 in ZZ_(2)^(5)$.
]

É poi possibile definire un insieme quoziente come $R_(n) = ZZ_(p) [t]
slash t^(n − 1)$. La struttura algebrica $(R_(n), +, dot)$ forma un
anello, ma non un campo, perché $t^(n - 1)$ é un polinomio riducibile.
Gli elementi di $R_(n)$ sono le classi $[a(t)]_(t^(n − 1))$, dove
$a(t) in ZZ_(p)[t]$ e $diff a(t) lt.eq n − 1$.

La congruenza modulo $t^(n − 1)$ è molto semplice da descrivere:

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ t^(n) equiv 1 mod t^(n − 1) $],
	[$ t^(n + 1) = t^(n) t equiv t mod t^(n − 1) $],
	[$ t^(n + 2) = t^(n) t^(2) equiv t^(2) mod t^(n − 1) $]
)

In particolare, se vale $a(t) = a_(0) + a_(1) t + dots + a_(n − 1) t^(n − 1)$,
risulta:

$ a(t) t = a_(0) t + a_(1) t^(2) + dots + a_(n − 1) t^(n) equiv
  a_(n − 1) + a_(0) t + a_(1) t_(2) + dots + a_(n − 2) t^(n − 1) mod t^(n − 1) $

É possibile identificare $ZZ_(p)^(n)$ con $R_(n)$ tramite:

$ a_(0) a_(1) dots a_(n − 1) |-> a_(0) + a_(1) t + dots + a_(n − 1) t^(n − 1) $

#lemma[
	Un sottoinsieme $C$ di $R_(n)$ è un codice ciclico se e soltanto se:

	+ Per ogni $a(t), b(t) in C$, vale $a(t) + b(t) in C$;
	+ Per ogni $a(t) in C$ e per ogni $r(t) in R_(n)$, vale $a(t) r(t) in C$.
] <Is-a-cyclic-code>
#proof[
	Si assuma che $C$ sia un codice ciclico. Essendo $C$ un codice lineare,
	è un sottospazio di $R_(n)$. Segue quindi dalla definizione di spazio
	vettoriale che per ogni $a(t), b(t) in C$, vale $a(t) + b(t) in C$, e
	per ogni $lambda in ZZ_(p)$ e per ogni $a(t) in C$, si ha $lambda a(t)
	in C$. Essendo $C$ un codice ciclico, per ogni $a(t) in C$, si ha

	#grid(
		columns: (0.25fr, 0.3fr, 0.45fr),
		[$ a(t)t in C $],
		[$ a(t) t^(2) = (a(t) t) t in C $],
		[$ a(t) t^(n − 1) = (((a(t) t) t) dots) t in C $]
	)

	Se $r(t) = r_(0) + r_(1) t + dots + r_(n − 1) t^(n − 1) in R_(n)$,
	risulta:

	$ a(t) r(t) = a(t) (r_(0) + r_(1) t + dots + r_(n − 1) t^(n − 1)) =
	  a(t) r_(0) + r_(1) a(t) t + dots + r_(n − 1) a(t) t^(n − 1) $

	Allora $a(t) r(t) in C$ perchè $a(t) r(t)$ è una combinazione lineare
	con coefficienti $r_(0), dots, r_(n)$ di parole di $C$.

	Viceversa, sia $C$ un sottoinsieme di $R_(n)$ che soddisfa le condizioni
	sopracitate. Allora $C$ è un sottospazio di $R_(n)$, perchè la prima
	condizione assicura che $C$ sia chiuso rispetto alla somma e la seconda
	condizione, scegliendo $r(t) = r_(0) in ZZ_(p)$, assicura che $C$ sia
	chiuso rispetto al prodotto vettore per scalare. Per ogni $a(t) = a_(0)
	+ a_(1) t + dots + a_(n − 1) t^(n − 1) in C$, applicando la seconda
	condizione scegliendo $r(t) = t$, si ha $a(t)t = a_(n − 1) + a_(0) t +
	a_(1) t^(2) + dots + a_(n − 2) t^(n − 1) in C$. Segue che $C$ è un codice
	ciclico.
]

Per $f(t) in R_(n)$ é possibile definire $angle.l f(t) angle.r =
{f(t) r(t) : r(t) in R_(n)}$.

#lemma[
	Sia $f(t) in R_(n)$. L'insieme $angle.l f(t) angle.r$ è un codice ciclico.
]
#proof[
	Affinché $angle.l f(t) angle.r$ sia un codice ciclico, é necessario che
	rispetti le due condizioni presentate nel @Is-a-cyclic-code:

	- Per ogni $f(t) r_(1)(t)$ e $f(t) r_(2)(t)$ in $angle.l f(t)
	  angle.r$ si ha $f(t) r_(1)(t) + f(t) r_(2)(t) = f(t)(r_(1)(t) +
	  r_(2)(t))$. Essendo $(R_(n), +, dot)$ un anello, é chiuso rispetto
	  alla somma, pertanto $r_(1)(t) + r_(2)(t) in R_(n)$. Di conseguenza,
	  $f(t) (r_(1)(t) + r_(2)(t)) in angle.l f(t) angle.r$;
	- Per ogni $f(t) r_(1)(t) in angle.l f(t) angle.r$ e per ogni $r_(2)(t)
	  in R_(n)$ si ha $(f(t) r_(1)(t)) dot r_(2)(t) = f(t) r_(1)(t) r_(2)(t)$.
	  Essendo $(R_(n), +, dot)$ un anello, é chiuso rispetto al prodotto,
	  pertanto $r_(1)(t) r_(2)(t) in R_(n)$. Di conseguenza, $f(t) r_(1)(t)
	  r_(2)(t) in angle.l f(t) angle.r$.
]

#theorem[
	Sia $C != {underline(0)}$ un codice ciclico in $R_(n)$. Allora:

	- Esiste un unico polinomio monico $p(t)$ di grado minimo in $C$;
	- $C = angle.l p(t) angle.r$;
	- Il polinomio $p(t)$ divide $t^(n) − 1$.
] <Cyclic-codes-properties>
#proof[
	- Essendo $C != {underline(0)}$, in $C$ non esistono polinomi
	  nulli. Sia $h(t) = h_(0) + h_(1) t + dots + h_(k) t^(k)$, con
	  $k < n$, un generico polinomio non nullo in $C$ di grado $k$.
	  Essendo $C$ un codice lineare, il polinomio monico $h^(-1)_(k)
	  h(t)$ appartiene a $C$. Si ha quindi che $C$ contiene almeno un
	  polinomio monico. Sia $p(t)$ uno dei polinomi monici che, fra
	  questi, ha grado minimo. Si supponga che esista almeno un altro
	  polinomio monico $q(t)$ di grado minimo; naturalmente, $diff(p(t))
	  = diff(q(t))$. Essendo $C$ un sottospazio di $R_(n)$, anche $p(t)
	  - q(t)$ deve appartenere a $C$, e $diff(p(t) - q(t)) < diff(p(t))$.
	  Essendo $p(t)$ polinomio di grado minimo ed essendo $diff(p(t)) =
	  diff(q(t))$, tale disuguaglianza é vera solamente nel caso in cui
	  $p(t) = q(t)$, ovvero se non esistono due polinomi monici distinti
	  di grado minimo.
	- Sia $p(t) in C$ e $s(t) in R_(n)$ un generico polinomio. Se
	  $p(t) s(t) in angle.l p(t) angle.r$, allora per definizione
	  di codice ciclico $p(t) s(t) in C$. Pertanto, $angle.l p(t)
	  angle.r subset.eq C$. D'altro canto, dato un generico polinomio
	  $f(t) in C$, dividendolo per $p(t)$ si ha $f(t) = p(t) q(t) +
	  r(t)$, con $diff(r(t)) < diff(p(t))$. Per quanto appena detto,
	  $p(t) q(t) in C$, pertanto $r(t) = f(t) - p(t) q(t) in C$.
	  Essendo peró $p(t)$ un polinomio di grado minimo, l'unica
	  situazione in cui si verifica $diff(r(t)) < diff(p(t))$ é
	  quando $r(t)$ é il polinomio nullo, ovvero quando la divisione
	  non ha resto. Pertanto, $C subset.eq angle.l p(t) angle.r$.
	  Valendo sia $angle.l p(t) angle.r subset.eq C$ sia $C subset.eq
	  angle.l p(t) angle.r$, si ha $C = angle.l p(t) angle.r$.
	- La divisione fra polinomi tra $t^(n) - 1$ e $p(t)$ restituisce
	  $t^(n) − 1 = p(t)q(t) + r(t)$, con $diff(r(t)) < diff(p(t))$.
	  É allora possibile scrivere $r(t) equiv −p(t) q(t) mod t^(n) − 1$.
	  Questo significa che $r(t) in angle.l p(t) angle.r = C$. Essendo
	  $p(t)$ un polinomio di grado minimo, la disuguaglianza $diff(r(t))
	  < diff(p(t))$ é valida solo se $r(t) = 0$, ovvero se $p(t)$ divide
	  $t^(n) - 1$.
]

Il solo ed unico polinomio del @Cyclic-codes-properties prende il nome di
*polinomio generatore*.

#example[
	Sia $R_(3) = Z_(2)[t] slash t^(3) − 1$, e sia $C = 1 + t^(2)$ un codice
	ciclico. Le parole di $C$ sono:

	$ mat(
		a(t) &= 0 => 000;
		a(t) &= 1 + t^(2) => 101;
		a(t) &= (1 + t^(2))t = t + t^(3) = t + 1 => 110;
		a(t) &= (1 + t^(2))t^(2) = (1 + t)t = t + t^(2) => 011) $

	Risulta $C = angle.l 1 + t angle.r = angle.l 1 + t^(2) angle.r
	= angle.l t + t^(2) angle.r$. Il polinomio generatore di $C$ è
	$p(t) = 1 + t$, che è anche l'unico che divide $t^(3) − 1 =
	(t − 1)(t^(2) + t + 1) = (t + 1)(t^(2) + t + 1)$ in $ZZ_(2)[t]$.
]

Il @Cyclic-codes-properties stabilisce che i codici ciclici in $R_(n)$
sono in corrispondenza biunivoca con i divisori monici del polinomio
$t^(n) − 1$. Pertanto, trovare i codici ciclici di $R_(n)$ consiste
nel trovare i divisori monici di $t^(n) − 1$ in $ZZ_(p) [t]$, che
corrisponde al trovare la fattorizzazione in polinomi primi di $t^(n) − 1$
in $ZZ_(p) [t]$.

#example[
	La fattorizzazione in primi di $t^(3) − 1$ in $ZZ_(2) [t]$ è $t^(3) − 1
	= (t + 1)(t^(2) + t + 1)$. I codici ciclici di $R_(3)$ sono allora:

	#align(
		center,
		table(
			columns: (auto, auto, auto),
			align: center,
			[polinomio generatore $p(t)$],
			[codice in $R_(3) = ZZ_(2) [t] slash t^(3) − 1$],
			[codice corrispondente in $ZZ_(2)^(3)$],
			$1$, $R_(n)$, $ZZ_(2)^(3)$,
			$t + 1$, ${0, 1 + t, t + t^(2), 1 + t^(2)}$, ${000, 110, 011, 101}$,
			$t^(2) + t + 1$, ${0, 1 + t + t^(2)}$, ${000, 111}$
		)
	)
]

#theorem[
	Sia $C$ un codice ciclico con polinomio generatore $p(t) = p_(0) +
	p_(1) t + dots + p_(r − 1) t^(r − 1) + t^(r)$ di grado $r$. Allora
	$C$ ha dimensione $k = n − r$. Inoltre, una matrice generatrice per
	$C$ è la matrice:

	$ G = mat(p_(0), p_(1), p_(2), dots, p_(r − 1), 1, 0, 0, dots, dots, 0;
			  0, p_(0), p_(1), p_(2), dots, p_(r − 1), 1, 0, dots, dots, 0;
			  0, 0, p_(0), p_(1), p_(2), dots, p_(r − 1), 1, 0, dots, 0;
			  dots.v, dots.down, dots.down, dots.down, dots.down, dots.down,
			  dots, dots.down, dots.down, dots, dots.v;
			  0, dots, dots, 0, p_(0), p_(1), p_(2), dots, p_(r − 1), 1, 0;
			  0, 0, dots, dots, 0, p_(0), p_(1), p_(2), dots, p_(r − 1), 1) $
]

#example[
	Il codice ciclico $C$ in $R_(8) = ZZ_(3) [t] slash t^(8) −1$ con
	polinomio generatore $p(t) = t^(3) + t − 1$ ha per matrice generatrice:

	$ G = mat(−1, 1, 0, 1, 0, 0, 0, 0;
			  0, −1, 1, 0, 1, 0, 0, 0;
			  0, 0, −1, 1, 0, 1, 0, 0;
			  0, 0, 0, −1, 1, 0, 1, 0;
			  0, 0, 0, 0, −1, 1, 0, 1) $
]
