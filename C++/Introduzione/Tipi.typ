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
di memoria. Esistono tanti tipi di puntatori quanti sono i tipi primitivi;
per quanto contengano un indirizzo di memoria (che é un numero), il loro
tipo non é un intero, bensí é specificatamente di tipo "puntatore a...".
Puntatori a tipi diversi sono incompatibili. Nonostante questo, la dimensione
di un puntatore non dipende dal tipo di dato dato che gli indirizzi di memoria
hanno tutti la stessa dimensione. Il valore di default per un puntatore é
`NULL` oppure (standard C++11) `nullptr`.

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
ne viene specificato. Il numero di posizioni dipende dal tipo di puntatore:
sommare N ad un puntatore equivale a spostare la cella di memoria a cui si
riferisce di N volte la dimensione del tipo di dato a cui il puntatore si
riferisce. La scrittura `p[n]` permette di risalire al valore che si trova
`n` posizioni in avanti rispetto al puntatore `p` (é uno spostamento unito
ad una dereferenziazione). La differenza fra due puntatori restituisce il
numero di elementi che si trovano nell'intervallo fra le posizioni in memoria
a cui i due si riferiscono. Il confronto (`=`) fra due puntatori viene fatto
rispetto ai rispettivi valori, e non a ció a cui puntano.

Il fatto che sui puntatori sia possibile fare aritmetica puó presentare un
problema, perché significa che é tecnicamente possibile, dall'interno di un
programma C++, raggiungere aree di memoria che non sono di competenza del
programma stesso, semplicemente incrementando o decrementando il valore di
un puntatore. Fortunatamente questo non puó accadere, perché il sistema
operativo lo previene emettendo un messaggio di errore `Segmentation Fault`
e fermando il programma prima che avvenga l'accesso. Per questo motivo non
é consigliabile (a meno di casi eccezionali) inizializzare un puntatore
fornendogli direttamente un indirizzo di memoria, perché questo comporta
che si chieda al programma di accedere ad una area di memoria specifica
senza poter sapere se il programma possa accedervi, dato che gli indirizzi
in RAM vengono assegnati in maniera sostanzialmente arbitraria.

Cercando di stampare il valore di un puntatore mediante `std::cout` si ottiene
effettivamente l'indirizzo di memoria a cui il puntatore é associato (espressa
in esadecimale).

#showybox[
	```
	int d = 1;
	int* p = &d;

	int c = p[2];                  // A shortand for *(p + 2)

	p = p + 3;                     // pointer's location is shifted by one.
	                               // A shortand for p = p + 3 * sizeof(int)
	std::cout << p << std::endl    // prints, say, 0xfffff7d7761c
	```
]

Essendo un puntatore comunque una variabile, anch'esso si trova in una certa
area di memoria, ed é pertanto possibile risalire all'area di memoria di un
puntatore. Questo significa che é anche possibile avere dei puntatori a dei
puntatori. Inoltre, nulla vieta di avere piú di un puntatore legato alla
stessa area di memoria.

#showybox[
	```
	char s = 's';       // A char
	char* ss = &s;      // A pointer to a char
	char* sss = &ss;    // A pointer to a pointer to a char
	char** f = &s;      // A pointer to a pointer to a char (in one go)
	```
]

É possibile sfruttare dei puntatori di tipo `void` per aggirare le
limitazioni imposte dal compilatore sui puntatori, in particolare i
vincoli di tipo. Infatti, un puntatore di tipo `void` puó riferirsi
a qualsiasi tipo di dato, ed é possibile riassegnare un puntatore di
tipo `void` a dati diversi. Per operare la dereferenziazione é peró
necessario compiere un casting esplicito al tipo di dato a cui il
puntatore si riferisce in questo momento. Sebbene nel C vi fosse una
certa utilitá nei puntatori `void`, nel C++ é da considerarsi una
funzionalitá deprecata.

#showybox[
	```
	int i;
	double d;

	void* pi = &i;
	void* pd = &d;
	int* ppd = pd;             // NOT Allowed

	int x = *((int*) (pi));    // Ok
	int y = *((int*) (pd));    // Allowed, but VERY dangerous
	```
]

Le utilitá dei puntatori sono riassunte di seguito:

- Permettono di riferirsi a piú dati dello stesso tipo;
- Permettono di condividere uno stesso dato in piú parti di codice senza
  doverlo ricopiare piú volte;
- Permettono di accedere ai dati indirettamente, non manipolando il valore
  della variabile in sé ma bensí accedendo alla memoria su cui tale dato si
  trova;
- Permettono il passaggio per parametri alle funzioni, non passando
  direttamente il valore ma il puntatore, risparmiando memoria;
- Permettono di costruire strutture dati dinamiche, come liste e alberi;
