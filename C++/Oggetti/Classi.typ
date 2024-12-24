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

É considerata best practice dare nomi significativi alle variabili di
stato della classe, per distinguerle dalle normali variabili locali.

Di default, tutto ció che si trova all'interno di una classe é privato, 
e quindi accessibile dall'esterno solamente tramite dei metodi forniti 
dalla classe. Una sezione della classe puó essere resa pubblica con la 
keyword `public` seguita dai due punti; tutto ció che si trova al di 
sotto di tale keyword sará pubblico. Nulla vieta di specificare una
sezione come `private` esplicitamente. Le keyword `public` e `private`
possono essere ripetute anche più di una volta all'interno della stessa
classe, ma per leggibilità è preferibile avere soltanto una parte 
pubblica ed una privata.

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

Quale sia il costruttore corretto da richiamare viene dedotto dal
compilatore sulla base del numero e del tipo di ciascun dato passato.
L'operatore `.` permette di accedere ai singoli attributi e metodi
della classe.

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

In un buon codice C++ ci si aspetta che esistano almeno quattro metodi
per ciascuna classe:

- Il *costruttore di default*;
- Il *distruttore*;
- Il *copy constructor*;
- L'*operatore assegnamento*.

Il costruttore di default é un costruttore che non prende alcun 
parametro ed inizializza ogni attributo della classe con valori 
standard (`NULL`, `nullptr`, $0$, ecc...).

```
	class_name::class_name() {
	a1_name = [0 / NULL / nullptr];
	...;
	aN_name = [0 / NULL / nullptr];
	}
```

Il costruttore di default é fondamentale per due motivi. Innanzitutto,
se non é presente, il compilatore ne crea uno di default, ma vuoto, 
ovvero dove nessun attributo viene istanziato, e questo comporta uno 
stato della memoria incoerente. Inoltre, se si volesse istanziare un 
array di oggetti, il costruttore di default viene chiamato in automatico 
per ciascun oggetto, e tale costruttore é l'unico che é possibile 
chiamare per un array di oggetti #footnote[Questo non é piú vero 
negli standard piú recenti.].

#exercise[
	```
	#include <iostream>

	dbuffer::dbuffer() {
		mSize = 0;
		mBuffer = nullptr;

		#ifndef NDEBUG
		std::cout << "dbuffer()" << std::endl;
		#endif
	}
	```
]

Il distruttore ha la stessa sintassi del costruttore, ma é preceduto 
dal carattere `~` ed ha `void` come argomento. Nel suo corpo, sono 
riportate le istruzioni per azzerare o eliminare dalla memoria tutti 
gli attributi dell'istanza della classe:

```
	class_name::~class_name(void) {
	static1_name = 0;
	...;
	staticN_name = 0;

	delete[] dynamic1_name;
	dynamic1_name = nullptr;
	...;
	delete[] dynamicN_name;
	dynamicN_name = nullptr;
	}
```

Quando termina lo scope in cui un oggetto esiste, il distruttore 
viene richiamato automaticamente, liberando tutta la memoria a 
questo associata senza doverlo fare manualmente.

#exercise[
	```
	dbuffer::~dbuffer(void) {
		if (mBuffer != nullptr) {
			delete[] mBuffer;
		}

		mBuffer = nullptr;
		mSize = 0;

		#ifndef NDEBUG
		std::cout << "~dbuffer(void)" << std::endl;
		#endif
	}
	```
]

L'operato del costruttore e del distruttore cosí definiti sono 
parte di un pattern di programmazione ad oggetti chiamato *RAII* 
(*Resource Acquisition Is Initialization*). Questo pattern specifica 
che l'allocazione (acquisizione) delle risorse deve avvenire durante 
la creazione dell'oggetto (nello specifico, durante l'inizializzazione) 
da parte del costruttore, mentre la deallocazione delle risorse deve 
avvenire durante la distruzione dell'oggetto da parte del distruttore. 
In altre parole, affinché l'inizializzazione possa avere successo,
l'acquisizione delle risorse deve avere successo. In questo modo, la 
risorsa é garantito che sia in possesso dell'oggetto solamente fintanto 
che l'oggetto esiste: se l'oggetto non ha dei leak, allora nemmeno la 
risorsa puó averne.

