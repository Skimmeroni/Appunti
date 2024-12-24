#import "../C++_definizioni.typ": *

Definire una *funzione* significa specificare quali operazioni tale funzione
deve compiere. Una funzione non puó essere chiamata fintanto che non é stata
dichiarata. Una dichiarazione di funzione le fornisce un nome, un tipo di
valore di ritorno ed un numero di argomenti ciascuno con il loro tipo. Una
funzione che non ritorna nulla ha come tipo di ritorno `void`. Una definizione
di una funzione le fornisce il corpo.

La definizione di una funzione deve essere coerente con le precedenti (se
esistono) dichiarazioni. Inoltre, le dichiarazioni devono essere fra loro
concordi. Tutte le dichiarazioni e definizioni della stessa funzione devono
avere lo stesso tipo di valore di ritorno e lo stesso tipo degli argomenti;
i nomi degli argomenti possono anche essere diversi, ma per rendere il codice
piú chiaro é preferibile che siano uguali.

#exercise[
	```
	void f(int a, double b);
	void f(int p, double q);     // Allowed, but weird
	void f(int x, double y) {}   // Allowed, but weird
	void f(int a, char b) {}     // NOT allowed, type mismatch
	```
]

In C++, esistono tre modi per passare un parametro ad una funzione. Di base,
quando un valore viene passato ad una funzione, il parametro di tale funzione
viene inizializzato con il valore passato. Al di lá di questo, che é comune a
tutti i modi, i modi sono i seguenti:

- *Passaggio per valore*, in cui viene semplicemente creata una copia locale
  alla funzione del parametro che viene passato, e tale copia non influenza
  in alcun modo la versione originale del dato nota alla funzione chiamante;
- *Passaggio per puntatore*, in cui viene passato un puntatore ad una risorsa
  nota alla funzione chiamante. Questo significa che se la funzione chiamata
  manipola il dato associato al puntatore, tale valore viene modificato anche
  rispetto alla funzione chiamante. Se nella funzione chiamata viene modificato
  il puntatore in sé, sia il puntatore originale che l'oggetto a cui si
  riferisce rimangono comunque intatti;
- *Passaggio per referenza*, in cui viene passata una reference ad un dato
  noto alla funzione chiamante; se la funzione chiamata lo modifica, tale
  modifica si ripercuote anche sul dato originale.

Qualsiasi dato può essere passato ad una funzione in tutti e tre i modi,
pertanto scegliere una modalità piuttosto che l'altra dipende sostanzialmente
da cosa si vuole ottenere. L'unica eccezione sono gli array statici che, per
mantenere C++ retrocompatibile con C, devono per forza venire passati tramite
puntatore. Se un array viene passato come argomento di una funzione, viene in
automatico passato un puntatore a tale array come effettivo argomento. In
altre parole, viene fatta una conversione da `T[]` a `T*`.

#exercise[
	```
	int strlen(const char*);

	void f()
	{
		char v[] = "Hello, World!";
		int i = strlen(v);
	}
	```
]

Il passaggio per valore è da preferirsi quando si ha interesse a non
modificare il dato di origine o quando si richiede esplicitamente di
ricreare una copia del dato originale, e tale dato è ragionevolmente
piccolo. In genere, il passaggio per valore viene effettuato per i
tipi primitivi.

Il passaggio per puntatore e per referenza sono da preferirsi quando si
ha interesse a modificare il dato originale oppure quando non si vuole
che tale dato venga modificato, ma passare l'intero dato per valore
richiederebbe troppa memoria. In questo secondo caso in particolare,
è bene che il puntatore/referenza passato sia dichiarato `const`, di
modo che possa essere letto ma non modificato.

Il passaggio tramite puntatore e tramite referenza sono molto simili.
Il passaggio tramite puntatore è in genere meno "sicuro" di quello per
referenza, perchè il puntatore in questione potrebbe riferirsi ad un
dato che non esiste e creare inconsistenze. Pertanto, è preferibile
sempre controllare che il puntatore passato ad una funzione non sia
`nullptr`.

