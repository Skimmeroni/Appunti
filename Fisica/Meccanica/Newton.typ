#import "../Fisica_defs.typ": *

La cinematica permette di descrivere la legge oraria di un corpo una
volta nota la sua accelerazione, ma non é in grado di spiegare perché
i corpi accelerano. Questo aspetto viene indagato da una seconda branca
della fisica, chiamata *meccanica*. La formulazione di meccanica storicamente
piú rilevante é la *meccanica Newtoniana*, ancora applicabile entro certi
limiti #footnote[Sulla scala delle velocitá estremamente grandi, vicine a
quelle della luce, alla meccanica Newtoniana si sostituisce la teoria della
relativitá (speciale). Similmente, sulla scala delle dimensioni estremamente
piccole, vicine a quelle dei costituenti ultimi della materia, alla meccanica
Newtoniana si sostituisce la meccanica quantistica. Nonostante questo, la
meccanica Newtoniana ha comunque un potere predittivo sufficiente per la
maggior parte delle applicazioni pratiche.].

Centrale nella meccanica Newtoniana é il concetto intuitivo di *forza*:
una forza é una interazione che avviene tra due o piú corpi in grado di
modificarne la velocitá, in direzione e/o intensitá. É possibile darne una
descrizione ontologica dividendole in due grandi categorie: *fondamentali*
e *non fondamentali* (o *emergenti*). Le forze fondamentali sono quelle che
interessano i costituenti fondamentali della materia, quindi atomi, protoni,
elettroni e quark. Nello specifico, in natura sono state osservate solamente
quattro forze fondamentali:

+ *Forza elettromagnetica*;
+ *Forza di gravità*;
+ *Interazione nucleare debole*;
+ *Interazione nucleare forte*.

Le forze emergenti sono quelle che nascono dall'applicazione di una o
più forze fondamentali, ma che dal punto di vista macroscopico è più
comodo considerare come forze in sè. Ad esempio, i contatti tra due
corpi (spinte, urti, ecc...) sono tecnicamente il risultato della reciproca
repulsione di cariche elettriche, ed é quindi la somma di miliardi di forze
elettromagnetiche, ma approcciare il problema a questo livello di dettaglio
non é rilevante. Si noti come la distinzione fra forze fondamentali e forze
emergenti, e fra diversi tipi di forze che appartengono alla stessa classe,
é soltanto nominale: tutte le forze sono fra loro commensurabili.

L'unitá di misura della forza (di tutte le forze) é il *Newton* (simbolo
$newton$); un Newton corrisponde alla quantitá di interazione necessaria
all'incrementare di una unitá l'accelerazione di un corpo avente massa
unitaria. Pertanto, $1 newton = 1 metre/second^(2) dot 1 kilogram$. Essendo
l'accelerazione una quantitá vettoriale, anche la forza deve necessariamente
esserlo. Per tale motivo, la forza che agisce complessivamente su un corpo,
detta *forza risultante*, é data dal sommare vettorialmente le singole forze.
Naturalmente, la forza risultante puó anche essere il vettore nullo. Di fatto,
a livello di effetto sull'accelerazione, non c'é nessuna distinzione fra un
corpo su cui non agisce alcuna forza ed un corpo su cui agiscono piú forze la
cui somma complessiva é nulla.

Prima di enunciare le leggi che descrivono il moto dei corpi, occorre
ricordare la definizione di sistema di riferimento inerziale: un sistema
di riferimento é inerziale rispetto ad un altro se é fermo o in moto non
accelerato.

//In altre parole, se un corpo non sta interagendo con alcun
//altro corpo, é sempre possibile trovare un sistema di riferimento dal
//quale osservare il suo moto dove l'accelerazione del corpo é nulla.

Le forze permettono di dare una migliore definizione di sistema di
riferimento inerziale. Infatti, un sistema di questo tipo è un sistema
in cui sono valide le cosiddette *Leggi di Newton*:

+ Un oggetto su cui agisce una forza totale nulla non modifica il 
  proprio stato di moto. Ovvero, un oggetto che subisce una forza 
  complessivamente nulla o rimane fermo o si muove di muovo rettilineo 
  uniforme;
