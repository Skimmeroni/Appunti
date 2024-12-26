#import "../C++_definizioni.typ": *

Una *funzione templata* é una funzione costruita in maniera speciale di modo
che possa avere uno o piú argomenti aventi qualsiasi tipo. Sono funzioni che
vengono compilate in maniera diversa dal compilatore sulla base di quali sono
i dati passati; se ne vengono usate diverse versioni, ognuna con tipi di dato
diversi, ne vengono generate altrettante versioni. La sintassi per dichiarare
una funzione templata é la seguente:

```
template <typename T1, ... typename Tn> return_type fun_name(t1 n1, ..., tN nN)
```

La keyword `typename` specifica uno o piú tipi _generici_, che verranno
trattati come "segnaposto"; se uno degli argomenti viene dichiarato generico,
il suo effettivo tipo sará scelto dal compilatore in base a come la funzione
viene chiamata. Un tipo generico viene trattato come un tipo a tutti gli
effetti, ed é pertanto possibile usarlo per dichiarare variabili interne alla
funzione, operare dei cast ed usarlo per specificare degli argomenti.

La chiamata ad una funzione templata é leggermente diversa:

```
fun_name <generic_type>(Atype1 Aname1 , dots, AtypeN AnameN)
```

Fra le parentesi angolate viene specificato il tipo che, per quella particolare
chiamata, deve essere usato come tipo effettivo al posto del tipo generico.
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

Sebbene un tipo di dato generico possa essere passato ad una funzione in
qualsiasi modo (per copia, per puntatore o per referenza), in genere é
preferibile evitare di passare dati di tipo generico per copia. Questo
perché non é possibile sapere in anticipo la dimensione del dato, ed un
passaggio per valore potrebbe essere molto esoso in termini di memoria.
Ove possibile, il passaggio per copia di tipi generici dovrebbero venire
sostituiti da passaggi per referenza.

Nel chiamare una fuzione templata é possibile omettere le parentesi
angolate solamente nel caso in cui il tipo generico non genera alcuna
ambiguitá. Situazioni ambigue si verificano quando la funzione templata
ritorna un parametro di uno dei tipi generici oppure quando una variabile
di tipo generico non viene immediatamente inizializzata.

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
una funzione non templata. Il compilatore, tra la versione di una funzione
che usa un tipo generico e la versione che usa un tipo specifico, sceglie
sempre la seconda.

Questo ha particolarmente senso nel caso in cui si vuole avere una versione
"speciale" di una funzione templata che funzioni in un modo diverso per tipi
di dato specifici. In questo caso, é particolarmente sensato definire comunque
una funzione templata specifica, anche se non definisce alcun tipo generico,
perché tale funzione viene effettivamente compilata solamente se necessario.

#exercise[
	```
	template <typename T> void test(const T& parameter) {}   // For any type
	template <> void test(const double& parameter) {}        // For doubles

	test(2.5);   // Will ALWAYS call the second version
	```
]

Una funzione templata non puó essere prima dichiarata e poi definita in
un secondo momento, ma deve necessariamente venire dichiarata e definita
insieme. Questo significa che non é possibile, come in genere viene fatto,
riportare la firma della classe in un file `.h` e specificarne il corpo
in un file `.cpp`. In genere, le funzioni template vengono riportate in
file a parte con estensione `.hpp` ("a metá" fra un file header ed un file
sorgente).

Oltre alle funzioni, anche le classi possono essere definite template. Cosí
come per le funzioni, una classe templata deve venire subito sia dichiarata
e definita. L'unica differenza con le funzioni é che non é possibile omettere
le parentesi angolate nella chiamata di una classe templata.

#exercise[
	```
	template <typename T>
	std::ostream &operator<<(std::ostream &os, const dbuffer<T> &db)
		os << db.size() << std::endl;

		for (typename dbuffer<T>::size_type i = 0; i < db.size(); ++i) {
			os << db[i] << " ";
		}
		os << std::endl;

		return os;
	```
]

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
