#import "../Fisica_defs.typ": *

La *corrente elettrica* é definita come rapporto fra la quantitá
di carica elettrica in movimento che attraversa una sezione di
un conduttore ed il tempo necessario a percorrere tale sezione:

$ i = frac(d q, d t) [coulomb / second] $

L'unitá di misura della corrente, $coulomb / second$, viene anche
chiamata *ampere* (simbolo $ampere$).

La quantitá di carica che passa in un conduttore in un certo intervallo
di tempo $(t_(i), t_(f))$ é ottenuta integrando:

$ q = integral_(t_(i))^(t_(f)) d q = integral_(t_(i))^(t_(f)) i d t $

Il quantitativo di corrente che passa attraverso il conduttore in
un'unitá di tempo puó variare da istante a istante.

Il caso piú semplice si ha quando la corrente fluisce in maniera uniforme
a prescindere dal tempo. In tale condizione, in ogni sezione del conduttore
fluisce lo stesso quantitativo di elettroni, perché per conservazione della
carica elettrica tutta la carica che passa da una sezione $A$ in un certo
istante di tempo deve essere pari a quella che passa da una qualsiasi altra
sezione $A'$.

Sebbene sia una quantitá scalare (essendo il rapporto di due scalari)
alla corrente viene spesso associata una direzione, che rappresenta
la direzione che gli elettroni percorrono all'interno del circuito.

Nonostante gli elettroni siano cariche negative, in genere per
semplicitá si denota un flusso di corrente come fossero cariche
positive, dato che il segno delle cariche elettriche in movimento
é spesso irrilevante. Pertanto, anche la direzione del movimento
delle cariche in un conduttore é denotato come se seguisse un flusso
di cariche positive.

Talvolta, si é interessati a conoscere la quantitá di corrente
che scorre in un conduttore non rispetto ad una sua sezione, ma
rispetto ad un'area di dimensione unitaria. Tale quantitá viene
anche chiamata *densitá di corrente*, indicata con $arrow(J)$:

$ i = integral arrow(J) dot d arrow(A) $

Dove $arrow(A)$ é il vettore superficie di $A$. Si noti come,
nonostante $i$ sia una quantitá scalare, $arrow(J)$ non lo é,
permettendo di poter avere una quantitá legata alla densitá di
corrente che sia comunque vettoriale.

Se la corrente é uniforme e parallela al vettore superficie $arrow(A)$,
anche $arrow(J)$ sará parallelo ad $arrow(A)$, pertanto é possibile
risolvere come:

$ i = integral arrow(J) dot d arrow(A) = integral J d A cos(0) =
  integral J d A = J integral d A $

L'integrale su $d A$ é semplicemente l'area dell'intera superficie,
pertanto:

$ i = J integral d A = J A => J = frac(i, A) $

// Manca la velocitá di deriva

La *resistenza* di un conduttore é la tendenza di un conduttore ad
opporsi al movimento delle cariche al suo interno #footnote[Concettualmente,
la resistenza associata ad un conduttore é l'analogo dell'attrito associato
ad una forza.]. Viene definita come rapporto fra la differenza di potenziale
fra due punti di un conduttore e la corrente indotta da tale differenza di
potenziale:

$ R = frac(V, i) [volt / ampere] $

L'unitá di misura della resistenza viene anche chiamata *Ohm*
(simbolo $ohm$).

Anziché ragionare in termini di singoli oggetti, é spesso utile
ragionare in termini di materiali. In particolare, sostituendo
il potenziale elettrico di un oggetto con il campo elettrico in
un punto qualsiasi di un conduttore e sostituendo la corrente
elettrica con la densitá di corrente in quel punto, si ottiene
la *resistivitá*:

$ rho = frac(E, J) [ohm dot metre] $

La resistivitá rappresenta la tendenza di un materiale (non di uno
specifico conduttore) ad opporsi al movimento delle cariche al suo
interno.

Si noti come l'equazione della resistenza vale solamente nel caso
di materiali *isotropi*, ovvero materiali le cui proprietá elettriche
sono costanti in ogni direzione.

Il reciproco della resistivitá é la *conduttivitá*, e rappresenta
la tendenza di un materiale a _non_ opporsi al movimento delle
cariche:

$ sigma = frac(1, rho) [(ohm dot metre)^(-1)] $

Se é nota la resistivitá di un certo materiale, é possibile calcolare
la resistenza di una sezione di un conduttore costituito (interamente)
di tale materiale.

Sia $A$ l'area della sezione del conduttore e sia $L$ la lunghezza di
una sua sezione. Se viene applicata una differenza di potenziale fra i
due estremi di tale sezione e la corrente é uniforme, il campo elettrico
e la densitá di corrente saranno costanti lungo tutti i punti della
sezione. Ovvero:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ E = frac(V, L) $],
	[$ J = frac(i, A) $]
)

Combinando le equazioni precedenti:

$ rho = frac(E, J) = frac(V slash L, i slash A) =
  frac(V, L i slash A) = frac(V A, L i) $

Tuttavia, il rapporto tra potenziale elettrico e corrente elettrica
é uguale alla resistenza, pertanto:

$ rho = frac(A, L) frac(V, i) = frac(A, L) R => R = rho frac(L, A) $

Nel caso in cui la legge $R = V slash i$ sia valida in ogni punto del
conduttore si dice che quel conduttore obbedisce alla *Legge di Ohm*.
