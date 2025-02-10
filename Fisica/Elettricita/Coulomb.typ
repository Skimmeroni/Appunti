#import "../Fisica_defs.typ": *

La *forza elettrostatica* é una forza dovuta ad una proprietá intrinseca
nei corpi, la *carica elettrica*. Tale proprietá esiste in due forme:
*positiva* e *negativa*; due cariche elettriche dello stesso tipo esercitano
reciprocamente una forza elettrostatica repulsiva, due cariche elettriche
di tipo diverso ne esercitano una attrattiva. L'unitá di misura della carica
elettrica é il *Coulomb* (simbolo $coulomb$).

Siano $q_(1)$ e $q_(2)$ i valori di carica elettrica di due corpi puntiformi,
e sia $arrow(r)$ il vettore distanza che li separa. La forza elettrostatica
che il secondo corpo esercita sul primo é data dalla seguente legge, detta
*Legge di Coulomb*:

$ arrow(F) = k frac(q_(1) q_(2), r^(2)) hat(r) $

Dove $hat(r)$ é un versore centrato nel secondo corpo puntiforme che
poggia sulla stessa retta di $arrow(r)$ e $k$ é una costante, detta
*costante elettrostatica* o *costante di Coulomb*:

$ k = 8.99 times 10^(9) newton dot metre^(2) / coulomb^(2) $

La forza elettrostatica in modulo é data da:

$ F = k frac(abs(q_(1)) abs(q_(2)), r^(2)) $

É naturalmente possibile calcolare la forza elettrostatica che il primo
corpo esercita sul secondo semplicemente centrando $arrow(r)$ nel primo
corpo ed invertendo il verso.

Per motivi storici, la Legge di Coulomb viene talvolta scritta anche come:

$ arrow(F) = frac(1, 4 pi epsilon_(0)) frac(q_(1) q_(2), r^(2)) hat(r) $

Dove $epsilon_(0)$ é un'altra costante, chiamata *costante di
permittivitá*:

$ 8.85 times 10^(-12) coulomb^(2) slash newton^(2) dot metre^(2) $

La carica elettrica é presente nei costituenti elementari della
materia, protoni (carica positiva) ed elettroni (carica negativa).
La carica elettrica di un singolo protone e quella di un singolo
elettrone, detta *carica elementare* ed indicata con $e$ #footnote[
I protoni sono a loro volta costituiti da particelle elementari
chiamate *quark*, e la carica elettrica di un protone é in realtá
la somma delle cariche elettriche dei singoli quark. In particolare,
il protone é costituito da due quark _up_ e da un quark _down_. Dato
che la carica elettrica di un quark _up_ é $frac(2, 3) e$ e quella di
un quark _down_ é $-frac(1, 3) e$, la somma complessiva é effettivamente
$frac(2, 3)e + frac(2, 3)e - frac(1, 3)e = e$.], é uguale
in modulo ma opposta in segno, ed é pari a:

$ e = plus.minus 1.602 times 10^(-19) coulomb $

Di norma, la carica elettrica complessiva di un corpo é nulla,
perché il numero di elettroni e protoni che lo costituiscono é
esattamente uguale, bilanciandosi a vicenda. Gli elettroni di
un corpo (non i protoni) possono peró spostarsi da un corpo
all'altro, lasciando uno con un "difetto" di elettroni e
l'altro con un "eccesso".

In tale situazione, il corpo in difetto di elettroni ha piú protoni
che elettroni, ed ha quindi una carica complessivamente positiva,
mentre il corpo in eccesso di elettroni ha piú elettroni che protoni,
ed ha quindi una carica complessivamente negativa. Essendo elettroni
e protoni indivisibili, la carica elettrica complessiva $q$ di un
corpo che contiene $n$ elettroni in eccesso/difetto é semplicemente:

$ q = n e, n in ZZ $

#exercise[
	Il corpo umano possiede un totale di circa $10^(29)$ elettroni. Si
	immagini che l'$1 percent$ di tutti gli elettroni del corpo di una
	persona vengano trasferiti nel corpo di un'altra persona, che dista
	$1 metre$ da questa. Qual'é la forza elettrostatica che la prima
	persona esercita sulla seconda?
]
#solution[
	L'uno percento di $10^(29)$ é $10^(27)$. La prima persona diventa
	carica negativamente, la seconda positivamente.

	$ F = k frac(abs(q_(1)) abs(q_(2)), r^(2)) =
	  8.99 times 10^(9) newton dot metre^(2) / coulomb^(2)
	  frac(abs(1.602 times 10^(-19) coulomb) 10^(27)
	  abs(1.602 times 10^(-19) coulomb) 10^(27), (1 metre)^(2)) =
	  2.3 times 10^(26) newton $

	Si noti come tale forza sia magnitudinalmente piú grande della
	forza-peso del pianeta Terra.
]

La forza elettrostatica é quindi una quantitá *quantizzata*, ovvero
multiplo intero di una unitá finita (detta *quanto*).

Il trasferimento di carica elettrica tra due (o piú) corpi é simmetrico:
la quantitá di carica elettrica persa da un corpo é esattamente pari a
quella acquisita dall'altro. Informalmente, la carica elettrica non puó
"svanire" nel nulla. Questa osservazione viene chiamata *principio di
conservazione della carica elettrica*, in analogia con il principio di
conservazione dell'energia.

In base al comportamento che i materiali hanno rispetto alla
forza elettrostatica, se ne distinguono due tipi: gli *isolanti*
e i *conduttori*. I primi, quando vengono caricati elettricamente,
mantengono in quella regione della loro superficie la carica ottenuta
(positiva o negativa), mentre i secondi, quando vengono caricati,
"disperdono" la carica ottenuta lungo tutta la loro superficie.

La differenza fra i due tipi di materiali é dovuta alla struttura degli
atomi che li compongono. Gli isolanti tendono ad essere costituiti da
atomi con elettroni fortemente attratti dal loro nucleo, avendo quindi
difficoltá a permettere loro di spostarsi. D'altro canto, i conduttori
hanno elettroni poco attratti dal loro nucleo, e che quindi sono piú
propensi a muoversi da un nucleo all'altro.
