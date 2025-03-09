#import "../Fisica_defs.typ": *

L'energia potenziale é stata definita come il lavoro compiuto dalla forza
di gravitá, cambiato di segno. Piú in generale, una energia potenziale puó
essere assegnata a qualsiasi energia associata ad una forza conservativa.
Essendo la forza elettrostatica, come dimostrato empiricamente, anch'essa
conservativa, é possibile associarvi una energia potenziale, l'*energia
potenziale elettrica*.

Si consideri una carica esploratrice $q_(0)$ localizzata nello spazio nel
punto $P$, sottoposta all'azione del campo elettrico di un'altra carica.
Si voglia definire l'energia potenziale elettrica $U$ associata a $q_(0)$:
innanzitutto, $U = 0$ quando la sorgente del campo elettrico é infinitamente
lontana rispetto a $q_(0)$, cosí lontana da essere trascurabile. Dopodiché,
la carica $q_(0)$ viene mano a mano avvicinata e su questa agirá la forza
elettrostatica, compiendo un lavoro ed inducendo una energia potenziale
elettrica:

$ U = -W_(infinity) [joule] $

Dove il pedice di $W$ sottolinea il fatto che tale carica viene
fatta avvicinare a partire da un punto infinitamente lontano.

Oltre all'energia potenziale elettrica, é possibile definire anche
un *potenziale elettrico* $V$ #footnote[Si noti come, nonostante
"potenziale elettrico" ed "energia potenziale elettrica" abbiano
nomi simili, non siano la stessa cosa (per quanto siano legate)]
come rapporto fra l'energia potenziale elettrica e la carica
esploratrice:

$ V = frac(-W_(infinity), q_(0)) = frac(U, q_(0)) [joule / coulomb] $

L'unitá di misura del potenziale elettrico viene chiamata per
semplicitá *Volt* (simbolo $volt$).

In altre parole, il potenziale elettrico é la quantitá di
energia potenziale elettrica per unitá di carica quando
questa viene avvicinata a partire dall'infinito. Si noti
come $V$ possa essere sia positivo che negativo, dato che
sia $U$ sia $q_(0)$ possono essere positivi o negativi, e
come sia una quantitá scalare, essendo il rapporto di due
quantitá scalari.

Per tal motivo, é possibile anche esprimere l'energia potenziale
elettrica in funzione del potenziale elettrico:

$ U = q V $

Il potenziale elettrico, come l'energia potenziale elettrica, dipende
anche dalla posizione. Spostandosi da un punto $i$ ad un punto $j$, il
potenziale elettrico varia di una differenza pari a:

$ Delta V = V_(f) - V_(i) $

Allo stesso modo, l'energia potenziale elettrica varia di una differenza
pari a:

$ Delta U = U_(f) - U_(i) = q V_(f) - q V_(i) = q Delta V $

Tale variazione puó essere sia positiva che negativa a seconda del segno
di $q$ e di $Delta V$. Essendo poi la forza elettrostatica una forza
conservativa, tale variazione non dipende dal percorso scelto.

Ovviamente, é possibile associare alla variazione di energia potenziale
elettrica da una posizione $i$ ad una $f$ con il lavoro compiuto dalla
forza elettromagnetica per indurre tale spostamento:

$ W = -Delta U = -q Delta V = -q (V_(f) - V_(i)) = q (V_(i) - V_(f)) $

Essendo il campo elettrico il tramite dell'interazione elettromagnetica,
dire che é la forza elettromagnetica o il campo elettrico a compiere il
lavoro non fa differenza.

Se una particella si sta muovendo nella zona di influenza di un campo
elettrico e l'unica forza che questa subisce é quella associata a tale
campo, allora l'energia meccanica viene conservata (essendo la forza
elettrostatica conservativa):

$ Delta K + Delta U = 0 => K_(i) + U_(i) = K_(f) + U_(f) $

Da cui é possibile ricavare un'equazione per la variazione di energia
cinetica indotta dallo variazione di potenziale elettrico:

$ Delta K = -Delta U = -q Delta V = q(V_(i) - V_(f)) $

Una qualsiasi forma di energia potenziale dipende solamente dalla
configurazione del sistema; nel caso dell'energia potenziale elettrica
significa semplicemente la distanza fra la carica esploratrice e la
sorgente del campo elettrico. Pertanto l'energia potenziale elettrica,
e quindi anche il potenziale elettrico, ha lo stesso valore in tutti
i punti equidistanti dalla sorgente.

Tutti i punti dello spazio che hanno il medesimo valore di potenziale
elettrico formano una superficie, chiamata *superficie equipotenziale*.
Il lavoro compiuto dalla forza elettrostatica su una carica esploratrice
che si muove lungo una superficie equipotenziale é nullo, in quanto:

$ W = q (V_(i) - V_(f)) = q (V_(i) - V_(i)) = q dot 0 = 0 $

Inoltre, essendo la forza elettrostatica una forza conservativa,
il lavoro compiuto dalla forza elettrostatica su una carica che
si sposta da una superficie equipotenziale all'altra non dipende
da quale sia il percorso compiuto.

É possibile calcolare la differenza di potenziale elettrico fra due
punti qualsiasi dello spazio $i$ e $f$ se é nota l'espressione del
vettore $arrow(E)$ lungo un percorso (non importa quale) che abbia
tali punti come estremi.

Si consideri una carica esploratrice $q_(0)$ sottoposta ad un campo
elettrico $arrow(E)$ che si muove lungo un percorso da $i$ a $f$ di
uno spostamento infinitesimo $d arrow(s)$. La forza elettrostatica
compie un lavoro sulla carica pari a:

$ d W = arrow(F) dot d arrow(s) => q_(0) arrow(E) dot d arrow(s) $

Il lavoro lungo l'intero percorso si ottiene integrando:

$ W = integral_(i)^(f) d W = q_(0) integral_(i)^(f) arrow(E) dot d arrow(s) $

Sostituendo l'espressione per il lavoro compiuto dalla forza elettrostatica:

$ W = cancel(q_(0)) (V_(i) - V_(f)) =
  cancel(q_(0)) integral_(i)^(f) arrow(E) dot d arrow(s) =>
  Delta V = -integral_(i)^(f) arrow(E) dot d arrow(s) $

É possibile anche fare il contrario, ovvero calcolare il campo elettrico
se é noto il potenziale elettrico.

Si supponga di avere una carica esploratrice $q_(0)$ che si muove di uno
spostamento infinitesimo $d arrow(s)$ da una superficie equipotenziale a
quella adiacente. Il lavoro infinitesimo puó essere calcolato sia rispetto
alla differenza di potenziale, sia rispetto allo spostamento percorso dalla
carica esploratrice per effetto della forza elettrostatica. Eguagliando le
due espressioni:

$ W = W => -q d V = arrow(F) dot d arrow(s) =>
  -cancel(q_(0)) d V = cancel(q_(0)) arrow(E) dot d arrow(s) => 
  -d V = E d s cos(theta) => E cos(theta) = -frac(d V, d s) $

Si noti peró come $E cos(theta)$ non sia altro che, per definizione,
la componente di $arrow(E)$ nella direzione di $arrow(s)$. Pertanto:

$ E_(s) = -frac(partial V, partial s) $

=== Caso di studio: potenziale di un campo elettrico uniforme

Si supponga di avere una carica esploratrice $q_(0)$ che si muove fra
due superfici equipotenziali $i$ e $f$ parallelamente al campo elettrico
$arrow(E)$ associato a tali superfici. Sia $Delta x$ lo spostamento;
essendo questo parallelo ad $arrow(E)$:

$ Delta V = -integral_(i)^(f) arrow(E) dot d arrow(s) =
  -integral_(i)^(f) E d s cos(0) = -E integral_(i)^(f) d s $

Ma l'integrale rappresenta semplicemente la somma di tutti gli spostamenti
infinitesimi, che per definizione é $Delta x$, pertanto:

$ Delta V = -E Delta x $