+ *Legge di inerzia*: la somma totale di tutte le forze che agiscono 
  su un corpo è direttamente proporzionale alla sua accelerazione. La 
  costante di proporzionalità che le lega, diversa per ciascun corpo, 
  prende il nome di *massa inerziale*:

  $ arrow(F)_("tot") = m arrow(a) $

  Nella somma, non sono conteggiate le forze che é il corpo stesso ad
  imprimere, solamente quelle che "subisce";
+ *Principio di azione-reazione*: se un corpo $A$ imprime una forza su 
  un corpo $B$, il corpo $B$ imprime una forza su $A$ con ugual modulo
  e direzione, ma verso opposto:

  $ arrow(F)_(A "su" B) = -arrow(F)_(B "su" A) $

  In altre parole, non è possibile avere una forza "a vuoto".

Se la massa di un corpo aumenta, la forza (totale) necessaria 
ad indurgli la stessa accelerazione aumenta. Viceversa, se la 
massa diminuisce, serve una forza minore per indurre la stessa 
acceelerazione. La massa è quindi la misura della "resistenza" 
di un corpo ad accelerare.

Naturalmente, in un sistema di riferimento non inerziale le Leggi di
Newton non sono valide. In particolare, possono presentarsi situazioni
in cui un corpo può variare di accelerazione senza che sia una forza a
farlo. Ci si chiede allora quali siano le leggi che governano il moto
nei sistemi di riferimento non inerziali.

A tal proposito, si ricordi come l'accelerazione osservata in un 
sistema di riferimento è data dalla somma fra l'accelerazione nel
secondo sistema e l'accelerazione fra un sistema di riferimento e
l'altro. Moltiplicando per la massa $m$:

$ arrow(a)_(1) = arrow(a)_(2) + arrow(a)_(1,2) => 
  m arrow(a)_(1) = m arrow(a)_(2) + m arrow(a)_(1,2) $

Si supponga che il primo sistema di riferimento sia inerziale. Allora
vale la seconda legge di Newton, e quindi non vi sono forze in gioco,
e non essendovi forze in gioco il prodotto fra massa e accelerazione 
è nullo. Ma allora:

$ m arrow(a)_(1) = m arrow(a)_(2) + m arrow(a)_(1,2) =>
  0 = m arrow(a)_(2) + m arrow(a)_(1,2) =>
  cancel(m) arrow(a)_(2) = -cancel(m) arrow(a)_(1,2) =>
  arrow(a)_(2) = -arrow(a)_(1,2) $

Ovvero, l'accelerazione del secondo sistema è pari all'accelerazione 
con cui il secondo sistema si muove, ma di segno opposto.

Di fatto, anche sistemi di riferimento non inerziali possono essere
approcciati con il "linguaggio" delle leggi di Newton, a patto di 
considerare la quantità $-m arrow(a)_(1,2)$ come una forza (anche 
se di fatto non lo è). Tale quantità viene anche chiamata *forza 
apparente*: il nome "apparente" non sta ad indicare che tale quantità
non esiste, ma indica invece che tale quantità si comporta come una 
forza nonostante non lo sia.

Le forze che agiscono ogni sistema di riferimento non inerziale possono
essere analizzate con le leggi di Newton se osservate da un sistema di
riferimento inerziale. In generale, questo é sempre possibile.

