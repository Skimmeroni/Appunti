#import "../Fisica_defs.typ": *

Oltre all'elettricitá, un'altra interazione fondamentale dell'Universo
é l'*interazione magnetica*, o *magnetismo*, mediata da una *forza
magnetica*. Cosí come la forza elettrostatica induce un campo elettrico,
la forza magnetica induce un *campo magnetico*. Gli oggetti che sono in
grado di subire ed indurre interazione magnetica sono detti _calamite_
o _magneti_.

Ogni calamita ha due estremitá, dette *poli*, aventi segno opposto.
Per convenzione, e per analogia con l'interazione elettrica, vengono
chiamati *polo nord* o *polo positivo* e *polo sud* o *polo negativo*.
Due poli uguali si respingono, due poli diversi si attraggono. A differenza
della carica elettrica, che puó esistere singolarmente come positiva o
negativa, una calamita ha sempre entrambi i poli, non esiste una calamita
con un solo polo #footnote[Alcuni modelli della fisica moderna ammettono
l'esistenza di singoli poli, ma non sono al momento corroborate.]. Dividendo
una calamita in due, si ottengono di nuovo due calamite, ciascuna dotata
di entrambi i poli.

Un campo magnetico puó venire generato fondamentalmente in due modi. Il
primo é dovuto ad una proprietá intrinseca degli atomi, non diversa dalla
carica elettrica; materiali che sono naturalmente in grado di generare un
campo magnetico sono detti *magneti permanenti*. Un secondo modo per
generare un campo magnetico é associato direttamente alle cariche elettrihe.
Infatti, qualsiasi corpo dotato di carica elettrica elettrica che si muove,
anche se non é un magnete permanente, é sempre in grado di generare un campo
magnetico.

Sperimentalmente, si osserva che il campo magnetico esercita una
forza sulle cariche elettriche in movimento che ne subiscono l'influenza.
Tale forza é perpendicolare alla direzione del vettore velocitá delle
particelle in ogni suo punto. Quando una forza é perpendicolare ad un
corpo in movimento si ha un moto circolare, pertanto il campo magnetico
indurrá la particella carica a muoversi secondo tale moto. Naturalmente,
se la particella si muove parallelamente al campo magnetico, la forza a
questo associata sará nulla, perché la componente perpendicolare di un
vettore rispetto a un vettore a cui é parallelo é sempre nulla.

Si prenda la direzione in questione come direzione privilegiata. Si
osserva che la forza associata ad un campo magnetico é proporzionale
al seno dell'angolo $theta$ formato tra questa direzione "privilegiata"
e la direzione del vettore velocitá della particella. Questo é in accordo 
con quanto detto in precedenza: il seno di un angolo é massimo quando
i due vettori che formano l'angolo sono perpendicolari. Si osserva
inoltre che la forza associata al campo magnetico é proporzionale alla
velocitá della carica e dalla sua intensitá.

Indicando con $arrow(B)$ il vettore campo magnetico, con $q$ la carica
elettrica in movimento e $arrow(v)$ il vettore velocitá, i risultati
possono essere riassunti nella *Legge di Lorentz*:

$ arrow(F)_(B) = q (arrow(v) times arrow(B)) $

Questa forza é detta *Forza di Lorentz*. Essendo generata da un
prodotto vettoriale, la sua direzione sará sempre perpendicolare
ai vettori $arrow(v)$ e $arrow(B)$. Inoltre, essendo questa forza
sempre perpendicolare al vettore velocitá (e quindi al vettore
spostamento), non compie alcun lavoro sulla carica, e non influisce
sulla sua energia cinetica. Puó peró influenzare la direzione della
velocitá, e quindi accelerarla (non in modulo, solo in direzione).

Svolgendo il prodotto vettoriale e isolando il modulo del campo
magnetico nell'equazione precedente, si ha:

$ B = frac(F_(B), q v sin(theta)) [(newton dot second) / (coulomb dot metre)] $

L'unitá di misura del campo magnetico viene anche chiamata *Tesla*
(simbolo $tesla$).

Oltre alle singole cariche elettriche in movimento, é possibile mettere
in relazione il campo magnetico direttamente con la corrente elettrica.
Si consideri il caso piú semplice possibile in cui vi sia un conduttore
bidimensionale di lunghezza $L$ in cui scorre una corrente di intensitá
$i$. La Forza di Lorentz per l'intero flusso di corrente é data dalla
sommma di tutte le forze che agiscono su ciascun elettrone:

$ arrow(F)_(B) = sum_(j) arrow(F)_(B, j) =
  sum_(j) e (arrow(v) times arrow(B)) =
  N e (arrow(v) times arrow(B)) $

Dove $N$ é il numero di elettroni che attraversano la sezione. Assumendo
che il flusso di corrente sia costante, é possibile esprimere il numero
di elettroni come prodotto fra la densitá di elettroni ed il volume della
sezione, che é a sua volta prodotto fra lunghezza della sezione e ampiezza.
Sostituendo nella precedente:

$ arrow(F)_(B) = N e (arrow(v) times arrow(B)) =
  n V e (arrow(v) times arrow(B)) =
  n A L e (arrow(v) times arrow(B)) =>
  F_(B) = e n A L v B sin(theta) $

Ricordando che il prodotto $e n v A$ é semplicemente uguale alla corrente
elettrica $i$:

$ F_(B) = i L B sin(theta) => arrow(F)_(B) = i arrow(L) times arrow(B) $
