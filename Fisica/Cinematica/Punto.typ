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

Il caso piú semplice da esaminare si ha quando l'accelerazione non cambia
mai, ovvero quando la funzione accelerazione é una funzione costante. In
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
$arrow(x)(t)$ e $arrow(v)(t)$ si ottiene la legge oraria per
un punto materiale con accelerazione costante. Tale tipo di
moto viene anche detto *moto uniformemente accelerato*:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ arrow(v)(t) = arrow(v)(t_(0)) + arrow(a) (t - t_(0)) $],
	[$ arrow(x)(t) = arrow(x)(t_(0)) + arrow(v)(t_(0)) (t - t_(0)) +
	   frac(1, 2) arrow(a) (t - t_(0))^(2) $]
)

Un esempio di moto uniformemente accelerato é il *moto in caduta libera*.
Questo é tipo di moto che descrive i corpi lasciati liberi di subire l'effetto
della forza di gravitá del pianeta Terra. Tale accelerazione é indipendente da
qualsiasi caratteristica del corpo che compie il moto, come la sua massa o la
sua forma (Il motivo per cui questo non sempre avviene é perché la forma di
un corpo subisce l'attrito dell'aria).

Tale accelerazione varia a seconda dell'altitudine: piú ci si trova vicino al
livello del mare e piú é intensa. Tuttavia, per le applicazioni pratiche il
suo valore é approssimativamente costante, ed é pari a $plus.minus 9.8
unit(metre / second^2)$.