Il copy constructor permette di istanziare una classe "clonando" una 
istanza giá esistente della stessa classe. Il copy constructor funziona 
anche se i dati della classe sono privati, perché il costruttore ha 
comunque accesso ai dati di una classe per la quale é costruttore.

```
class_name::class_name(const class_name &other) {
	a1_name = other.a1_name;
	...
	aN_name = other.aN_name;
}
```

#exercise[
	```
	dbuffer::dbuffer(const dbuffer &other) {
		mSize = 0;
		mBuffer = nullptr;

		mBuffer = new int[other.mSize]
		for (unsigned int i = 0; i < other.mSize; i++) {
			mBuffer[i] = other.mBuffer[i];
		}

		mSize = other.mSize;

		#ifndef NDEBUG
		std::cout << "~dbuffer(const dbuffer&)" << std::endl;
		#endif
	}
	```
]

Il copy constructor ha anche una seconda utilitá. Se viene definita 
una funzione che fra i suoi argomenti ha una istanza di una classe 
passata per valore, é necessario che nello spazio di memoria della 
funzione venga creata una copia di tale istanza. Quando la funzione 
viene chiamata, questa chiama implicitamente il copy constructor per 
effettuare tale copia. Inoltre, se una classe viene istanziata come 
si inizializza una variabile, viene invocato in automatico il copy 
constructor (non puó pertanto considerare una inizializzazione).

#exercise[
	```
	void f(dbuffer dbx) { ... };

	dbuffer db2 = db1;     // Same as dbuffer db2(db1)
	f(db2);                // Calls dbuffer dbx(db2)
	```
]

Come per il costruttore di default, se non viene definito il copy
constructor il compilatore ne crea uno in automatico. Il problema
é che il copy constructor autogenerato opera tale copia "membro a
membro", sia che i dati siano valoriali sia che siano puntatori, e
non c'é garanzia che tale modo di copiare rifletta la logica della
classe. In particolare, una copia di puntatori rende i due oggetti
interdipendenti, dato che condividono uno stesso dato con i rispettivi
puntatori, ed in genere questo non é un effetto voluto.

L'operatore assegnamento sostituisce il contenuto dell'istanza della
classe su cui viene chiamato con quello dell'istanza della classe
passata come argomento.

```
class_name& operator=(const class_name &other) {
	if (this != &other) {
	/* temporary copy */

	/* cleanup */

	/* substitution */
	}

	return *this;
	}
```

Il controllo `if (this != &other)` é una sezione standard 
dell'operatore di assegnamento. Questo controlla se l'indirizzo 
del puntatore corrisponde a quello dell'istanza passata come 
argomento. Tale controllo é necessario perché se i due indirizzi 
sono effettivamente uguali, allora si sta cercando di assegnare 
un oggetto a sé stesso, che é una operazione "a vuoto", e quindi
non c'é alcun bisogno di eseguirla (sarebbe uno spreco di risorse). 
Anche la chiusura `return *this` é standard, e di fatto ritorna 
l'oggetto stesso per reference. Sebbene possa sembrare astruso, 
tale `return` é utile per poter avere assegnamenti a catena.

Anziché copiare direttamente i campi dell'istanza `other` con quelli
dell'istanza `this`, si preferisce costruire un oggetto temporaneo 
e poi, se tale costruzione ha avuto successo, sostituire i campi di 
questo oggetto temporaneo con l'istanza `this`. Questo perché prima 
di effettuare la copia da `other` a `this` é necessario svuotare 
`this` (essendo una istanza giá esistente, potrebbe non essere 
vuota), e se la copia dovesse fallire l'oggetto `this` si ritroverebbe 
svuotato. In questo modo, in caso di fallimento, l'oggetto `this` 
rimane nello stato precedente alla tentata copia. É infatti (quasi) 
garantito che una sostituzione non possa fallire, mentre non vi é 
garanzia sull'allocazione di memoria.

#exercise[
	```
	dbuffer& dbuffer::operator=(const dbuffer &other) {
		if (this != &other) {
			// temporary copy
			unsigned int tmpsize = other.mSize;
			int* tmpbuffer = new int[other.mSize];
			for (unsigned int i = 0; i < tmpsize; i++) {
				tmpbuffer[i] = other.mBuffer[i];
			}

			delete mBuffer;
			mBuffer = nullptr;
			mSize = 0;

			mBuffer = tmpbuffer;
			mSize = tmpsize;
		}

		return *this;
	}
	```
]

