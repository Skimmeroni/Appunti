#import "@preview/showybox:2.0.1": showybox

Ogni nome (identificatore) in un programma C++ deve aver associato un *tipo*.
Il tipo di un dato determina sia la quantitá di memoria assegnata al dato,
sia quali operazioni possono essere eseguite sul dato, e come tali operazioni
devono venire interpretate.

Nel C++ si distinguono i seguenti tipi di dato primitivi:

- *numeri interi*;
- *booleani*;
- *caratteri*;
- *numeri decimali*;
- *enumerativi*;
- `void`;
- *puntatori*;
- *reference*.

=== Numeri interi

I numeri interi sono rappresentati attraverso tre tipi di variabili: `int`,
`unsigned int` e `signed int`. Esistono poi tre sottotipi di intero, rispetto
alla dimensione: `int` (dimensione standard), `long int` (dimensione doppia
rispetto a `int`) e `short int` (dimensione dimezzata rispetto a `int`).
`long` puó venire usata come abbreviazione per `long int`, cosí come `short`
lo é per `short int`. Quanto effettivamente occupino dei dati memorizzati con
tali tipi dipende dall'implementazione in uso, ma in genere la dimensione di
un dato `int` non puó essere inferiore a $16$ bit.

I modificatori per il segno e per la dimensione possono essere combinati.
Se non viene specificato direttamente, un tipo `int` viene inteso come un
intero con segno. Pertanto, non esiste alcuna differenza fra `signed int` e
`int`, semplicemente il secondo denota esplicitamente la presenza del segno.
Il compilatore restituisce un warning se si cerca di assegnare un valore ad
un tipo decimale che eccede la sua capacitá. La dimensione di un intero
`signed`, `unsigned` o non specificato é sempre la stessa, ció che cambia é
l'intervallo di valori rappresentabili.

Se un numero intero viene riportato cosí com'é, il compilatore assume che sia
un numero in rappresentazione decimale. Se al numero viene anteposto `0`,
questo viene inteso in rappresentazione ottale. Se al numero viene anteposto
`0x`, questo viene inteso come in rappresentazione esadecimale. Se al sumero
viene postposto `U`, viene inteso come numero senza segno, mentre se al numero
viene postposto `L`, viene inteso come avente modificatore `long`.

=== Numeri decimali

Un valore decimale é un valore numerico floating point. Esistono in tre
dimensioni: `float` (precisione singola), `double` (precisione doppia)
e `long double` (precisione estesa). Quanto effettivamente occupino dei
dati memorizzati con tali tipi dipende dall'implementazione in uso, ma
in genere la dimensione di un dato `double` non puó essere inferiore a
$32$ bit.

Se non viene specificato diversamente, un dato floating-point é di tipo
`double`. Il compilatore restituisce un warning se si cerca di assegnare
un valore ad un tipo decimale che eccede la sua capacitá.

=== Booleani

Un valore booleano puó assumere solamente due valori, `true` e `false`. Un
booleano puó essere usato per esprimere il risultato di una operazione logica.
Internamente, un valore booleano viene considerato come un numero intero che
puó avere esclusivamente valore $1$ (`true`) oppure $0$ (`false`). Infatti,
stampando un booleano tramite `std::cout` viene restituito $1$ oppure $0$.

Se utilizzato in una espressione aritmetica, un valore booleano viene
trattato come un intero ($1$ se `true`, $0$ se `false`). D'altra parte,
un numero intero che viene convertito in un booleano diventa `true` se
ha un qualsiasi valore che non sia $0$ e `false` altrimenti. Anche un
puntatore puó essere convertito in un booleano. Un puntatore a `nullptr`
viene convertito come `false` e come `true` altrimenti.

#showybox[
	```
	int x = 10;
	int y = 5;

	bool b = (x > y);    // True, since 10 is greater than 5
	bool c = !(x != y)   // False, since 10 is not 5

	b = -3;              // True, since -3 is not 0
	c = &x;              // True, since it's not a null pointer
	```
]

=== Caratteri

Una variabile di tipo `char` contiene un singolo carattere del set di
caratteri supportato dall'implementazione in uso. Sebbene il set di
caratteri supportato puó variare molto da implementazione a implementazione,
é possibile assumere che questo sia almeno $7$-bit ASCII, e che contenga
quindi almeno le dieci cifre decimali, le $26$ lettere dell'alfabeto
inglese ed i principali segni di punteggiatura.

