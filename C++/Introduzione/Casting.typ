#import "@preview/showybox:2.0.1": showybox

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

#showybox[
	```
	const float pi;              // NOT Allowed
	const float pi = 3.14;       // Allowed

	pi = 3.1415;                 // NOT Allowed

	g = 1;
	const int gamma = g;         // Allowed
	```
]

Il valore di una reference a cui viene aggiunto il modificatore `const` puó
cambiare se il valore originale viene cambiato, ma non puó comunque venire
modificato direttamente. Non é peró vero il contrario: se una variabile viene
dichiarata `const` non puó essere referenziata, perché questo violerebbe il
senso stesso di averla dichiarata in quel modo.

#showybox[
	```
	int f = 2;
	const int& e = f;
	f++;                         // Allowed, now e = 3 even if constant
	e++;                         // NOT Allowed

	const char x = 'x';
	char& y = x;                 // NOT Allowed
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

Cosí come in (quasi) tutti i linguaggi di programmazione tipizzati, in C++ é
possibile fare *casting*, ovvero trasformare il tipo di dato di una variabile
in un tipo di dato diverso, purché compatibile. Alcuni cast sono *impliciti*,
ovvero dove il compilatore opera "dietro le quinte" un cambio di tipo se questo
é in grado di intuirlo da solo. Questo é comodo, perché non é necessario
specificare istruzioni aggiuntive, ma puó essere rischioso perché potrebbe
diventare difficile ricostruire a ritroso che tale casting é avvenuto. Il
cast C *esplicito* ha invece questa forma:

```
var_type1 = (Type1)var_type2
```

C++, per quanto possa utilizzare i due cast sopra citati, possiede i seguenti
cast speciali:

```
var_type1 = static_cast<Type1>(var_type2)
var_type1 = const_cast<Type1>(var_type2)
var_type1 = reinterpret_cast<Type1>(var_type2)
var_type1 = dynamic_cast<Type1>(var_type2)
```

- `static_cast` é sostanzialmente analogo al casting esplicito del C;
- `const_cast` é un cast speciale utile per "de-proteggere" i dati,
  permettendo di accedere ad un dato costante attraverso un puntatore;
- `reinterpret_cast` é un cast speciale che "forza" un cast anche quando
  questo porta a conclusioni ambigue, di fatto "reinterpretando" il significato
  dei singoli byte;
- `dynamic_cast` é un cast speciale che permette di fare downcasting in una
  gerarchia di classi.

#showybox[
	```
	int i;
	double d;
	i = static_cast<int>(d);              // Similar to i = (int)d in C fashion

	int* pi;
	const int* cpi = &i;
	pi = static_cast<int*>(cpi);          // NOT allowed, can't edit i through cpi
	pi = const_cast<int*>(cpi);           // Allowed

	char* c;
	c = reinterpret_cast<char*>(&i);      // Allowed, integer now a char sequence
	*(c + 2)                              // Editing i byte by byte
	```
]
