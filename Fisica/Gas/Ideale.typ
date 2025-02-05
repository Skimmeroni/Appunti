#import "../Fisica_defs.typ": *

	La descrizione fisica di un gas deve tenere conto di tre variabili
	fondamentali: _pressione_, _volume_ #footnote[Un gas, a differenza
	di un liquido o di un solido, non ha un volume ben definito, perché
	tende a riempire interamente il recipiente nel quale é contenuto.
	É peró comunque possibile assegnare ad un gas un volume se il
	recipiente che lo contiene é costituito da un materiale estremamente
	leggero e deformabile.] e _temperatura_. Tutte e tre dipendono dal
	modo in cui si comportano i loro atomi e molecole e possono essere
	messe in relazione fra loro da una sola equazione, chiamata *equazione
	di stato*.

	Al fine di costruire una equazione di questo tipo, é conveniente
	semplificare il modello di un gas di modo da renderlo approcciabile.
	Inoltre, una proprietá attesa del modello é che non descriva solamente
	un gas nello specifico (idrogeno, ossigeno, elio, ecc...), ma che sia
	applicabile a qualsiasi gas.
 
	Un modello di gas che permette di darne una descrizione semplice senza
	essere troppo distante dal modo in cui un gas agisce normalmente é il
	cosiddetto *gas ideale*. Un gas ideale é un gas che ha le seguenti
	proprietá:

	- La sua temperatura non é troppo bassa, perché altrimenti
	  potrebbe toccare il suo punto di fusione;
	- La sua temperatura non é troppo alta, perché altrimenti
	  le interazioni fra le sue molecole sarebbero troppo intense;
	- La sua pressione non é troppo alta (punto precedente);
	- Le uniche interazioni che avvengono tra le sue particelle
	  sono i reciproci urti;
	- Il volume delle particelle di cui é costituito é considerato
	  trascurabile.

	Inoltre, stando trattando particelle estremamente piccole, é
	ragionevole parlare in termini di *moli*, una unitá di misura
	che indica un certo numero di particelle (atomi o molecole).
	Una mole é definita come il numero di atomi di Carbonio-12
	presenti in un campione di 12 $gram$, ed é stata determinata
	sperimentalmente come:

	$ N_(A) = 6.02 times 10^(23) mole^(-1) $

	Tale numero viene anche detto *Numero di Avogadro*.

	Il numero di moli $n$ di un gas é legato alla massa $m$ di
	quest'ultimo a partire dall'equazione:

	$ n = frac(m, M) = frac(N, N_(A)) $

	Dove $N$ indica il numero di particelle di cui il gas é costituito
	ed $M$ indica la *massa molare*, ovvero la massa atomica dell'elemento
	espressa in $gram / mole$.

	Considerato un gas ideale in un preciso istante di tempo, é possibile
	descriverne lo stato a partire dalla seguente equazione, chiamata
	*Legge di Stato dei Gas Ideali*:

	$ P V = n R T $

	Dove $P$ é la pressione del gas, $V$ é il suo volume, $T$ é la
	sua temperatura, $n$ é il suo numero di moli e $R$ é una costante
	determinata sperimentalmente chiamata *costante universale dei gas
	ideali*, il cui valore é:

	$ R = 8.314 joule / mole dot kelvin$

	#exercise[
		Una bomboletta spray, che contiene un gas a pressione $2.02 times
		10^(5) pascal$, si trova ad una temperatura di $22 degreeCelsius$.
		La bomboletta viene riscaldata fino a far raggiungere al gas al
		suo interno una temperatura di $195 degreeCelsius$. Assumendo che
		il volume della bomboletta (e quindi del gas) rimanga lo stesso
		prima e dopo venire riscaldata, che pressione raggiunge il gas?
	]
	#solution[
		L'equazione di stato dei gas ideali puó venire applicata al gas sia
		rispetto a prima che subisca il riscaldamento, sia rispetto a dopo:

		#grid(
			columns: (0.5fr, 0.5fr),
			[$ P_(i) V_(i) = n R T_(i) $],
			[$ P_(f) V_(f) = n R T_(f) $]
		)

		Naturalmente, il numero di moli $n$ é sempre lo stesso. Tuttavia,
		anche il volume rimane invariato per ipotesi, pertanto é possibile
		scrivere:

		$ V = frac(n R T_(i), P_(i)) = frac(n R T_(f), P_(f)) $

		Risolvendo rispetto a $P_(f)$:

		$ frac(cancel(n R) T_(i), P_(i)) = frac(cancel(n R) T_(f), P_(f)) =>
		  frac(T_(i), P_(i)) = frac(T_(f), P_(f)) => P_(f) =
		  frac(T_(f) dot P_(i), T_(i)) =
		  frac(195 degreeCelsius dot 2.02 times 10^(5) pascal, 22 degreeCelsius) =
		  3.20 times 10^(5) $
	]

	L'equazione puó essere riscritta in maniera equivalente in termini del
	numero di particelle anziché in termini del numero di moli. Essendo $R$
	una costante ed essendo $n = N slash N_(A)$, é possibile scrivere:

	$ n R = frac(N, N_(A)) R = N frac(R, N_(A)) $

	Essendo $R slash N_(A)$ il rapporto di due costanti, anche il suo risultato
	sará una costante. In particolare, tale valore viene indicato con $K$ e
	chiamato *Costante di Boltzmann*:

	$ K = frac(R, N_(A)) =
	  frac(8.314 joule / mole dot kelvin, 6.02 times 10^(-23) mole^(-1)) =
	  1.38 times 10^(-23) joule / kelvin $

	Sostituendo $n R$ con $N K$ si ha:

	$ P V = N K T $
