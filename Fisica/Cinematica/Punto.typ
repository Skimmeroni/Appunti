#import "../Fisica_defs.typ": *

// Si definisce *punto materiale* un'approssimazione in cui un corpo esteso,
// al descriverne il movimento, viene considerato come un punto adimensionale.
// Tale approssimazione é particolarmente fruttifera quando la scala del corpo
// in esame é di gran lunga piú piccola della scala dell'ambiente circostante.

// La cinematica é lo studio del movimento dei corpi. Obiettivo della
// cinematica é definire una approssimazione dei corpi e del loro moto
// che, con un margine di errore accettabile, ne descriva la *legge oraria*,
// ovvero prevedere la posizione del punto in qualsiasi istante temporale
// conoscendo la posizione iniziale e la sua velocitá.

Il modello piú semplice per descrivere un moto é quello *unidimensionale*,
ovvero di un punto materiale che si muove lungo una linea retta. Il punto
al centro della retta indica il punto zero, detto *origine*. La direzione
positiva della retta é quella in cui le coordinate della posizione del punto
aumentano, mentre quella negativa é quella in cui le coordinate diminuiscono.
Il segno piú e meno indica in quale delle due direzioni il punto si trova; il
segno piú viene in genere sottinteso.

La *posizione* é una quantitá $arrow(x)(t)$ in funzione del tempo, un
vettore che ha punto iniziale nell'origine e punto finale nella coordinata
che corrisponde a dove si trova il punto materiale nel dato istante di tempo.

Lo *spostamento* $Delta arrow(x)$ é il vettore differenza fra una posizione
di partenza $arrow(x)(t)$ ed una posizione di arrivo $arrow(x)(t_(0))$. Una
differenza di tempo $Delta t$ é la differenza tra un tempo finale $t$ ed
un tempo iniziale $t_(0)$. É pertanto possibile scrivere:

$ Delta arrow(x) = arrow(x)(Delta t + t_(0)) - arrow(x)(t_(0)) $

Si indica invece con *distanza* la lunghezza complessiva che é stata percorsa
dal punto materiale. Questa non é una quantitá vettoriale, bensí uno scalare,
ed é sempre positiva, mentre lo spostamento puó essere sia positivo che
negativo.

#exercise[
	Un punto materiale si muove in linea retta a partire dall'origine
	e da un tempo iniziale $t_(0) = 0$. Dopo un certo tempo $t_(1)$ si
	trova a $L$ metri dall'origine; dopo un ulteriore tempo $t_(2)$ si
	trova di nuovo nell'origine. Calcolare spostamento e distanza al
	tempo $t_(1) + t_(2)$.
]
#solution[
	$Delta t = t_(1) + t_(2) - t_(0) = t_(1) + t_(2) - 0 = t_(1) + t_(2)$.

	$ Delta arrow(x) = arrow(x)(Delta t + t_(0)) - arrow(x)(t_(0)) =
	  arrow(x)(t_(1) + t_(2) + t_(0)) - arrow(x)(t_(0)) =
	  arrow(x)(t_(1) + t_(2)) - arrow(x)(0) = arrow(0) - arrow(0) =
	  arrow(0) $

	$ d(Delta t + t_(0)) = || L + L || = 2L $
]

// Lo spostamento puó essere espresso per mezzo di un piano cartesiano...

La rapiditá con cui uno spostamento é compiuto é inversamente proporzionale
al tempo impiegato. Ovvero, se uno stesso spostamento viene compiuto in
meno tempo, la rapiditá di tale spostamento é piú alta. La *velocitá media*
fornisce una prima informazione su quanto rapidamente avvenga lo spostamento
di un corpo, da una situazione di partenza ad una di arrivo:

$ arrow(v)_("media") = frac(Delta arrow(x), Delta t) =
  frac(arrow(x)(t + Delta t) - arrow(x)(t), Delta t)
  [unit(metre/second)] $

Essendo la velocitá media un rapporto tra un vettore ed uno scalare, é
anch'essa un vettore. Inoltre, essendo il tempo una quantitá non negativa,
il segno della velocitá media é necessariamente lo stesso dello spostamento.

É possibile associare una velocitá anche alla distanza, chiamata *velocitá
scalare media*. Tale grandezza é data dal rapporto fra la distanza percorsa
in un intervallo di tempo $Delta t$ e l'intervallo di tempo stesso.

$ arrow(s)_("media") = frac(d(x), Delta t) = [unit(metre/second)] $

Cosí come la distanza, anche la velocitá scalare media é (come da nome) uno
scalare, ed é sempre positiva.

