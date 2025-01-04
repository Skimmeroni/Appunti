#import "../C++_definizioni.typ": *

Una *funzione templata* é una funzione costruita in maniera speciale di modo
che possa avere uno o piú argomenti aventi qualsiasi tipo. La sintassi per
dichiarare una funzione templata é la seguente:

```
template <typename T1, ... typename Tn> return_type fun_name(t1 n1, ..., tN nN)
```

La keyword `typename` specifica uno o piú tipi _generici_, che verranno
trattati come "segnaposto"; se uno degli argomenti viene dichiarato generico,
il suo effettivo tipo sará scelto dal compilatore in base a come la funzione
viene chiamata. Un tipo generico viene trattato come un tipo a tutti gli
effetti, ed é pertanto possibile usarlo per dichiarare variabili interne alla
funzione, operare dei cast ed usarlo per specificare degli argomenti.

Fra le parentesi angolate viene specificato il tipo che, per quella particolare
chiamata, deve essere usato come tipo effettivo al posto del tipo generico.

```
fun_name <type1, ... typeN>(arg1 , ..., argN)
```

Naturalmente, se piú argomenti di una funzione templata sono stati dichiarati
dello stesso tipo generico, una chiamata a tale funzione deve rispettare lo
stesso tale vincolo di tipo.

#exercise[
	```
	template <typename T> void swap(T& a, T& b) {
		T temporary = a;
		a = b;
		b = temporary;
	}

	int main() {
		int a = 1, b = 2;
		double c = 3, d = 4;

		swap <int>(a, b);       // Allowed
		swap <double>(c, d);    // Allowed
		swap <double>(c, a);    // NOT allowed
	}
	```
]

Quando il compilatore deve compilare una funzione templata, ne compila tante
versioni quante sono le combinazioni di tipi di dato utilizzate per chiamare
tale funzione. Ciascuna di queste "versioni" prende il nome di *specializzazione*.
Si noti come le funzioni template non introducano un overhead, perché una
specializzazione equale in termini di risorse usate alla sua controparte non
templata.

Sebbene un tipo di dato generico possa essere passato ad una funzione in
qualsiasi modo (per copia, per puntatore o per referenza), in genere é
preferibile evitare di passare dati di tipo generico per copia. Questo
perché non é possibile sapere in anticipo la dimensione del dato, ed un
passaggio per valore potrebbe essere molto esoso in termini di memoria.
Ove possibile, il passaggio per copia di tipi generici dovrebbero venire
sostituiti da passaggi per referenza.

#exercise[
	```
	template <typename T> T example1(T a) {
		T b = a;
		...
		return b;   // Correct, but ambiguous. Must use <>
	}

	template <typename T> void example2() {
		T temp;     // Correct, but ambiguous. Must use <>
		...
	}
	```
]

La keyword `template` non fa parte della signature della funzione, ed é
pertanto possibile fare overloading su una funzione templata, anche con
una funzione non templata. Questo ha particolarmente senso nel caso in
cui si vuole avere una versione "speciale" di una funzione templata che
funzioni in un modo diverso per tipi di dato specifici. In questo caso,
é particolarmente sensato definire comunque una funzione templata specifica,
anche se non definisce alcun tipo generico, perché tale funzione viene
effettivamente compilata solamente se necessario. Un pattern molto comune
prevede di utilizzare `typedef` per riferirsi ad una specializzazione che
viene usata molto piú frequentemente delle altre (questo é il caso della
classe `String` della libreria standard, ad esempio).

Una funzione templata non puó essere prima dichiarata e poi definita in
un secondo momento, ma deve necessariamente venire dichiarata e definita
insieme. Questo significa che non é possibile, come in genere viene fatto,
riportare la firma della classe in un file `.h` e specificarne il corpo
in un file `.cxx`. In genere, le funzioni template vengono riportate in
file a parte con estensione `.hxx` ("a metá" fra un file header ed un file
sorgente).

Si noti come una funzione templata introduca delle difficoltá di debugging
che le funzioni normali non hanno. In particolare, il compilatore potrebbe
non essere in grado di individuare degli errori nel codice della funzione
templata fino a quando questa non viene specializzata con dei tipi "problematici".

