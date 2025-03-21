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

#exercise[
	Un uomo delle pulizie spinge il suo aspirapolvere in avanti (verso
	destra) con una forza costante pari a $50.0 newton$. La direzione
	della forza forma un angolo di $30 degree$ con il terreno. Calcolare
	il lavoro compiuto per avere uno spostamento dell'aspirapolvere di
	$3.00 metre$
]
#solution[
	L'unica forza che sta contribuendo allo spostamento é quella esercitata
	dall'uomo; la forza di gravitá non sta compiendo alcun lavoro. Il verso
	dello spostamento é concorde con il piano orizzontale: pertanto l'angolo
	tra il terreno e la forza é anche l'angolo tra la forza e lo spostamento.
	Applicando la legge:

	$ W = arrow(F) dot arrow(d) = 50.0 newton dot 3.00 metre
	  dot cos(30 degree) = 130 joule $
]

L'espressione per $W$ assume che la forza sia costante, ovvero che non
dipenda né dal tempo passato né dallo spazio percorso dal corpo per il
suo effetto. Il calcolo del lavoro puó peró essere generalizzato anche
al caso in cui la forza di cui é causa sia dipendente dallo spazio.

Si supponga di suddividere lo spazio in incrementi infinitesimi, dove in
ciascun incremento $j$-esimo la forza é approssimativamente costante per
tutta la durata dell'incremento. Sia $F_(j)$ la forza costante associata
al $j$-esimo incremento e sia $Delta x$ la porzione di spazio percorso
dal corpo per effetto di tale forza in un qualsiasi incremento. Il lavoro
totale viene pertanto ad essere la somma di tanti lavori infinitesimi
$W_(j)$:

$ W = sum_(j) W_(j) = sum_(j) F_(j) Delta x $

Imponendo che $Delta x$ approcci zero, si ottiene il seguente integrale:

$ W = lim_(Delta x -> 0) sum_(j) F_(j) Delta x =
  integral^(x_(f))_(x_(i)) F(x) d x $

Dove $x_(i)$ e $x_(f)$ indicano, rispettivamente, la posizione iniziale
e finale del punto materiale sottoposto alla forza.

Applicando la seconda legge di Newton, si ha:

$ W = integral^(x_(f))_(x_(i)) F(x) d x = integral^(x_(f))_(x_(i)) m a d x $

L'accelerazione é data dalla derivata della velocitá rispetto al tempo.
Applicando la regola della catena:

$ W = integral^(x_(f))_(x_(i)) m a d x =
  integral^(x_(f))_(x_(i)) m frac(d v, d t) d x =
  integral^(x_(f))_(x_(i)) m frac(d x, d t) d v =
  integral^(v_(f))_(v_(i)) m v d v $

Risolvendo:

$ W = m integral^(v_(f))_(v_(i)) v d v =
  m (frac(v^(2)_(f), 2) - frac(v^(2)_(i), 2)) =
  frac(1, 2) m v^(2)_(f) - frac(1, 2) m v^(2)_(i) =
  K_(f) - K_(i) $

Riottenendo l'espressione per il lavoro come differenza dell'energia cinetica.

Sotto alcune ipotesi, é possibile estendere il concetto anche a forze
che agiscono con piú componenti:

$ arrow(F) = F(x) bold(arrow(i)) + F(y) bold(arrow(j)) + F(z) bold(arrow(k)) $

Si consideri uno spostamento infinitesimo in piú dimensioni:

$ d arrow(r) = d x bold(arrow(i)) + d y bold(arrow(j)) + d z bold(arrow(k)) $

Fintanto che le componenti della forza dipendono solamente dalle relative
componenti spaziali ($F(x)$ dipende solo da $x$, $F(y)$ dipende solo da
$y$, $F(z)$ dipende solo da $z$), é possibile esprimere la variazione
infinitesima di lavoro come:

$ d W = arrow(F) d arrow(r) = F(x) d x + F(y) d y + F(z) d z $

Integrando, si ottiene l'espressione per il lavoro compiuto da una
forza esterna su un punto materiale, che si muove in tre direzioni
da una posizione iniziale $r_(i) = (x_(i), y_(i), z_(i))$ ad una
finale $r_(f) = (x_(f), y_(f), z_(f))$:

$ W = integral^(r_(f))_(r_(i)) d W = integral^(x_(f))_(x_(i)) F(x) d x +
  integral^(y_(f))_(y_(i)) F(y) d y + integral^(z_(f))_(z_(i)) F(z) d z $

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

=== Caso di studio: lavoro compiuto dalla forza elastica di una molla

Considerando uno scenario in cui una molla avente costante $k$ é attaccata
ad una parete dal lato sinistro ed ha un punto materiale attaccato a quello
destro, é possibile scrivere:

$ F_(s)(x) = -k x $

Dove $x$ indica lo spostamento della molla dalla sua posizione originale.

Si supponga di imprimere una forza al punto materiale che lo faccia muovere
verso destra, lasciandolo poi libero; la forza elastica della molla lo fará
rallentare, compiendo lavoro negativo e sottraendo energia dal punto materiale.

Essendo la forza elastica una forza variabile (dipendente da $x$), non
é possibile applicare direttamente l'equazione per il calcolo del lavoro.
É peró possibile applicare quanto detto sulle forze variabili dipendenti
dallo spazio per ottenere il seguente integrale:

$ W_(s) = integral^(x_(f))_(x_(i)) -F_(s)(x) d x $

Dove $x_(i)$ e $x_(f)$ indicano, rispettivamente, la posizione iniziale
e finale dell'estremo destro della molla. Sostituendo l'espressione per
$F_(s)$ nell'equazione, si ha:

// Perché il segno non viene cambiato?

$ W_(s) = integral^(x_(f))_(x_(i)) -k x d x =
  -k integral^(x_(f))_(x_(i)) x d x =
  -k [frac(x^(2), 2)]^(x_(f))_(x_(i)) =
  -k (frac(x^(2)_(f), 2) - frac(x^(2)_(i), 2)) =
  -frac(1, 2) k (x^(2)_(f) - x^(2)_(i)) =
  frac(1, 2)k (x^(2)_(i) - x^(2)_(f)) $

#exercise[
	Ad una molla appesa al soffitto viene attaccata una sfera di massa
	$0.55 kilogram$, il cui peso fa allungare la molla di $0.02 metre$.
	Quanto vale la costante elastica della molla? Quanto vale il lavoro
	compiuto dalla molla?
]
#solution[
	Essendo il sistema in equilibrio, non vi é accelerazione. Pertanto, la
	forza di gravitá che spinge in basso la sfera é uguale e contraria alla
	forza elastica della molla che cerca di riportarla al suo stato naturale.

	$ sum arrow(F)_("est") = m arrow(a) = arrow(F)_(s) + arrow(F)_(g) = 0 $

	Isolando la costante elastica:

	$ arrow(F)_(s) = -arrow(F)_(g) => k x = -(-m g) => k = frac(m g, x) =
	  frac(0.55 kilogram dot 9.8 metre / second^(2), 0.02 metre) =
	  270 newton / metre $

	Il lavoro compiuto dalla molla é dato da:

	$ W_(s) = frac(1, 2) k (x^(2)_(i) - x^(2)_(f)) =
	  frac(1, 2) 270 newton / metre ((0.00 metre)^(2) - (0.02 metre)^(2)) =
	  -0.054 joule $
]