#exercise[
	Appoggiando una tazza di caffé sul tavolino di un treno fermo o
	in moto rettilineo uniforme, la tazza rimane ferma. Se peró il
	treno inizia a accelerare, la tazza inizia a muoversi accelerando
	in direzione opposta rispetto al moto del treno. Se la tazza era
	ferma e improvvisamente ha iniziato a muoversi con una accelerazione,
	non nulla, allora significa che una forza di qualche tipo la sta
	facendo muovere, ma non é realmente presente alcuna forza: la
	seconda legge di Newton sembrerebbe violata. Come é possibile
	interpretare correttamente questo scenario?
]
#solution[
	Il sistema di riferimento in esame non é inerziale, perché il treno sta
	accelerando. Si ipotizzi invece uno scenario dove il treno sta venendo
	osservato dalla banchina: da questo punto di vista, la tazza non ha una
	accelerazione, é ferma. Il motivo per cui si ha l’illusione che si stia
	muovendo é dovuto al fatto che il treno sta accelerando, ovvero si muove
	a una velocitá diversa dalla tazza, mentre questa sta mantenendo la sua
	velocitá nulla (in accordo con la prima legge di Newton). In sostanza,
	non é la tazza a muoversi all’indietro, é tutto il resto del treno che
	si muove in avanti: la tazza rimane ferma, ma ció che vi sta sotto si
	muove piú velocemente di quanto questa stia facendo. Non a caso, se
	immaginassimo di incollare saldamente la tazza al tavolo, anche se il
	treno accelerasse la tazzina non cadrebbe, perché tazza e treno
	formerebbero un unico corpo sottoposto allo stesso moto.
]

// Manca completamente la parte sulla forza di gravitá.

La descrizione delle forze in gioco viene fatta delineando un *diagramma
di corpo libero*, fissando un sistema di coordinate cartesiane e riportando
i vettori delle forze in gioco, eventualmente "spezzandole" nelle loro
componenti orizzontali e verticali rispetto agli assi.

// Servirebbe un disegno

#exercise[
	Un disco da hockey di massa $0.3 kilogram$ si sta muovendo
	sulla superficie ghiacciata del campo da gioco di moto rettilineo
	uniforme. Due bastoni da hockey lo colpiscono contemporaneamente:
	il primo gli imprime una forza $F_(1)$ di $5 newton$ con un
	angolo $theta$ di $20 degree$ sotto l'orizzontale, mentre
	il secondo gli imprime una forza $F_(2)$ di $8 newton$ con
	un angolo $phi$ di $60 degree$ sopra l'orizzontale. Assumendo
	che queste forze siano le uniche che stanno agendo sul disco, si
	determini l'intensitá della sua accelerazione.
]
#solution[
	Le due forze possono essere scomposte lungo gli assi $x$, $y$ e $z$,
	per poi venire sommate componente per componente:

	$ cases(
		F_(x) = F_(1, x) + F_(2, x) = cos(theta) F_(1) + cos(phi) F_(2) =
		cos(-20 degree) dot 5 newton + cos(60 degree) dot 8 newton =
		8.7 newton,
		F_(y) = F_(1, y) + F_(2, y) = cos(theta) F_(1) + cos(phi) F_(2) =
		sin(-20 degree) dot 5 newton + sin(60 degree) dot 8 newton =
		5.2 newton,
		F_(z) = 0 newton
	) $

	Il modulo della forza risultante viene ricavato mediante somma vettoriale:

	$ |arrow(F)| = |arrow(F)_(x)| + |arrow(F)_(y)| + |arrow(F)_(z)| =
	  sqrt((8.7 newton)^(2) + (5.2 newton)^(2) + (0 newton)^(2)) =
	  10.1 newton $

	Applicando la seconda legge di Newton é possibile poi ricavare il modulo
	dell'accelerazione:

	$ arrow(F) = m arrow(a) => |arrow(F)| = |m arrow(a)| =>
	  |arrow(a)| = frac(|arrow(F)|, m) => |arrow(a)| = frac(10.1 newton,
	  0.3 kilogram) = 33.8 metre/second^(2) $
]

// Avrebbe forse piú senso introdurre un caso di studio aggiuntivo
// per trattare il corpo fermo

=== Caso di studio: piano inclinato liscio

Il *piano inclinato* é uno scenario in cui un corpo avente massa
$m$, approssimabile ad un punto materiale, si trova su una superficie
inclinata rispetto all'orizzontale di un certo angolo $theta$, chiamata
*vincolo*. Le coordinate sono comode da fissare centrate nel vertice piú
distante dalla superficie.

