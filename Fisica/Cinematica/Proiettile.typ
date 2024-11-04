#import "../Fisica_defs.typ": *

Per analizzare un moto in due dimensioni, non é sufficiente considerare
posizioni, velocitá e accelerazioni esclusivamente in termini del loro
valore assoluto e del loro segno. Diventa pertanto necessario associarvi un
vettore, il cui modulo rappresenta il valore in sé associato alla quantitá e
la direzione rappresenta come questo si orienta nello spazio bidimensionale.

Un punto materiale che si muove in due dimensioni puó essere decomposto come
somma di un moto unidimensionale in orizzontale ed un moto unidimensionale in
verticale. É allora possibile descrivere una posizione in due dimensioni
$arrow(r)$ in un certo tempo fissato $t_(0)$ come una somma vettoriale:

$ arrow(r)(t_(0)) = arrow(x)(t_(0)) + arrow(y)(t_(0)) =
  hat(i) x(t_(0)) + hat(j) y(t_(0)) $

Essendo le due direzioni completamente indipendenti, per costruire dei
vettori velocitá é sufficiente calcolare separatamente velocitá per ciascuna
direzione ed operare una somma vettoriale:

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ v_(x)(t) = cos(theta) v(t) = frac(d, d t) x(t) $],
	[$ v_(y)(t) = sin(theta) v(t) = frac(d, d t) y(t) $],
	[$ arrow(v)(t) = hat(i)v_(x)(t) + hat(j)v_(y)(t) $]
)

Lo stesso puó essere fatto per l'accelerazione:

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ a_(x)(t) = cos(theta) a(t) = frac(d^(2), d t) x(t) $],
	[$ a_(y)(t) = sin(theta) a(t) = frac(d^(2), d t) y(t) $],
	[$ arrow(a)(t) = hat(i)a_(x)(t) + hat(j)a_(y)(t) $]
)

Si assuma che sia l'accelerazione rispetto alla componente orizzontale che
quella rispetto alla componente verticale siano costanti. Diventa allora
possibile scrivere delle leggi orarie per la posizione rispetto ad entrambe
le componenti:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ x(t) = x(t_(0)) + v_(x)(t_(0)) (t - t_(0)) +
	   frac(1, 2) a_(x) (t - t_(0))^(2) $],
	[$ y(t) = y(t_(0)) + v_(y)(t_(0)) (t - t_(0)) +
	   frac(1, 2) a_(y) (t - t_(0))^(2) $],
)

Un caso di studio particolarmente interessante é quello del *moto parabolico*,
ovvero di un oggetto che si muove nello spazio unicamente sottoposto
all'attrazione gravitazionale.

Un corpo di questo tipo si muove lungo la direzione orizzontale con
accelerazione costante pari a $0$, mentre si muove lungo la direzione
verticale con accelerazione costante pari a $-g$, essendo influenzato
dalla gravitá della Terra (il segno meno é dovuto al fatto che la gravitá
va dall'alto al basso). Fintanto che la distanza percorsa é sensibilmente
piú piccola del raggio terreste, é possibile approssimare la Terra come
un piano ed é quindi giustificato considerare l'accelerazione di gravitá
uniforme ovunque. Un moto di questo tipo puó quindi essere descritto
lungo le due direzioni come:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ x(t) = x(t_(0)) + v_(x)(t_(0)) (t - t_(0)) $],
	[$ y(t) = y(t_(0)) + v_(y)(t_(0)) (t - t_(0)) -
	   frac(1, 2) g (t - t_(0))^(2) $],
)

Il nome moto parabolico viene dal fatto che risolvendo la prima equazione
rispetto a $(t - t_(0))$ e sostituendo nella seconda, si ottiene l'equazione
di una parabola:

$ y(t) = y(t_(0)) + v_(y)(t_(0)) (frac(x(t) - x(t_(0)), v_(x)(t_(0)))) -
  frac(1, 2) g (frac(x(t) - x(t_(0)), v_(x)(t_(0))))^(2) = \
  y(t_(0)) + frac(sin(theta) cancel(v(t_(0))) [x(t) - x(t_(0))], cos(theta)
  cancel(v(t_(0)))) - frac(g[x^(2)(t) + x^(2)(t_(0)) - 2x(t) x(t_(0))],
  2(cos(theta)  v(t_(0)))^(2)) = \
  y(t_(0)) + tan(theta) [x(t) - x(t_(0))] - frac(g x^(2)(t) + g x^(2)(t_(0)) -
  2g x(t) x(t_(0)), 2cos^(2)(theta) v^(2)(t_(0))) = \
  y(t_(0)) + tan(theta) x(t) - tan(theta) x(t_(0)) - frac(g x^(2)(t),
  2cos^(2)(theta) v^(2)(t_(0))) - frac(g x^(2)(t_(0)), 2cos^(2)(theta)
  v^(2)(t_(0))) + frac(cancel(2) g x(t) x(t_(0)), cancel(2) cos^(2)(theta)
  v^(2)(t_(0))) = \
  underbracket((frac(-g, 2cos^(2)(theta) v^(2)(t_(0)))), A) x^(2)(t) +
  underbracket((tan(theta) + frac(g x(t_(0)), cos^(2)(theta)
  v^(2)(t_(0)))), B) x(t) + underbracket(y(t_(0)) - tan(theta) x(t_(0)) -
  frac(g x^(2)(t_(0)), 2cos^(2)(theta)  v^(2)(t_(0))), C) $

Dove $A$, $B$ e $C$ sono costituite da valori noti.

A partire da tale equazione é possibile calcolare il range orizzontale,
ovvero la posizione in cui il corpo si trova orizzontalmente alla
stessa altezza di quando il corpo é stato lanciato. Per farlo é sufficiente
imporre $y(t) = y(t_(0))$; dato che le due quantitá si trovano da parti opposte
dell'equazione, le due si elidono, ottenendo:

$ (frac(-g, 2cos^(2)(theta) v^(2)(t_(0)))) x^(2)(t) +
  (tan(theta) + frac(g x(t_(0)), cos^(2)(theta) v^(2)(t_(0)))) x(t) -
  (tan(theta) x(t_(0)) + frac(g x^(2)(t_(0)), 2cos^(2)(theta)
  v^(2)(t_(0)))) = 0 $

Un'altro caso di studio di moto in due dimensioni é il *moto circolare
uniforme*, un moto in cui un corpo materiale si muove descrivendo una
traiettoria circolare la cui velocitá é costante in modulo.

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

Viene poi definita *velocitá angolare*.
La velocitá in senso stretto (la velocitá istantanea) é quindi il prodotto fra
la velocitá angolare ed il raggio del cerchio descritto dalla traiettoria del
corpo.

// Manca completamente la descrizione della velocitá angolare

#grid(
	columns: (0.5fr, 0.5fr),
	[$ omega = 2 pi nu = frac(2 pi, T) [unit(rad/second)] $],
	[$ v = frac(2 pi r, T) = omega r [unit(metre/second)] $]
)

Come di consueto, il vettore velocitá é dato dalla derivata della posizione,
pertanto tale vettore é una tangente al cerchio descritto dal punto materiale.

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
