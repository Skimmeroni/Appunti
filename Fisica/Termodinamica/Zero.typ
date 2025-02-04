#import "../Fisica_defs.typ": *

Informalmente, la *temperatura* é una quantitá fisica legata alle
proprietá dei corpi di essere _caldi_ o _freddi_. Piú correttamente,
la temperatura di un corpo é legata all'energia cinetica media degli
atomi che lo costituiscono #footnote[Spesso si tende ad associare la
temperatura di un corpo alla sensazione che suscita quando questo
viene toccato. Questo peró non é corretto, perché il corpo umano
percepisce la _differenza_ fra la propria temperatura e quella
dell'oggetto toccato.]. L'unitá di misura del SI per la temperatura
é il *Kelvin* (simbolo $kelvin$).

Siano $A$ e $B$ due corpi che si trovano in un sistema isolato.
É possibile verificare empiricamente che, dopo un certo intervallo
di tempo, $A$ e $B$ raggiungono una temperatura intermedia fra le
loro temperature originali (non necessariamente la loro media matematica);
dopodiché, la loro temperatura rimane immutata. Questa situazione prende
il nome di *equilibrio termico*.

Si supponga ora che $B$ ed un terzo corpo $C$ vengano posti in un sistema
isolato, raggiungendo l'equilibrio termico dopo un certo intervallo di
tempo. Se la temperatura che hanno $A$ e $B$ quando raggiungono il loro
equilibrio termico e quella che hanno $B$ e $C$ quando raggiungono il
loro equilibrio termico sono uguali, allora é garantito che anche $A$
e $C$ abbiano la stessa temperatura.

Questa osservazione puó essere riassunta in quello che prende il nome di
*principio zero della termodinamica*: se due corpi $A$ e $B$ sono ciascuno
in equilibrio termico con un terzo corpo $T$, allora $A$ e $B$ sono a loro
volta in equilibrio termico. Tale principio non solo sottintende il fatto
che ad ogni entitá fisica sia sempre associabile una temperatura, ma é
anche alla base del modo in cui la temperatura viene misurata.

La temperatura viene misurata mediante un *termometro*, un dispositivo
che assegna un valore numerico alla temperatura di un corpo. Per _calibrare_
un termometro, viene scelto un corpo o un sistema che é noto a priori avere
una temperatura stabile sotto certe condizioni, e fissare (arbitrariamente)
tale valore come punto di riferimento. L'idea é quella di porre un corpo in
equilibrio termico con il termometro e verificare, quando questo accade,
quanto tale valore si discosta dal punto di riferimento #footnote[A dire
il vero, ponendo il termometro in equilibrio termico con il corpo da misurare,
la temperatura iniziale del termometro falserebbe la misurazione. In genere
si assume che tale scarto sia trascurabile.].

Come punto di riferimento di un termometro viene in genere scelto quello
che viene chiamato _punto triplo_ dell'acqua, una situazione in cui l'acqua
é in grado di presentarsi in natura contemporaneamente come acqua, ghiaccio
e vapore, ed é noto che la temperatura di tale sistema in tale situazione
é estremamente stabile. É stato accordato dal SI che il valore di tale
temperatura debba essere $273.16 kelvin$, e che il valore di un $kelvin$
debba essere $1 slash 273.16 kelvin$.

La misurazione in $kelvin$ é quella usata negli esperimenti scientifici,
ma comunemente vengono utilizzate unitá di misura piú semplici. In
particolare, una seconda unitá di misura per la temperatura tuttora
molto utilizzata é il *Celsius* ($degreeCelsius$). Un $degreeCelsius$
ed un $kelvin$ rappresentano la stesso sfasamento di temperatura, ma
$degreeCelsius$ é centrata sul valore $0$ anziché sul valore $273.16$.
É pertanto possibile convertire un valore dell'una nell'altra secondo
l'equazione:

$ T_("Kelvin") = T_("Celsius") - 273.16 $

Dove $T_("Kelvin")$ e $T_("Celsius")$ indicano la medesima temperatura,
ma espressa rispettivamente in $K$ o in $degreeCelsius$.

Una terza unitá di misura per la temperatura é il *Fahrenheit*, che
utilizza una scala piú piccola rispetto a Celsius ed é centrata su
un diverso punto zero. La conversione fra una medesima temperatura
espressa in Celsius o in Fahrenheit é data dalla seguente equazione:

$ T_("Fahrenheit") = frac(9, 5) T_("Celsius") + 32 $
