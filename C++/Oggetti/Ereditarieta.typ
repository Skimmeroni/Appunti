#import "../C++_definizioni.typ": *

L'*ereditarietá* permette di estendere una classe a partire dai metodi e
dagli attributi di un'altra classe. Un'alternativa é la *composizione*,
inserire in una classe dei sotto-oggetti di supporto per fare operazioni
specifiche.

Con la composizione, la classe mantiene una propria esistenza autonoma, nel
caso dell'ereditarietá la classe ha una "doppia" identitá: é sia una istanza
della sua classe, sia una istanza della classe da cui deriva.

Una classe viene ereditata mediante la keyword `public`:

```
class derived_class_name : public base_class_name
{
	/* ... */
}
```

Se una classe ne eredita un'altra, puó utilizzare tutti i metodi `public`
o `protected` della classe ereditata ed accedere a tutti gli attributi
`public` o `protected` della classe ereditata. Tutto ció che nella classe
ereditata é dichiarato `private` non puó essere usato dalla classe che
eredita.

Piú classi possono essere ereditate dalla stessa classe:

```
class derived_class_name : public base_class_name1, ..., public base_class_nameN, 
{
	/* ... */
}
```

Ereditare piú classi in una sola volta puó portare a dei conflitti, che 
C++ non é in grado di individuare in fase di compilazione, ed é pertanto
consigliato farlo con parsimonia.

Ereditando una classe mediante `public` é possibile usare i metodi `public`
e `protected` della classe ereditata anche al di fuori della classe che la
eredita. Una classe puó peró viene ereditata anche mediante la keyword
`private`:

```
class derived_class_name : private base_class_name
{
	/* ... */
}
```

Anche in questo caso, la classe che eredita puó usare tutti i metodi
non `private` della classe ereditata ed accedere a tutti gli attributi
non `private` della classe ereditata. La differenza é che tali metodi
e attributi non possono essere usati al di fuori della classe che eredita
attraverso di essa, anche se nella classe ereditata non erano `private`.

Se la classe che eredita ridefinisce o effettua overloading su un metodo
della classe ereditata, il metodo originale non é accessibile direttamente
a partire dalla classe che eredita, anche nel caso in cui la firma sia
diversa. Se si desidera usare il metodo originale, é necessario specificarlo
mediante `::`.

#exercise[
	```
	class BaseClass
	{
	public:
		void f() {/* ... */}
		void f(int a, int b) {/* ... */}
	};

	class SubClass : public BaseClass
	{
	public:
		void f(int) {/* ... */}
	};

	int main()
	{
		SubClass S;

		S.g(10);                // Allowed
		S.g();                  // NOT allowed, who is g()?
		S.g(1, 2);              // NOT allowed, who is g(int, int)?
		S.BaseClass::g(1, 2);   // Allowed
	}
	```
]

Nel costruire una classe derivata, viene seguita la stessa gerarchia
delle classi. Ovvero, prima viene costruita la parte di classe relativa
alla classe ereditata, poi vengono inizializzati i dati membro della
classe che eredita ed infine viene eseguito il costruttore della classe
che eredita.

Nello scrivere un costruttore per una classe derivata é necessario gestire
anche la costruzione della parte di classe ereditata. Se si vuole che tale
sezione venga costruita usando un costruttore specifico, é possibile farlo
richiamando il suddetto costruttore nella initialization list del costruttore
della classe che eredita. Se questo non viene fatto, viene automaticamente
richiamato il costruttore di default della classe ereditata.

Se una classe derivata non ha definito esplicitamente un costruttore
di default, il compilatore ne genera uno automatico che prima richiama
il costruttore di default della classe ereditata, poi vengono richiamati
i costruttori di default relativi ai dati membro della classe che eredita
ed infine viene generato un costruttore di default vuoto per la classe
che eredita.

#exercise[
	```
	class Member
	{
	public:
		Member() {/* ... */}
		Member(int x) {/* ... */}
	};

	class Base
	{
	public:
		Base() {/* ... */}
		Base(int x) {/* ... */}
	};

	class Derived : public Base
	{
	private:
		Member m;
	public:
		Derived(int x) {/* ... */}
		Derived(int a, int b) : Base(100), m(0) {/* ... */}
	};

	int main()
	{
		Derived d(1);      // 1.   Base::Base()
		                   // 2.   Member::Member()
		                   // 3.   Derived::Derived(int x)

		Derived d(1, 2);   // 1.   Base::Base(int x)
		                   // 2.   Member::Member(int x)
		                   // 3.   Derived::Derived(int a, int b)

		return 0;
	}
	```
]

