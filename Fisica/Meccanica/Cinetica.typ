#import "../Fisica_defs.typ": *

L'*energia cinetica* di un punto materiale è la quantità di energia
associata al suo essere in movimento. Un punto materiale di massa
$m$ che si muove di velocità $v$ #footnote[Occorre anche assumere
che ci si trova a velocità di netto inferiori a quelle della luce.]
ha associata la seguente energia cinetica:

$ K = frac(1, 2) m v^(2) [joule] $

L'unità di misura dell'energia cinetica è il *Joule*:
$1 J = 1 kilogram dot metre^(2) / second^(2)$

Quando la velocità di un punto materiale aumenta, anche la sua energia
cinetica aumenta. Viceversa, quando la velocità di un punto materiale
diminuisce, anche la sua energia cinetica diminuisce. Nel caso limite
in cui il punto materiale sia fermo, la sua energia cinetica è nulla. 

#exercise[
  Una papera di massa $m = 3.0 kilogram$ sta volando con velocità
  $v = 2.0 metre / second$. Assumendo di poter trattare la papera
  come punto materiale, qual'è la sua energia cinetica?
]
#solution[
  $ K = frac(1, 2) dot 3.0 kilogram dot (2.0 metre / second)^(2) = 6 joule $
]

Modificare la velocità di un punto materiale significa quindi modificare
la sua energia cinetica. Ma modificare la velocità di un punto materiale
significa imprimergli una forza, pertanto il "tramite" dello scambio di
energia cinetica è la forza. In particolare, se l'energia cinetica di un
punto materiale aumenta in seguito all'applicazione di una forza, si dice
che tale forza ha _fornito_ energia al punto materiale, mentre se diminuisce
che ha _sottratto_ energia. Il quantitativo di energia fornita o sottratta
ad un punto materiale per mezzo di una forza prende il nome di *lavoro*.

Si consideri un punto materiale, che subisce l'effetto di una forza costante
$arrow(F)$ e modifica la sua velocità da un valore iniziale $arrow(v)_(0)$
al tempo $t_(0)$ ad un valore finale $arrow(v)_(f)$ al tempo $t_(f)$. Sia
poi $arrow(d)$ lo spostamento che il punto materiale compie nell'intervallo
di tempo da $t_(0)$ a $t_(f)$. è possibile legare forza e accelerazione del
punto materiale lungo l'asse $x$ applicando la Seconda Legge di Newton:

$ F_(x) = m a_(x) $

Avendo assunto che la forza sia costante, anche l'accelerazione sarà
costante. Ricordando che, per un moto uniformemente accelerato, vale
l'espressione:

$ v^(2)_(f) = v^(2)_(0) + 2a_(x) d => a_(x) = frac(v^(2)_(f) - v^(2)_(0), 2d) $

Dove $d$ è lo spostamento del punto materiale nel lasso di tempo
$[t_(0), t_(f)]$, è possibile sostituire nella precedente come:

$ F_(x) = m (frac(v^(2)_(f) - v^(2)_(0), 2d)) =>
  F_(x) d = frac(1, 2) m v^(2)_(f) - frac(1, 2) m v^(2)_(0) =
  K_(f) - K_(i) $

Dove $frac(1, 2) m v^(2)_(f) = K_(f)$ e $frac(1, 2) m v^(2)_(0) = K_(i)$
indicano, rispettivamente, l'energia cinetica prima e dopo che il punto
materiale ha subito l'effetto della forza. Il lavoro viene quindi ad
essere il prodotto fra la componente orizzontale della forza che agisce
sul punto materiale e lo spostamento indotto dalla variazione di velocità
conseguente all'agire della forza:

$ W = F_(x) d = K_(f) - K_(i) = Delta K $

Se $K_(f) > K_(i)$, ovvero se l'energia cinetica "netta" è positiva,
allora anche il lavoro è positivo, e pertanto la forza ha fornito
energia al punto materiale. Viceversa, se $K_(f) < K_(i)$, ovvero
se l'energia cinetica "netta" è negativa, allora anche il lavoro
è negativo, e pertanto la forza ha sottratto energia al punto materiale.

Applicando la trigonometria, è possibile scrivere:

$ W = arrow(F) dot arrow(d) = F cos(theta) d $

Dove $theta$ è l'angolo formato dai vettori $arrow(F)$ e $arrow(d)$.
Se l'angolo fra i due è retto, $cos(theta) = 0$, e pertanto il lavoro
è zero. Se è invece piatto o nullo, $cos(theta) = plus.minus 1$, e
pertanto il lavoro è massimo in modulo.

L'espressione per $W$ indica che una forza con componente orizzontale
concorde con lo spostamento dell'oggetto induce un lavoro con segno
positivo, che quindi fornisce energia all'oggetto, mentre una forza
con componente orizzontale discorde con lo spostamento dell'oggetto
induce un lavoro con segno negativo, che quindi sottrae energia all'oggetto.

=== Caso di studio: lavoro compiuto dalla forza di gravità

Si consideri un punto materiale di massa $m$ che viene lanciato in
aria perpendicolarmente al terreno (e quindi parallelamente alla
forza di gravità) con velocità iniziale $v_(0)$, percorrendo uno
spostamento verticale pari a $arrow(d)$. Tale punto materiale avrà
una energia cinetica iniziale pari a $K_(0) = frac(1, 2) m v^(2)_(0)$.
Ricordando l'espressione analitica della forza di gravità, il lavoro
compiuto dalla forza di gravità sul punto materiale viene ad essere:

$ W_(g) = arrow(F)_(g) dot arrow(d) = m g d cos(theta) $

La spinta è verso l'alto, così come lo spostamento, mentre la forza
di gravità è verso il basso, pertanto i due vettori hanno la medesima
direzione ma verso opposto. L'angolo fra i due vettori è pertanto $pi$,
e si ha quindi:

$ W_(g) = m g d cos(pi) = m g d (-1) = -m g d $

Infatti, la forza di gravità sta rallentando il punto materiale fino
a fermarlo, e quindi sta compiendo su di esso un lavoro negativo,
sottraendovi energia.

Quando il punto materiale raggiunge la sua massima altezza, questo
inizia a cadere verso il basso, ed il suo spostamento diviene quindi
concorde sia in direzione che in verso con la forza di gravità. L'angolo
fra i due vettori è pertanto $0$, e si ha quindi:

$ W_(g) = m g d cos(0) = m g d (1) = m g d $

Infatti, la forza di gravità sta facendo accelerare il punto materiale,
e quindi sta compiendo su di esso un lavoro positivo, fornendovi energia.

=== Caso di studio: lavoro compiuto dalla forza elastica
