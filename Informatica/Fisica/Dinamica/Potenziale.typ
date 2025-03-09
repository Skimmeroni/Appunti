#import "../Fisica_defs.typ": *

L'*energia potenziale*, indicata con $U$, é una forma di energia associata
alla "configurazione" di un sistema, ovvero alle posizioni che le entitá
nel sistema che imprimono forze l'una sull'altra occupano. La variazione
di energia potenziale di un punto materiale é definita come l'opposto del
lavoro su questo compiuto:

$ Delta U = -W $

All'energia potenziale é legato il concetto di _conservativitá_ delle
forze. Si consideri un sistema fisico cosí definito:

+ Il sistema é costituito da due o piú oggetti fisici;
+ Le forze sussistono fra uno degli oggetti del sistema ed uno o
  piú oggetti del sistema; 
+ Quando la configurazione del sistema cambia, una forza compie lavoro
  $W_(1)$, trasferendo energia dall'energia cinetica dell'oggetto ad
  un altro tipo di energia (potenziale, ecc...) del sistema;
+ Quando tale cambiamento nella configurazione viene rovesciato, una
  forza compie un lavoro $W_(2)$ che fornisce energia all'oggetto.

Nella situazione in cui $W_(2)$ e $W_(1)$ sono sempre uguali in valore
assoluto, ovvero quando l'energia ceduta dall'oggetto al sistema viene
sempre restituita per intero se il processo viene invertito, allora
l'energia che viene restituita é energia potenziale e la forza in
questione é una *forza conservativa*. Se questo non avviene, si dice
che si é in presenza di una *forza non conservativa*. La forza elastica
e la forza di gravitá sono esempi di forze conservative; la forza di
attrito é un esempio di forza non conservativa.

Una proprietá delle forze conservative é che il lavoro netto compiuto
lungo un percorso chiuso (ovvero, dove il punto iniziale e quello finale
coincidono) é sempre zero, a prescindere dalla lunghezza e dalla forma
del percorso. In maniera sostanzialmente equivalente, é possibile dire
che il lavoro compiuto da una forza conservativa da un punto $A$ ad un
punto $B$ non dipende né dalla forma percorso, né dalla sua lunghezza. 

Una espressione per $U$ puó essere scritta come segue. Si consideri un
punto materiale che fa parte di un sistema su cui agisce una forza
conservativa $arrow(F)$. Se questa compie un lavoro $W$ sul punto
materiale, la variazione di energia potenziale é uguale in modulo al
lavoro, ma in segno opposto. É pertanto possibile sostituire $Delta U$
nell'espressione per il calcolo del lavoro come:

$ -W = Delta U = -integral_(x_(i))^(x_(f)) F(x) d x $

Dove $x_(i)$ e $x_(f)$ sono rispettivamente il punto iniziale e finale
dello spostamento del corpo indotto dalla forza.

=== Caso di studio: energia potenziale gravitazionale

Si consideri un punto materiale di massa $m$ che viene lanciato
verticalmente da un punto $y_(i)$ ad un punto $y_(f)$; su questa
agisce la forza di gravitá $F_(g)$. Applicando la formula appena
trovata:

$ Delta U =
  -integral_(y_(i))^(y_(f)) arrow(F)_(g)(y) d y =
  -integral_(y_(i))^(y_(f)) (-m g) d y =
  m g integral_(y_(i))^(y_(f)) d y =
  m g [y]_(y_(i))^(y_(f)) =
  m g (y_(f) - y_(i)) =
  m g Delta y $

Dove l'integrazione avviene verticalmente, e non orizzontalmente. Si
noti come la forza di gravitá abbia segno negativo, in accordo con il
fatto che questa agisce dal basso verso l'alto.

Sebbene solamente una _variazione_ di energia potenziale sia una quantitá
fisicamente rilevante, talvolta puó essere utile associare una energia
potenziale $U(y)$ ad un punto materiale in un sistema Terra-punto ad una
certa altezza $y$. Riscrivendo l'espressione precedente in questo modo:

$ U_(f) - U_(i) = m g (y_(f) - y_(i)) $

Si ha che $U_(f)$ e $U_(i)$ sono rispettivamente l'energia potenziale
associata al punto materiale quando questo si trova ad altezza $y_(f)$
e $y_(i)$. In generale, ad una certa altezza $y$, si ha:

$ U(y) = m g y $

=== Caso di studio: energia potenziale elastica

Si consideri una molla con un estremo fissato a sinistra ed un punto
materiale attaccato a destra. Quando il punto materiale si muove da
una posizione iniziale $x_(i)$ ad una nuova posizione $x_(f)$, la molla
esercita su questo una forza $F(x) = -k x$, e compie pertanto un lavoro.
Sostituendo tale forza nell'equazione per la variazione dell'energia
potenziale, si ha:

$ Delta U =
  -integral^(x_(f))_(x_(i)) F(x) d x =
  -integral^(x_(f))_(x_(i)) (-k x) d x =
  k integral^(x_(f))_(x_(i)) x d x = 
  k [frac(x^(2), 2)]^(x_(f))_(x_(i)) =
  k (frac(x^(2)_(f), 2) - frac(x^(2)_(i), 2)) =
  frac(1, 2) k x^(2)_(f) - frac(1, 2) k x^(2)_(i) $

In maniera analoga a quanto fatto per l'energia potenziale gravitazionale,
é possibile associare un'energia potenziale ad una posizione specifica del
punto materiale come:

$ U(x) = frac(1, 2) k x^(2) $