La velocitá media non é ancora sufficiente a descrivere il concetto di
rapiditá dello spostamento, perché non é in grado di descrivere cosa
accade istante per istante, ma soltanto ció che accade in due istanti
(partenza e arrivo); tutto ció che avviene nel mezzo é perduto.

Per ottenere questa forma di velocitá é possibile calcolare la velocitá
media in un lasso di tempo sempre piú piccolo. L'idea é che se é possibile
calcolare la velocitá media in un lasso di tempo infinitesimo, si avrebbe
la conoscenza della velocitá istante di tempo per istante di tempo, ovvero
una *velocitá istantanea* #footnote[In realtá, questa é una semplificazione.
Infatti, non é davvero possibile considerare un istante di tempo
infinitesimo, perché al di sotto di una certa scala diventa impossibile
osservare lo scorrere del tempo. Pertanto, si dovrebbe parlare di "lasso
di tempo arbitrariamente piccolo" piú che infinitesimo.]:

$ arrow(v)_("istantanea") = lim_(Delta t -> 0) arrow(v)_("media") =
  lim_(Delta t -> 0) frac(arrow(x)(t + Delta t) - arrow(x)(t), Delta t) =
  frac(d, d t) arrow(x)(t) [unit(metre/second)] $

Si noti infatti come l'espressione nel penultimo termine dell'uguaglianza
corrisponda perfettamente alla definizione di derivata. Inoltre, riportando
la funzione posizione-tempo su un piano cartesiano, é evidente come la
velocitá istantanea non sia altro che un vettore lungo la tangente in quel
punto.

#exercise[
	Un punto materiale si sta muovendo; la sua posizione é nota in ogni
	istante a partire dall'equazione $x(t) = -4t + 2t^(2)$. Si vuole
	calcolare:

	- Il suo spostamento tra gli istanti $t = 0 unit(second)$ e
	  $t = 1 unit(second)$;
	- Il suo spostamento tra gli istanti $t = 1 unit(second)$ e
	  $t = 3 unit(second)$;
	- La sua velocitá media tra gli istanti $t = 0 unit(second)$ e
	  $t = 1 unit(second)$;
	- La sua velocitá media tra gli istanti $t = 1 unit(second)$ e
	  $t = 3 unit(second)$;
	- La sua velocitá istantanea in $t = 2.5 unit(second)$.
]
#solution[
	$ Delta x = x(1) - x(0) = (-4 dot 1 + 2 dot 1^(2)) unit(metre) -
	  (-4 dot 0 + 2 dot 0^(2)) unit(metre) = (-4 + 2) unit(metre) - (0 + 0)
	  unit(metre) = -2 unit(metre) $

	$ Delta x = x(3) - x(1) = (-4 dot 3 + 2 dot 3^(2)) unit(metre) -
	  (-4 dot 1 + 2 dot 1^(2)) unit(metre) = (-12 + 18) unit(metre) - (-4 + 2)
	  unit(metre) = 8 unit(metre) $

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ v_("media") = frac(x(1) - x(0), 1 unit(second) - 0 unit(second)) =
		   frac(-2 unit(metre), 1 unit(second)) = -2 unit(metre/second) $],
		[$ v_("media") = frac(x(3) - x(1), 3 unit(second) - 1 unit(second)) =
		   frac(8 unit(metre), 2 unit(second)) = 4 unit(metre/second) $]
	)

	$ v(2.5) = frac(d, d t) x(2.5) = frac(d, d t)_(t = 2.5) -4t + 2t^(2) =
	  -4 + 4 dot 2.5 = 6 unit(metre/second) $
]

Oltre alla variazione della posizione in funzione del tempo, potrebbe
essere d'interesse a conoscere la variazione della velocitá in funzione
del tempo. Tale variazione é descritta dall'*accelerazione media*:

$ arrow(a)_("media") = frac(Delta arrow(v), Delta t) =
  frac(arrow(v)(t + Delta t) - arrow(v)(t), Delta t)
  [unit(metre / second^2)] $

Cosí come per la velocitá, é possibile definire una *accelerazione istantanea*:

$ arrow(a)_("istantanea") = lim_(Delta t -> 0)
  frac(Delta arrow(v), Delta t) = lim_(Delta t -> 0)
  frac(arrow(v)(t + Delta t) - arrow(v)(t), Delta t) =
  frac(d, d t) arrow(v)(t) = frac(d^(2), d t) arrow(x)(t)
  [unit(metre / second^2)] $

La velocitá istantanea e l'accelerazione istantanea sono le quantitá
che vengono indicate come "velocitá" e "accelerazione" in senso stretto.
Pertanto, se non specificato diversamente, si tende ad indicare la
velocitá e l'accelerazione istantanea semplicemente con "velocitá" e
"accelerazione".

