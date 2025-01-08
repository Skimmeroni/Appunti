#import "../C++_definizioni.typ": *

C++ é stato, nel corso del tempo, esteso con nuove funzionalitá.

In C++11, é stata aggiunta la possibilitá di dichiarare un tipo
`long long`, potendo quindi avere un intero a 64 bit.

É possibile utilizzare `nullptr` per riferirsi ad un puntatore che
non punta a nulla. Questo elimina l'ambiguitá fra il valore `0` ed
il valore `NULL`.

É possibile utilizzare delle classi `enum`, dove é possibile assegnare
ai membri dell'`enum` dei valori che non sono necessariamente numeri
interi.

É stata introdotta la keyword `auto`, che permette di dedurre il tipo
da assegnare ad una variabile in maniera (appunto) automatica, senza
doverlo specificare. Tale keyword puó essere utilizzata solamente in
inizializzazione: se si tenta di aggiungere `auto` ad una variabile
che non viene inizializzata, viene restituito un messaggio d'errore.
É particolarmente utile nell'inizializzare iteratori, dato che il nome
del tipo di un iteratore tende ad essere molto lungo.

Si noti come la deduzione compiuta da `auto` potrebbe non essere
quella che ci si aspetta. Ad esempio, `auto x = 1` induce il compilatore
ad assegnare alla variabile `x` il tipo `int`, mentre si potrebbe avere
interesse ad assegnarvi `short` o `unsigned int`. Inoltre, abusare `auto`
tende a rendere il codice di difficile lettura, perché i tipi dei dati
non sono riportati esplicitamente.

#exercise[
	```
	auto v = 10;   // v is an integer
	auto x;        // NOT allowed

	std::map<std::string, fs::file_time_type> M;
	auto start = M.begin();
	// Same as std::map<std::string, fs::file_time_type>::iterator start = M.begin();
	```
]

La keyword `decltype` permette di dichiarare una variabile usando il tipo di
dato (quale che sia) di un'altra variabile. É particolarmente utile quando si
ha a che fare con variabili dichiarate `auto`, per poter mantenere la coerenza
di tipo fra variabili diverse.

#exercise[
	```
	double a = 1.0;
	decltype(a) b;       // Same as double a

	auto c = 2;
	decltype(c) d = 0;   // Same as int d = 0
	```
]

La keyword `using`, oltre all'introdurre dei namespace nello scope globale,
in C++11 puó essere usata anche come sostituto di `typedef`. A differenza di
questo é peró piú flessibile, perché permette di poter assegnare dei nomi di
comodo anche a tipi templati.

#grid(
	columns: (0.5fr, 0.5fr),
	[
	```
	using name = datatype;
	```
	],
	[
	```
	template<typename T> using name = datatype<T>;
	```
	]
)

#exercise[
	```
	typedef myclass<data_type, functor> mytype;
	using mytype1 = myclass<data_type, functor>;

	template<typename F> using mytype2 = myclass<int, f>;
	mytype2<double> var;
	```
]

Il C++ eredita da C `assert`, che valuta a runtime se una certa condizione
é verificata o no (in genere una pre/post condizione) e fa terminare il
programma nel caso non sia verificata. C++11 introduce un nuovo tipo di
asserzione, `static_assert`, che valuta invece a compile time se una
certa condizione conoscibile a compile time é verificata o no ed impedisce
la compilazione nel caso in cui non sia verificata.

```
static_assert(condition, error_message);
```

#exercise[
	```
	static_assert(sizeof(int) == 8, "La dimensione del tipo int é insufficiente");
	```
]

In C++ é possibile simulare un approccio alla programmazione di tipo funzionale,
in particolare alle funzioni anonime, utilizzando i funtori. C++11 introduce
il supporto nativo alle funzioni anonime, senza bisogno dei funtori.

```
[capture_clause] (arg1, ..., argN) -> return_type {/* ... */}
```

La *capture clause* indica quali sono le variabili dello scope esterno alla
funzione anonima che saranno visibili/usabili nello scope della funzione.

#exercise[
	```
	#include <algorithm>
	#include <array>

	int main()
	{
	std::array<double, 5> a = {1.0, 2.0, 3.0, 4.0, 5.0};
	double constant = 3;
	std::transform(a.begin(), a.end(), a, [=](double d) -> double {return d * costant;});
	}
	```
]

