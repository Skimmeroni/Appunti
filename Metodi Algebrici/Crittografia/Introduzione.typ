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

	$ [1]_(26), [13]_(26), [15]_(26), [7]_(26), [21]_(26), [18]_(26) $.
] <Amogus-as-numbers>

L'operazione di cifratura puó quindi essere vista come una funzione che ha
in input una unitá del messaggio in chiaro scritta sotto forma di numero e
restituisce una unitá di messaggio cifrato scritta sotto forma di numero.
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

	Si consideri un sistema crittografico cosí costruito (é facile verificare
	che le funzioni di cifratura e decifratura sono effettivamente l'una
	l'inversa dell'altra):

	$ mat(
		cal(P) = bb(Z)_(N),
		cal(C) = bb(Z)_(N),
		f(p) = [5]_(26) p + [3]_(26),
		f^(-1) (c) = [21]_(26) c - [21]_(26) b;
	) $

	Si consideri il messaggio del @Amogus-as-numbers, scritto come numeri
	interi modulo $26$. La cifratura fornisce:

	$ mat(
		f([1]_(26)) = [1]_(26) dot [5]_(26) + [3]_(26) = [8]_(26),
		f([13]_(26)) = [13]_(26) dot [5]_(26) + [3]_(26) = [16]_(26);
		f([15]_(26)) = [15]_(26) dot [5]_(26) + [3]_(26) = [0]_(26),
		f([7]_(26)) = [7]_(26) dot [5]_(26) + [3]_(26) = [12]_(26);
		f([21]_(26)) = [21]_(26) dot [5]_(26) + [3]_(26) = [4]_(26),
		f([18]_(26)) = [18]_(26) dot [5]_(26) + [3]_(26) = [15]_(26);
	) $

	Mentre la decifratura fornisce:

	#set math.mat(column-gap: 1em)
	$ mat(
		f^(-1)([8]_(26)) = [21]_(26) dot [8]_(26) - [21]_(26) dot [3]_(26) = [1]_(26),
		f^(-1)([16]_(26)) = [21]_(26) dot [16]_(26) - [21]_(26) dot [3]_(26) = [13]_(26);
		f^(-1)([0]_(26)) = [21]_(26) dot [0]_(26) - [21]_(26) dot [3]_(26) = [15]_(26),
		f^(-1)([12]_(26)) = [21]_(26) dot [12]_(26) - [21]_(26) dot [3]_(26) = [7]_(26);
		f^(-1)([4]_(26)) = [21]_(26) dot [4]_(26) - [21]_(26) dot [3]_(26) = [21]_(26),
		f^(-1)([15]_(26)) = [21]_(26) dot [15]_(26) - [21]_(26) dot [3]_(26) = [18]_(26);
	) $

	Effettivamente, i due messaggi coincidono.
]
