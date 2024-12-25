#import "../C++_definizioni.typ": *

Una *classe* viene dichiarata con la seguente sintassi:

```
class class_name {
	attribute1_type attribute1_name;
	attribute2_type attribute2_name;
	...
	attributeN_type attributeN_name;

	method1_type method1_name;
	method2_type method2_name;
	...
	methodN_type methodN_name;
};
```

Una classe é un tipo di dato definito dall'utente che é dotato anche di
funzioni specifiche per poterlo manipolare. Di fatto, una classe é simile
ad una `struct` con delle funzioni maggiormente accoppiate. Una istanziazione
di una classe prende il nome di *oggetto*; come per una `struct`, l'operatore
`.` permette di accedere alle funzioni e le variabili che contiene.

Le funzioni che appartengono ad una classe (*metodi*) e le variabili che
appartengono ad una classe (*attributi*) possono essere dichiarate `public`
oppure `private`. Un metodo/attributo `public` é accessibile dall'esterno
se esiste un riferimento all'oggetto, mentre un metodo/attributo `private`
é accessibile solamente da un metodo della classe.

Una sezione della classe puó venire dichiarata come `private` o come `public`
riportando l'etichetta `private:` o `public:` rispettivamente. Tutto ció che
si trova al di sotto di tale etichetta viene dichiarato come l'etichetta
specifica. `public:` e `private:` possono essere ripetute anche più di una
volta, ma per leggibilità è preferibile avere soltanto una ciascuna. Una
sezione che non é esplicitamente dichiarata come `private` o `public` é
assunta essere `private`.

#exercise[
	```
	class dbuffer {
		unsigned int size;
		int* buffer;
	}
	```
]

Una classe viene istanziata chiamando uno dei suoi *costruttori*. Un
costruttore é un metodo di tale classe che accetta un certo numero di
parametri (anche nessuno) e che istanzia la classe con tali valori. I
costruttori sono metodi che hanno per nome il nome della classe stessa,
ed in genere sono dichiarati `public`.

```
class_name::class_name(a1_type a1_value ..., aN_type aN_value) {
	a1_name = a1_value;
	...;
	aN_name = aN_value;
}
```

#exercise[
	```
	dbuffer::dbuffer(unsigned int size, int value) {
		mBuffer = new int[size];
		mSize = size;

		for (unsigned int i = 0; i < size; i++) {
			mBuffer[i] = value;
		}
	}
	```
]

Essendo dei metodi, i costruttori supportano l'overloading, pertanto possono
esserci piú costruttori per una stessa classe, fintato che la loro firma é
distinta. Quale sia il costruttore corretto da richiamare viene dedotto dal
compilatore sulla base del numero e del tipo di ciascun dato passato.

```
class_name class_instance(a1_value, ..., aN_value);
```

Naturalmente, come ogni tipo di dato, anche una istanza di una classe 
puó essere creata usando la memoria dinamica.

#exercise[
	```
	dbuffer* d = new dbuffer();
	...
	delete d;
	d = nullptr;
	```
]

Porre `const` alla fine di un metodo segnala al compilatore che tale
metodo non modifica lo stato dell'oggetto su cui agisce. Riportare
questo modificatore é talvolta necessario perché la modifica dello
stato interno di un oggetto potrebbe avvenire anche senza utilizzare
uno dei parametri passati al metodo (chiamando un costruttore, ad
esempio). Una funzione generica non può terminare con `const`, soltanto
una funzione di classe.

É considerata best practice inizializzare i valori manipolati da un
costruttore anche se questi li sovrascrive. Questo perché, semmai
l'istanziazione di uno degli attributi dovesse fallire, l'oggetto
rimarrebbe comunque in uno stato coerente #footnote[Standard del C++
piú recenti permettono di chiamare un costruttore dentro un altro
costruttore. Sarebbe quindi possibile chiamare il costruttore di
default dentro tutti gli altri, inizializzando gli attributi con
valori coerenti ma risparmiando linee di odice. É comunque considerata
una bad practice].

Puó essere utile, al fine di avere la certezza che un costruttore sia
stato invocato correttamente, inserire delle informazioni di debug.
Ovvero, se si sospetta che il costruttore non stia venendo chiamato
correttamente, é possibile inserire del codice che viene eseguito
ogni volta che il costruttore viene invocato e fintanto che si sta
compilando in modalitá debug:

```
	#ifndef NDEBUG
	...
	#endif

```

`NDEBUG` é una etichetta specificata nella libreria standard, che 
assume valore vero se il codice é stato compilato in modalitá debug; 
se il codice viene compilato in modalitá release, tale etichetta 
assume valore falso, e ció che racchiude `#ifndef` viene ignorato.

In un costruttore potrebbe esserci ambiguitá fra il nome passato 
per inizializzare un attributo della classe ed il nome dell'attributo 
stesso. La keyword `this`, un puntatore speciale alla classe stessa, 
permette di specificare che ci si sta riferendo ad un attributo o ad 
una funzione che appartiene alla classe, disambiguando da eventuali 
omonimi.