// Plots plots plots

In genere, l'accelerazione é nota (per altri mezzi) cosí come lo é
il tempo, mentre non lo é la velocitá. Per tale motivo, é ragionevole
esplicitare la formula rispetto alla velocitá. Questo comporta di
invertire una derivata, ovvero calcolare un integrale:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ integral_(t_(0))^(t) arrow(a)(t') d t' =
	   integral_(t_(0))^(t) frac(d, d t) arrow(v)(t') =
	   arrow(v)(t) - arrow(v)(t_(0)) $],
	[$ integral_(t_(0))^(t) arrow(v)(t') d t' =
	   integral_(t_(0))^(t) frac(d, d t) arrow(x)(t') =
	   arrow(x)(t) - arrow(x)(t_(0)) $]
)

Una espressione di questo tipo necessita peró di descrivere interamente la
funzione con cui varia l'accelerazione. Questo puó essere fatto solamente
se la funzione accelerazione é una funzione nota.

#exercise[
	Un punto materiale si sta muovendo; la sua posizione é nota in
	ogni istante a partire dall'equazione $v(t) = 40t - 5t^(2)$.
	Qual'é l'accelerazione media tra gli istanti $t = 0 unit(second)$
	e $t = 2 unit(second)$? Qual'é l'accelerazione istantanea al tempo
	$t = 2 unit(second)$?
]
#solution[
	$ a_("media") = frac(v(2) - v(0), (2 - 0) unit(second)) =
	  frac((40 - 5 dot 2^(2)) unit(metre/second) - (40 - 5 dot 0^(2))
	  unit(metre/second), 2 unit(second)) = frac(20 unit(metre/second) -
	  40 unit(metre/second), 2 unit(second)) = -10 unit(metre/second^(2)) $

	$ a(2) = frac(d, d t) v(2) = frac(d, d t)_(t = 2) 40t - 5t^(2) =
	  40 - 5 dot 2 (2) = 20 unit(metre/second^(2)) $

]

=== Caso di studio: moto uniformemente accelerato

Il moto unidimensionale piú semplice da esaminare é il *moto uniformemente
accelerato*, in cui la funzione accelerazione é una funzione costante. In
altri termini, $arrow(a)(t) = arrow(a)$ per qualsiasi istante di tempo $t$.
Recuperando la formula, si ha:

$ arrow(v)(t) - arrow(v)(t_(0)) =
  integral_(t_(0))^(t) arrow(a)(t') d t' =
  integral_(t_(0))^(t) arrow(a) d t' =
  arrow(a) integral_(t_(0))^(t) d t' =
  arrow(a) dot (t - t_(0)) =
  arrow(a) t - arrow(a) t_(0) $

É poi possibile fare lo stesso rispetto alla posizione, sostituendo
nell'espressione della velocitá la formula appena ricavata:

$ arrow(x)(t) - arrow(x)(t_(0)) = integral_(t_(0))^(t) v(t') d t' =
  integral_(t_(0))^(t) arrow(v)(t_(0)) + arrow(a) t - arrow(a) t_(0) d t' =
  integral_(t_(0))^(t) arrow(v)(t_(0)) d t' +
  integral_(t_(0))^(t) arrow(a) t d t' -
  integral_(t_(0))^(t) arrow(a) t_(0) d t' = \
  arrow(v)(t_(0)) integral_(t_(0))^(t) d t' +
  arrow(a) integral_(t_(0))^(t) t d t' -
  arrow(a) integral_(t_(0))^(t) t_(0) d t' =
  arrow(v)(t_(0)) (t - t_(0)) +
  arrow(a) (frac(1, 2) t^(2)) -
  arrow(a) (frac(1, 2) t_(0)^(2)) =
  arrow(v)(t_(0)) (t - t_(0)) +
  frac(1, 2) arrow(a) (t - t_(0))^(2) $

// C'é qualcosa di strano in questo integrale...

Riassumendo le due formule trovate ed esplicitando rispetto a
$arrow(x)(t)$ e $arrow(v)(t)$ si ottiene:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ arrow(v)(t) = arrow(v)(t_(0)) + arrow(a) (t - t_(0)) $],
	[$ arrow(x)(t) = arrow(x)(t_(0)) + arrow(v)(t_(0)) (t - t_(0)) +
	   frac(1, 2) arrow(a) (t - t_(0))^(2) $]
)

