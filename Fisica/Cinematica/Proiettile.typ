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
