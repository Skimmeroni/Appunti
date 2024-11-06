#import "@preview/showybox:2.0.1": showybox

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
variable_type* pointer_name = &variable_to_point // declares and initialises a
pointer
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

Un *array* é una sequenza di dati dello stesso tipo, memorizzati in aree di
memoria contigue chiamate *celle*, utile per memorizzare dati che fra loro
hanno un qualche legame logico. Un array viene dichiarato come una normale
variabile di un certo tipo, ma accodando `[]` al nome. La dimensione di un
array é fissata, direttamente nel codice riportandola fra le parentesi
quadre oppure venendo "dedotta" dal compilatore in base a come l'array
viene inizializzato.

Un array viene inizializzato riportando fra parentesi graffe i valori,
separati da virgole, che verranno assegnati ordinatamente a ciascuna
posizione dell'array. Se vi sono piú valori che posizioni nell'array,
il compilatore restituisce un errore. Non é possibile cambiare i valori
assegnati alle celle di un array usando la medesima sintassi
dell'inizializzazione, ma occorre farlo cella per cella. Riportando
il nome dell'array con N fra le parentesi graffe si ottiene il valore
nella (N - 1)-esima cella dell'array; gli array partono da 0. Il compilatore
non restituisce un messaggio di errore se si cerca di accedere ad una cella
di memoria che supera le dimensioni dell'array.

```
	array_type array_name[n]                    // Size set to n
	array_type array_name[n] = {v1, ..., vm}    // m can't be greater than n
	array_type array_name[]                     // Size to be determined
	array_type array_name[] = {v1, ..., vn}     // Size is set to n by the compiler
```

#showybox[
	```
	char array1[3]                    // Not initialised
	char array2[3] = {'a', 'b', 'c'}  // Fully initialised (sizes match)
	char array3[3] = {'a'}            // Partially initialised (less elements than size)
	int array4[] = {1, 2, 3, 4, 5}    // Size is set to 5 by the compiler

	array2 = {'p', 'q', 'r'}          // NOT allowed
	array3[0] = 'f';                  // Allowed
	array3[1] = 'b';                  // Allowed
	array4[10] = 10;                  // NOT allowed

	char x = array3[0]                // Allowed
	char x = array2[5]                // Allowed, but dangerous
	```
]

Un array puó essere costituito a sua volta da array; si parla in questo caso
di *array multidimensionale*. Un array multidimensionale viene dichiarato
come un normale array ma riportando tante parentesi quadre quante sono le
dimensioni; il valore fra le parentesi quadre indica la lunghezza degli
array di tale dimensione. Solamente la prima dimensione di un array
multidimensionale (quella piú a sinistra) puó venire lasciata alla
deduzione del compilatore: le restanti devono per forza essere specificate.
I "sotto-array" di un array multidimensionale sono comunque tutti dello
stesso tipo.

```
	// Multidimensional array having n dimensions. First dimensions is long
	// a, second is long b, etcetera
	array_type array_name[a][b]...[n]
```

#showybox[
	```
	int array0[5][3];
	int array1[2][3] = {{1, 2, 3}, {4, 5, 6}};
	int v = array1[0][2];                             // First array, third element

	int array2[][3] = {{1, 2, 3}, {4, 5, 6}};         // Allowed
	int array3[3][] = {{1, 2, 3}, {4, 5, 6}};         // NOT allowed
	int array4[][] = {{1, 2, 3}, {4, 5, 6}};          // NOT allowed
	```
]

La sintassi degli array é molto simile alla sintassi dei puntatori, perché i
due sono intimamente legati. Infatti, é possibile inizializzare un puntatore
con il nome di un array (fintanto che i tipi sono coerenti); sebbene questo
non sia formalmente corretto, dato che un array _non_ é un puntatore, questo
abuso di notazione é accettato per motivi storici. Un puntatore che assume
come valore un array diventa un puntatore al primo elemento di tale array.
Una volta inizializzato un puntatore con un array, é possibile utilizzarlo
per scorrere lungo l'array in maniera naturale. Un puntatore puó anche essere
inizializzato con un elemento dell'array specifico, e diventa un puntatore
a tale cella di memoria.

#showybox[
	```
	int array[3] = {-1, -2, -3};

	int *p;
	p = array;                       // Allowed, but should be p = &(array[0])

	int *q = array++;                // Allowed, but should be q = &(array[1])
	array++;                         // NOT allowed
	p++;                             // Allowed, points to array[1]

	int w = p[0]                     // Equals *array[1]
	int x = p[1]                     // Equals *array[2]
	```
]

I puntatori possono essere associati anche ad array multidimensionali.
Assegnare un puntatore ad un array multidimensionale corrisponde ad
assegnarlo ad uno dei suoi sottoarray; scorrere con tale puntatore
corrisponde a scorrere di sottoarray in sottoarray.

#showybox[
	```
	int array[2][3] = {{1, 2, 3}, {4, 5, 6}};

	int* q = array;                             // NOT allowed
	int (*p)[3] = array;                        // Pointer to first array of 3 integers

	p++;                                        // Shifts to next 3-dimesional array
	(*p)[1] = 10;                               // array[1][1] = 10
	```
]

// Esiste un modo per decifrare i tipi di dato cursati,
// ha probabilmente senso prenderla dal libro

Una *reference* é un tipo di dato simile al puntatore. Una reference
é di fatto un _alias_ per un'altra variabile; ogni volta che viene
fatta una manipolazione sulla reference, tale manipolazione viene
propagata sulla variabile originale. Una reference deve necessariamente
essere inizializzata quando viene dichiarata, pena messaggio di errore
da parte del compilatore, perché una reference non inizializzata non ha
alcun significato. L'inizializzazione deve essere rispetto ad una variabile,
non rispetto ad un valore. Una volta dichiarato ed inizializzato, un reference
non puó venire "sganciato" e riassegnato ad una variabile diversa, nemmeno se
ha lo stesso tipo della precedente. Cosí come i puntatori, le reference sono
di tipo "reference a...".

```
	reference_type& reference_name = variable_to_be_referenced
```

#showybox[
	```
	int x = 10;
	int& y = x;        // y references x
	y++;               // de facto x++

	int& z;            // NOT allowed
	int& w = 10;       // NOT allowed
	```
]