Una forza in gioco é la *forza di gravitá* $P$, che spinge il corpo verso il
centro della Terra. In realtá, la forza di gravitá é una forza che intercorre
fra qualsiasi coppia di corpi, non soltanto fra un corpo e la terra, ma per
semplicitá (chiarita meglio in seguito) é possibile assumere che la forza
di gravitá spinga semplicemente un corpo verso il terreno. Naturalmente, si
assume che il terreno sia un sistema di riferimento inerziale.

Il modulo della forza di gravitá é dato dal prodotto fra la massa del corpo
e una costante, denominata $g$, che rappresenta l'accelerazione che un corpo
subisce per l'influenza della forza di gravitá esercitata dalla Terra. Sebbene
tale valore non sia costante, perché dipende dalla distanza fra il suolo ed
il corpo, la sua variazione é in genere sufficientemente piccola da essere
trascurabile. In genere, viene preso in considerazione un sistema di
riferimento con le ascisse positive in alto; dato che, in questo modello,
il suolo si trova al di sotto del corpo, e quindi la forza di gravitá spinge
il corpo verso il basso, questa ha segno negativo:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ P = m g $],
	[$ arrow(P) = -P hat(j) = - m g hat(j) = m arrow(g) $]
)

Se il piano é impenetrabile, ovvero se il corpo non "sprofonda" dentro
la superficie, respinge il corpo verso l'altro con una forza $N$, che
gli impedisce di "bucarla". Questa forza, chiamata *reazione vincolare*
o *forza normale*, ha direzione perpendicolare alla superficie e uguale
in modulo alla componente verticale della forza di gravitá.

Il modulo della componente parallela al piano della forza di gravitá
é data dal prodotto fra il modulo della forza di gravitá per il seno
dell'angolo $theta$, mentre il modulo della componente perpendicolare
é dato dal prodotto del modulo della forza di gravitá per il coseno di
$theta$ (Le componenti sono invertite perché l'angolo non é quello fra
il corpo e il piano). La reazione vincolare ha invece esclusivamente una
componente perpendicolare. Riassumendo:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ cases(P_(x) = P sin(theta) = m g sin(theta), N_(x) = 0) $],
	[$ cases(P_(y) = -P cos(theta) = -m g cos(theta), N_(y) = N) $]
)

// Diagramma di corpo libero

Anche l'accelerazione del corpo, come le forze, puó essere scomposta nelle
due componenti. Il corpo non sta sprofondando, pertanto non ha moto lungo la
componente perpendicolare al vincolo, mentre scivola parallelamente a questo.
Applicando la seconda legge di Newton:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ m a_(x) = P_(x) + N_(x) => \
	   cancel(m) a_(x) = cancel(m) g sin(theta) + 0 =>
	   a_(x) = g sin(theta) $],
	[$ m a_(y) = P_(y) + N_(y) => \
	   0 = - m g cos(theta) + N =>
	   N = m g cos(theta) $]
)

Nel caso limite in cui $theta = frac(pi, 2)$, ovvero in cui il vincolo é
"a strapiombo", non agisce alcuna forza perpendicolare al vincolo, perché
$cos(frac(pi, 2)) = 0$, mentre l'accelerazione parallela al vincolo coincide
perfettamente con l'accelerazione di gravità perché $sin(frac(pi, 2)) = 1$.

Nel caso limite in cui $theta = 0$, ovvero in cui il vincolo é "piatto",
la reazione vincolare e la forza di gravitá coincidono perfettamente, perché
$cos(0) = 1$, mentre non agisce alcuna forza parallela al vincolo, perché
$sin(0) = 0$.

// Diagramma di corpo libero di entrambi i casi limite

#exercise[
	Una palla di massa $m = 1 kilogram$ viene lasciata cadere da una certa
	altezza. Sapendo che la massa del pianeta Terra é pari a circa $M = 6
	times 10^(24) kilogram$, calcolare l'accelerazione che la Terra
	subisce per effetto della forza esercitata dalla palla
]
#solution[
	Dal punto di vista della palla, l'unica forza su cui questa agisce é la
	forza di gravitá, che ha modulo $m_("palla") dot g$. Applicando la Terza
	Legge di Newton:

	$ |arrow(F)_("Terra-palla")| = |-arrow(F)_("palla-Terra")| =>
	  m g = M |arrow(a)| => |arrow(a)| = frac(m, M) g = frac(1 kilogram,
	  6 times 10^(24) kilogram) dot 9.8 metre/second^(2) =
	  1.63 times 10^(-24) metre/second^(2) $
]

