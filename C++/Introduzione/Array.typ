#import "@preview/showybox:2.0.1": showybox

Combinando fra loro tipi primiti, é possibile costruire tipi di dato
composti. Nel C++, i principali dati composti sono tre: *array*,
*stringhe* e *strutture*.

=== Array

Un *array* é una sequenza di dati dello stesso tipo, memorizzati in aree
di memoria contigue chiamate *celle*. Gli array sono utili per memorizzare
dati che fra loro hanno un qualche legame logico.

Un array viene dichiarato come una normale variabile di un certo tipo, ma
accodando `[]` al nome. Dentro alle parentesi quadre é opzionalmente riportata
la sua *dimensione*, ovvero il numero di celle di cui é costituito. Un array
viene inizializzato riportando fra parentesi graffe i valori, separati da
virgole, che verranno assegnati ordinatamente a ciascuna posizione dell'array.
Se vi sono piú valori che posizioni nell'array, il compilatore restituisce un
errore, mentre l'opposto é ammissibile (le celle rimaste vuote vengono
automaticamente riempite con $0$).

```
	array_type array_name[n]                    // Size set to n
	array_type array_name[n] = {v1, ..., vm}    // m can't be greater than n
	array_type array_name[]                     // Size to be determined
	array_type array_name[] = {v1, ..., vn}     // Size is set to n by the compiler
```

Se la dimensione di un array non viene riportata, il compilatore la "deduce"
sulla base del numero di elementi con il quale é stato inizializzato (se é
stato inizializzato con $n$ elementi, allora gli viene assegnata in automatico
la dimensione $n$). La dimensione di un array, se riportata esplicitamente,
deve essere un valore costante, non il contenuto di una variabile, anche se il
valore di tale variabile é noto, e non é ammesso che questa venga determinata
a runtime #footnote[Molti compilatori hanno introdotto una estesione che
permette di avere array la cui dimensione viene calcolata a runtime
(*variable-length arrays* o *VLA*). Per forzare il compilatore a non
usare questa estesione, molti mettono a disposizione il flag `-pedantic` che
garantisce aderenza totale allo standard ISO C++.]. Una volta fissata la
dimensione di un array, non é piú possibile cambiarla (estenderla o
restringerla).

Non é possibile cambiare i valori assegnati alle celle di un array usando la
medesima sintassi dell'inizializzazione, ma occorre farlo cella per cella.
Riportando il nome dell'array con N fra le parentesi graffe si ottiene il
valore nella (N - 1)-esima cella dell'array; gli array partono da 0.
Il compilatore non restituisce un messaggio di errore se si cerca di accedere
ad una cella di memoria che supera le dimensioni dell'array. Nonostante questo,
é comunque considerato un comportamento semanticamente scorretto, perché (come
nel caso dei puntatori) si sta cercando di accedere ad un'area di memoria non
assegnata al programma, e gli effetti sono imprevedibili.

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
	char x = array2[5]                // Allowed, but...
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

=== Stringhe

Una *stringa* é un tipo di dato che permette di memorizzare informazioni
alfanumeriche. In C, le stringhe sono degli array di `char` il cui ultimo
carattere é il carattere speciale `\0`. Quando a `cout` viene fornito un
array di `char` con queste caratteristiche, vengono ordinatamente stampati
tutti i caratteri dell'array ad eccezione di `\0`. Un puntatore a `char`
viene interpretato come una stringa, pertanto non é possibile, a meno di
usare una sintassi particolarmente convoluta, riferirsi ad una stringa
tramite un puntatore. Le stringhe del C hanno dei metodi che si trovano
nell'header file `string.h` (o `cstring`).

Una stringa puó essere inizializzata in due modi. Il primo é quello di
usare la sintassi tipica degli array, e quindi riportare ordinatamente
ogni carattere fra parentesi graffe; in questo caso, occorre che l'ultimo
sia `\0`. Il secondo é quello di riportare semplicemente i caratteri fra
doppi apici; il compilatore converte implicitamente tale rappresentazione
in lista di caratteri e aggiunge `\0` alla fine. Una stringa particolarmente
lunga puó essere inizializzata "spezzandola" in piú sequenze racchiuse fra
doppi apici: il compilatore si incarica di concatenarle automaticamente.

#showybox[
	```
	char strc[10] = "Hello";
	char strm[] = "Up" "Down" "Left" "Right" "Forward" "Backward";
	char strl[] = {'W', 'o', 'r', 'l', 'd', '!', '\0'};
	char* strp = "Hello, World!";   // should be const char* strp
	```
]

// Se una stringa viene dichiarata con `char*`, é...
// Se viene dichiarata con `char[]`, é...

La sintassi del tipo `char* str = "..."` é ammessa perché é un residuo del
modo in cui C gestisce le stringhe, ma non é tecnicamente corretta. Infatti,
una stringa scritta in questo modo ha implicitamente un `const` davanti,
perché indica una stringa costante che viene raggiunta attraverso un puntatore
non costante. Infatti, se si cerca di manipolare tale stringa tramite tale
puntatore si ottiene un errore a runtime. Se si dichiara invece una stringa
come array di caratteri, é possibile modificarla come fosse un normale array
senza effetti collaterali.

#showybox[
	```
	char* m = "More";
	m[2] = 'l';            // Allowed, but...

	char d[] = "Down";
	d[1] = 'a';            // Allowed
	```
]

