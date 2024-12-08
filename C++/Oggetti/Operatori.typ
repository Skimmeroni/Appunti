#import "@preview/showybox:2.0.1": showybox

C++ supporta la ridefinizione di quasi tutti gli operatori, di modo 
che, rispetto ad una classe, abbiano un significato diverso e più 
funzionale. Gli unici operatori che non possono essere ridefiniti 
sono `.` e `::`. La ridefinizione degli operatori è tecnicamente 
equivalente al definire un metodo speciale per una certa classe, 
ma la ridefinizione è in genere più comodo e più intellegibile.
Non è però possibile "inventare" operatori da zero: solo
ridefinire operatori che già esistono.

#showybox[
	```
	// Redefine + so that it sums two objects value-by-value

	dbuffer operator+(const dbuffer& lhs, const dbuffer& rhs)
	{
		assert(lhs.size() == rhs.size());

		dbuffer result(lhs.size());

		for (dbuffer::size_type i = 0; i < lhs.size(); i++)
			result[i] = lhs[i] + rhs[i];

		return result;
	}

	dbuffer a(10, 3);
	dbuffer b(10, 18);

	dbuffer c = a + b;   // Allowed
	```
]

Un operatore può essere ridefinito sia globalmente che come membro di
una classe. Nel secondo caso, come primo membro viene automaticamente 
considerato `this`. 

#showybox[
	```
	// Redefine + so that it sums two objects value-by-value
	// 'lhs' is just 'this' 

	dbuffer operator+(const dbuffer& rhs)
	{
		assert(this->size == rhs.size);

		dbuffer result(this->size);

		for (size_type i = 0; i < this->size; i++)
			result[i] = *this[i] + rhs[i];

		return result;
	}
	```
]

La ridefinizione degli operatori supporta l'overloading, pertanto è
possibile ridefinire uno stesso operatore per più volte (a patto che
la signature sia diversa). Il compilatore sceglierà in automatico di
volta in volta quale "versione" dell'operatore usare in base al 
contesto.

#showybox[
	```
	// First version: two objects
	dbuffer operator+(const dbuffer& lhs, const dbuffer& rhs)
	{
		...
	}

	// Second version: an object and an integer
	dbuffer operator+(const dbuffer& lhs, int rhs)
	{
		dbuffer result(lhs.size());

		for (dbuffer::size_type i = 0; i < lhs.size(); i++)
			result[i] = lhs[i] + rhs;

		return result;
	}

	dbuffer a(10, 3);
	dbuffer b(10, 18);

	dbuffer c = a + b;    // Uses the first version
	dbuffer d = a + 25;   // Uses the second version
	```
]

Ad eccezione di `[]` e `=`, che devono per forza essere ridefiniti 
come membri di classe, tutti gli altri operatori possono essere 
ridefiniti in entrambi i modi. In genere, una classe che richiede 
che degli operatori funzionino in un certo modo è bene che abbia gli
operatori ridefiniti come membri di classe. Invece, se si necessita
di ridefinire un operatore di un'altra classe rispetto alla classe in
esame, è strettamente necessario ridefinirlo globalmente, dato che 
l'alternativa sarebbe modificare la classe originale.

Possono essere ridefiniti sia operatori binari che operatori unari. Nel caso
particolare degli operatori unari `++` e `--`, diventa necessario distinguere
se si sta intendendo la versione prefissa o postfissa, dato che la signature
dei due operatori è la stessa (`operator++` e `operator--`, rispettivamente).
Per poterlo fare, è possibile modificare la firma della ridefinizione di una
delle due versioni introducendo un argomento extra, anche se inutilizzato.

#showybox[
	```
	// ++i
	dbuffer& operator++(dbuffer& rhs)
	{
		for (dbuffer::size_type i = 0; i < rhs.size(); i++)
			rhs[i] = rhs[i] + 1;

		return rhs;
	}

	// i++
	dbuffer operator++(dbuffer& lhs, int)   // to distinguish between the two
	{
		dbuffer tmp(lhs)

		for (dbuffer::size_type i = 0; i < lhs.size(); i++)
			lhs[i] = lhs[i] + 1;

		return tmp;
	}
	```
]

Un operatore speciale che è possibile ridefinire è l'operatore di cast,
che permette di convertire un oggetto di una classe in un oggetto di
un'altra classe o in un tipo primitivo, e/o viceversa. Nonostante non
abbiano un valore di ritorno nella firma, tali ridefinizioni devono
restituire comunque un valore. A prescindere da quale semantica venga
fornita alla nuova versione dell'operatore, la sua precedenza rimane
quella originale.

#showybox[
	```
	dbuffer::operator int() const {
		return this->size;
	}

	dbuffer x(19);
	int i = static_cast<int>(x);   // Allowed, i = 19
	```
]
