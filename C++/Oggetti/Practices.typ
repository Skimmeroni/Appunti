#import "../C++_definizioni.typ": *

In un buon codice C++ ci si aspetta che esistano almeno quattro metodi
per ciascuna classe:

- Il *costruttore di default*;
- Il *distruttore*;
- Il *copy constructor*;
- L'*operatore assegnamento*.

Il costruttore di default é un costruttore che non prende alcun
parametro ed inizializza ogni attributo della classe con dei
valori di default (in genere `NULL`, `nullptr`, $0$, ecc...).

```
	class_name::class_name() {
	a1_name = [0 / NULL / nullptr];
	...;
	aN_name = [0 / NULL / nullptr];
	}
```

Vi sono situazioni dove quali siano i valori di default da utilizzare
in un costruttore non é scontato, oppure potrebbero cambiare nel tempo.
In tal caso, una possibile soluzione consiste nel dichiarare una o piú
variabili `static` all'interno della classe che riportano tali valori.
Una variabile dichiarata `static` all'interno di una classe funziona
come una costante; tutti le istanze della classe possono riferirvisi
e ne esiste esattamente una sola copia, comune a tutte le istanze.

Il costruttore di default é fondamentale perché se non é presente
il compilatore é costretto a crearne uno di default al meglio delle
sue capacitá. Il problema é che tale costruttore autogenerato richiama
il costruttore di default (se esiste) per ogni attributo della classe
che non sia un dato primitivo. Pertanto, se la classe contiene degli
attributi di dato primitivo e non ha un costruttore di default definito
esplicitamente, questi dati non sono istanziati, e questo comporta uno
stato della memoria incoerente.

Un secondo motivo dell'importanza del costruttore di default sta
nel fatto che, se si volesse istanziare un array di oggetti, tale
costruttore viene chiamato in automatico per ciascun oggetto, ed
é l'unico che é possibile chiamare per un array di oggetti
#footnote[Questo non é piú vero negli standard C++ piú recenti.].

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
