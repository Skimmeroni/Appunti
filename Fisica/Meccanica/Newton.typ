#import "../Fisica_defs.typ": *

La cinematica descrive la legge oraria di un corpo se é nota la sua
accelerazione. Tuttavia, non fornisce informazioni su come ricavarla.
Una accelerazione é definita a partire dal risultato di interazioni
sul corpo che la subisce chiamate *forze*.

Il fatto che le forze possano annullarsi a vicenda necessita che queste 
debbano essere una quantità vettoriale. Due forze si annullano se hanno
la medesima direzione ed il medesimo modulo, ma verso opposto.

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

Le Leggi non specificano cosa _esattamente_ siano le forze, perchè le
trattano da un punto di vista strettamente matematico. è però possibile
darne una descrizione ontologica dividendole in due grandi categorie:
*fondamentali* e *non fondamentali* (o *emergenti*). Le forze fondamentali
sono quelle che interessano i costituenti fondamentali della materia,
quindi atomi, protoni, elettroni e quark. Nello specifico, in natura
sono state osservate solamente quattro forze fondamentali:

+ *Forza elettromagnetica*;
+ *Forza di gravità*;
+ *Interazione nucleare debole*;
+ *Interazione nucleare forte*.

Le forze emergenti sono quelle che nascono dall'applicazione di una 
o più forze fondamentali, ma che dal punto di vista macroscopico è 
più comodo considerare come forze in sè. Esempi di forze emergenti
sono:

+ La *forza di attrito*, che è forza elettromagnetica di due corpi 
  a contatto;
+ La *tensione* di una fune, che è forza elettromagnetica fra gli 
  atomi del tirante e gli atomi della fune;
+ La *forza elastica* di una molla, che è forza elettromagnetica
  degli atomi della molla che cercano di ritornare nella posizione
  iniziale.

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

// La forza centrifuga è un esempio di forza apparente