Internamente, un carattere viene considerato come un numero intero
costante. Riferirsi ai caratteri in quanto tali anziché riferirvisi
direttamente mediante i numeri interi che li rappresentano permette
di introdurre un livello di astrazione maggiore ed evitare di considerare
gli specifici dettagli implementativi. Essendo numeri interi, possono essere
manipolati aritmeticamente come di consueto, ma se stampati con `std::cout`
vengono resi come caratteri.

La possibilitá di convertire un `char` in un `int` lascia aperta una
questione: `char` é `signed` oppure `unsigned`? Un `char` di $8$ bit
potrebbe contenere un valore fra $-128$ e $127$ oppure fra $0$ e $255$
a seconda se abbia o non abbia il segno. Sfortunatamente, la scelta non
é standardizzata, ma dipende dall'implementazione. C++ permete di
dichiarare una variabile di tipo `char` specificatamente come `signed`
per rifarsi alla prima rappresentazione e `unsigned` per la seconda.
Fortunatamente, la maggior parte dei caratteri di uso comune si trovano
fra $0$ e $127$, pertanto la differenza é spesso irrilevante.

#showybox[
	```
	char a = 'b';    // a is 'b', which is 98
	a /= 2;          // a is '1', which is 49
	a++;             // a is '2', which is 50
	a *= 10;         // a is out of range
	```
]

I caratteri Unicode non possono essere rappresentati mediante `char`, perché
richiedono troppa memoria. Per usecase di questo tipo é possibile rifarsi al
tipo di dato `wchar_t`.

Il tipo `char` é la piú piccola entitá che puó essere indirizzata, pertanto
non puó avere dimensione inferiore a 8 bit. `char` é il tipo di dato che piú
di tutti ha la stessa dimensione nelle diverse implementazioni; per questo
motivo, la dimensione di un `char` é quella che viene utilizzata dal C++ come
"unitá di misura" per esprimere la dimensione degli altri tipi di dato. In
particolare, la funzione della libreria standard `sizeof()` restituisce la
dimensione in multipli di `char` del tipo di dato passato come argomento
(in alternativa, é possibile recuperare queste informazioni dal file della
libreria standard `#limits.h`).

#showybox[
	```
	std::cout << sizeof(char) << std::endl;     // prints, say, 1
	std::cout << sizeof(int) << std::endl;      // prints, say, 4
	std::cout << sizeof(double) << std::endl;   // prints, say, 8

	#include <limits.h>
	int main()
	{
		std::cout << "largest float ==> " << numeric_limits<float>::max()
		<< ", char is signed ==> " << numeric_limits<char>::is_signed()
		<< std::endl;
	}
	```
]

Queste sono le relazioni fra le dimensioni fra i tipi che sono consistenti in
tutte le implementazioni:

#line(length: 100%)
1 #sym.equiv sizeof(char) #sym.lt.eq sizeof(short) #sym.lt.eq sizeof(int)
#sym.lt.eq sizeof(long) \
1 #sym.lt.eq sizeof(bool) #sym.lt.eq sizeof(long) \
sizeof(char) #sym.lt.eq sizeof(wchar_t) #sym.lt.eq sizeof(long) \
sizeof(float) #sym.lt.eq sizeof(double) #sym.lt.eq sizeof(long double) \
sizeof(char) #sym.equiv sizeof(signed char) #sym.equiv sizeof(unsigned char) \
sizeof(int) #sym.equiv sizeof(signed int) #sym.equiv sizeof(unsigned int) \
sizeof(short int) #sym.equiv sizeof(signed short int) #sym.equiv sizeof(unsigned
short int) \
sizeof(long int) #sym.equiv sizeof(signed long int) #sym.equiv sizeof(unsigned
long int)
#line(length: 100%)

=== Enumerativi

Un `enum` é un tipo di dato che consente di associare in maniera automatica
dei valori interi costanti a delle sequenze alfanumeriche, di modo da usarle
come "segnaposto" per dei valori legati da una qualche semantica.

```
enum name {name_1 = value_1, name_2 = value_2, ..., name_n = value_n};
```

