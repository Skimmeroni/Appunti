#import "@preview/showybox:2.0.1": showybox

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
