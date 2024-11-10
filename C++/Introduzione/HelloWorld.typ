#import "@preview/showybox:2.0.1": showybox

L'entry point di un programma C++ é una funzione avente nome `main`. Tale
funzione deve essere globale e ne deve esistere una ed una sola copia. Il
suo tipo di ritorno deve essere `int`, perché ció che viene restituito é
il valore di successo o di errore dell'esecuzione del programma. Il suo
numero di argomenti é variabile (anche zero), e tali argomenti vengono
forniti al programma direttamente dall'utente quando il programma viene
avviato.

```
int main()
{
    ...
    return 0;
}
```

Il programma `Hello, World!` per il linguaggio C++, che stampa sullo standard
output tale stringa, é il seguente:

```
#include <iostream>

int main()
{
    std::cout << "Hello, World!" << std::endl;

    return 0;
}
```

`std::cout` é un oggetto definito nella libreria standard del C++ (nello
specifico, definito nell'header `iostream`, che viene importato) preposto
alla stampa sullo standard output. A prescindere di quale sia il tipo di
dato che `std::cout` debba stampare, questo lo restituisce come carattere.

In maniera molto simile, per leggere input da tastiera é possibile sfruttare
`std::cin`

#showybox[
	```
	#include <iostream>

	int main()
	{
	    int something;
	    std::cin >> something;
	    std::cout << "I got " << something << std::endl;

	    return 0;
	}
	```
]

Nel caso in cui si voglia mostrare un messaggio di errore, é possibile
scrivere sullo standard error mediante `std::cerr`. Questo é in genere
piú rapido che scrivere sullo standard output perché lo standard error
non fa buffering, e quindi l'overhead é minore. Aiuta inoltre a separare
i messaggi di errore dal normale flusso di esecuzione del programma.

Gli operatori `<<` e `>>` sono operatori che rispettivamente inseriscono dati
in uno stream ed estraggono dati da uno stream. C++ supporta la *ridefinizione*
degli operatori, pertanto é possibile assegnare ad un operatore una funzione
diversa a seconda del tipo di dato che si richiede che questo manipoli. In
effetti, tali operatori sono essi stessi una ridefinizione, dato che il loro
uso di "default" é lo shift logico (a sinistra e a destra rispettivamente).
