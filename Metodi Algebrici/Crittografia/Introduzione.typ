#import "../Metodi_defs.typ": *

Si consideri una situazione in cui si vuole inviare un messaggio
opportunamente "occultato" di modo che solamente i destinatari
intesi a riceverlo siano in grado di rimuovere l'occultamento e
poter leggere il messaggio. Ovvero, non si ha interesse ad impedire
a terze parti di poter trovare il messaggio, ma di fare in modo che,
anche se terze parti possano intercettarlo, non siano in grado di
rimuovere l'occultamento.

Il messaggio originale che si vuole mandare prende il nome di *messaggio
in chiaro*, mentre il messaggio opportunamente occultato prende il nome
di *messaggio cifrato*. Le due versioni del messaggio sono scritte adoperando
i *caratteri* di un certo *alfabeto* (in genere, il medesimo) di dimensione
$N$. Il processo che consiste nel convertire un messaggio in chiaro in un
messaggio cifrato prende il nome di *cifratura* o *crittazione*; il processo
inverso, ovvero il convertire un messaggio cifrato in un messaggio in chiaro,
prende il nome di *decifratura* o *decrittazione*.

Affinché sia possibile manipolarli, il messaggio in chiaro ed il messaggio
cifrato devono essere scomposti in elementi atomici, trattabili uno per
uno, detti *unitá*. Una unitá puó corrispondere ad un singolo carattere
dell'alfabeto su cui i messaggi sono definiti cosí come ad una $k$-upla
di caratteri.

Dovendo poi operare matematicamente su tali unitá per ottenere la cifratura,
é necessario tradurre tali caratteri sotto forma di numero. In genere, questo
viene fatto determinando un intervallo di numeri interi ed associando ciascuna
unitá ad uno di questi numeri interi. Tale associazione deve essere biunivoca,
e non é nemmeno necessario nascondere a terze parti la regola che permette
tale traduzione.

#example[
	Si voglia spedire il messaggio `A, M, O, G, U, S`. Tale messaggio é
	scritto nell'alfabeto inglese, avente $N = 26$ caratteri (gli spazi
	e le virgole non sono parte del messaggio, sono presenti solo per
	chiarezza).

	Si assuma che la conversione fra carattere e numero venga fatta
	associando a ciascun $i$-esimo carattere l'$i$-esimo numero intero
	nell'intervallo ${0, ..., 26}$, modulo $26$. Pertanto, la dimensione
	delle unitá dei messaggi é pari ad $1$. Il messaggio scritto in forma
	di numero é quindi

	$ [1]_(26), [13]_(26), [15]_(26), [7]_(26), [21]_(26), [18]_(26) $
] <Amogus-as-numbers>

L'operazione di cifratura puó quindi essere vista come una funzione che
ha in input una unitá del messaggio in chiaro scritta sotto forma di numero
e restituisce una unitá di messaggio cifrato scritta sotto forma di numero.
L'operazione di decifratura é la funzione inversa della funzione di cifratura,
che ha in input una unitá del messaggio cifrato e restituisce una unitá del
messaggio in chiaro. La funzione di cifratura deve essere biunivoca, ovvero
ad una unitá di messaggio in chiaro (scritta come numero) deve venire associata
una ed una sola unitá di messaggio cifrato (scritta come numero), perché
altrimenti non sarebbe possibile costruire la funzione di decifratura (essendo
la sua inversa).

Un sistema cosí formulato prende il nome di *sistema crittografico*, e puó
essere schematicamente rappresentato come:

$ cal(P) attach(-->, t: f) cal(C) attach(-->, t: f^(-1)) cal(P) $

- $cal(P)$ é l'insieme di tutte le possibili unitá che costituiscono i
  messaggi in chiaro, scritte come numero;
- $cal(C)$ é l'insieme di tutte le possibili unitá che costituiscono i
  messaggi cifrati, scritte come numero;
- $f$ é la funzione di cifratura;
- $f^(-1)$ é la funzione di decifratura (inversa di $f$).

#example[
	#set math.mat(column-gap: 3.5em, delim: none)

	Si consideri un sistema crittografico cosí costruito (é facile
	verificare che le funzioni di cifratura e decifratura sono
	effettivamente l'una l'inversa dell'altra):

	$ mat(
		cal(P) = ZZ_(N),
		cal(C) = ZZ_(N),
		f(p) = [5]_(26) p + [3]_(26),
		f^(-1) (c) = [21]_(26) c - [11]_(26);
	) $

	Si consideri il messaggio del @Amogus-as-numbers, scritto come
	numeri interi modulo $26$. La cifratura fornisce:

	$ mat(
		f([1]_(26)) = [1]_(26) dot [5]_(26) + [3]_(26) = [8]_(26),
		f([13]_(26)) = [13]_(26) dot [5]_(26) + [3]_(26) = [16]_(26);
		f([15]_(26)) = [15]_(26) dot [5]_(26) + [3]_(26) = [0]_(26),
		f([7]_(26)) = [7]_(26) dot [5]_(26) + [3]_(26) = [12]_(26);
		f([21]_(26)) = [21]_(26) dot [5]_(26) + [3]_(26) = [4]_(26),
		f([18]_(26)) = [18]_(26) dot [5]_(26) + [3]_(26) = [15]_(26);
	) $

	Mentre la decifratura fornisce:

	$ mat(
		f^(-1)([8]_(26)) = [21]_(26) dot [8]_(26) - [11]_(26) = [1]_(26),
		f^(-1)([16]_(26)) = [21]_(26) dot [16]_(26) - [11]_(26) = [13]_(26);
		f^(-1)([0]_(26)) = [21]_(26) dot [0]_(26) - [11]_(26) = [15]_(26),
		f^(-1)([12]_(26)) = [21]_(26) dot [12]_(26) - [11]_(26) = [7]_(26);
		f^(-1)([4]_(26)) = [21]_(26) dot [4]_(26) - [11]_(26) = [21]_(26),
		f^(-1)([15]_(26)) = [21]_(26) dot [15]_(26) - [11]_(26) = [18]_(26);
	) $

	Effettivamente, i due messaggi coincidono.
] <Amogus-crypto>

