#import "../Fisica_defs.typ": *

Una classe di moti bidimensionali di particolare interesse é quella dove la
traiettoria descritta dal punto materiale é una circonferenza. Un moto di
questo tipo prende il nome di *moto circolare*.

Imponendo un sistema di assi cartesiani al centro di tale circonferenza,
la posizione in ogni momento del punto materiale é data dal vettore che
unisce il centro con un punto lungo tale circonferenza, che per definizione
é un raggio, ed é quindi di modulo costante nel tempo. Tale vettore forma
un angolo $theta$ con l'asse orizzontale, ed é pertanto possibile scomporre
la posizione di un punto $arrow(p)(t)$ nelle due componenti:

$ arrow(p)(t) = cases(
  arrow(p_(x))(t) = |arrow(r)| cos(theta(t)),
  arrow(p_(y))(t) = |arrow(r)| sin(theta(t))) $

La posizione di un punto materiale che si muove di moto circolare puó anche
essere determinata dalla lunghezza dell'arco di circonferenza che ha per
estremi il punto in questione ed il punto di coordinate $(|arrow(r)|, 0)$.
Le due descrizioni sono equivalenti, perché l'arco di circonferenza $x(t)$
descritto dal punto all'istante $t$ ed il modulo del vettore $arrow(p)(t)$ che
congiunge il punto con il centro della circonferenza sono legati da un rapporto:

// Qui ci va il rapporto...

Essendo $|r|$ una costante, $x(t)$ e $theta(t)$ sono proporzionali.

La velocitá di un punto materiale che si muove di moto circolare puó essere
definita anche come variazione istantanea (in istanti di tempo infinitesimi)
dell'angolo $theta$ formato dal vettore posizione con l'asse orizzontale. Tale
velocitá prende il nome di *velocitá angolare*.

$ omega(t) = lim_(Delta t -> 0) frac(theta(t + Delta t) - theta(t),
  Delta t) = frac(d, d t) theta(t) [unit(rad/second)] $

La velocitá in senso stretto (la velocitá istantanea) rimane comunque
definita come la variazione istantanea della posizione del punto materiale.
Per quanto appena stabilito, tale velocitá puó anche essere espressa come
prodotto fra la velocitá angolare ed il raggio del cerchio descritto dal punto
materiale:

$ arrow(v)(t) = frac(d, d t) arrow(x)(t) =
  cases(display(frac(d, d t) (|r| cos(theta(t)))),
        display(frac(d, d t) (|r| sin(theta(t))))) =
  cases(|r| display(frac(d, d t) cos(theta(t))),
        |r| display(frac(d, d t) sin(theta(t)))) =
  cases(-|r| sin(theta(t)) display(frac(d, d t) theta(t)),
        |r| cos(theta(t)) display(frac(d, d t) theta(t))) =
  cases(-|r| sin(theta(t)) omega(t),
        |r| cos(theta(t)) omega(t)) $

Il punto materiale potrebbe avere anche una accelerazione rispetto alla
velocitá angolare, ovvero potrebbe percorrere sezioni di circonferenza di
uguale lunghezza in tempi diversi. Tale accelerazione prende il nome di
*accelerazione angolare* $alpha(t)$, ed in analogia con l'accelerazione in
senso stretto é data dalla derivata seconda dell'angolo descritto dal vettore
posizione del punto materiale in funzione del tempo.

$ alpha(t) = lim_(Delta t -> 0) frac(omega(t + Delta t) - omega(t),
  Delta t) = frac(d, d t) omega(t) = frac(d^(2), d t) theta(t) $

L'accelerazione in senso stretto é quindi data da:

$ arrow(a) = lim_(Delta t -> 0) frac(arrow(v)(t + Delta t) - arrow(v)(t),
  Delta t) = frac(d, d t) arrow(v)(t) = |r| frac(d^(2), d t) theta(t) =
  cases(|r| display(frac(d, d t) (-sin(theta(t)) omega(t))),
        |r| display(frac(d, d t) (cos(theta(t)) omega(t)))) = \
  cases(-|r| ((cos(theta(t)) omega(t)) omega(t) +
        sin(theta(t)) display(frac(d, d t)) omega(t)),
        -|r| ((sin(theta(t)) omega(t)) omega(t) -
        cos(theta(t)) display(frac(d, d t)) omega(t))) =
  cases(-|r| (cos(theta(t)) omega^(2)(t) + sin(theta(t)) alpha(t)),
        -|r| (sin(theta(t)) omega^(2)(t) - cos(theta(t)) alpha(t))) $