#exercise[
	Un aereo sta effettuando un atterraggio: tocca terra con una velocitá di
	$64 unit(metre/second^(2))$ per poi rallentare con decelerazione costante
	fino a fermarsi. Quanto vale questa decelerazione se per fermarsi l'aereo
	impiega $2 unit(second)$? Qual'é la sua posizione dopo essersi fermato?
	Si assuma $t_(0) = 0 unit(second)$ e $x(t_(0)) = 0 unit(metre)$.
]
#solution[
	Se l'aereo sta rallentando con accelerazione (negativa) costante, sono
	valide le leggi del moto uniformemente accelerato. Il fatto che si sia
	fermato indica che la sua velocitá dopo $2 unit(second)$ é nulla. La
	velocitá con cui l'aereo tocca terra é la velocitá con cui inizia il
	suo moto a decelerazione costante. Tale decelerazione é quindi:

	$ v(t) = v(t_(0)) + a dot (t - t_(0)) =>
	  a = frac(v(t) - v(t_(0)), t - t_(0)) =
	  frac(v(2) - v(0), 2 unit(second) - 0 unit(second)) =
	  frac((0 - 64) unit(metre/second), 2 unit(second)) =
	  -32 unit(metre/second^(2)) $

	La sua posizione dopo essersi fermato é data da:

	$ x(t) &= x(t_(0)) + v(t_(0)) t + frac(1, 2) a t^(2) =>
	  x(2) = x(0) + v(0) dot 2 unit(second) +
	  frac(1, 2) dot a dot 2^(2) unit(second) = \
	  &= 0 unit(metre) + 64 unit(metre/second) dot 2 unit(second) +
	  frac(1, 2) dot (-32) unit(metre/second^(2)) dot 4 second^(2) =
	  64 unit(metre) $
]

=== Caso di studio: moto in caduta libera

Un esempio specifico di moto uniformemente accelerato é il *moto in caduta
libera*. Questo é tipo di moto che descrive i corpi lasciati liberi di subire
l'effetto della forza di gravitá del pianeta Terra. Tale accelerazione é
indipendente da qualsiasi caratteristica del corpo che compie il moto, come
la sua massa o la sua forma (Il motivo per cui questo non sempre avviene é
perché la forma di un corpo subisce l'attrito dell'aria).

Tale accelerazione varia a seconda dell'altitudine: piú ci si trova vicino al
livello del mare e piú é intensa. Tuttavia, per le applicazioni pratiche il
suo valore é approssimativamente costante, ed é pari a $plus.minus 9.8
unit(metre / second^2)$.

#exercise[
	Una palla viene lanciata verso l'alto con velocitá $20 unit(metre/second)$,
	che ricade poi verso il basso toccando il suolo. Si assuma $t_(0) = 0
	unit(second)$ e $x(t_(0)) = 0 unit(metre)$.

	- Quanto tempo impiega la palla a raggiungere il punto di massima altezza?
	- Qual'é la massima altezza che la palla riesce a raggiungere?
	- Qual'é la posizione della palla al tempo $t = 5 unit(second)$?
	- Qual'é la velocitá della palla al tempo $t = 5 unit(second)$?
]
#solution[
	Il punto di massima altezza é quello dove la palla é ferma a mezz'aria. Si
	noti come l'accelerazione del corpo in caduta libera sia negativa.

	$ v(t) = v(t_(0)) + a dot (t - t_(0)) =>
	  0 = v(0) - g dot (t - 0) =>
	  t = frac(v(0), g) =
	  frac(20 unit(metre/second), 9.8 unit(metre/second^(2))) =
	  2.04 unit(second) $

	$ x(t) = x(t_(0)) + v(t_(0)) t + frac(1, 2) a t^(2) =
	  x(0) + v(0) t - frac(1, 2) g t^(2) =
	  0 unit(metre) + 20 unit(metre/second) dot 2.04 unit(second) -
	  frac(1, 2) 9.8 unit(metre/second^(2)) (2.04)^(2) unit(second^(2)) =
	  20.4 unit(metre) $

	$ v(t) = v(t_(0)) + a dot (t - t_(0)) =>
	  v(5) = v(0) - g dot (5 - 0) =
	  20 unit(metre/second) - 9.8 unit(metre/second^(2)) dot
	  (5 unit(second) - 0 unit(second)) = -29 unit(metre/second) $

	$ x(t) = x(t_(0)) + v(t_(0)) t + frac(1, 2) a t^(2) =>
	  x(5) = x(0) + v(0) dot 5 - frac(1, 2) g dot 5^(2) =
	  0 unit(metre) + 20 unit(metre/second) dot 5 unit(second) -
	  frac(1, 2) 9.8 unit(metre/second^(2)) 5^(2) unit(second^(2)) =
	  -22.5 unit(metre) $
]
