#import "../C++_definizioni.typ": *

C++ supporta la ridefinizione di quasi tutti gli operatori, cambiandone il
significato per usa sola classe oppure globalmente. Ridefinire un operatore
permette di modificarne la semantica per meglio adattarla ad una specifica
situazione #footnote[Tecnicamente, quello che si ottiene ridefinendo un
operatore potrebbe anche essere ottenuto introducendo una funzione o un
metodo speciale con la medesima semantica, ma la ridefinizione è in genere
più comodo e più intellegibile].

Per poter ridefinire un operatore é necessario riferirvisi tramite il
suo nome. Il nome di un operatore é dato dalla parola chiave `operator`
seguita dal simbolo dell'operatore. Questo perché un operatore é di fatto
una funzione, e puó pertanto essere invocata come tale: semplicemente,
l'uso del solo simbolo agisce come una abbreviazione.

Un operatore può essere ridefinito sia globalmente, e che quindi avrá lo
stesso significato a prescindere dall'argomento, che come membro di una
classe, e che quindi avrá quel significato solamente se come argomento
vi é un oggetto di tale classe. L'unico aspetto di un operatore che non
é possibile modificare (oltre al suo simbolo) é il numero di argomenti; ad
esempio, se un operatore é binario, non lo si puó ridefinire come unario.
Inoltre, non è possibile "inventare" operatori da zero, ma solo ridefinire
quelli forniti dalla grammatica del linguaggio.

#exercise[
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

Gli unici operatori che non possono essere in alcun modo ridefiniti sono
`.` e `::` #footnote[Questo perché hanno un nome come argomento, anziché
un valore, e permettere una loro ridefinizione introdurrebbe un notevole
livello di complessitá nella grammatica del linguaggio]. Inoltre, gli
operatori `[]`, `=`, `->` e `()` possono essere ridefiniti ma solamente
rispetto ad una classe, non globalmente.

Un operatore binario puó essere ridefinito come un metodo (di classe) non
statico avente un argomento oppure come una funzione (globale) avente due
argomenti. Per un qualsiasi operatore binario `@`, la scrittura `aa@bb` puó
essere interpretata nel primo senso come `aa.operator(@)(bb)` oppure nel
secondo senso come `operator@(aa, bb)`. Nel primo caso, la presenza di un
argomento solo é dovuta al fatto che `operator@` viene chiamato come metodo
dell'oggetto `aa`, ed infatti `aa` é sottinteso con `this`.

#exercise[
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

Un operatore unario puó essere ridefinito come un metodo (di classe) non
statico avente un argomento oppure come una funzione (globale) avente un
argomento. Gli operatori unari esistono sia in forma prefissa che postfissa,
pertanto ridefinire l'operatore in uno dei due modi non sottintende la
ridefinizione nell'altro modo.

Per un qualsiasi operatore unario prefisso `@`, la scrittura `@aa` puó
essere interpretata nel primo senso come `aa.operator(@)` oppure nel secondo
senso come `operator@(aa)`. Nel primo caso, l'assenza di argomenti solo é
dovuta al fatto che `operator@` viene chiamato come metodo dell'oggetto `aa`,
ed infatti `aa` é sottinteso con `this`. Per un qualsiasi operatore unario
postfisso `@`, la scrittura `aa@` puó essere interpretata nel primo senso
come `aa.operator(@)(int)` oppure nel secondo senso come `operator@(aa, int)`.

#exercise[
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

Essendo gli operatori di fatto delle funzioni, La ridefinizione degli
operatori supporta l'overloading, pertanto è possibile ridefinire uno
stesso operatore per più volte (a patto che la signature sia diversa).
Il compilatore sceglierà in automatico di volta in volta quale "versione"
dell'operatore usare in base al contesto.

#exercise[
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

Ridefinire un operatore potrebbe non preservare le proprietá che aveva
in origine. Ad esempio, un operatore binario `@` commutativo, se viene
ridefinito per la classe di `aa` ma non per la classe di `bb`, rende
`aa@bb` potenzialmente corretto ma `bb@aa` errata. Inoltre, ridefinire
l'operatore `@` non ridefinisce in automatico `@=`, occorre farlo
manualmente (se si desidera).