Un iteratore costante (`const_iterator`) ad una struttura dati della
libreria standard (`vector`, `array`, ecc...) viene richiesto a partire
da un iteratore non costante (`iterator`) che viene poi internamente
convertito ad iteratore costante. C++11 introduce la possibilitá di
chiamare direttamente un iteratore costante per le strutture dati
della libreria standard mediante `cbegin()` e `cend()`.

C++11 permette di inizializzare una classe container, anche custom,
con la stessa sintassi dell'inizializzazione degli array (`{element1,
..., elementN}`). Questo puó venire fatto importando `initializer_list`
e dotando la classe di un costruttore speciale che svolga tale ruolo.
Le classi container della libreria standard sono tutte dotate di tale
costruttore.

```
#include <initializer_list>

class className
{
	/* ... */

	className(const initializer_list<datatype>& l)
	{
		// l.begin(), l.end(), ...
	}
}
```

C++11 introduce la possibilitá di iterare lungo una sequenza con dei cicli
`for` piú compatti.

#exercise[
	```
	std::vector<int> vi = {1, 2, 3, 4, 5, 6};

	// for (auto i = vi.begin(); e = vi.end(); i != e; ++i) {/* ... */}
	for (auto i : vi) {    // Body does not edit i (value passing)
		/* ... */
	}

	// for (auto& i = vi.begin(); e = vi.end(); i != e; ++i) {/* ... */}
	for (auto& i : vi) {   // Body edits i (reference passing)
		/* ... */
	}
	```
]

C++11 introduce i cosiddetti *costruttori delega*, che permettono di
richiamare un costruttore all'interno dell'initialization list di un
altro costruttore.

I metodi fondamentali di una classe C++ (costruttore di default,
distruttore, costruttore di copia, assegnamento) devono venire
definiti da chi scrive la classe oppure, se non specificati, vengono
automaticamente generati dal compilatore. C++11 introduce le keyword
`default` e `delete`, che manipolano tale comportamento.

Se un metodo fondamentale é posto uguale a `default`, si sta esplicitamente
chiedendo al compilatore di generare la versione di default a questo relativa.
La keyword `delete` specifica al compilatore che non si vuole implementare
tale metodo e che il compilatore non deve fornirne una sua versione di
default (naturalmente, provando ad usare tale metodo, si incorre in un
messaggio d'errore).

#exercise[
	```
	class myClass
	{
	public:
		myClass() = default;                      // Always use compiler-generated
		myClass(const myClass& other) = delete;   // Does not exist; do not generate
		/* ... */
	};

	int main()
	{
		myClass c1;
		myClass c2(c1);   // NOT allowed

		return 0;
	}
	```
]

C++11 introduce una nuova keyword applicabile ai metodi di classe `virtual`,
`final`. `final` é da porsi alla fine della firma di un metodo `virtual`
per specificare che su tale metodo non é possibile effettuare override da
parte di una classe derivata. É utile per imporre che un metodo di una
classe astratta venga mantenuto in tutte le implementazioni.

C++11 introduce una nuova keyword applicabile ai metodi di classe `virtual`,
`override`. `override` é da porsi alla fine della reimplementazione della
firma di un metodo `virtual` per specificare che tale metodo proviene da
una classe base e sulla quale é stato effettuato un override.

Oltre al copy constructor ed all'operatore assegnamento, C++11 introduce la
possibilitá di avere dei *move copy constructor* e dei *move assignment*.
Tali metodi sono concettualmente simili alle loro controparti, con la
differenza che non viene fatta una copia, bensí il contenuto di un oggetto
viene spostato in un altro, lasciando l'oggetto originale come vuoto o come
non valido.

#grid(
	columns: (0.5fr, 0.5fr),
	[
	```
	class_name(class_name&& other) {/* ... */}
	```
	],
	[
	```
	class_name& operator=(clas_name&& other) {/* ... */}
	```
	]
)

C++14 introduce anche la possibilitá di utilizzare direttamente i numeri
binari. Questi hanno come prefisso `0b` oppure `0B` e sono costituiti da
solo 0 e 1. Internamente, sono considerati di tipo `int`. É poi possibile
avere delle lambda expression polimorfe utilizzando la keyword `auto`.
Infine, é possibile introdurre il warning `deprecated` per segnalare che
un metodo o una classe non dovrebbero venire utilizzati.