In genere, quando ci si riferisce ad un sistema crittografico ci si riferisce
ad una _famiglia_ di sistemi, che hanno in comune la struttura delle funzioni
$f$ e $f^(-1)$ e degli insiemi $cal(P)$ e $cal(C)$ ma differiscono fra di loro
per la scelta di determinati parametri. I valori dei parametri della funzione
$f$ prendono il nome di *chiave di cifratura*, mentre i valori dei parametri
della funzione $f^(-1)$ prendono il nome di *chiave di decifratura*.

#example[
	Il sistema crittografico dell'esempio @Amogus-crypto puó essere
	visto come un membro di una famiglia piú ampia di sistemi crittografici,
	che hanno questa forma:

	#set math.mat(column-gap: 1.5em, delim: none)
	$ mat(
		cal(P) = ZZ_(N),
		cal(C) = ZZ_(N),
		f(p) = a p + b,
		f^(-1) (c) = a^(-1) c - a^(-1) b,
		"con" a\, b in ZZ_(n) " e " a "invertibile";
	) $

	Dove tutti i sistemi crittografici di tale famiglia hanno gli
	stessi insiemi $cal(P)$ e $cal(C)$, ma la scelta delle funzioni
	di cifratura e di decifratura dipendono dalla coppia di parametri
	$(a, b)$. Nel caso particolare dell'@Amogus-crypto, la chiave di
	cifratura é $([5]_(26), [3]_(26))$, mentre la chiave di decifratura
	é $([21]_(26), [11]_(26))$.
] <Amogus-crypto-system>

Di fatto, non é necessario che a terze parti sia nascosto il sistema
crittografico che viene usato per cifrare un messaggio, ma é sufficiente
che siano le chiavi ad esserlo. Questo perché fintanto che le chiavi di
cifratura e di decifratura non sono note, le sole funzioni di cifratura
e di decifratura non sono sufficienti a cifrare/decifrare un messaggio.

Essendo la funzione di cifratura e di decifratura l'una l'inversa
dell'altra, se la chiave di cifratura viene scoperta, diventa possibile
ricostruire la chiave di decifratura, e viceversa. Questo richiede che
entrambe le chiavi siano note solo ed esclusivamente alle entitá che si
scambiano i messaggi, perché se terze parti riescono ad ottenere l'una
possono facilmente determinare l'altra. I sistemi di crittografia che
adottano questo approccio prendono il nome di *crittografia a chiave
privata*, anche detta *crittografia simmetrica*.

#example[
	Si consideri l'@Amogus-crypto-system. Anche se fosse noto il sistema
	di cifratura, senza almeno una delle due chiavi non é possibile conoscere
	la vera forma delle due funzioni. Si supponga peró di venire a conoscenza
	che la chiave di cifratura sia $([7]_(26), [11]_(26))$; diventa allora
	possibile determinare la chiave di decifratura (e quindi la vera forma
	della funzione di decifratura) con pochi passi:

	$ f^(-1) (c) = a^(-1) c - a^(-1) b =>
	  f^(-1) (c) = ([7]_(26))^(-1) c - ([7]_(26))^(-1) [11]_(26) =>
	  f^(-1) (c) = [15]_(26) c - [9]_(26) $
]

Nella *crittografia a chiave pubblica*, anche detta *crittografia
asimmetrica*, é invece possibile rendere nota la chiave di cifratura
senza che questo comporti che si possa usarla per ricavare la chiave
di decifratura. Questo perché la funzione di cifratura viene appositamente
scelta di modo che, anche ammesso di conoscere la chiave di cifratura,
calcolare la chiave di decifratura a partire da questa richieda una
computazione troppo lunga per essere ragionevole.

Funzioni per le quali é semplice valutarle nel loro input ma che é proibitivo
calcolarne l'inversa sono dette *one-way function*. La nozione di one-way
function non é rigorosa dal punto di vista matematico, dato che il tempo
necessario per calcolare la funzione inversa di una funzione dipende anche
dalla tecnologia attualmente a disposizione. In parole povere, un incremento
nella potenza dei calcolatori puó rendere funzioni un tempo considerate
one-way function delle funzioni "comuni".

Sarebbe tecnicamente possibile provare matematicamente che il calcolo
dell'inversa di una certa funzione sia un problema non risolvibile in
tempo polinomiale. In questo modo, non importa la potenza dei calcolatori,
tale computazione sará sempre e comunque improponibile (se non per piccole
istanze). É peró interessante notare come non esista alcuna prova matematica
che il calcolo di funzioni inverse per funzioni di cifratura comunemente
utilizzabili sia un problema intrattabile.
