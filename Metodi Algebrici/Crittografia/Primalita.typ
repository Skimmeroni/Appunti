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

Un esempio di test probabilistico per determinare se un intero $n$ é primo
é il *test di primalitá di Fermat*. Se $n$ é pari ed é diverso da $2$, allora
é certamente un numero composto. Pertanto, senza perdita di generalitá, si
assuma che $n$ sia dispari. L'algoritmo procede come segue:

#line(length: 100%)
+ Si fissi un parametro $k$, che determina il numero di volte che l'algoritmo
  verrá eseguito;
+ Si scelga un qualsiasi numero $b$ tale per cui $0 < b < n$;
+ Si calcoli $"MCD"(b, n)$;
+ Se $"MCD"(b, n) > 1$, allora $n$ é certamente un numero composto,
  perché ha almeno $"MCD"(b, n)$ come divisore, e l'algoritmo termina.
  Altrimenti, si calcoli $b^(n − 1) mod n$;
+ Se $b^(n − 1) equiv.not 1 mod n$, allora $n$ é certamente un numero
  composto, perché altrimenti violerebbe il @Fermat-little-theorem, e
  l'algoritmo termina. Se invece $b^(n − 1) equiv 1 mod n$, l'iterazione
  corrente per il test é "inconclusiva";
+ Se l'algoritmo é giá stato eseguito $k$ volte ed é sempre stato
  inconclusivo, allora $n$ é _probabilmente_ un numero primo, e
  l'algoritmo termina, altrimenti riprende dal punto 2.
#line(length: 100%)

Si noti come l'algoritmo garantisca di identificare un numero composto
come tale, ma non garantisce di identificare un numero primo come tale.
Ovvero, potrebbe presentarsi una situazione in cui l'algoritmo ha in
input un numero composto ma lo classifica come primo.

L'algoritmo si basa infatti sull'assunto che esistano pochissimi numeri
composti $n$ tali per cui vale $b^(n − 1) equiv 1 mod n$, e che quindi
ripetendo l'algoritmo abbastanza volte non si incorra in un falso positivo.
Naturalmente, é necessario sostanziare l'assunto che i numeri con queste
caratteristiche siano effettivamente pochi.

Siano $n > 1$ un numero intero dispari e $b$ un intero qualsiasi,
primo con $n$. Se vale $b^(n − 1) equiv 1 mod n$ si dice che $n$
è *pseudoprimo di Fermat* rispetto alla base $b$. Il nome "pseudoprimo
di Fermat" viene dal fatto che tali numeri possiedono una caratteristica
che ci si aspetta possiedano solamente i numeri primi (rispettare l'enunciato
del @Fermat-little-theorem) pur non essendo necessariamente numeri primi.

#example[
	$15$ é uno pseudoprimo di Fermat per la base $4$. Infatti, $4$ e $15$
	sono primi fra di loro ed é vero che $4^(14) equiv 1 mod 15$. Non é
	peró pseudoprimo rispetto a $2$, perché pur essendo $2$ e $15$ coprimi
	si ha che $2^(14)$ non é congruente ad $1$ modulo $15$. Una iterazione
	del test di primalitá di Fermat scegliendo $b = 4$ darebbe per $15$
	risposta inconclusiva, mentre una iterazione con $b = 2$ classificherebbe
	(correttamente) $15$ come numero composto.
]

#lemma[
	Un numero primo $p$ é pseudoprimo di Fermat rispetto a qualsiasi base.
]
#proof[
	Se $p$ é primo, allora é rispettato il @Fermat-little-theorem, e
	quindi vale $b^(p) equiv b mod p$ per qualsiasi $b in ZZ$. Inoltre,
	se $p$ non é divisore di $b$, allora vale anche $b^(p - 1) equiv 1
	mod p$. Affinché $p$ sia pseudoprimo di Fermat rispetto ad una certa
	base $b$ deve essere coprimo con $b$; se $p$ non é divisore di $b$,
	allora é certamente coprimo con $b$. Pertanto, per $p$ vale $b^(p - 1)
	equiv 1 mod p$, che é la definizione di pseudoprimo di Fermat.
]

#theorem[
	Per ogni intero $b > 1$, esistono infiniti pseudoprimi di Fermat
	composti rispetto alla base $b$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]

Si supponga di aver applicato il test di primalitá di Fermat $r$ volte,
usando quindi $r$ basi (non necessariamente distinte) $b_(1), b_(2), ...,
b_(r)$, e di aver trovato che $n$ é probabilmente primo. L'efficienza del
test dipende dalla probabilitá che $n$ sia effettivamente primo.