#exercise[
	```
	class complex {
	private:
		double real_part;
		double imaginary_part;

	public:
		complex operator+(complex a, complex b) {    // Complex plus complex
			complex r = a;
			r.real_part += b.real_part;
			r.imaginary_part += b.imaginary_part;
			return r;
		}

		complex& operator+=(complex a) {             // Immediate version
			this->real_part += a.real_part;
			this->imaginary_part += a.imaginary_part;
			return *this;
		}

		complex operator+(complex a, double b) {     // Complex plus real
			complex r = a;
			r.real_part += b;
			return r;
		}

		complex& operator+=(double a) {              // Immediate version
			this->real_part += a;
			return *this;
		}

		complex operator+(double a, complex b) {     // Real plus complex
			complex r = b;
			r.real_part += a;
			return r;
		}
	}
	```
]

Se si necessita di ridefinire un operatore di un'altra classe rispetto alla
classe in esame, è strettamente necessario ridefinirlo globalmente, dato che
l'alternativa sarebbe modificare la classe originale.

Usare un costruttore per effettuare le conversioni di tipo presenta due
principali problemi. Il primo é che non é possibile convertire un oggetto
di classe in un tipo primitivo (non essendo classi) ed il secondo é che
non é possibile convertire un oggetto di una nuova classe in un oggetto di
una classe definita in precedenza.

Questi problemi possono essere aggirati ridefinendo l'operatore di casting.
Data una classe `X`, l'operatore `X::operatorT()` specifica come convertire
un oggetto di classe `X` nel tipo (o nella classe) `T`. Nonostante non
abbiano un valore di ritorno nella firma, tali ridefinizioni devono
restituire comunque un valore. A prescindere da quale semantica venga
fornita alla nuova versione dell'operatore, la sua precedenza rimane
quella originale.

#exercise[
	```
	dbuffer::operator int() const {
		return this->size;
	}

	dbuffer x(19);
	int i = static_cast<int>(x);   // Allowed, i = 19
	```
]

Una funzione globale potrebbe necessitare di accedere ai dati di una
funzione, anche se questi sono privati. Ad esempio, l'operatore `<<`
potrebbe necessitare di accedere ai dati privati di una classe per
poter scrivere su file attributi che questa non espone, di modo da
poterla poi ricostruire in lettura.

Una soluzione é dichiarare una funzione con il modificatore `friend`,
che permette al metodo cosí dichiarato di poter accedere agli attributi,
anche se dichiarati privati, della classe in cui si trova la dichiarazione.
É anche possibile dichiarare una intera classe come `friend`. In questo
caso, tutti i metodi della classe dichiarata `friend` ottengono
automaticamente questa proprietá.

#exercise[
	```
	friend std::ostream &operator<<(std::ostream &os, const dbuffer &db);
	```
]

Una classe dichiarata `friend` non introduce un nuovo nome nel namespace,
perché dichiarare una classe `friend` significa semplicemente dotare una
classe che si suppone giá esistere di una proprietá aggiuntiva. Pertanto,
una classe dichiarata `friend` lo diventa effettivamente se é giá stata
dichiarata oppure venire dichiarata dopo ma nel medesimo namespace.

#exercise[
	```
	class X {/* ... */};        // X is friend of Y

	namespace N {
		class Y {
			friend class X;
			friend class Y;
			friend class AE;
		};

		class Z {/* ... */};   // Z is friend of Y
	}

	class AE {/* ... */};      // AE is not friend of Y
	```
]

Lo stesso discorso vale per le funzioni dichiarate `friend`. Una funzione
dichiarata `friend` lo diventa effettivamente se é giá stata dichiarata,
se viene dichiarata dopo ma nel medesimo namespace oppure se ha un oggetto
della classe in cui é presente la dichiarazione `friend` come argomento.

#exercise[
	```
	void g() {/* ... */};          // g is friend of X

	class X {
		friend void f();
		friend void g();
		friend void h(const X&);   // Has X as argument so ok
	};

	void f() {/* ... */};          // f is not friend of X
	```
]

Aggiungere una funzione `friend` semplifica notevolmente il programma,
ma introduce anche un accoppiamento forte tra due classi. In casi in cui
l'accoppiamento fra due classi esiste comunque, un metodo `friend` é una
buona scelta, ma spesso é possibile ottenere quello che fa un metodo
`friend` usando dei metodi e delle conversioni di tipo.
