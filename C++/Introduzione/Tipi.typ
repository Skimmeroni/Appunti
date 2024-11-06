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
- `void`.

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
