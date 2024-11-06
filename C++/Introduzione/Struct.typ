#import "@preview/showybox:2.0.1": showybox

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

`typedef` permette di associare un alias ad un tipo di dato giá esistente.
É utile per riferirsi ad un tipo avente un nome molto lungo con un alias
piú corto. Puó essere utile anche per "mascherare" valori veri con nomi di
comodo, di modo che da fuori da una classe i dati appaiano con nomi piú
semplici da comprendere.

```
typedef old_name new_name;
```

#showybox[
	```
	typedef unsigned long int uli;

	uli x = 10;                       // Same as unsigned long int x = 10
	```
]

`const` é un modificatore che, posto davanti alla definizione di una
variabile, la rende immutabile, ovvero non é piú possibile modificarne
il valore in un secondo momento. Permette di creare delle costanti,
ovvero valori che devono imprescindibilmente assumere uno ed un solo
valore #footnote[`const` occupa lo stesso spazio che nel C aveva `#define`;
infatti, sebbene sia possibile anche in C++ definire costanti in questo
modo, é da considerarsi una worst practice, dato che il linguaggio offre
uno strumento preposto.]. Se si tenta di aggiungere `const` ad una variabile
che non viene inizializzata quando viene dichiarata viene restituito
un messaggio di errore.

```
const var_type var_name = value;
```

Il valore di una reference a cui viene aggiunto il modificatore `const` puó
cambiare se il valore originale viene cambiato, ma non puó comunque venire
modificato direttamente.

#showybox[
	```
	const float pi;              // NOT Allowed
	const float pi = 3.14;       // Allowed

	pi = 3.1415;                 // NOT Allowed

	g = 1;
	const int gamma = g;         // Allowed

	int f = 2;
	const int& e = f;
	f++;                         // Allowed, now e = 3 even if constant
	e++;                         // NOT Allowed
	```
]

Rispetto ai puntatori, l'uso del modificatore `const` puó portare a
conseguenze impreviste. Possono presentarsi tre situazioni, in base
a dove viene posta la keyword `const` nella dichiarazione del puntatore:

- Il modificatore `const` si trova prima del tipo di dato del puntatore.
  In questo senso, il puntatore "protegge" la variabile, impedendo che sia
  possibile modificarla se si passa dal puntatore. Sia il puntatore, sia
  l'oggetto in sé se vi si accede direttamente, sono liberamente modificabili.
  Infatti, la keyword `const` si riferisce comunque sempre e solo al puntatore,
  anche se il dato a cui si riferisce non é una costante;
- Il modificatore `const` si trova dopo il tipo di dato del puntatore. In
  questo senso, é il puntatore stesso ad essere una costante, e non é piú
  possibile modificarlo (scollegarlo e collegarlo ad altro, per esempio), ma
  é possibile modificare il valore dell'oggetto in sé se vi si accede tramite
  il puntatore;
- Il modificatore `const` si trova sia prima che dopo il tipo di dato del
  puntatore. Sia il puntatore, sia l'oggetto se vi si accede tramite il
  puntatore, non sono modificabili.

Assegnare ad un puntatore (non necessariamente con `const`) un tipo di dato
che ha il modificatore `const` restituisce un errore in fase di compilazione,
perché si sta di fatto negando il "senso" dell'aver dichiarato tale variabile
come constante in principio.

#showybox[
	```
	int i = 200;

	const int* p1 = &i;               // 1st type
	*p1 = 100;                        // NOT allowed
	p1 = nullptr;                     // Allowed

	int* const p2 = &i;               // 2nd type
	*p2 = 100;                        // Allowed
	p2 = nullptr;                     // Not allowed

	const int* const p3 = &i;         // 3rd type
	*p3 = 100;                        // NOT allowed
	p3 = nullptr;                     // NOT allowed
	```
]