=== Caso di studio: macchina di Atwood

Una *macchina di Atwood* é una macchina (ideale) costituita da una
carrucola dotata di una fune inestensibile, che scorre liberamente
senza spezzarsi. Sia la carrucola che la fune sono da considerarsi
prive di massa, o comunque di massa cosí piccola da non essere rilevante.
Agli estremi della fune sono appesi due corpi rispettivamente di massa
$m_(1)$ e $m_(2)$. Il sistema di riferimento piú semplice per descrivere
le accelerazioni é usarne uno centrato nel centro di massa di ciascun corpo.

Le due masse subiscono la forza di gravità, ciascuna con la propria
intensitá. Se la fune si spezzasse, i due corpi cadrebbero verso il
basso come di consueto, mentre in questo scenario i due corpi si muovo
in alto o in basso tirati dalla fune. Questo accade perché i corpi
subiscono una forza opposta in verso a quella di gravitá chiamata
*tensione*, indotta dalla fune. Essendo la fune la stessa da ambo le
parti della carrucola, anche la tensione deve essere uguale. Riassumendo:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ cases(P_(1) = -m_(1) g, T_(1) = T) $],
	[$ cases(P_(2) = -m_(2) g, T_(2) = T) $]
)

// Diagramma di corpo libero

Rispetto al sistema di coordinate cosí fissato, i due corpi si muovono
esclusivamente lungo l'asse verticale. Essendo la fune inestensibile,
se un corpo accelera in un certo verso con un certo modulo l'altro corpo
deve necessariamente accelerare con ugual modulo e senso inverso. Applicando
la seconda legge di Newton:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ m_(1) a_(1) = T + P_(1) => m_(1) a = T - m_(1) g $],
	[$ m_(2) a_(2) = T + P_(2) => - m_(2) a = T - m_(2) g $]
)

=== Caso di studio: piano inclinato scabro

Introdurre la *forza di attrito* permette di spiegare molti fenomeni empirici
che, altrimenti, contraddirebbero le Leggi di Newton. L'attrito puó essere
pensato come una forza che emerge dallo "sfregamento" di superfici diverse a
contatto, avente direzione opposta rispetto alla forza agente. La causa di
tale sfregamento é da cercarsi nelle interazioni elettromagnetiche fra gli
atomi che si trovano sull'"esterno" delle due superfici. Sebbene ogni singolo
atomo abbia una interazione propria, é possibile approssimare l'attrito come
uniforme lungo tutta la superficie.

#exercise[
	Si considerino le seguenti tre situazioni reali, e si cerchi di
	interpretarle introducendo la forza di attrito:

	- Dando una spinta ad un libro lungo la superficie orizzontale di un
	  comodino, questo si muove per alcuni secondi decelerando per poi
	  smettere di muoversi;
	- Spingendo orizzontalmente il libro e mantenendo costante la spinta, il
	  libro continua a muoversi senza accelerazione;
	- Spingendo una cassa molto pesante, questa non si sposta, anche se
	  non é fissata al terreno, a meno che la forza con cui la si spinge
	  sia sufficientemente intensa.
]
#solution[
	- Il fatto che il libro acceleri (tecnicamente, deceleri) anziché
	  procedere di moto rettilineo uniforme puó essere spiegato introducendo
	  una forza di attrito che si verifica tra la superficie del libro
	  e quella del tavolo; in questo modo, la forza netta non é nulla e
	  una accelerazione puó verificarsi;
	- Se la forza che tiene spinto il libro fosse la sola forza in gioco,
	  il libro dovrebbe accelerare, ma questo non accade. Questo puó essere
	  spiegato dal fatto che una forza di attrito di modulo uguale e verso
	  opposto alla forza che imprime la spinta la controbilancia, e quindi
	  la forza totale netta é nulla;
	- Se la cassa non si muove, significa che un'altra forza sta
	  controbilanciando l'azione della spinta; tale spinta é la
	  forza di attrito che si genera fra la cassa ed il terreno.
	  Spingendo sufficientemente forte, é possibile vincere tale
	  attrito e riuscire effettivamente a spostare la cassa.
]