#exercise[
	```
	#include <iostream>

	void fun1(int j)
	{
		j = j / 2;
	}

	void fun2(int* j)
	{
		*j = *j + 3;
		int x = 30;
		j = &x;         // Nothing changes for i
	}

	void fun3(int& j)
	{
		j = j * 2;
		int& x = j;
		x++;            // Something changed for i
	}

	int main()
	{
		int i = 10;
		fun1(i);         // Nothing changes

		int* g = &i;
		fun2(g);        // i is now 13

		int& r = i;
		fun3(r);        // i is now 27

		return 0;
	}
	```
]

Una funzione non dichiarata `void` deve per forza ritornare un valore del
tipo corrispondente a quello riportato nella sua dichiarazione. Una funzione
`void` non puó ritornare alcun valore, ad eccezione di una chiamata ad
un'altra funzione `void`. L'unica funzione che non necessita di un `return`
esplicito é `main`, che se non lo possiede il compilatore vi aggiunge
implicitamente `return 0`. Una funzione può ritornare dati di qualsiasi
tipo, ad eccezione degli array, dei quali è possibile ritornare esclusivamente
un puntatore che vi si riferisce, mai l'array in se.

É considerata bad practise ritornare da una funzione puntatori o
reference a dati locali alla funzione stessa. Questo perchè i dati
locali ad una funzione vengono rimossi dallo stack una volta che la
funzione è stata eseguita, quindi tali puntatori/reference si riferiscono
a dati non validi. In genere il compilatore é in grado

Due funzioni che si trovano nello stesso namespace ma che hanno dei
parametri diversi (come numero e/o come tipo) sono comunque considerate
funzioni diverse. In altre parole, C++ supporta l'*overloading*. Se viene
chiamata una funzione che condivide il nome con un'altra funzione, il
compilatore è in grado di dedurre (più o meno correttamente) quale sia
la "versione" corretta della funzione da chiamare. Se esiste piú di un
candidato per una chiamata di funzione ed il compilatore non é in grado
di stabilire quale sia quella intesa, viene restituito un messaggio di
errore. Naturalmente, due funzioni con la stessa identica firma non sono
ammesse a prescindere.

#exercise[
	```
	#include <iostream>

	void f(int x, double y, char z) {}
	void f(char x, int y, char z) {}
	void f(float x, double y, int z) {}

	int main()
	{
		f(1, 0.0, 'a');       // First is called
		f('a', 0, 'b');       // Second is called
		f(1, 0, 'a');         // Ambiguous: all three valid
		f(1.0f, 0.0, 'a');    // Ambiguous: all three valid

		return 0;
	}
	```
]

Una funzione può anche avere dei valori di default opzionali assegnati
ai parametri. Se una funzione con dei default sui parametri viene
chiamata con un valore per tale parametro, allora tale parametro viene
utilizzato normalmente, mentre se non viene specificato allora viene
usato quello di default. I parametri di una funzione a cui viene
assegnato un valore di default devono necessariamente essere contigui
ed essere tutti sulla parte destra.

```
ret_type func_name(type_1 par_1, ..., type_i par_i = def_i, ..., type_n par_n = def_n)
```

#exercise[
	```
	#include <iostream>

	void h(char c, int v = 20) {}        // Allowed
	void f(char c = 10, int v = 90) {}   // Allowed
	void g(char c = 10, int v) {}        // NOT allowed

	int main()
	{
		f(1, 29);                       // c = 1, v = 29
		f(1);                           // c = 1, v = 90
		f();                            // c = 10, v = 90

		return 0;
	}
	```
]

La keyword `inline` permette di dichiarare una funzione come funzione
inline. Una funzione inline è una funzione che viene espansa in linea
quando viene chiamata, ovvero l'intero codice della funzione inline
viene inserito o sostituito nel punto della chiamata di funzione inline.
Questa sostituzione viene eseguita dal compilatore C++ in fase di
compilazione, non a runtime. Questo è particolarmente utile nel caso
in cui il tempo necessario ad eseguire il cambio di contesto sia maggiore
del tempo di esecuzione della funzione, e questo si verifica se la funzione
è estremamente piccola, e permette così di migliorare le prestazioni.