#theorem[
	Sia $n > 1$ un intero composto dispari. Se $n$ non è pseudoprimo di
	Fermat rispetto ad almeno una base $b$, allora $n$ non è pseudoprimo
	per almeno la metà delle basi possibili viste modulo $n$, cioè le
	$phi(n)$ basi $b$ con $0 < b < n$ e $"MCD"(b, n) = 1$.
] <Fermat-pseudoprime-estimate>
// #proof[
// Dimostrabile, da aggiungere
// ]

Se $n$ è un numero composto e vale $b_(i)^(n − 1) equiv 1 mod n$,
si ha che $n$ é pseudoprimo di Fermat rispetto a $b_(i)$. Per il
@Fermat-pseudoprime-estimate, la probabilitá che $n$ "superi" il
test pur non essendo un numero primo é $frac(1, 2)$. Dato che ogni
iterazione dell'algoritmo é indipendente dalle altre, la probabilitá
che $n$ "superi" tutte e $k$ le iterazioni del test pur non essendo
un numero primo é $(frac(1, 2))^(k)$.

#example[
	Ripetendo il test di primalitá di Fermat $k = 5$ volte, la probabilitá
	di classificare incorrettamente un numero composto come primo é circa
	$0.03$. Ripetendo il test $k = 10$ volte, la probabilitá é circa $0.001$.
	Ripetendo il test $k = 50$ volte, la probabilitá é circa $9 dot 10^(-16)$.
]

Sia $n$ un numero intero composto. Se esiste almeno una base per la quale
$n$ non é pseudoprimo, ripetendo il test di primalitá di Fermat infinite
volte é garantito che prima o poi verrá compiuta una iterazione con tale
base, classificandolo correttamente come composto. Esistono peró dei numeri
che sono pseudoprimi di Fermat rispetto ad ogni possibile base, e che quindi
saranno sempre in grado di "eludere" il test di primalitá di Fermat a
prescindere di quante volte lo si ripeta.

Sia $n > 1$ un intero dispari composto. Si dice che $n$ è un *numero di
Carmichael* se é pseudoprimo di Fermat rispetto a qualsiasi base, ovvero
se vale:

$ b^(n − 1) equiv 1 mod n
  space "per ogni" space b in ZZ space "con" space (b, n) = 1 $

#example[
	I numeri di Carmichael minori di $10000$ sono soltanto $7$. In
	particolare, questi sono: $561, 1105, 1729, 2465, 2821, 6601, 8911$.
]

#lemma[
	Un numero intero composto $n > 1$ è un numero di Carmichael se e
	soltanto se:

	- $n$ non ha alcun quadrato perfetto tra i suoi divisori;
	- $p − 1 divides n − 1$ per ogni divisore primo $p$ di $n$.
] <Is-a-Carmichael-number>
// #proof[
// Dimostrabile, da aggiungere
// ]

#corollary[
	Un numero di Carmichael è prodotto di almeno tre numeri primi distinti.
] <Carmichael-three-primes>
#proof[
	Si supponga per assurdo che un numero di Carmichael sia prodotto di meno
	di tre numeri primi distinti. Naturalmente, non si puó avere un numero di
	Carmichael che sia prodotto di un solo numero primo, perché altrimenti
	si violerebbe il @Is-a-Carmichael-number.

	Devono allora esistere due numeri primi distinti $p$ e $q$ tali che
	$n = p q$. Si supponga, senza perdita di generalitá, che $p < q$. Per
	il @Is-a-Carmichael-number deve aversi $p - 1 divides n - 1$ e $q - 1
	divides n - 1$. Ovvero:

	$ n − 1 = (p − 1)(q − 1) + (p − 1) + (q − 1) $

	Da cui si ricava $p - 1 divides q - 1$. Analogamente, da $q − 1 divides
	n − 1$ si ha $q − 1 divides p − 1$. Ma allora si ha $p − 1 = q − 1$,
	ovvero $p = q$, che é in contraddizione con le ipotesi di partenza in
	quanto si ha assunto che $p$ e $q$ fossero distinti. Occorre quindi
	concludere che un numero di Carmichael è prodotto di tre o piú numeri
	primi distinti.
]

#example[
	Si consideri il numero $561$. I suoi divisori sono $1, 3, 11, 17, 33,
	51, 187, 561$ e nessuno di questi é un quadrato perfetto. Inoltre, i
	suoi divisori primi sono $p_(1) = 3$, $p_(2) = 11$ e $p_(3) = 17$, e
	si ha $p_(1) - 1 divides 560$, $p_(2) - 1 divides 560$, $p_(3) - 1
	divides 560$. In base al @Is-a-Carmichael-number, si ha che $561$ é un
	numero di Carmichael. Inoltre, per il @Carmichael-three-primes, tale
	numero deve essere il prodotto di almeno tre primi distinti, ed in
	effetti si ha $561 = 3 dot 11 dot 17$.
]
