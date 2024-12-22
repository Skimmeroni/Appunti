#import "../Fisica_defs.typ": *

Quando si effettua una misurazione, non ci si puó aspettare di ottenere
un risultato che corrisponda perfettamente alla realtá, dato che sia i
sensi che gli strumenti di misurazione hanno una portata limitata. Un
modo semplice per delimitare l'ampiezza della certezza di una misurazione
é effettuarne piú di una e farne la media: in altre parole, farne una
*stima*. In fisica, una stima é ritenuta valida se é dello stesso *ordine
di grandezza* del risultato atteso.

L'ordine di grandezza di una misurazione si ottiene come segue: se la parte
non decimale del numero é minore di $sqrt(10)$, allora l'ordine di grandezza
equivale alla potenza di dieci per la quale questa é moltiplicato, se invece
é superiore a $sqrt(10)$ allora l'ordine di grandezza é la potenza di dieci
che lo moltiplica piú uno. Per indicare che due valori hanno lo stesso ordine
di grandezza si utilizza il simbolo $tilde$.

Quando si effettuano una serie di misurazioni ripetute, le cifre che
compaiono nella stessa posizione in tutte le misurazioni sono dette
*cifre significative*. In altre parole, le cifre significative di una
misurazione sono le cifre su cui si é sufficientemente certi che siano
_esatte_.

Quando delle operazioni matematiche vengono applicate a delle grandezze,
bisogna tenere conto di quali cifre significative avrá il risultato. Come
regola pratica é possibile assumere che il risultato di una operazione
abbia numero di cifre significative pari a quelle dell'operando che ne
ha di meno. Nel caso in cui il numero di cifre significative debba essere
ridotto, é possibile arrotondare in questo modo: l'ultima cifra che si
conserva va aumentata di $1$ se la cifra successiva, che si scarta, è
maggiore o uguale di $5$, mentre rimane uguale se la cifra scartata è
minore di $5$. Dato che in un lungo calcolo si pué incorrere in una
moltitudine di "rifiniture" delle cifre significative, una tecnica utile
per evitare di accumulare errori è quella di attendere il risultato finale
prima di arrotondare. Limitando l'approssimazione delle cifre significative
ad un solo passaggio si é certi di accumulare il minor numero di errori
possibile.

É possibile esprimere matematicamente quanto é accurata una misurazione
mediante i concetti di *errore assoluto* e *errore relativo*. L'errore
assoluto $e_(A)$ é la semi-differenza tra la massima e la minima tra le
misurazioni che sono state effettuate, mentre l'errore relativo $e_(R)$
é il rapporto tra l'errore assoluto e la media matematica delle misurazioni
effettuate. L'errore assoluto quantifica l'intervallo entro al quale i valori
delle misurazioni sono da considerarsi accettabili, mentre l'errore relativo
rappresenta lo scarto tra il valore ricavato dalla misurazione e il valore
_reale_. L'errore relativo puó essere moltiplicato per $100 percent$ per
ottenere l'*errore relativo percentuale* $e_(R p)$ che rappresenta, in
percentuale, quanto la misurazione si avvicina al valore _reale_.

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ e_(A) = frac(n_("max") - n_("min"), 2) $],
	[$ e_(R) = frac(e_(A), n_("avg")) $],
	[$ e_(R p) = e_(R) dot 100 percent $]
)

#exercise[
	Nel determinare la lunghezza di una scrivania, sono state effettuate
	cinque misurazioni, ottenendo i cinque valori seguenti:

	#align(center,
		table(
			columns: 5,
			[$2.5561 metre$], [$2.5505 metre$],
			[$2.5597 metre$], [$2.5523 metre$],
			[$2.5549 metre$]
		)
	)

	Quali sono le cifre significative? Qual'é la misurazione media? Quali
	sono errore assoluto, errore relativo e errore relativo percentuale?
]
#solution[
	Le cifre significative sono le prime tre, perché compaiono in tutte e
	cinque le misurazioni. La misurazione media é data da:

	$ frac(2.5561 metre + 2.5505 metre + 2.5597 metre
	  2.5523 metre + 2.5549 metre, 5) = 2.5547 metre $

	Errore assoluto, relativo e relativo percentuale sono dati da:

	#grid(
		columns: (0.4fr, 0.3fr, 0.3fr),
		[$ e_(A) = frac((2.5597 - 2.5505) metre, 2) =
		   0.0046 metre $],
		[$ e_(R) = frac(0.0046 metre, 2.5547 metre) = 0.0018 $],
		[$ e_(R p) = 0.0018 * 100 percent = 0.18 percent $]
	)

	La misurazione media puó quindi essere scritta piú accuratamente come
	$2.5547 metre plus.minus 0.0046 metre$.
]
