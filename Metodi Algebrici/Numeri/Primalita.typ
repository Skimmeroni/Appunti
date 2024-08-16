#import "../Metodi_defs.typ": *

Si voglia generare, fissato un certo ordine di grandezza,
un numero primo qualsiasi di tale dimensione. L'approccio
piú semplice consiste nello scegliere un numero $n$ dispari
di tale ordine di grandezza fissato e valutare se tale numero
é primo; se non lo é, si considera $n + 2$ e si valuta se é
primo, se non lo é si valuta $n + 4$, ecc... Per il Teorema
dei Numeri Primi, é garantito che un numero venga trovato
entro $O(log(n))$ passi.

Viene detto *test di primalitá* un procedimento, in genere
espresso sotto forma di algoritmo, che permette di determinare
se un numero intero $n$ qualsiasi sia o non sia un numero primo.

Il test piú semplice, detto _test naive_, prevede di calcolare,
per ciascun $1 < k < n$, la divisione fra $n$ e $k$: se
esiste almeno un $k$ tale per cui $k | n$, allora $n$ non é
primo, altrimenti lo é. Questo approccio puó essere migliorato
osservando come nell'intervallo $1 < k < n$ possono ripetersi
piú volte dei multipli di numeri primi: se tali numeri fossero
divisori di $n$, per il @Euclid-lemma anche i loro fattori lo
sarebbero, ma questi sarebbero giá stati testati (essendo
certamente minori di $n$). Pertanto, non é necessario considerare
tutti i numeri nell'intervallo $1 < k < n$, ma soltanto quelli
primi.

#lemma[
	Sia $n in NN$ con $n gt.eq 1$. Se $n$ é un numero composto,
	allora almeno uno dei numeri primi che costituiscono la sua
	fattorizzazione é minore di $floor(sqrt(n))$.
]
#proof[
	Si supponga che, in una certa iterazione del test naive, venga
	trovato un numero $p$ che é divisore di $n$. Allora é possibile
	scrivere $n = p q$ per un certo $q in ZZ$. Per come il test
	é strutturato, $q$ deve necessariamente essere maggiore o uguale
	a $p$, perché altrimenti il test lo avrebbe giá individuato (o
	avrebbe individuato un numero primo della sua fattorizzazione).
	Se $q$ fosse maggiore di $p$, allora non sarebbe rilevante ai
	fini del test, perché $p$ verrebbe scoperto prima di $q$ ed
	il test terminerebbe comunque. L'unico caso rilevante si ha
	con $p = q$, ovvero $n = p dot p = p^(2)$, da cui si ha
	$sqrt(n) = p$. Dato che $p$ é stato scelto casualmente, si ha
	che deve esistere almeno un $p$ con queste caratteristiche
	nell'intervallo $(1, n)$.
]

Il test naive é un test _deterministico_, ovvero garantisce di restituire
sempre la risposta corretta. In altre parole, se il test determina che un
certo numero $n$ é un numero primo, allora tale numero é effettivamente un
numero primo, mentre se determina che é un numero composto allora é
effettivamente un numero composto. Il problema di tale test é che
richiede troppe computazioni, specialmente per numeri grandi.

Approcci diversi sono forniti dai test _probabilistici_, ovvero che
non garantiscono di fornire la risposta corretta ma lo fanno a meno
di una certa percentuale. Il vantaggio di tali test é che sono molto
piú veloci dei test deterministici, e quindi utilizzabili nella pratica
(specialmente quando un certo margine di errore é tollerato). Inoltre,
piú test probabilistici possono essere applicati ad uno stesso numero:
piú test confermano lo stesso risultato e maggiore é la certezza del
responso.

Siano $n > 1$ un numero intero dispari e $b$ un intero qualsiasi, primo
con $n$. Se vale $b^(n − 1) equiv 1 mod n$ si dice che $n$ è *pseudoprimo
di Fermat* rispetto alla base $b$. La locuzione "pseudoprimo di Fermat"
viene dal fatto che la definizione di pseudoprimo dipende dal contesto;
se non diversamente specificato, ci si riferirá agli pseudoprimi di Fermat
semplicemente come pseudoprimi.

#example[
	$15$ é uno pseudoprimo per la base $4$. Infatti, $4$ e $15$ sono primi
	fra di loro ed é vero che $4^(14) equiv 1 mod 15$.
]

#lemma[
	Un numero primo $p$ é pseudoprimo rispetto a qualsiasi base.
]

#theorem[
	Per ogni intero $b > 1$, esistono infiniti pseudoprimi rispetto
	alla base $b$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Alla luce dei risultati trovati, é possibile enunciare un semplice algoritmo,
detto *test di primalitá di Fermat*, che determina se un numero intero $n$ é
o non é un numero primo. Se $n$ é pari ed é diverso da $2$, allora é certamente
un numero composto. Pertanto, senza perdita di generalitá, si assuma che $n$
sia dispari:

#line(length: 100%)
+ Si fissi un parametro $k$, che determina il numero di volte che l'algoritmo
  verrá eseguito;
+ Si scelga un qualsiasi numero $b$ tale per cui $0 < b < n$;
+ Si calcoli $"MCD"(b, n)$ con l'algoritmo di Euclide;
+ Se $"MCD"(b, n) > 1$, allora $n$ é certamente un numero composto,
  perché ha almeno $"MCD"(b, n)$ come divisore, e l'algoritmo termina.
  Altrimenti, si calcoli $b^(n − 1) mod n$;
+ Se $b^(n − 1) equiv.not 1 mod n$, allora $n$ é certamente un numero
  composto, perché altrimenti violerebbe il @Fermat-little-theorem, e
  l'algoritmo termina. Se invece $b^(n − 1) equiv 1 mod n$, l'iterazione
  corrente per il test é "inconclusiva";
+ Se l'algoritmo é giá stato eseguito $k$ volte, allora $n$ é _probabilmente_
  un numero primo, e l'algoritmo termina, altrimenti riprende dal punto 2.
#line(length: 100%)

L'algoritmo garantisce di determinare che un numero sia un numero composto
se é un numero composto, ma non da garanzie di determinare che un numero
sia primo se é un numero primo.

Si supponga di aver applicato l'algoritmo $k$ volte, usando quindi $k$
basi $b_(1), b_(2), ..., b_(k)$, e di aver trovato che $n$ é probabilmente
primo. L'efficienza del test dipende dalla probabilitá che $n$ sia effettivamente
primo.

#theorem[
	Sia $n > 1$ un intero composto dispari. Se $n$ non è pseudoprimo rispetto
	ad almeno una base $b$, allora $n$ non è pseudoprimo per almeno la metà
	delle basi possibili viste modulo $n$, cioè le $phi(n)$ basi $b$ con
	$0 < b < n$ e $"MCD"(b, n) = 1$.
] <Fermat-pseudoprime-estimate>
// #proof[
// Dimostrabile, da aggiungere
// ]

Il @Fermat-pseudoprime-estimate permette di dare una stima della probabilitá che
un numero $n$ che il test di Fermat stabilisce essere primo sia effettivamente
primo.

Se $n$ è un numero composto e vale $b_(1)^(n − 1) equiv 1 mod n$, si ha che
$n$ é pseudoprimo rispetto a $b_(1)$. Per il @Fermat-pseudoprime-estimate,
la probabilitá che $n$ "superi" il test pur non essendo un numero primo é
$frac(1, 2)$. Dato che ogni iterazione dell'algoritmo é indipendente dalle
altre, la probabilitá che $n$ "superi" tutte e $k$ le iterazioni del test
pur non essendo un numero primo é $frac(1, 2^(k))$.