L'operatore di assegnamento puó essere scritto in maniera 
sostanzialmente automatica impiegando il copy constructor 
e la funzionalitá `std::swap` offerta dalla libreria standard, 
presente nell'header file `algorithm`. Questo é l'unico caso 
in cui in C++ é considerata best practice usare un costruttore 
all'interno di un altro costruttore.

```
#include <algorithm>

class_name& class_name::operator=(const class_name &other) {
	if (this != &other) {
		class_name tmp(other);
		std::swap(this->attribute1, tmp.attribute1);
		std::swap(this->attribute2, tmp.attribute2);
		...
		std::swap(this->attributeN, tmp.attributeN);

		// tmp is removed automatically when out of scope
	}

	return *this;
}
```

#exercise[
	```
	#include <algorithm>

	dbuffer& dbuffer::operator=(const dbuffer &other) {
		if (this != &other) {
			dbuffer tmp(other);
			std::swap(this->mSize, tmp.mSize);
			std::swap(this->mBuffer, tmp.mBuffer);
		}

		return *this;
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

Nel caso in cui la classe sia una _classe container_ (se deve 
rappresentare un oggetto composito), per accedere ai suoi dati
in maniera ancora migliore è possibile ridefinire l'operatore 
`[]`, di modo che l'accesso ricordi quello di un array.

#exercise[
```
// Even better
int& dbuffer::operator[](unsigned int index) {
	assert(index < mSize);

	return mBuffer[index];
}

const int& dbuffer::operator[](unsigned int index) const {
	assert(index < mSize);

	return mBuffer[index];
}

dbuffer a, b;
a[i] = b[j];   // a.setValue(i, b.getValue(j))
```
]

Utile puó anche essere un metodo di serializzazione, che semplicemente 
stampi il valore dei campi della classe.

#exercise[
	```
	void dbuffer::print() {
		std::cout << mSize << std::endl;
		for (unsigned int i = 0; i < mSize; i++) {
			std::cout << mBuffer[i] << " ";
		}
		std::cout << std::endl;
	}

	dbuffer a;
	a.print();
	```
]

Questo può essere fatto in maniera più elegante ridefinendo 
l'operatore `<<`. Il vantaggio è che in questo modo l'oggetto 
non viene solamente restituito, se necessario, su standard output, 
ma può essere scritto su qualsiasi cosa che sia uno stream (un file, 
una socket, ecc...).

```
std::ostream &operator<<(std::ostream &os, const class_name &thing)
{
	...
	return os;
}
```

Dato che tale operatore ha un significato globale, sia la 
definizione che la dichiarazione di tale ridefinizione deve 
venire fatta globalmente.

#exercise[
	```
	// Even better
	std::ostream &operator<<(std::ostream &os, const dbuffer &db)
	{
		os << db.getSize() << std::endl;
		for (unsigned int i = 0; i < db.getSize(); i++) {
			os << db[i] << " ";
		}
		os << std::endl;

		return os;
	}

	dbuffer a;
	std::cout << a << std::endl;
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

La funzione `std::swap` opera in questo modo: se l'argomento 
passato è di un tipo primitivo, lo scambio viene effettuato 
normalmente scambiando gli indirizzi di memoria, mentre se è 
una classe utilizza (se esiste) il metodo `swap` interno alla
classe. Può essere quindi utile, soprattutto se la classe è una
classe container, aggiungervi un metodo `swap`.

#exercise[
	```
	#include <algorithm>

	void dbuffer::swap (dbuffer &other) {
		std::swap(this->size, other.size);
		std::swap(this->buffer, other.buffer);
	}
	```
]

Ridefinire il metodo `swap` può essere utile anche per semplificare la 
ridefinizione dell'operatore di assegnamento.

#exercise[
	```
	#include <algorithm>

	dbuffer& dbuffer::operator=(const dbuffer &other) {
		if (this != &other) {
			dbuffer tmp(other);
			tmp.swap(*this);
		}

		return *this;
	}
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
