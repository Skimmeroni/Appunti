#import "@preview/showybox:2.0.1": showybox

Nel C++ si distinguono i seguenti tipi di dato primitivi:

- *booleani*, `bool`;
- *caratteri*, `char`;
- *numeri interi*, `int`;
- *numeri decimali*, `float` (singola precisione) `double` (doppia precisione);
- *puntatori*;
- *reference*;

Possono essere poi aggiunti dei _modificatori_ ai tipi primitivi:

- `unsigned`, che rimuove il segno dai tipi numerici;
- `long`, che raddoppia il numero di bit usato per rappresentare il valore
  di una variabile di tipo `int` o `double`. Scrivendo solamente `long` si
  sottintende `long int`;
- `short`, che dimezza il numero di bit usato per rappresentare il valore di
  una variabile di tipo `int`. Scrivendo solamente `short` si sottintende
  `short int`;

La quantitá di bit effettivamente utilizzata per rappresentare una variabile
non é fissata, ma dipende dalle caratteristiche dell'architettura su cui il
codice viene compilato e dal sistema operativo. Lo standard fissa comunque
dei vincoli di massima:

- `char` é la piú piccola entitá che puó essere indirizzata, pertanto non
  puó avere dimensione inferiore a 8 bit;
- `int` non puó avere dimensione inferiore a 16 bit;
- `double` non puó avere dimensione inferiore a 32 bit.

Le informazioni relative a quanti bit sono allocati per una variabile di ogni
tipo si trova in un file della libreria standard chiamato `#limits.h`, che puó
eventualmente essere importato per ricavare tali informazioni. In alternativa,
la funzione della libreria standard `sizeof()` restituisce la dimensione in
multipli di `char` del tipo di dato passato come argomento.

#showybox[
	```
	std::cout << sizeof(char) << std::endl;     // prints, say, 1
	std::cout << sizeof(int) << std::endl;      // prints, say, 4
	std::cout << sizeof(double) << std::endl;   // prints, say, 8
	```
]

Un puntatore é un tipo di dato che contiene un riferimento ad un indirizzo
di memoria. É possibile utilizzarli per accedere ai dati indirettamente,
non manipolando il valore della variabile in sé ma bensí accedendo alla
memoria su cui tale dato si trova. Esistono tanti tipi di puntatori quanti
sono i tipi primitivi; per quanto contengano un indirizzo di memoria (che é
un numero), il loro tipo non é un intero, bensí é specificatamente di tipo
"puntatore a...". Puntatori a tipi diversi sono incompatibili. Il valore di
default per un puntatore é `NULL` oppure (standard C++11) `nullptr`.

Un puntatore viene dichiarato come una normale variabile di tale tipo,
ma postponendo `*` al tipo #footnote[Tecnicamente, la scrittura `type* v`
é equivalente a `type * v` e a `type *v`. Questo perché il token `*` viene
riconosciuto dal parser singolarmente, quindi non c'é differenza nella sua
posizione. Scegliere uno stile piuttosto che un'altro dipende da preferenze
personali.]. Anteponendo `&` al nome di una variabile se ne ottiene l'indirizzo
di memoria. Per ricavare il valore della cella di memoria a cui un puntatore é
associato si antepone `*` al nome della variabile. L'atto di "risalire" al
valore a cui un puntatore é legato é una operazione che prende il nome di
*dereferenziazione*.

```
variable_type* pointer_name                      // declares a pointer
variable_type* pointer_name = &variable_to_point // declares and initialises a pointer
variable_type variable_name = *pointer_name      // dereferences a pointer
```

#showybox[
	```
	int* p = nullptr;                 // initialises a pointer p

	int s = 10;                       // initialises an integer s

	p = &s;                           // p points to the memory address of s

	std::cout << *p << std::endl;     // retrieves the value to which p is
	                                  // pointing, and prints it

	(*p)++;                           // retrieves the value to which p is
	                                  // pointing, and increments it by one
	```
]

Un puntatore, pur non venendo considerato un intero, puó essere manipolato
come tale. In particolare, é possibile sommare un intero ad un puntatore,
e l'operando `+` viene reinterpretato non come una somma nel senso stretto
del termine ma come lo spostamento di un offset di tante posizioni quante
ne viene specificato. Inoltre, cercando di stampare il valore di un puntatore
mediante 'std::cout' si ottiene effettivamente l'indirizzo di memoria a cui
il puntatore é associato (espressa in esadecimale)

Il fatto che sui puntatori sia possibile fare aritmetica puó presentare un
problema, perché significa che é tecnicamente possibile, dall'interno di un
programma C++, raggiungere aree di memoria che non sono di competenza del
programma stesso, semplicemente incrementando o decrementando il valore di
un puntatore. Fortunatamente questo non puó accadere, perché il sistema
operativo lo previene emettendo un messaggio di errore e fermando il
programma prima che avvenga l'accesso.

#showybox[
	```
	int d = 1;
	int* p = &d;

	p++;                          // pointer's location is shifted by one.
	                              // Where is it now?
	std::cout << p << std:endl    // prints, say, 0xfffff7d7761c
	```
]