#exercise[
	```
		#include <iostream>
		#include <array>
		#include <string>

		template<typename T> custom_print(const T&)
		{
			std::cout << T << std::endl;   // Allowed
		}

		int main()
		{
			int x = 10;
			std::string s = "Hello, World!";
			std::array<int, 5> a = {1, 2, 3, 4, 5};

			custom_print<int>(x);                  // Ok
			custom_print<std::string>(s);          // Ok
			custom_print<std::array<int, 5>>(a);   // Error: std::array has no operator<<

			return 0;
		}
	```
]

Oltre alle funzioni, anche le classi possono essere definite template. Una
classe templata é una classe in cui figura un tipo generico, come attributo
e/o in uno o piú dei suoi metodi:

```
template<class C1, ... class Cn> class class_name {
	/* ... */
}
```

Istanziare una classe templata non é dissimile dall'istanziare una classe normale:

```
class_name<C1, ..., Cn> object(arg1, ..., argN);
```

Cosí come per le funzioni, una classe templata deve venire subito sia dichiarata
e definita.

#exercise[
```
template<class C> class String {
private:
	Struct Srep;
	Srep* rep;
public:
	String();
	String(const C*);
	String(const String&);

	C read(int i) const;
	/* ... */
}
```
]

Nel chiamare una fuzione templata é possibile omettere le parentesi angolate
solamente se il tipo generico non genera alcuna ambiguitá, ovvero quando il
compilatore é in grado di dedurre dal contesto quale debba essere il tipo in
questione. Se non esiste alcuna specializzazione della funzione templata che
possa accordarsi con i tipi di dato passati, o se esistono piú specializzazioni
egualmente plausibili, il compilatore restituisce un messaggio d'errore. D'altro
canto, nell'istanziare una classe templata non é mai possibile omettere le
parentesi angolate.

Le stesse regole della risoluzione fra tipi per le funzioni standard vengono
adottate per la risoluzione fra tipi delle funzioni template. In sostanza,
ogni chiamata ad una funzione templata dove le parentesi angolate sono state
omesse viene risolta scegliendo l'insieme di tipi di dato che meglio si accorda
con i valori passati come argomenti, dopodiché vengono applicate le classiche
regole per risolvere le ambiguitá nell'overloading. Nello specifico:

- Vengono considerate tutte le possibili specializzazioni di tutte le
  funzioni templati i cui tipi si accordano con i tipi passati come
  argomento;
- Se piú funzioni template sono valide, ma alcune sono piú specializzate
  di altre, vengono scelte sempre quelle piú specializzate;
- Viene gestito l'overloading delle funzioni template e delle funzioni
  standard con tipi medesimi. Se il tipo di dato passato alla funzione
  templata é stato dedotto anziché riportato esplicitamente, non sono
  ammesse conversioni implicite; 
- Se una funzione standard ed una funzione templata specializzata con gli
  stessi tipi sono candidate, viene sempre preferita la funzione standard;
- Se vi sono zero o piú di un candidato con la stessa probabilitá di essere
  la specializzazione scelta, viene restituito un messaggio di errore.

#exercise[
	```
	template <typename T> void test(const T& parameter) {}   // For any type
	void test(const double& parameter) {}                    // For doubles

	test(2.5);   // Will ALWAYS call the second version
	```
]

Si noti come la deduzione fatta dal compilatore, per quanto certamente
corretta sintatticamente, potrebbe non dare il risultato voluto. 

Particolare attenzione va prestata ai costruttori delle classi template.
Questo perché assegnare un tipo generico potrebbe essere sia un assegnamento
bit-a-bit (come per i tipi primitivi) oppure richiedere memoria dinamica, e
non é noto esplicitamente quale delle due situazioni si verifica. É bene
pertanto gestire questa situazione con un blocco `try catch`.

#exercise[
	```
	dbuffer(size_type size, const value_type& value) : size(0), buffer(nullptr)
	{
		buffer = new value_type[size];

		try {
			for (size_type i = 0; i < size; ++i) {
				buffer[i] = value;
			}
			this->size = size;
		} catch(...) {
			delete[] buffer;
			buffer = nullptr;
			throw;   // Very important!
		}
	}
	```
]
