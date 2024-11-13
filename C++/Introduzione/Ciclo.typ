#import "@preview/showybox:2.0.1": showybox

Inizializzare una variabile significa assegnarle un valore per la prima volta.
Se una variabile non viene inizializzata, potrebbe o potrebbe non venirle
essere assegnato un valore di default. Le variabili globali, le variabili
membro di un certo namespace oppure le variabili locali dichiarate `static`
vengono implicitamente inizializzate con un valore "neutro" che dipende dal
tipo di variabile ($0$ per `int`, $0.0$ per `double`, ecc...). Le variabili
locali non dichiarate `static` e le variabili allocate dinamicamente non
vengono inizializzate di default, ed occorre farlo esplicitamente. I membri
degli array e delle strutture possono venire inizializzati oppure no a seconda
che l'array o la struttura a cui appartengono é o non é `static`. Una
istanziazione di una classe potrebbe (ed é bene che ce l'abbia) avere un
costruttore che assegna valori di default agli attributi della classe.

In C++ esistono diversi modi per allocare le variabili. Diversi
modi implicano diversa visibilitá, ovvero sono accessibili in
un qualche modo in un punto piuttosto che un altro del programma.
I modi sono quattro:

- Allocazione *globale*;
- Allocazione *automatica*;
- Allocazione *statica*;
- Allocazione *dinamica*;

Una variabile é globale se non appartiene a nessuna funzione o classe.
Tale variabile é accessibile da qualsiasi punto dell'unitá di compilazione
corrente, e da qualsiasi altra unitá di compilazione che importa il (un)
file in cui é dichiarata. Le variabili globali esistono all'interno della
memoria fintanto che il programma é in esecuzione.

Le variabili dichiarate globalmente appartengono ad un proprio namespace,
detto *namespace globale*. É possibile specificare che ci si sta riferendo
a delle entitá che appartengono al namespace globale mediante `::` senza
riportare alcun nome. In genere, questo non é necessario, perché tutto ció
che non ha un namespace associato (se esiste) viene cercato o nel namespace
globale o nello scope in cui ci si trova. L'unica situazione in cui `::`
permette effetivamente di disambiguare si ha quando ci si vuole riferire
ad una entitá del namespace globale che una un conflitto di nomi con una
entitá del namespace o dello scope in uso. É comunque considerata bad
practice riusare gli stessi nomi e tipi per variabili globali e locali,
a meno di avere un motivo ragionevole per farlo.

#showybox[
	```
	int x;

	namespace XXX
	{
		int x;
	}

	int main()
	{
		int x = 1;       // Allowed
		::x = 5;         // Global x, not local x
		XXX::x = 10;     // x from XXX, not local x

		std::cout << x << ::x << XXX::x << std::endl;    // Prints 1510
		return 0;
	}
	```
]

Definire una variabile globale che deve essere accessibile
da ogni singola unitá di compilazione del codice é una delle
poche situazioni in cui puó avere senso avere un file `main.h`.

Una variabile é automatica se viene allocata e deallocata automaticamente
nello/dallo stack. Sono le variabili comunemente intese, che si trovano
all'interno di una funzione e che esistono solamente fintanto che tale
funzione é in esecuzione. Sono accessibili solamente dal blocco in cui
sono state definite. Naturalmente, le variabili automatiche dichiarate
all'interno di `main()` esistono fino alla fine dell'esecuzione del programma.

#showybox[
	```
	void f(int param)      // Will exist as long as f exists
	{
		int i;             // Will exist as long as f exists

		if (i) {
			int k;         // Will exist as long as the if block exists
			...
		}

		...
	}

	int main()
	{
		int j;             // Will exist as long as main exists
		                   // (Until the program stops)
	}
	```
]

Una variabile é statica se é dichiarata con il modificatore `static`.
Sebbene la loro visibilitá sia ristretta a quella del blocco in cui
sono state definite, esisteranno comunque in memoria fino alla fine
del programma. Combinano il lifespan di una variabile globale con
la visibilitá di una variabile dinamica.

Una variabile é dinamica se ne viene richiesto esplicitamente il
quantitativo di memoria da allocare e la loro deallocazione. Tali
dati non si trovano, come le variabili precedenti, sullo stack,
ma bensí sullo heap, pertanto é necessario gestirne l'esistenza
in maniera oculata (si rischia di saturare la memoria con dati
inutili). I dati dinamici, sebbene possano essere di qualsiasi
tipo, sono particolarmente utili per quando é necessario allocare
molta memoria, dato che la dimensione dello stack é in genere molto
contenuta.

Un dato dinamico viene creato mediante la keyword `new` e distrutto
mediante la keyword `delete`.

#grid(
	columns: (0.5fr, 0.5fr),
	[
	```
	Object* name = new Object;
	```
	],
	[
	```
	delete name;
	```
	]
)

`new` restituisce un puntatore all'oggetto dinamico cosí creato, e tale
puntatore é l'unico modo per poter accedere a tale oggetto (il puntatore
potrebbe comunque essere memorizzato sullo stack). Questo significa che
se tale puntatore, per qualche motivo, perde il riferimento a tale oggetto,
questo rimane nello heap senza piú possibilitá di accedervi, e finché il
programma non termina l'area di memoria che questo occupa non puó essere
sovrascritta, generando un *orfano*. Infatti, a differenza di altri linguaggi
di programmazione, in C++ non esiste un *garbage collector* #footnote[É peró
possibile estendere C++ aggiungendo un garbage collector esterno, come Boehm
GC.].

#showybox[
	```
	struct Obj {
		double d;
		int arr[1024];
	};

	Obj* o = new Obj;     // o is a pointer to a value in heap

	o->d = 10.23;

	o = new Obj;          // Allowed, but now old values are lost in heap

	new Obj;              // Allowed, but memory is allocated for nothing
	```
]

`delete` contrassegna il contenuto dinamico associato al puntatore come
scrivibile da parte del sistema operativo. Naturalmente, se si cerca di
chiamare `delete` su un puntatore su cui é giá stato chiamato si puó avere
un comportamento indefinito, perché i vecchi valori _potrebbero_ essere giá
stati sovrascritti da altri dati. Pertanto, una best practice é, dopo aver
chiamato `delete` riassegnare il puntatore a `nullptr`, perché chiamando
`delete` su un puntatore nullo non succede nulla. Cercando di chiamare
`delete` su un puntatore che non si riferisce a dei dati dinamici viene
restituito un errore a runtime.

#showybox[
	```
	struct Obj {
		double d;
		int arr[1024];
	};

	Obj* o = new Obj;

	delete o;           // Values in heap related to o are flagged as removable

	delete o;           // Allowed, but VERY dangerous
	```
]

Gli array sono spesso allocati dinamicamicamente, perché in genere il loro
contenuto richiede molto spazio. Occorre peró prestare attenzione al fatto
che la deallocazione del contenuto dinamico va fatta con `delete[]`, che
libera ricorsivamente tutto il contenuto che si trova all'interno, altrimenti
solamente il contenuto che si trova in prima posizione viene liberato.
É anche possibile allocare dinamicamente array multidimensionali usando
puntatori a puntatori, anche se a tale livello di complessitá diventa molto
piú ragionevole utilizzare una classe.

#showybox[
	```
	int size1 = 5, size2 = 3;

	int** array = new int*[size1];

	for (int i = 0, i < size1, i++)
	    array[i] = new int[size2];

	array[3][2] = 7;

	for (int i = 0, i < size1, i++)
	    delete[] array[i];

	delete[] array;
	```
]

