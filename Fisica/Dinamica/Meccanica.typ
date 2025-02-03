#import "../Fisica_defs.typ": *

La somma fra l'energia cinetica di tutti gli elementi di un sistema e
l'energia potenziale di tutti gli elementi di un sistema prende il nome
di *energia meccanica*, indicata con $E$:

$ E = K + U $

É particolarmente interessante trattare l'energia meccanica associata a
sistemi _isolati_, ovvero in cui non avvengono scambi di energia e/o di
materia con l'esterno, ed in cui agiscono solamente forze conservative.
Questo perché analizzarli diventa nettamente piú semplice.

Una variazione di energia cinetica $Delta K$ su un elemento del sistema
corrisponde ad un lavoro $W_(1)$ compiuto su tale elemento. Allo stesso modo,
una variazione di energia potenziale $Delta U$ su un elemento del sistema
corrisponde ad un lavoro $-W_(2)$ compiuto su tale elemento. Se nel sistema
in questione agiscono solo forze conservative, una variazione di energia
cinetica corrisponde ad una variazione uguale in modulo ma opposta in
segno di energia potenziale, pertanto $W_(1)$ e $-W_(2)$ hanno lo stesso
modulo. Indicando con i pedici $f$ e $i$ rispettivamente le energie
associate all'istante in cui la forza inizia e finisce di agire, é
possibile scrivere:

$ W_(1) = -W_(2) =>
  Delta K = - Delta U =>
  K_(f) - K_(i) = -(U_(f) - U_(i)) =>
  K_(i) + U_(i) = K_(f) + U_(f) $

Ma la somma fra l'energia potenziale e l'energia cinetica é l'energia
meccanica, pertanto:

$ K_(f) + U_(f) = K_(i) + U_(i) =>
  E_(f) = E_(i) =>
  E_(f) - E_(i) = 0 =>
  Delta E = 0 $

Ovvero, la variazione di energia meccanica all'interno di un sistema
isolato in cui agiscono solamente forze conservative é sempre nulla;
per quanto le energie cinetica e potenziale possano variare liberamente,
la loro somma é sempre costante. Il motivo per cui analizzare sistemi
di questo tipo é molto semplice sta nel fatto che, essendo l'energia
meccanica sempre costante, due stati distinti del sistema possono
essere analizzati senza dover anche considerare gli stati intermedi
e senza dover ricavare il lavoro svolto dalle singole forze.

L'energia meccanica permette di estendere la nozione di forza che
fornisce energia ad un corpo compiendo un lavoro al fornire energia
ad un sistema dall'esterno. Una forza esterna agisce su un sistema
trasferendovi energia; se l'energia del sistema aumenta, la forza
vi sta fornendo energia, mentre se l'energia del sistema diminuisce,
la forza vi sta sottraendo energia. Naturalmente, se piú forze esterne
stanno agendo sul sistema contemporaneamente, il trasferimento di
energia dipende dal lavoro compiuto dalla forza netta.

Fintanto che il sistema é costituito da soltanto un punto materiale,
l'unica forma di energia che puó venirmi fornita é l'energia cinetica.
Se invece il sistema é costituito da piú di un corpo, l'energia fornita
potrebbe figurare anche in altre forme, come l'energia potenziale.

Nel caso in cui nel sistema sono presenti solamente forze conservative,
l'energia fornita dall'esterno figura come energia meccanica. Se $W$ é
il lavoro compiuto sul sistema da una forza esterna, il guadagno o la
perdita di energia da parte del sistema é data da:

$ W = Delta E = Delta K + Delta U $

Si noti come, in questo caso, é ammesso che l'energia meccanica del
sistema aumenti o diminuisca, anche si é in presenza di sole forze
conservative. Questo perché l'input di energia viene dall'esterno
del sistema, non dall'interno.

Si consideri invece il caso in cui fra le forze esterne al sistema
che agiscono su questo figura la forza d'attrito, che é una forza
non conservativa. Sia $arrow(F)$ una forza costante esterna al
sistema, parzialmente controbilanciata da una forza di attrito
$arrow(f)_(k)$, che agisce su un suo elemento. Sia $arrow(d)$
lo spostamento indotto da tale forza, e siano $arrow(v)_(i)$ e
$arrow(v)_(f)$ le velocitá che il corpo ha rispettivamente all'inizio
ed alla fine dello spostamento. Applicando la Seconda Legge di Newton:

$ arrow(F) - arrow(f)_(k) = m arrow(a) $

Avendo assunto che $arrow(F)$ é costante, anche $arrow(a)$ é costante.
Ricordando che $arrow(v)^(2)_(f) = arrow(v)^(2)_(i) + 2 arrow(a) arrow(d)$:

$ arrow(F) - arrow(f)_(k) =
  m (frac(arrow(v)^(2)_(f) - arrow(v)^(2)_(i), 2 d)) =>
  arrow(F)d - arrow(f)_(k)d =
  frac(1, 2) m arrow(v)^(2)_(f) - frac(1, 2) m arrow(v)^(2)_(i) =>
  arrow(F)d = frac(1, 2) m arrow(v)^(2)_(f) - frac(1, 2) m arrow(v)^(2)_(i) + arrow(f)_(k)d $

Sostituendo con le espressioni per il lavoro e per l'energia cinetica, si ha:

$ W = Delta K + f_(k) d $

É possibile generalizzare al caso in cui vi sia anche energia potenziale:

$ W = Delta E + f_(k) d $

L'energia obbedisce ad un principio empirico che (al momento) non trova
alcuna eccezione, chiamato *principio di conservazione dell'energia*,
che stabilisce che il quantitativo totale di energia all'interno di
un sistema isolato non possa mai cambiare, ma solamente venire convertita
(da cinetica a potenziale, per esempio, o viceversa). Si noti come
l'introdurre o sottrarre energia in un sistema isolato da parte di una
forza esterna non viola questo principio; il lavoro fornito/sottratto
é comunque presente, ma in un sistema piú ampio. Nel caso limite in cui
si consideri l'intero Universo, non esiste alcuna forza a questo esterna,
pertanto l'energia totale dell'Universo é sempre la stessa.
