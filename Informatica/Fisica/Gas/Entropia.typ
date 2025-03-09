#import "../Fisica_defs.typ": *

Tutte le leggi fisiche che hanno il tempo come parametro possono
essere applicate anche con un valore per il tempo negativo. Inoltre,
il trasferimento di energia fra due corpi potrebbe avvenire indifferentemente
da un corpo all'altro senza mai violare il principio di conservazione di
energia. Eppure, la maggior parte dei processi fisici accadono sempre in
un solo senso, come se la "direzione" del tempo fosse una sola.

Questo significa che la "direzione" dei processi fisici, che é verificata
empiricamente, non puó essere cercata né nel tempo, né nell'energia. Tale
direzione va invece cercata in una proprietá dei sistemi fisica chiamata
*variazione di entropia*, che in un sistema fisico chiuso durante un
processo irreversibile, a differenza dell'energia, puó solamente aumentare.

Facendo riferimento in particolar modo ad un gas, l'entropia puó essere
definita come una sua ulteriore variabile di stato. Nello specifico, la
variazione di entropia di un gas fra uno stato iniziale ed uno finale é
dato dal rapporto fra la variazione di calore ceduto/assorbito durante
il passaggio di stato e la variazione di temperatura:

$ Delta S = S_(f) - S_(i) = integral^(f)_(i) frac(d Q, T) [joule / kelvin] $

La temperatura é una quantitá sempre positiva (se misurata in $kelvin$),
mentre il calore puó essere sia positivo che negativo. Per tal motivo,
il segno di $Delta S$ dipende interamente da quello di $Q$.

Naturalmente, tale integrale non puó essere risolto a meno di conoscere
la funzione con cui $Q$ e $T$ variano. Se peró si considera il caso
particolare di una trasformazione isoterma, $T$ é sempre costante, e
l'integrale é risolto in maniera banale:

$ Delta S = integral^(f)_(f) frac(d Q, T) =
  frac(1, T) integral^(f)_(f) d Q = frac(Q, T) $

Affinché la temperatura in una trasformazione rimanga costante, é
necessario che il calore sia positivo, ovvero che venga fornito
dall'esterno al gas. Essendo $Q$ positivo ed essendo $T$ positivo
per definizione, anche la variazione di entropia $Delta S$ é positiva.

Se una trasformazione non é isoterma ma la variazione di temperatura
fra lo stato iniziale e finale é comunque molto piccola, é possibile
approssimare la variazione di entropia a:

$ Delta S approx frac(Q, T_("avg")) $

Dove $T_("avg")$ é la temperatura media lungo tutto il processo.

Si noti come, sulla base delle equazioni sopra citate, la variazione di
entropia possa diminuire (quando $Q$ é negativo), eppure l'entropia é
stata definita come una quantitá che non puó diminuire. In realtá, questo
é vero solamente per i processi irreversibili e solamente per i sistemi
chiusi: se un sistema fisico ha una riduzione di entropia, l'esterno del
sistema ha un aumento di entropia, e viceversa. Nello specifico, l'aumento
di entropia interna/esterna al sistema é sempre maggiore della diminuzione
di entropia esterna/interna, pertanto la variazione complessiva é sempre
positiva. 

Queste osservazioni possono essere riassunte nel *secondo principio della
termodinamica*: la variazione di entropia di un sistema chiuso in seguito
ad un processo fisico puó solamente o rimanere costante (se il processo
é reversibile) o aumentare (se il processo é irreversibile):

$ Delta S gt.eq 0 $
