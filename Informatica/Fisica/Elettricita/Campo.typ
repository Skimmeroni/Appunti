#import "../Fisica_defs.typ": *

Le particelle con carica elettrica sono in grado di influenzarsi a vicenda
perchè perturbano lo spazio circostante. In particolare, le particelle
cariche inducono un *campo*, chiamato *campo elettrico*.

Due particelle cariche non interagiscono direttamente, bensì l'interazione
elettrostatica è _mediata_ dai rispettivi campi elettrici, che esistono
anche nel vuoto assoluto e che permette loro di attrarsi e respingersi
pur non essendo a contatto. Il campo elettrico è a tutti gli effetti un
campo vettoriale, ovvero uno spazio dove ad ogni punto può essere associato
un vettore orientato $arrow(E)$.

Si supponga di avere una certa carica elettrica negativa che sta generando
un campo elettrico. Per conoscerne l'intensità in un certo punto dello spazio
$P$, è possibile supporre di posizionare in tale punto una carica positiva
$q_(0)$, detta *carica esploratrice*, così piccola da non poter influenzare
la carica negativa principale. Il campo elettrico in $P$ è dato dal rapporto
fra la forza elettrostatica $arrow(F)$ che la carica esploratrice subisce e
la carica stessa:

$ arrow(E) = frac(arrow(F), q_(0)) $

Avendo definito $q_(0)$ come positiva, il verso di $arrow(E)$ coincide
con il verso di $arrow(F)$. Naturalmente, se vi sono piú cariche elettriche
contemporaneamente, il campo elettrico in un certo punto é dato dalla somma
vettoriale dei singoli campi elettrici.

#exercise[
  Due cariche puntiformi $q_(1) = +2 times 10^(-4) coulomb$ e
  $q_(2) = -5 times 10^(-5) coulomb$ sono poste nel vuoto a una
  distanza $r = 0.1 metre$. Quanto vale l'intensitá del campo
  elettrostatico nel punto equidistante dalle due cariche? Se
  in tale punto venisse posta una carica $q_(0) = 4 times 10(-5)
  coulomb$, quale sarebbe l'intensitá della forza elettrostatica
  a cui questa é sottoposta?
]
#solution[
  Il campo elettrico totale é dato dalla somma vettoriale dei due
  campi elettrici:

  $ arrow(E) = arrow(E)_(1) + arrow(E)_(2) =
    frac(k, r^(2)) (q_(1) - q_(2)) =
    frac(8.99 times 10^(9) newton dot metre^(2) / coulomb^(2),
    (0.05 metre)^(2)) (+2 times 10^(-4) coulomb dot -5 times 10^(-5) coulomb) =
    9 times 10^(5) newton / coulomb $

  La carica $q_(0)$ verrebbe sottoposta alla forza:

  $ F = E q = 9 times 10^(5) newton / coulomb dot 4 times 10^(-5) coulomb =
    3.6 times 10^(-2) newton $
]

Nel caso piú generale in cui il campo elettrico non sia costante, é
possibile immaginare lo spazio come suddiviso in regioni infinitesime,
ed in ciascuna di queste il campo elettrico é dato da:

$ d arrow(E) = frac(d arrow(F), q_(0)) =
  k frac(d Q cancel(q_(0)), cancel(q_(0)) r^(2)) hat(r) =
  k frac(d Q, r^(2)) hat(r) $

Integrando rispetto ad $E$:

$ arrow(E) = integral d arrow(E) = k integral frac(Q, r^(2)) hat(r) d Q $

//=== Caso di studio: campo elettrico generato da un anello

//=== Caso di studio: campo elettrico generato da un filo
