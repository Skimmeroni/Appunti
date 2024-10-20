#import "@preview/showybox:2.0.1": showybox

Una *stringa* é un tipo di dato che permette di memorizzare informazioni
alfanumeriche. In C, le stringhe sono degli array di `char` il cui ultimo
carattere é il carattere speciale `\0`. Quando a `cout` viene fornito un
array di `char` con queste caratteristiche, vengono ordinatamente stampati
tutti i caratteri dell'array ad eccezione di `\0`. Un puntatore a `char`
viene interpretato come una stringa, pertanto non é possibile, a meno di
usare una sintassi particolarmente convoluta, riferirsi ad una stringa
tramite un puntatore. Le stringhe del C hanno dei metodi che si trovano
nell'header file `string.h` (o `cstring`).

#showybox[
	```
	char strc[10] = "Hello";
	char strl[] = {'W', 'o', 'r', 'l', 'd', '!', '\0'};
	char* strp = "Hello, World!";                        // should be const char* strp
	```
]

Una sintassi del tipo `char* str = "..."` é ammessa perché é un residuo del
modo in cui C gestisce le stringhe, ma non é tecnicamente corretta. Infatti,
una stringa scritta in questo modo ha implicitamente un `const` davanti,
perché indica una stringa costante che viene raggiunta attraverso un puntatore
non costante. Infatti, se si cerca di manipolare tale stringa tramite tale
puntatore viene restituito un errore.

// Da rivedere

In C++, questa é la forma piú "basica" di stringa, e pertanto andrebbe evitata
a meno di circostanze particolari. Le stringhe C++ sono degli oggetti veri e
propri, definiti come `std::string`. L'header file `string` contiene diversi
metodi per manipolarle.

#showybox[
	```
	#include <string>

	std::string s1;
	s1 = "Hello";
	std::string s2 = "World!";
	```
]

Le stringhe C sono ancora utilizzate come argomenti dalla riga di comando.
Infatti, la sintassi standard #footnote[Alcuni compilatori accettano anche
versioni non strettamente conformi a tale standard, ma é comunque best
practise aderirvi.] della funzione `main` completa é la seguente:

```
int main(int argc, char* argv[])
{
	...
	return 0;
}
```

`argc` (_argument count_) é una variabile intera e cattura il numero di
argomenti passati al programma quando é stato invocato. `argv` (_argument
value_) é un array di puntatori, ciascuno facente riferimento ad una stringa,
ed a sua volta ciascuna stringa é l'$i$-esimo argomento passato al programma.
L'unica eccezione é `argv[0]`, che é invece il nome dell'eseguibile stesso
(pertanto, gli argomenti vanno contati a partire da $1$).

Gli argomenti in `argv` sono sempre e comunque stringhe. Per interpretarne
il contenuto come tipi di dato primitivi diversi (come `int` o `float`) sono
possibili due strade:

- Usare le funzioni di basso livello del C, come `atoi` o `atof`;
- Usare gli oggetti `stringstream` dell'header C++ `sstream`.

#grid(
	columns: (0.5fr, 0.5fr),
	[
	```
	var_type = std::atoX(argv[i]);
	```
	],
	[
	```
	#import <sstream>
	std::stringstream s_name(argv[i]);
	type name;
	s_name >> name;
	```
	]
)