In genere, l'accelerazione é nota (per altri mezzi) cosí come lo é
il tempo, mentre non lo é la velocitá. Per tale motivo, é ragionevole
esplicitare la formula rispetto alla velocitá. Questo comporta di
invertire una derivata, ovvero calcolare un integrale:

Come é stato fatto per il moto unidimensionale, é possibile esplicitare
le formula per l'accelerazione angolare rispetto alla velocitá angolare
calcolando un integrale:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ integral_(t_(0))^(t) alpha(t') d t' =
	   integral_(t_(0))^(t) frac(d, d t) omega(t') =
	   omega(t) - omega(t_(0)) $],
	[$ integral_(t_(0))^(t) omega(t') d t' =
	   integral_(t_(0))^(t) frac(d, d t) theta(t') =
	   theta(t) - theta(t_(0)) $]
)

=== Caso di studio: moto circolare uniforme

Il *moto circolare uniforme* é un moto circolare dove oltre al modulo
del vettore posizione anche la velocitá angolare é costante nel tempo.
Naturalmente, essendo la velocitá proporzionale alla velocitá angolare,
anche la velocitá sará costante in modulo nel tempo.

In questa particolare situazione, il numero di rivoluzioni che il punto
compie é necessariamente costante, pertanto per descrivere il suo moto é
sufficiente conoscere il tempo che il punto materiale impiega per compiere
un giro completo. Il numero di rivoluzioni che un punto materiale compie
in un secondo prende il nome di *frequenza*, mentre il tempo necessario
per compiere un giro completo prende il nome di *periodo*:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ nu = frac("numero di giri", 1 unit(second)) [unit(hertz)] $],
	[$ T = frac(1, nu) [unit(second)] $]
)

Diventa pertanto possibile esprimere la velocitá e la velocitá angolare in
termini di frequenza e periodo:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ omega(t) = omega = 2 pi nu = frac(2 pi, T) $],
	[$ v(t) = v = omega r = frac(2 pi r, T) $]
)

Sebbene il moto abbia una velocitá costante in modulo, la sua direzione varia
costantemente, pertanto il vettore velocitá (ovvero, se si considera sia la
direzione del moto che il suo modulo) non é costante. É quindi possibile
associare a questo moto una accelerazione, derivando la velocitá. Il verso di
questo vettore accelerazione punta sempre verso il centro, pertanto prende il
nome di *accelerazione centripeta*.

Per ricavare il modulo, é possibile approcciare il problema descrivendo il
moto usando come sistema di riferimento un sistema di assi rotanti, dove il
primo versore $hat(u)_(r)$ si trova sulla retta che congiuge il punto con il
centro del cerchio descritto mentre il secondo versore $hat(u)_(theta)$ é a
questo perpendicolare.

Il sistema di riferimento cosí descritto cambia la direzione dei suoi
versori in ogni istante di tempo, ma ha il vantaggio di avere il vettore
velocitá sempre parallela al versore $hat(u)_(r)$ e sempre perpendicolare
al versore $hat(u)_(theta)$ mentre il vettore spostamento é sempre parallelo
al versore $hat(u)_(theta)$ e sempre perpendicolare al vettore $hat(u)_(r)$.
É allora possibile scrivere:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ arrow(v) = hat(u)_(theta) v $],
	[$ arrow(r) = hat(u)_(r) r $]
)

Il versore $hat(u)_(theta)$ puó essere scomposto lungo due componenti, una
orizzontale ed una verticale, rispetto ad un secondo sistema di riferimento
centrato nel centro del cerchio. In ogni istante di tempo, il versore descrive
un diverso angolo $theta$ con l'orizzontale, pertanto le due componenti sono
dipendenti dal tempo. É pertanto possibile decomporre il vettore come:

$ hat(u)_(theta) = hat(i) u^(x)_(theta) (t) + hat(j) u^(y)_(theta) (t) =
  hat(i) dot 1 dot cos((theta + frac(pi, 2)) (t)) + hat(j) dot 1 dot
  cos((theta + frac(pi, 2)) (t)) = hat(j) cos(theta (t)) - hat(i) sin(theta
  (t)) $

Dove il fattore $1$ deriva dal fatto che $hat(u)_(theta)$ é un versore
e ha quindi modulo $1$. La quantitá $frac(pi, 2)$ deriva invece dal fatto
che l'angolo che si sta considerando é quello formato dal versore $hat(u)_(r)$,
che é perpendicolare a quello formato da $hat(u)_(theta)$, ed é quindi
"spostato" di $frac(pi, 2)$ radianti.

Derivando la velocitá rispetto al tempo, si ha il modulo dell'accelerazione
centripeta:

$ abs(a) = abs(frac(d, d t) arrow(v)) = abs(frac(d, d t) hat(u)_(theta) v) =
  v abs(frac(d, d t) hat(u)_(theta)) = v abs(frac(d, d t) (hat(j) cos(theta
  (t)) - hat(i) sin(theta (t)))) = v abs(frac(d, d t) hat(j) cos(theta (t)) -
  frac(d, d t) hat(i) sin(theta (t))) = \
  v abs(- hat(j) sin(theta (t)) frac(d, d t) theta(t) - hat(i) cos(theta (t))
  frac(d, d t) theta(t)) = v abs(hat(j) sin(theta (t)) omega + hat(i)
  cos(theta (t)) omega) = v omega abs(hat(j) sin(theta (t)) + hat(i) cos(theta
  (t))) = \
  v omega sqrt(sin^(2)(theta (t)) + cos^(2)(theta (t))) = v omega dot 1 =
  omega r dot omega = omega^(2) r $

Che é anch'essa costante, dato che nella sua espressione non vi é una
dipendenza dal tempo.

#exercise[
	Il moto di rivoluzione di un pianeta attorno alla sua stella puó
	essere approssimato ad un moto circolare uniforme #footnote[Questo
	é vero solamente se il pianeta in questione si trova sufficientemente
	vicino alla stella. Piú é lontano, piú l'orbita che descrive si fa
	ellittica.]. Sapendo che la Terra dista circa $1.496 times 10^(11)
	unit(metre)$ dal Sole, qual'é il valore della velocitá angolare che
	ha la Terra nel suo moto di rivoluzione attorno al Sole? E quello
	dell'accelerazione centripeta?
]
#solution[
	La Terra impiega (circa) $1$ anno a compiere una rivoluzione
	completa attorno al Sole, ed é pertanto questo il periodo del
	moto in esame:

	$ 1 "anno" = 365 "giorni" = 8760 "ore" = 525600 "minuti" =
	  31536000 unit(second) $

	Noto il periodo, é possibile calcolare la velocitá angolare:

	$ omega = frac(2 pi, T) = frac(2 pi, 3.15 times 10^(7) unit(second)) =
	  2.00 times 10^(-7) unit(rad/second) $

	Nota la velocitá angolare, é possibile calcolare l'accelerazione
	centripeta:

	$ a = omega^(2) r = (2.00 times 10^(-7) unit(rad/second))^(2) dot
	  1.496 times 10^(11) unit(metre) =
	  5.93 times 10^(-3) unit(rad/second^(2)) $
]

Un modo alternativo per derivare l'accelerazione centripeta é quello di
osservare la formula dell'accelerazione per un moto circolare. Essendo il
moto rettilineo uniforme privo di accelerazione angolare e dalla velocitá
(angolare) costante, sostituendovi $alpha(t) = 0$ e $omega(t) = omega$ si ha:

$ cases(-|r| (cos(theta(t)) omega^(2)(t) + sin(theta(t)) dot 0),
        -|r| (sin(theta(t)) omega^(2)(t) - cos(theta(t)) dot 0)) =
  cases(-|r| cos(theta(t)) omega^(2),
        -|r| sin(theta(t)) omega^(2)) =
  sqrt((-|r| cos(theta(t)) omega^(2))^(2) +
      (-|r| sin(theta(t)) omega^(2))^(2)) = \
  sqrt((|r|^(2) cos^(2)(theta(t)) omega^(4)) +
      (|r|^(2) sin^(2)(theta(t)) omega^(4))) =
  sqrt((|r|^(2) omega^(4))(cos^(2)(theta(t)) + sin^(2)(theta(t)))) =
  sqrt((|r|^(2) omega^(4)) dot 1) = |r| omega^(2) $

=== Caso di studio: moto armonico

La proiezione di un moto circolare uniforme lungo un asse viene detta *moto
armonico*. Di fatto, ciascuna delle due componenti dimensionali di un moto
circolare uniforme, se presa singolarmente, descrive un moto armonico.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ arrow(p_(x))(t) = |arrow(r)| cos(theta(t)) $],
	[$ arrow(p_(y))(t) = |arrow(r)| sin(theta(t))) $]
)

Per semplicitá, si consideri un moto lungo la componente $x$, e si introduca
uno sfasamento $phi.alt$ di modo che non vi sia differenza fra seno e coseno
(essendo l'una la traslazione dell'altra).

$ x(t) = r cos(omega t + phi.alt) $

// Perché omega t?

$r$ viene detta *ampiezza*, ed indica l'altezza massima che la
traiettoria descritta dal punto riesce a raggiungere. $phi.alt$ viene
detta *fase iniziale* ed indica l'altezza al tempo iniziale. $omega$
viene detta *frequenza angolare*.

Il tempo che un punto materiale impiega per percorrere un giro completo
in un moto circolare uniforme corrisponde al tempo che un punto materiale
impiega per passare da un punto ad una certa altezza ad un punto con la
medesima altezza in un moto armonico. Ricordando che la formula per il
calcolo della velocitá angolare di un moto circolare uniforme é $omega =
2 pi slash T$, il periodo $T = 2 pi slash omega$ viene detto *periodo di
oscillazione* per il moto armonico.

=== Caso di studio: moto circolare uniformemente accelerato

Il *moto circolare uniformemente accelerato* é un moto circolare in cui
l'accelerazione angolare é costante. In questo caso, é effettivamente
possibile risolvere l'integrale in maniera semplice:

$ omega(t) - omega(t_(0)) =
  integral_(t_(0))^(t) alpha(t') d t' =
  integral_(t_(0))^(t) alpha d t' =
  alpha integral_(t_(0))^(t) d t' =
  alpha dot (t - t_(0)) =
  alpha t - alpha t_(0) $

Da cui si ha:

$ theta(t) - theta(t_(0)) = integral_(t_(0))^(t) omega(t') d t' =
  integral_(t_(0))^(t) omega(t_(0)) + alpha t - alpha t_(0) d t' =
  integral_(t_(0))^(t) omega(t_(0)) d t' +
  integral_(t_(0))^(t) alpha t d t' -
  integral_(t_(0))^(t) alpha t_(0) d t' = \
  omega(t_(0)) integral_(t_(0))^(t) d t' +
  alpha integral_(t_(0))^(t) t d t' -
  alpha integral_(t_(0))^(t) t_(0) d t' =
  omega(t_(0)) (t - t_(0)) +
  alpha (frac(1, 2) t^(2)) -
  alpha (frac(1, 2) t_(0)^(2)) =
  omega(t_(0)) (t - t_(0)) +
  frac(1, 2) alpha (t - t_(0))^(2) $

// C'é qualcosa di strano in questo integrale...

Ovvero:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ omega(t) = omega(t_(0)) + alpha (t - t_(0)) $],
	[$ theta(t) = theta(t_(0)) + omega(t_(0)) (t - t_(0)) +
	   frac(1, 2) alpha (t - t_(0))^(2) $]
)

Che corrisponde al risultato trovato per il moto uniformemente accelerato in
una dimensione.