Si tende a distinguere due tipi di forze di attrito, la *forza di attrito
statica* e la *forza di attrito dinamica*. La prima é quella che si verifica
quando lo "sfregamento" di due superfici impedisce ad un corpo fermo di
iniziare a muoversi, mentre la seconda é quella che si verifica quando lo
"sfregamento" di due superfici frena il movimento di un corpo che si sta
giá muovendo.

La forza di attrito statica cresce con il crescere della forza agente, fino a
raggiungere un plateau, mentre la forza di attrito dinamica é sostanzialmente
costante. In genere, la forza di attrito dinamica $f_(d)$ ha modulo inferiore
a quello della massima forza di attrito statica $f_(s, "max")$. Fintanto che
la forza che induge lo "sfregamento" é inferiore a $f_(s, "max")$, il corpo
che viene spinto non si muove; quando il corpo inizia a muoversi, la
forza di attrito statico viene vinta ed entra in gioco la forza di attrito
dinamico.

Il modulo di $f_(d)$ e di $f_(s, "max")$ é ricavato a partire dalle seguenti
formule:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ f_(d) = mu_(d) F_(N) $],
	[$ f_(s, "max") = mu_(s) F_(N) $]
)

Dove $F_(N)$ é la forza normale che agisce sul corpo impressa dalla
superficie. I coefficienti $u_(s)$ e $mu_(d)$ sono detti rispettivamente
*coefficiente di attrito statico* e *coefficiente di attrito dinamico*,
e sono coefficienti adimensionali che sono propri di qualsiasi coppia di
superfici, e vanno determinati sperimentalmente. Le due equazioni non sono
equazioni vettoriali, dato che la forza di attrito ha sempre la stessa
direzione (parallela alla superficie) e sempre lo stesso verso (opposto
rispetto a quello lungo cui avviene lo "sfregamento").

// Sarebbe interessante aggiungere un plot come quello a pagina 126

Il piano inclinato scabro é uno scenario analogo al piano inclinato liscio,
ma dove la reazione vincolare ha sia una componente perpendicolare al vincolo,
sia una parallela: la forza di attrito tra il vincolo ed il corpo.

// L'attrito radente é distinto da quello volvente e da quello viscoso.
// Cosa sono?

#grid(
	columns: (0.5fr, 0.5fr),
	[$ cases(P_(x) = P sin(theta) = m g sin(theta),
	         N_(x) = mu N_(y) = mu N) $],
	[$ cases(P_(y) = -P cos(theta) = -m g cos(theta),
	         N_(y) = N) $]
)

Applicando la seconda legge di Newton:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ m a_(x) = P_(x) + N_(x) => \
	   m a_(x) = m g sin(theta) - mu N $],
	[$ m a_(y) = P_(y) + N_(y) => \
	   0 = - m g cos(theta) + N =>
	   N = m g cos(theta) $]
)

=== Caso di studio: moto circolare

É giá stato introdotto il moto circolare come il moto di un corpo che
percorre una traiettoria circolare, ed é anche stato puntualizzato come
ogni moto circolare abbia necessariamente una accelerazione centripeta.
Applicando la Seconda Legge di Newton, deve allora esistere una forza
che induce tale accelerazione centripeta:

$ arrow(F)_("tot") = arrow(F)_(c) = m arrow(a_(c)) =>
  F_(c) = m frac(v^(2), r) $

Tale forza viene chiamata *forza centripeta*, perché ha la stessa direzione
dell'accelerazione che questa induce (l'accelerazione centripeta, appunto).

Si noti come la forza centripeta non sia un nuovo tipo di forza, ma sia
semplicemente una qualsiasi forza (una tensione, una forza di attrito,
la forza di gravitá, ecc...) che modifica la direzione di un corpo
inducendo una accelerazione centripeta senza modificarne la velocitá.
