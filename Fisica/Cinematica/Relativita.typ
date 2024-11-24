#import "../Fisica_defs.typ": *

Siano $A$ e $B$ due sistemi di riferimento, dove uno dei due si sta muovendo
rispetto all'altro di moto rettilineo uniforme. Se si osserva la situazione
dal punto di vista di $A$, il sistema di riferimento $A$ é fermo mentre $B$
si sta muovendo di moto rettilineo uniforme con velocitá $v$ rispetto a
questo. Se si osserva la situazione dal punto di vista di $B$, il sistema di
riferimento $B$ é fermo mentre $A$ si sta muovendo di moto rettilineo uniforme
con velocitá $-v$ rispetto a questo. Entrambe le esperienze sono equamente
valide.

Questo sta a significare che non esiste alcun modo di determinare in senso
"assoluto" se un sistema di riferimento é fermo oppure in moto rettilineo
uniforme, ma é possibile farlo solamente rispetto ad un secondo sistema di
riferimento. Questa osservazione prende il nome di *principio di relativitá*.
Sistemi di riferimento che sono fermi l'uno rispetto all'altro o in moto
rettilineo uniforme l'uno rispetto all'altro si dicono *inerziali*. In
altre parole, il principio di relatività sancisce che non esistono sistemi 
di riferimento "universalmente" inerziali: si è sempre inerziali rispetto 
ad un altro sistema.

Le descrizioni compiute da piú sistemi di riferimento inerziali del moto di
uno stesso punto materiale possono essere messe in relazione fra di loro.
Siano $A$ e $B$ due sistemi di riferimento con origine coincidente, e sia $P$
un punto materiale. Si osservi la situazione dal punto di vista di $A$, e si
supponga che $B$ si stia muovendo di moto rettilineo uniforme rispetto a
questo con velocitá $arrow(v)_(B A)$. Entrambi i sistemi di riferimento
osserveranno $P$ muoversi, ma non necessariamente alla stessa velocitá e non
necessariamente compiendo la stessa traiettoria.

In questo scenario vi sono tre vettori posizione, $arrow(r)_(B A)(t)$,
$arrow(r)_(P A)(t)$ e $arrow(v)_(P B)(t)$. Questi indicano, rispettivamente:
la posizione di $P$ rispetto ad $A$, la posizione di $P$ rispetto a $B$ e la
posizione di $B$ rispetto ad $A$. Tali vettori cambiano di direzione e/o di
modulo in ogni istante, da cui la dipendenza dal tempo. Il vettore
$arrow(r)_(B A)(t)$ ha origine nell'origine di $A$ e punto di applicazione
nell'origine di $B$, mentre $arrow(r)_(P B)(t)$ ha origine nell'origine di
$B$ e punto di applicazione in $P$. Essendo il punto di applicazione del primo
coincidente con l'origine del secondo, la loro somma avrá origine nell'origine
di $A$ e punto di applicazione in $P$, ma questo vettore é precisamente
$arrow(r)_(P A)(t)$. In altre parole, i reciproci vettori posizione sono
componibili semplicemente per somma:

$ arrow(r)_(P A)(t) = arrow(r)_(B A)(t) + arrow(r)_(P B)(t) $

Essendo poi la velocitá la derivata della posizione, si osserva che anche
questa puó essere composta per somma:

$ frac(d, d t) (arrow(r)_(P A)(t)) = frac(d, d t) (arrow(r)_(B A)(t) +
  arrow(r)_(P B)(t)) => frac(d, d t) arrow(r)_(P A)(t) = frac(d, d t)
  arrow(r)_(B A)(t) + frac(d, d t) arrow(r)_(P B)(t) =>
  arrow(v)_(P A)(t) = arrow(v)_(B A) + arrow(v)_(P B)(t) $

Derivando ulteriormente l'espressione, si ottiene che l'accelerazione di
$P$ non dipende dal sistema di riferimento, dato che $arrow(v)_(B A)$ é
una costante.

$ frac(d, d t) (arrow(v)_(P A)(t)) = frac(d, d t) (arrow(v)_(B A) +
  arrow(v)_(P B)(t)) => frac(d, d t) arrow(v)_(P A)(t) = frac(d, d t)
  arrow(v)_(B A) + frac(d, d t) arrow(v)_(P B)(t) =>
  arrow(a)_(P A)(t) = arrow(a)_(P B)(t) $
