#import "../Fisica_defs.typ": *

Nella maggior parte dei casi, come spiegato in precedenza, un aumento
dell'energia termica di un corpo corrisponde ad un aumento della sua
temperatura, e viceversa una perdita di energia termica corrisponde
una diminuzione della temperatura. Esiste peró una situazione in cui
l'energia termica di un corpo aumenta o diminuisce senza che la sua
temperatura cambi; questo accade durante un *passaggio di stato*.

Un corpo fisico puó esistere in uno fra tre *stati della materia*,
o semplicemente *stati*, principali: *solido*, *liquido* e *gassoso*.
I tre stati hanno le seguenti caratteristiche:

- Un corpo allo stato solido ha i propri atomi bloccati in una
  struttura ben definita, dovuta alla loro reciproca attrazione;
- Un corpo allo stato liquido ha una struttura parzialmente ordinata
  ed un volume fissato, ma non ha una forma ben definita ed assume
  automaticamente la dimensione del contenitore che lo racchiude;
- Un corpo allo stato gassoso non hanno sostanzialmente alcuna
  struttura, e possono muoversi liberamente le une rispetto alle
  altre.

Se sottoposto ad un trasferimento di calore mentre si trova ad una
specifica temperatura, un corpo che si trova in uno stato puó passare
in un altro stato. Fintanto che il passaggio di stato non é completato,
la sua temperatura rimane costante; aumentando l'apporto di calore la
temperatura rimane comunque costante, ma il passaggio di stato avviene
piú velocemente.

Il passaggio di stato dallo stato solido a quello liquido prende
il nome di *liquefazione*. Per liquefare un corpo é necessario
fornirvi calore, perché é necessario rompere i legami che mantengono
gli atomi nella loro struttura. Il passaggio di stato opposto prende
il nome di *solidificazione* e richiede di sottrarre calore al corpo.
Il passaggio di stato dallo stato liquido a quello gassoso prende
il nome di *vaporizzazione*, mentre il passaggio inverso di
*condensazione*.

Il quantitativo di calore necessario a compiere un passaggio di stato
dipende sia dal materiale del corpo che deve subirlo sia dalla sua massa,
perché un corpo piú massivo richiede piú calore per compiere un passaggio
di stato. Il calore $Q$ necessario a permettere un passaggio di stato
completo per un corpo di massa $m$ é legato alla massa stessa dalla
seguente equazione:

$ Q = L m $

Dove $L$ é una costante che prende il nome di *calore latente*, ed
indica l'ammontare di calore necessario per permettere ad una unitá
di massa di un certo materiale di compiere un passaggio di stato.
Naturalmente, il calore ha segno negativo se il passaggio di stato
richiede una riduzione di energia (da liquido a solido o da gassoso
a liquido) ed un segno positivo se richiede un aumento di energia
(da solido a liquido o da liquido a gassoso).

Si noti come il valore di $L$ rispetto al passaggio liquido-solido
(o solido-liquido) e quello rispetto al passaggio gassoso-liquido
(o liquido-gassoso) non siano necessariamente uguali. Si tende pertanto
a distinguere tra *calore latente di fusione* $L_(v)$ per il primo
caso e *calore latente di vaporizzazione* $L_(v)$ per il secondo caso. 

#exercise[
	$1 gram$ di ghiaccio, alla temperatura iniziale di $-30.0 degreeCelsius$,
	viene trasformato prima in acqua alla temperatura di $0.0 degreeCelsius$
	e poi in vapore alla temperatura di $120.0 degreeCelsius$. Il calore
	specifico del ghiaccio é $2090 joule / kilogram dot kelvin$, quello
	dell'acqua é $4187 joule / kilogram dot kelvin$ e quello del vapore
	é $2010 joule / kilogram dot kelvin$. Il calore latente di fusione
	del ghiaccio é $3.33 dot 10^(5) joule / kilogram$, mentre il calore
	latente di vaporizzazione dell'acqua é $2.26 dot 10^(6) joule / kilogram$.
	Quanto calore é necessario per completare l'intero processo?
]
#solution[
	É possibile separare il processo in cinque fasi:

	- Il ghiaccio passa da $-30.0 degreeCelsius$ a $0.0 degreeCelsius$,
	  guadagnando calore:

	  $ Q_(1) = c_(1) m Delta_(1) T = 2090 joule / kilogram dot degreeCelsius dot
	    1.00 dot 10^(-3) kilogram dot (0.0 degreeCelsius + 30.0 degreeCelsius) = 
	    62.7 joule $

	- Il ghiaccio subisce un passaggio di stato, passando da solido a liquido
	  e diventando acqua:

	  $ Q_(2) = L_(f) m =
	    3.33 dot 10^(5) joule / kilogram dot 1.00 dot 10^(-3) kilogram =
	    333.0 joule $

	- L'acqua passa da $0.0 degreeCelsius$ a $100.0 degreeCelsius$,
	  guadagnando calore:

	  $ Q_(3) = c_(3) m Delta_(3) T = 4186 joule / kilogram dot degreeCelsius dot
	    1.00 dot 10^(-3) kilogram dot (100.0 degreeCelsius - 0.0 degreeCelsius) =
	    419.0 joule $

	- L'acqua subisce un passaggio di stato, passando da liquido a gassoso
	  e diventando vapore:

	  $ Q_(4) = L_(v) m =
	    2.26 dot 10^(6) joule / kilogram dot 1.00 dot 10^(-3) kilogram =
	    2260.0 joule $

	- Il vapore passa da $100.0 degreeCelsius a 120.0 degreeCelsius$,
	  guadagnando calore:

	  $ Q_(5) = c_(5) m Delta_(5) T = 2010 joule / kilogram dot degreeCelsius dot
	    1.00 dot 10^(-3) kilogram dot (120.0 degreeCelsius - 100.0 degreeCelsius) =
	    40.2 joule $

	Sommando tutti i valori trovati:

	$ Q_("tot") = Q_(1) + Q_(2) + Q_(3) + Q_(4) + Q_(5) =
	  62.7 joule + 333.0 joule + 419.0 joule + 2260.0 joule + 40.3 joule =
	  3110.0 joule $
]
