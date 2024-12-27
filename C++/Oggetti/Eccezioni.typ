#import "../C++_definizioni.typ": *

Gli errori a runtime vengono gestiti dal linguaggio C++ adoperando il
paradigma delle *eccezioni*. L'idea é che una funzione che incontra un
errore a runtime che non é in grado di risolvere "lancia" (_throws_)
una eccezione, delegando la gestione di tale errore al chiamante. Una
funzione in grado di gestire gli errori in questo modo si dice che
"cattura" (_catch_) una eccezione.

La gestione degli errori permette di separare due concetti distinti:
l'_error reporting_, ovvero notificare al chiamante che c'é stato un
problema, e l'_error handling_, ovvero gestire questa evenienza in
qualche modo (anche non facendo nulla). Infatti, questi due aspetti
sono sotto il controllo di due entitá diverse. Chi scrive una libreria
potrebbe essere in grado di determinare dove possono verificarsi gli
errori a runtime, ma in genere non ha modo di sapere come poterli
gestire. Chi usa una libreria potrebbe essere in grado di poter gestire
un errore a runtime, ma in genere non ha modo di sapere dove esattamente
tale errore si sia verificato.

Le eccezioni figurano in C++ come *blocco try-catch*, avente la seguente
sintassi:

```
	try {
		/* ... */
	}
	catch (/* ... */) {
		/* ... */
	}
```

All'interno del blocco `try` viene eseguita la funzione che potrebbe
restituire una eccezione. Tra le parentesi tonde della keyword `catch`
viene riportata l'eccezione che quel blocco `catch`, anche chiamato
*exception handler*, si incarica di gestire. Un blocco `catch` puó
trovarsi solamente subito dopo un blocco `try`.

All'interno del blocco `catch` viene riportato cosa fare nel caso in
cui si verifichi l'eccezione riportata tra parentesi tonde. Se l'eccezione
non avviene, o se avviene una eccezione diversa da quella riportata fra
parentesi, il blocco `catch` viene ignorato. Se una funzione puó generare
piú eccezioni e le si vuole gestire, é possibile concatenare piú blocchi
`catch` ad uno stesso blocco `try`, ciascuno preposto a gestire una eccezione
fra queste.

Una eccezione viene effettivamente generata mediante `throw`:

```
	throw name_of_the_exception;
```

C++ non specifica un formato o un tipo di dato per costruire una eccezione.
Queste possono essere di fatto qualsiasi cosa, che sia un tipo di dato custom
o un tipo di dato predefinito. Per evitare confusione con i tipi standard, si
preferisce utilizzare un tipo di dato custom specifico per ciascuna eccezione,
in genere sotto forma di struct o di classe.

#exercise[
	```
	#include <iostream>

	struct Division_by_zero {};

	int smart_ratio(int n, int d)
	{
		if (d == 0) {
			throw Division_by_zero();
		} else {
			return n / d;
		}
	}

	int main()
	{
		int a, b;

		std::cin >> a;
		std::cin >> b;

		try {
			int r = smart_ratio(a, b);
			std::cout << r << std::endl;
		} catch (Division_by_zero) {
			std::cerr << "Attempted division by zero!" << std::endl;
		}

		return 0;
	}
	```
]
