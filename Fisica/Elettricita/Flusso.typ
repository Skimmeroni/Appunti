#import "../Fisica_defs.typ": *

Calcolare il campo elettrico associato ad una carica non puntiforme
é possibile, ma tedioso. Esistono peró alcune specifiche situazioni
in cui é possibile calcolare il campo elettrico di una carica in maniera
semplice anche nel caso in cui questa non sia puntiforme. In particolare,
uno di questi casi si ha quando la superficie della carica é una superficie
chiusa, anche detta *superficie gaussiana*.

Si consideri un campo elettrico costante $arrow(E)$ che attraversa
una superficie piatta $A$ di forma rettangolare, avente il vettore
superficie $arrow(A)$ parallelo al campo elettrico. Ciascun vettore
$arrow(E)$ attraversa un'area infinitesima $d A$; essendo $arrow(E)$
e $arrow(A)$ paralleli, la sola componente di $arrow(E)$ lungo l'asse $x$
attraversa la superficie.

La quantitá di campo elettrico che attraversa la superficie $A$ prende il
nome di *flusso elettrico*, indicato con $Phi$. Ogni area infinitesima
$d A$ é attraversata da un flusso $d Phi$ come:

$ d Phi = arrow(E) d arrow(A) $

Il flusso totale attraverso la superficie $A$ viene quindi ad essere:

$ Phi = integral d Phi = integral arrow(E) d arrow(A) $

Piú in generale, é possibile calcolare il flusso totale attraverso una
qualsiasi superficie integrando lungo tutta la superficie:

$ Phi = integral.cont arrow(E) d arrow(A) $

Il flusso elettrico attraverso una superficie gaussiana é in relazione
con la carica totale contenuta nella superficie dalla seguente relazione,
chiamata *Teorema di Gauss*:

$ Phi = integral.cont arrow(E) d arrow(A) = frac(q, epsilon_(0)) $

Tale relazione puó essere usata per ricavare in maniera alternativa
il campo elettrico di una carica puntiforme. Si immagini di avere
una carica puntiforme centrata in una sfera di raggio $r$ che la
racchiude interamente. Il campo elettrico in ogni punto equidistante
dal centro della sfera, fra cui la sua superficie, avrá uguale il modulo
del campo elettrico.

Si consideri un'area infinitesima $d A$ della superficie. In ognuna di
queste aree, il vettore superficie $arrow(A)$ ed il vettore $arrow(E)$
sono perpendicolari. Essendo poi $arrow(E)$ sempre costante in modulo
lungo $A$:

$ frac(q, epsilon_(0)) = Phi = integral.cont arrow(E) d arrow(A) =
  integral.cont E d A = E integral.cont d A $

L'integrale lungo tutta la superficie é semplicemente l'intera area
della sfera, pertanto:

$ frac(q, epsilon_(0)) = E integral.cont d A = 4 E pi r^(2) =>
  E = frac(1, 4 pi epsilon_(0)) frac(q, r^(2)) = frac(F, q_(0)) $

Che coincide con la definizione di campo elettrico precedentemente enunciata.

#exercise[
  Quattro cariche $q_(1), q_(2), q_(3), q_(4)$ sono disposte nello
	spazio. Possono essere definite tre superfici $S_(1), S_(2), S_(3)$
	come segue: la prima contiene le cariche $q_(1)$ e $q_(4)$, la seconda
	contiene $q_(2)$ e $q_(3)$ mentre la terza contiene $q_(1)$ e $q_(3)$.
	Il flusso rispetto al campo elettrico generato dalle quattro cariche
	delle tre superfici sopra descritte vale, rispettivamente: $Phi_(1)
	= 0$, $Phi_(2) = 0$, $Phi_(3) = 2.26 times 10^(3) newton dot metre^(2)
	/ coulomb$. Sapendo che $q_(1) = -1 times 10^(-8) coulomb$, quanto
	vale l'intensitá di carica delle altre tre?
]
#solution[
  $ cases(Phi_(1) = frac(-1 times 10^(-8) coulomb + q_(4), epsilon_(0)) = 0,
          Phi_(2) = frac(q_(2) + q_(3), epsilon_(0)) = 0,
          Phi_(3) = frac(-1 times 10^(-8) coulomb + q_(3), epsilon_(0)) =
                    2.26 times 10^(3) newton dot metre^(2) / coulomb) =>
    cases(q_(4) = 1 times 10^(-8) coulomb,
          q_(3) = 3 times 10^(-8) coulomb,
          q_(2) = -3 times 10^(-8) coulomb) $
]

=== Caso di studio: campo elettrico di una sfera carica cava

Si consideri una superficie sferica $S$ di raggio $R$, la cui carica
totale $q$ é distribuita in modo omogeneo lungo la sua superficie.
Applicando il Teorema di Gauss ad una superficie di raggio $r$
concentrica ad $S$:

$ E = cases(display(frac(1, 4 pi epsilon_(0))) display(frac(q, r^(2))) &
            "se" r gt.eq R, 
            0 & "se" r < R) $

Questo significa che una sfera cava la cui carica elettrica é distribuita
in modo omogeneo lungo la sua superficie si comporta come se fosse una
carica puntiforme.

=== Caso di studio: campo elettrico di una sfera carica piena

Si consideri una superficie sferica $S$ di raggio $R$, la cui carica
é distribuita uniformemente lungo il suo volume. É possibile pensare
ad una situazione di questo tipo come a delle superfici sferiche
concentriche, ciascuna avente carica distribuita uniformemente lungo
la sua superficie.

Nel caso in cui si consideri una superficie sferica concentrica ad
$S$ di raggio $r$ maggiore di $R$, il campo elettrico é analogo alla
situazione precedente, perché si sta considerando una superficie
gaussiana che racchiude interamente la carica.

Si consideri invece il caso di una superficie sferica concentrica ad
$S$ di raggior $r$ minore di $R$. La sezione di carica esterna ad $S$,
per quanto detto in precedenza, non genera alcun campo elettrico,
mentre la sezione di carica interna ad $S$ si comporta come fosse
puntiforme. Indicando con $q'$ tale sezione di carica, si ha:

$ E = frac(1, 4 pi epsilon_(0)) frac(q', r^(2)) $

Se la carica totale $q$ racchiusa da una superficie sferica di raggio $R$
é uniforme, la carica parziale $q'$ racchiusa da una sotto-superficie
sferica di raggio $r$ é proporzionale a $q$:

$ frac(q', frac(4, 3) pi r^(3)) = frac(q, frac(4, 3) pi R^(3)) => q' = q frac(r^(3), R^(3)) $

Sostituendo nella precedente:

$ E = (frac(q, 4 pi epsilon_(0) R^(3))) r $