#exercise[
	```
	dbuffer::dbuffer(unsigned int size) {
		...
		this->size = size;
	}
	```
]

Come da programmazione ad oggetti, anziché esporre direttamente i dati 
di una classe all'esterno, si preferisce filtrarne l'accesso mediante 
dei metodi *getter* e *setter*. In C++ esiste peró un modo migliore 
per implementare tale funzionalitá, ed é utilizzare una reference per 
avere un getter e setter in una sola funzione. Infatti, dato che si 
sta passando il dato per reference, se lo si modifica si sta 
effettivamente modificando il dato originale.

#exercise[
```
#include <cassert>

int& dbuffer::value(unsigned int index) {
	assert(index < mSize);

	return mBuffer[index];
}

dbuffer a, b;
a.value(i) = b.value(j);   // a.setValue(i, b.getValue(j))
```
]

In genere, i metodi getter/setter vengono "spezzati" in due: uno che 
agisce in sola lettura quando il dato passato è modificato con `const`
ed uno che agisce in lettura e/o scrittura quando il dato è passato
normalmente. Il metodo di sola lettura ha il modificatore `const`
all'inizio e alla fine, ma per il resto è identico all'originale. 
Dato che il C++ supporta l'overloading delle funzioni, i due metodi 
possono anche avere lo stesso nome, è il compilatore a determinare 
in automatico quale delle due versioni usare sulla base della presenza 
del `const` nel dato passato.

#exercise[
```
#include <cassert>

int& dbuffer::value(unsigned int index) {
	assert(index < mSize);

	return mBuffer[index];
}

const int& dbuffer::value(unsigned int index) const {
	assert(index < mSize);

	return mBuffer[index];
}

```
]

Una funzione globale potrebbe necessitare di accedere ai dati di una 
funzione, anche se questi sono privati. Ad esempio, l'operatore `<<` 
potrebbe necessitare di accedere ai dati privati di una classe per 
poter scrivere su file attributi che questa non espone, di modo da
poterla poi ricostruire in lettura. Una soluzione è l'uso del 
modificatore `friend`, che se posto davanti alla firma di una 
funzione all'interno della classe (anche se tale funzione non 
appartiene alla classe) specifica che tale funzione può accedere 
ai suoi attributi anche se dichiarati privati.

#exercise[
	```
	friend std::ostream &operator<<(std::ostream &os, const dbuffer &db)
	```
]

Una sezione di una classe può essere dichiarata `protected`: tutto ciò
che si trova in tale sezione è privato dal punto di vista dell'uso, ma
può essere usato da una classe derivata da quella corrente.

Per inizializzare i valori di una classe in un costruttore è 
possibile, in alternativa al semplice assegnamento, usare una 
*initialization list*. Questa consiste in una lista in cui 
riportare dei copy constructor per ciascun attributo da voler 
inizializzare. Anche un tipo di dato primitivo può essere
inizializzato in questo modo, perchè anche questi hanno 
associati dei copy constructor.

```
class_name::class_name(a1_type a1_value ..., aN_type aN_value) : a1_type(a1_initValue) ..., aN_type(aN_initValue){
	...
}
```

L'initialization list è anche l'unico modo per poter inizializzare in 
una classe un attributo dichiarato `const`, dato che per definizione
se lo si tentasse di fare in un costruttore si avrebbe un errore in
compilazione.

#exercise[
	```
	#include <iostream>

	dbuffer::dbuffer() : mSize(0), mBuffer(nullptr){

		#ifndef NDEBUG
		std::cout << "dbuffer()" << std::endl;
		#endif
	}
	```
]

I costruttori che hanno un solo parametro potrebbero essere intesi 
dal compilatore come una conversione di tipo. Per prevenire questa 
situazione è possibile dichiarare il costruttore con la keyword
`explicit`. Si noti come `explicit` non faccia parte della signature 
del metodo.

#exercise[
	```
	dbuffer::dbuffer(unsigned int size) {
		...
		this->size = size;
	}

	dbuffer d;
	d = 10;     // Allowed

	explicit dbuffer::dbuffer(unsigned int size) {
		...
		this->size = size;
	}

	dbuffer d;
	d = 10;     // NOT allowed
	```
]

I tipi di dato esposti dalla classe che non è certo se resteranno 
uguali nel tempo è bene che vengano mascherati da un `typedef`. 
Questo ha sia il vantaggio di nascondere i dettagli implementativi 
all'esterno, sia di poter mantenere uguale l'utilizzo della classe 
anche se il tipo del dato esposto dovesse cambiare (particolarmente
utile per chi usa la classe). Naturalmente, dato che questo `typedef`
è dentro alla classe, per accedere a quel tipo è necessario specificare
il nome della classe mediante l'operatore `::`.

#exercise[
	```
	class dbuffer {
		public:
		typedef unsigned int size_type;

		private:
		size_type size;
		int* buffer;
	}

	const int& dbuffer::operator[](dbuffer::size_type index) const {
	assert(index < mSize);

	return mBuffer[index];
	}
	```
]