Essendo degli array di caratteri (per quanto gestiti in maniera speciale), una
stringa si comporta come tale. Ovvero, se la sua dimensione viene fissata ma
viene inizializzata con una stringa con meno caratteri di tale dimensione, i
caratteri restanti vengono riempiti con il carattere nullo. Se la dimensione
non viene specificata, viene dedotta dal compilatore sulla base di come viene
inizializzata. Non é possibile inizializzare una stringa se non mentre la si
dichiara.

Per inserire caratteri speciali all'interno di una stringa, é possibile usare
l'escape character '\'. In particolare, alcuni caratteri speciali, come quello
di tabulazione o di a capo, hanno delle escape sequence dedicate (`\t` e `\n`
rispettivamente, in questo caso). É possibile inserire volutamente il carattere
nullo all'interno di una stringa, ma la maggior parte delle funzioni che
manipolano stringhe non saranno in grado di notarlo.

Una stringa con prefisso `L` é una stringa di wide chars. Di conseguenza, il
suo tipo é `const wchar_t`.

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

=== Struct

Similmente agli array, che sono tipi primitivi, le *struct* sono considerate
tipi compositi. Di fatto, una struct é un "raggruppamento" di dati anche di
tipo diverso, chiamati *campi*. Sono di fatto una forma piú "rudimentale"
del concetto di classe. Tutti i dati di una struct sono di default pubblici,
quindi liberamente modificabili.

Una struct puó essere inizializzata allo stesso modo di come viene
inizializzato un array, dove ogni elemento $i$-esimo all'interno
delle parentesi graffe viene assegnato alla $i$-esima variabile
contenuta nella `struct`. Una `struct` puó anche essere inizializzata
parzialmente, ovvero assegnando un valore solamente ai primi $n$
campi.

#grid(
	columns: (0.3fr, 0.7fr),
	[
	```
	struct name_type {
		type_1 name_1;
		type_2 name_2;
		...
		type_n name_n;
	};
	```
	],
	[
	```
	struct_type struct_name = {field_1, field_2, ..., field_n};
	```
	]
)

#showybox[
	```
	struct Point {
		int x;
		int y;
	};

	Point A = {5, 2};
	```
]

L'operatore `.` permette di accedere ai dati di una `struct`, specificando
il nome del campo a cui ci si riferisce. L'operatore `->` permette di accedere
ad un campo di una struct quando ci riferisce ad essa tramite un puntatore e
non direttamente (é una abbreviazione di una deferenziazione seguita da un
accesso).

#grid(
	columns: (0.5fr, 0.5fr),
	[
	```
	struct_name.field
	```
	],
	[
	```
	pointer_to_a_struct->field
	```
	]
)

#showybox[
	```
	Point P = {5, 2};
	Point* Q = &P;

	P.x = 10;
	Q->y = 8;       // same as (*Q).p = 8

	std::cout << Q->x << " " << P.y << std::endl;    // prints 10 8
	```
]

La memoria occupata da una `struct` dipende dalla politica di allocazione
della memoria del compilatore. In genere, viene prediletta una allocazione
di memoria che ottimizza l'accesso piuttosto che la dimensione. Per tale
motivo, per ottenere la massima efficienza in termini di spazio occupato
é preferibile disporre i dati all'interno in ordine decrescente di grandezza,
di modo che piú dati possano venire "accorpati" in un'unica `word`.

Due `struct` diverse, anche se hanno gli stessi tipi e sono inizializzate
allo stesso modo, sono comunque considerati due tipi distinti. Questo perché
una variabile dichiarata come una certa `struct` ha per tipo tale `struct`.
Inoltre, anche una `struct` formata da un solo campo, anche se tale campo é
un tipo di dato primitivo, é comunque considerata un tipo distinto da
quest'ultimo.

#showybox[
	```
	struct S1 {int a;};
	struct S2 {int a;};

	S1 x;
	S2 y = x;    // NOT Allowed, different types

	int z = x;   // NOT Allowed, even if x is just a int
	```
]

Una `struct` non puó essere definita ricorsivamente, ovvero non puó contenere
a sua volta una `struct` dello stesso tipo come campo. Questo perché il nome di
un tipo diventa disponibile non solamente dopo essere stato dichiarato, ma dopo
che lo si definisce per la prima volta, perché il compilatore non puó sapere
quanta memoria allocare. É peró possibile avere una `struct` che contiene un
puntatore ad una `struct` dello stesso tipo, perché la memoria allocata per un
puntatore é sempre la stessa, ed il problema non si pone.

#showybox[
	```
	// NOT allowed, incomplete type
	struct Node {
		int value;
		Node Left;
		Node Right;
	};

	// Allowed
	struct Node {
		int value;
		Node* Left;
		Node* Right;
	};
	```
]

In generale, il nome di una `struct` che é stata dichiarata ma non definita
puó essere usato solamente nei casi in cui non é necessario conoscerne la
dimensione o uno dei suoi campi.

#showybox[
	```
	struct List;

	// NOT allowed, incomplete type
	struct Table {
			int hash;
			List L;
	};

	// Allowed, but unusable until List is defined
	struct Table {
			int hash;
			List* L;
	};

	void  f(List L);         // Allowed
	List  g(int x, char* S); // Allowed
	List  h(double y);       // Allowed
	List  q(List L);         // Allowed
	List* p(List* L);        // Allowed

	int main(int argc, char* argv[])
	{
			List* L;         // Allowed, only pointers involved
			List LL;         // NOT allowed, incomplete type
			f(*L);           // NOT allowed, size is needed to be returned
			g(5, "Hello");   // NOT allowed, size is needed to be passed
			h(3.14).n = 0;   // NOT allowed, fields are unknown
			List* P = p(L);  // Allowed, only pointers involved

			return 0;
	}
	```
]
