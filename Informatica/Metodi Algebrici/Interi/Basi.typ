#import "../Metodi_defs.typ": *

#theorem("Esistenza ed unicitá della rappresentazione dei numeri interi in una certa base")[
	Sia $b$ un intero maggiore o uguale a 2. Ogni numero intero $n$ non
	negativo può essere scritto in uno ed un solo modo nella forma:

	$ n = d_(k) b^(k) + d_(k − 1) b^(k − 1) + ... + d_(1) b + d_(0)
	  "   con" 0 lt.eq d_(i) < b " " forall i = 0, ..., k " " d_(k) != 0
	  "per" k > 0 $

]
#proof[
	La dimostrazione prevede di applicare il principio di induzione forte
	su $n$. Per $n = 0$ la proposizione é verificata immediatamente. Si
	assuma allora che la proposizione sia vera per ogni $m$ con $0 lt.eq
	m < n$ e la si dimostri per $n$.

	Innanzitutto, si osservi come sia possibile dividere $n$ per $b$,
	ottenendo:

	$ n = b q + r "   con" 0 lt.eq r < b $

	per un certo $q$ ed un certo $r$. Per la definizione di divisione,
	si ha $q < n$. Ma allora $q$ é uno degli $m$ per i quali é valida
	l'ipotesi assunta, ovvero che esiste uno ed un solo modo per
	scrivere $q$ nella forma:

	$ q = c_(k - 1) b^(k - 1) + c_(k − 2) b^(k − 2) + ... + c_(1) b + c_(0) $

	Per certi $k$ valori $c_(i)$ tali per cui $0 lt.eq c_(i) < b$.
	Sostituendo la seconda espressione nella prima, si ha:

	$ n = b q + r = b (c_(k - 1) b^(k - 1) + c_(k − 2) b^(k − 2) + ... +
	  c_(1) b + c_(0)) + r = c_(k - 1) b^(k) + c_(k − 2) b^(k − 1) + ... +
	  c_(1) b^(2) + c_(0) b + r $

	Ponendo $d_(k) = c_(k − 1), d_(k − 1) = c_(k − 2), ..., d_(1) =
	c_(0), d_(0) = r$, si ha:

	$ n = d_(k) b^(k) + d_(k − 1) b^(k − 1) + ... + d_(1) b + d_(0)
	"   con" 0 lt.eq d_(i) < b " " forall i = 0, ..., k $

	Che é l'ipotesi che si voleva dimostrare.

	Per quanto riguarda l'unicità di questa scrittura, questa segue
	dall'unicità di $q$ e di $r$.
]

Dati $b in ZZ$ con $b gt.eq 2$ e un numero naturale $n$ tale che:

$ n = d_(k) b^(k) + d_(k − 1) b^(k − 1) + ... + d_(1) b + d_(0)
  "   con" 0 lt.eq d_(i) < b " " forall i = 0, ..., k " " d_(k) != 0
  "per" k > 0 $

Gli interi $d_(0), d_(1), ..., d_(k)$ si dicono le *cifre* di $n$ in *base*
$b$.

Per indicare in quale base $n$ sta venendo espresso, se ne riportano
ordinatamente le cifre aggiungendo la base in pedice alla cifra piú a
destra. Nel caso in cui il pedice sia assente, si sta sottointendendo
che tale numero sta venendo espresso in base $10$.

Una base $b$ fa uso di un numero di cifre pari a $b - 1$, partendo da
$0$; nel caso in cui la base sia maggiore di $10$, si usano dei simboli
extra per rappresentare le cifre mancanti.

Se é nota la (unica) rappresentazione di un numero intero non negativo
in una certa base $b$, é sempre possibile ricavarne la rappresentazione
in base 10 semplicemente svolgendo l'equazione della definizione. Si noti
peró come tale equazione possa anche essere riscritta come:

#set math.mat(delim: none)
$ mat(
	n &= d_(k) b^(k) + d_(k − 1) b^(k − 1) + d_(k − 2) b^(k − 2) +
	  d_(k − 3) b^(k − 3) + ... + d_(1) b + d_(0);
	  &= (d_(k) b + d_(k − 1)) b^(k − 1) + d_(k − 2) b^(k − 2) +
	  d_(k − 3) b^(k − 3) + ... + d_(1) b + d_(0);
	  &= ((d_(k) b + d_(k − 1)) b + d_(k − 2)) b^(k − 2) +
	  d_(k − 3) b^(k − 3) + ... + d_(1) b + d_(0);
	  &= (((d_(k) b + d_(k − 1)) b + d_(k − 2)) b +
	  d_(k − 3)) b^(k − 3) + ... + d_(1) b + d_(0);
	  &= ...;
	  &= (... (((d_(k) b + d_(k − 1)) b + d_(k − 2)) b +
	  d_(k − 3)) b^(k − 3) + ... + d_(1)) b + d_(0);
) $

Questa forma é nettamente piú convoluta, ma piú semplice da utilizzare per
effettuare la conversione. Infatti, sono necessarie solo $k$ moltiplicazioni
per $b$ e $k$ addizioni.

#example[
	$ 61405_(7) = (((6 dot 7 + 1)7 + 4)7 + 0)7 + 5 =
	((42 + 1)7 + 4)49 + 5 = (301 + 4)49 + 5 = 14950 $
]

Per effettuare la conversione inversa, ovvero ricavare la rappresentazione
di un numero $n$ in base $b$ a partire dalla sua rappresentazione in base
10, si osservi come le cifre $d_(0), d_(1), ..., d_(k)$ di $n$ non siano
altro che i resti delle divisioni:

$ mat(
	n & = b q + d_(0), 0 lt.eq d_(0) < b;
	q & = q_(1) b + d_(1), 0 lt.eq d_(1) < b;
	q_(1) & = q_(2) b + d_(2), 0 lt.eq d_(2) < b;
	& ...
) $

E cosı̀ via, finchè non si ottiene quoziente nullo.

#example[
$ mat(
	14950 & = 7 dot 2135 + 5;
	2135 & = 7 dot 305 + 0;
	305 & = 7 dot 43 + 4;
	43 & = 7 dot 6 + 1;
	6 & = 7 dot 0 + 6;
) $

Leggendo dal basso verso l'alto, si ha $14950 = 61405_(7)$
]

#lemma[
	Sia $n$ un numero intero non negativo e sia $b$ una base. Il
	numero di cifre in base $b$ necessarie a rappresentare $n$ è
	dato da $floor(ln(n)/ln(b)) + 1$
]

Le somme e le sottrazioni fra numeri in base $n$ operano allo stesso modo
di quelle in base $10$, l'unica accortezza sta nel fatto che il _riporto_
massimo é $n - 1$.

#example[
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat(space, 3, 1, 4, 2, + ;
			   space, 3, 2, 4, 4, = ;
			   1, 1, 4, 1, 1) $],
		[$ mat(&4 + 2 = 1,     "con" "riporto di", 1;
			   &4 + 4 + 1 = 4, "con" "riporto di", 1;
			   &2 + 1 + 1 = 4, "senza riporto", ;
			   &3 + 3 = 1,     "con" "riporto di", 1) $]
	)
]