Ogni elemento che figura fra le quadre viene chiamato _enumeratore_, ed il
valore che vi viene associato puó venire specificato oppure lasciato dedurre
al compilatore. Nel secondo caso, a tutti gli enumeratori che vengono dopo
l'ultimo a cui é stato associato un valore esplicitamente viene assegnato
il valore a questo successivo. Se nessun valore viene specificato, agli
enumeratori assegnati i numeri $1, 2, 3, dots, $

Ciascun `enum` va a costituire un tipo di dato a sé stante. Ovvero, il tipo di
dato di un enumeratore é il nome dello specifico `enum` di cui fa parte, non
`enum` generico. In una operazione aritmetica, un enumeratore viene considerato
come il valore che gli é stato assegnato, e si comporta come un normale intero.
Tentando di stamparlo con `std::cout` viene restituito il valore numerico, non
il nome dell'enumeratore.

Il _range_ di una enumerazione contiene i valori di tutti i suoi enumeratori
arrotondati alla piú grande vicina potenza di due meno uno. L'estremo sinistro
del range viene scalato a $0$ se a nessun enumeratore é associato un valore
negativo e alla piú piccola potenza negativa di due in caso contrario. Il
`sizeof` di una enumerazione é la stessa di un tipo di dato sufficientemente
grande da contenerne il range e non maggiore di `sizeof(int)`, a meno che uno
o piú dei suoi enumeratori ha assegnato un valore troppo grande per essere
rappresentato in un `int` o `unsigned int`.

#showybox[
	```
	enum day {Mon = 10, Tue = 20, Wed = 30, Thu = 40,
              Fri = 50, Sat = 60, Sun = 70};

	day d;
	d = Wed;          // Allowed
	d = 10;           // NOT Allowed
	int f = Fri;      // Allowed

	enum days {Mon, Tue, Wed, Thu, Fri, Sat, Sun};
	// 1, 2, 3, 4, 5, 6, 7
	enum daysss {Mon = 1, Tue, Wed = 5, Thu, Fri = 2, Sat, Sun};
	// 1, 2, 5, 6, 2, 3, 4
	```
]

=== Void

Il tipo `void` rappresenta una mancanza di informazione e non puó essere
assegnato direttamente ad una variable. Puó essere usato esclusivamente
in due contesti: per contrassegnare che una funzione non ritorna alcun
valore oppure per specificare che un puntatore si riferisce ad una variabile
il cui tipo non é noto a priori #footnote[Per indicare che una funzione non
ritorna alcun valore non é possibile semplicemente non riportare il tipo della
funzione. Questo sia per mantenere la retrocompatibilitá con il linguaggio C,
sia perché altrimenti la grammatica del C++ diverrebbe piú complessa.].

#showybox[
	```
	void x;       // NOT allowed
	void f();     // f() is a function that does not return anything
	void* y;      // y is a pointer to an object of unknown type
	```
]

=== Puntatori

Un puntatore é un tipo di dato che contiene un riferimento ad un indirizzo
di memoria. Esistono tanti tipi di puntatori quanti sono i tipi primitivi;
per quanto contengano un indirizzo di memoria (che é un numero), il loro
tipo non é un intero, bensí é specificatamente di tipo "puntatore a...".
Puntatori a tipi diversi sono incompatibili. Nonostante questo, la dimensione
di un puntatore non dipende dal tipo di dato, in quanto gli indirizzi di
memoria hanno tutti la stessa dimensione.

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
variable_type* pointer_name
variable_type* pointer_name = &variable_to_point
variable_type variable_name = *pointer_name
```

Il valore di default per un puntatore é `NULL` oppure (standard C++11)
`nullptr`. É anche ammesso che un puntatore punti a $0$, dato che una
istruzione di quel tipo viene interpretata dal compilatore in maniera
speciale (non venendo mai allocato nulla all'indirizzo $0$).

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
rispetto ai rispettivi valori, e non a ció a cui puntano. Cercando di stampare
il valore di un puntatore mediante `std::cout` si ottiene effettivamente
l'indirizzo di memoria a cui il puntatore é associato (espressa in esadecimale).

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

Essendo un puntatore comunque una variabile, anch'esso si trova in una certa
area di memoria, ed é pertanto possibile risalire all'area di memoria di un
puntatore. Questo significa che é possibile avere dei puntatori a dei
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

=== Reference

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