I distruttori di una classe derivata vengono richiamati in ordine diverso
rispetto alla gerarchia delle classi. Ovvero, prima viene richiamato il
distruttore della classe che eredita, poi vengono richiamati i distruttori
relativi ai dati membro della classe che eredita ed infine viene richiamato
il distruttore della parte di classe relativa alla classe ereditata.

Se una classe derivata non ha definito esplicitamente un copy constructor,
il compilatore ne genera uno automatico che prima richiama il copy constructor
di default della classe ereditata, poi vengono richiamati i copy constructor
dei dati membro della classe che eredita ed infine viene generato un copy
constructor di default vuoto per la classe che eredita.

Nello scrivere esplicitamente un copy constructor per una classe derivata é
necessario gestire anche la copia della parte di classe ereditata. Per fare
questo, é necessario richiamare i relativi copy constructor nella initialization
list del copy constructor della classe che eredita. A tali costruttori viene
direttamente passato `other` (o un attributo di `other`), senza che questo
generi un errore: tale operazione prende il nome di *upcasting*.

#exercise[
	```
	class Member
	{
	public:
		Member() {/* ... */}
		Member(const Member& other) {/* ... */}
	};

	class Base
	{
	public:
		Base() {/* ... */}
		Base(const Base& other) {/* ... */}
	};

	class Derived : public Base
	{
	private:
		Member m;
	public:
		Derived(const Derived& other) : Base(other), m(other.m) {/* ... */}
	};

	int main()
	{
		Derived d1;       // 1.   Base::Base()
		                  // 2.   Member::Member()
		                  // 3.   Derived::Derived()

		Derived d2(d1);   // 1.   Base::Base(const Base& other)
		                  // 2.   Member::Member(const Member& other)
		                  // 3.   Derived::Derived(const Derived& other)

		return 0;
	}
	```
]

Se una classe derivata non ha ridefinito esplicitamente l'operatore
assegnamento, il compilatore lo ridefinisce sulla falsariga di come
viene generato un copy constructor automatico. Se lo si volesse
ridefinire esplicitamente, occorre copiare anche le sezioni di
classe della classe ereditata.

#exercise[
	```
	class Member
	{
	public:
		Member& operator=(const Member& other) {/* ... */}
	};

	class Base
	{
	public:
		Base& operator=(const Base& other) {/* ... */}
	};

	class Derived : public Base
	{
	private:
		Member m;
	public:
		Derived& operator=(const Derived& other)
		{
			if (this != &other) {
				Base::operator=(other);
				this->m = other.m;
			}

			return *this;
		}
	};
	```
]

L'upcasting permette di risalire una gerarchia di classi, usando una
classe derivata come fosse la classe base. É possibile avere piú classi
che derivano dalla stessa classe eppure avere funzioni che operano sulla
classe base passando oggetti della classe derivata.

#exercise[
	```
	class Vehicle {/* ... */};

	class Car : public Vehicle {/* ... */};
	class Motorbike : public Vehicle {/* ... */};

	void register(Vehicle& v) {/* ... */}

	int main()
	{
		Car c();
		Motorbike m();

		register(c);    // Allowed
		register(m);    // Allowed
	}
	```
]

L'upcasting questo puó essere fatto solamente tramite puntatori o
reference, non per valore. 

#grid(
	columns: (0.5fr, 0.5fr),
	[
	```
	DerivedClass d;
	BaseClass* b = &d;
	```
	],
	[
	```
	DerivedClass d;
	BaseClass& b = d;
	```
	]
)

Quando un oggetto viene upcastato alla classe ereditata i suoi attributi
ed i suoi metodi non presenti in questa esistono ancora, ma sono "oscurati".
Quando si cerca di fare un upcasting per valore ció che accede davvero é uno
*slicing*, ovvero dove gli attributi ed i metodi propri della classe che eredita
non sono oscurati, bensí sono eliminati del tutto.
