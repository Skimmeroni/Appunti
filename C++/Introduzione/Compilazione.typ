#import "@preview/showybox:2.0.1": showybox

// Aggiungere disegno preso dalle slide, da fare con Graphviz

Un programma scritto nel linguaggio C++ é in genere costituito da uno o piú
*file sorgente*, dei file di testo ciascuno contiene una parte del codice.
Quando la compilazione viene invocata, prima che avvenga la compilazione
vera e propria ciascun file viene modificato da una componente specifica
del compilatore chiamata *preprocessore*. Questo converte il file di testo
originale in un altro file di testo, nel quale sono state peró fatte delle
specifiche sostituzioni sulla base di *direttive*, contenute nel file stesso.
Il risultato dell'operato del preprocessore é un file testuale di codice
"puro", dove le direttive sono sostituite dalle rispettive valutazioni.
Ciascuno di questi file viene detto *unitá di compilazione*. Tale file esiste
solo in memoria e viene passato al compilatore. Per ciascuno di questi il
compilatore lo converte in un *file oggetto*, file che contiene la
rappresentazione in codice binario dell'unitá di compilazione in input.
Tali file non sono portabili, perché il loro contenuto dipende sia
dall'architettura su cui il compilatore é stato eseguito, sia dal sistema
operativo su cui il compilatore é stato eseguito sia dal compilatore stesso.
Tali file di per loro non sono eseguibili; un'ultima componente del
compilatore é il linker, che unisce tutti i file oggetto in un solo
eseguibile.

Il preprocessore interpreta delle istruzioni speciali (direttive),
riconoscibili perché vi viene anteposto il simbolo `#`. Le direttive
piú importanti e piú utilizzate sono:

- `#define` e `#undef`. Permettono la definizione di *macro* o di *tag*.
  Una macro é una stringa che, in ogni posizione del codice in cui viene
  individuata, deve venire sostituita una seconda stringa. Tale sostituzione
  non viene interpretata semanticamente dal compilatore, pertanto puó essere
  sia una sostituzione tra due stringhe vere e proprie oppure la sostituzione
  di una stringa con una espressione. Una tag é una etichetta che viene
  registrata nella memoria del compilatore, da usarsi nelle direttive
  condizionali di seguito riportate. Macro e tag sono spesso riportate in
  maiuscolo per distinguerle dalle variabili vere e proprie, ma non vi sono
  restrizioni vere e proprie (al di lá di quelle che giá esistono) sul loro
  nome;
- `#if`, `#else`, `#elif` e `#endif`. Hanno la stessa funzionalitá del
  costrutto `if-else`, ma operano rispetto al codice e non rispetto alla
  sua logica. Possono essere usate, in combinazione con i tag, per rendere
  parti di codice bypassate durante la compilazione. Una loro possibile
  utilitá consiste nel rendere il codice cross-platform, istruendo il
  compilatore ad operare in modi diversi a seconda della piattaforma su
  cui il codice viene eseguito;
- `#ifdef` e `#ifndef`. Come i precedenti, ma anziché effettuare una
  valutazione di espressioni logiche valutano se una certa macro o tag
  é stata definita oppure no;
- `#include`. Permette di riportare il nome di un file sorgente esterno da
  includere nel file sorgente attuale, di modo da avere accesso alle variabili
  e ai metodi in questo definito. Esiste in due forme: `#include "filename"`
  e `#include <filename>`. Entrambe hanno la stessa funzionalitá, l'unica
  differenza sta nella posizione del filesystem in cui tali file vengono
  cercati. La prima predilige la ricerca di file usando percorsi assoluti
  (partendo quindi dalla cartella in esame) mentre la seconda predilige
  la ricerca di file usando il percorso standard in cui i file delle librerie
  si trovano (questo dipende da sistema operativo a sistema operativo, su
  Linux `/usr/include`).

#showybox[
	#grid(
		columns: (0.4fr, 0.25fr, 0.35fr),
		[
			```
			#include "File2"
			#define PIPPO 1234
			#define FUNZ(a) 2 * a + 3

			double d = PIPPO + 10
			#ifdef PLUTO
			int j = 900;
			#else
			int j = 1000;
			#endif

			double k = FUNZ(j);
			```
		],
		[
			```
			int v1;
			double v2;
			char v3;
			```
		],
		[
			```
			int v1;
			double v2;
			char v3;

			double d = 1234 + 10;

			int j = 1000;

			double k = 2 * j + 3
			```
		]
	)
]

Il compilatore analizza sintatticamente il codice sorgente per verificare che
non siano presenti typo. Effettua inoltre una parziale analisi semantica, in
particolare il *type checking* (ad esempio, valutare che un valore passato ad
una funzione sia del tipo specificato nella firma della funzione, oppure che
una variabile venga inizializzata con un dato coerente col suo tipo) e
l'identificazione di variabili e funzioni esterne, che non possono essere
incluse immediatamente ma che devono attendere la fase di linking, ed é quindi
necessario riportare dei "placeholder". Il compilatore, oltre a convertire le
istruzioni dal formato testuale a quello binario, aggiunge (se necessario)
delle informazioni di debug aggiuntive utili per la fase di testing.

I riferimenti a componenti esterne al file oggetto vengono risolti dal
linker, che cerca negli altri file oggetto le variabili e le funzioni
che nel file in esame hanno un nome ma non una implementazione, sostituendo
il "placeholder" con l'indirizzo di memoria della variabile/funzione presa
dal file oggetto dove é contenuta. Un errore tipico che il linker puó emettere
é `Unresolved External Symbol`, che avviene quando in un file oggetto é
riportato il nome di una funzione/variabile che non é presente in nessun file
oggetto che il linker ha esaminato. Il linker unifica i vari file oggetto in
un solo eseguibile, ed introduce del codice di *startup* per renderlo
riconoscibile dal sistema operativo come tale. Oltre ai file oggetto del
codice in esame, il linker si occupa anche di aggiungere (se necessario)
le librerie esterne. Queste, tranne la libreria standard (che viene inclusa
sempre in automatica) devono essere specificate manualmente.

Sebbene, come giá detto, i file sorgente possono avere estensioni a piacere
(fintanto che sono file di testo), per convenzione i file sorgente si
dividono in due categorie:

- I file con estensione `.cxx`: contengono la definizione vera e propria di
  funzioni (il loro corpo) e variabili (il loro effettivo valore). Possono
  essere visti come l'implementazione di una libreria della quale é nota
  l'interfaccia. Tali file sono quelli che vengono effettivamente compilati.
- I file con estensione `.h`, anche chiamati *file header*: contengono la
  dichiarazione di funzioni (la loro firma), variabili (il loro tipo) e tipi
  di dato definiti dall'utente (classi e simili). Possono essere visti come
  l'interfaccia di una libreria, ovvero riportano solamente _cosa_ é necessario
  implementare ma non l'implementazione in sé e per sé. Tali file non vengono
  in genere compilati, ma vengono inclusi nei file `.cxx` per rendere loro
  disponibili le interfacce da implementare.

Per tale motivo, i file sorgente dei codici C++ sono in genere a coppie: un
file `.h` che contiene l'interfaccia ed il corrispettivo file `.cpp` che ne
implementa le funzionalitá. C++ non supporta le *forward declarations*: se
nel codice é presente una funzione che non ha una firma (anche se non é nota
l'implementazione), viene restituito un errore. Riportare le firme delle
funzioni in file header permette di rendere nota al compilatore la firma
di una funzione prima che questa venga implementata, di modo che non sia
necessario rivedere l'ordine della dichiarazione delle funzioni ad ogni
cambiamento.

// Aggiungere un esempio?

Sebbene non sia impedito l'usare `#include` per includere un file `.cpp` in
un file `.cpp`, questo comportamento viene in genere scoraggiato perché rende
i due file non piú indipendenti. Se si vuole avere del codice condiviso fra
piú file, é preferibile che si trovi in un header file.

Puó capitare che un header file venga incluso piú volte nello stesso file
`.cpp`, specialmente quando il progetto é molto grande. Di base questo non
é un problema, dato che ció che accade é che il preprocessore deve eseguire
piú volte "a vuoto" una stessa sostituzione della direttiva `#include`;
sebbene non sia un comportamento problematico, potrebbe comunque far
sprecare tempo al preprocessore e rallentare il processo di compilazione.
Per prevenirlo é possibile introdurre la cosiddetta *guardia*, che non é
altro che una struttura del tipo:

```
#ifndef something_H
#define something_H
...
#endif
```

In questo modo, il preprocessore include `something.h` solamente se non é
mai stato finora incluso.

// Aggiungere un esempio?

La suddivisione del codice in piú file oggetto permette la *compilazione
separata*: un file sorgente deve venire ricompilato solamente se viene
modificato direttamente.

Nel C++ si distingue tra *dichiarazione* e *definizione* di una funzione
o di una variabile. Dichiarare una funzione significa riportare il tipo
del valore di ritorno di tale funzione, il suo nome ed il numero e tipo
dei suoi argomenti. Definire una funzione significa, oltre a dichiararla,
anche riportarne il corpo.

```
	// definition
	return_value_type function_name(type_arg1 name_arg1, ..., type_argN name_argN)

	// declaration
	return_value_type function_name(type_arg1 name_arg1, ..., type_argN name_argN)
	{
	// body goes here...
	}
```

Definire una variabile significa notificare al compilatore che tale variabile
esiste ed ha un certo nome, ma quale sia il suo valore non é da cercarsi nel
file attuale (in genere questo viene fatto per la definizione di costanti
globali in sostituzione a `#define`). Dichiarare una variabile significa
sia esplicitarne il suo tipo, sia *inizializzarla*, ovvero assegnarle un
valore iniziale; le due operazioni possono essere compiute separatamente
o contemporaneamente. Una variabile non inizializzata assume in genere un
valore casuale, che dipende dal contenuto della memoria che prima occupava
tale variabile.

```
	extern variable_type variable_name            // define a variable, without declaring

	variable_type variable_name = initial_value   // declare a variable and initialise

	variable_type variable_name                   // first declare a variable...
	variable_name = initial_value                 // then initialise it
```

Come giá detto, il compilatore non dá errori fintanto che esiste una firma
di una funzione o il nome e tipo di una variabile. In altre parole, non dá
errori fintanto che una variabile/funzione é _dichiarata_. É il linker a
dare un errore nel caso in cui una variabile/funzione non é stata _definita_.

Si noti come una dichiarazione implichi anche una definizione, mentre
non é necessariamente vero il contrario. Inoltre, dichiarare piú volte
una stessa variable/funzione non dá errore, perché si sta semplicemente
ripetendo piú volte la stessa operazione, mentre definire piú volte una
stessa variabile/funzione da spesso errore perché il linker non é in
grado di distinguere quale "versione" della variabile/funzione debba
venire utilizzata.

#showybox[
```
	float euclidean_distance(int x1, int y1, int x2, int y2)

	double temperature;
	temperature = 4.2;

	extern float gamma_constant;
```
]

L'entry point di un programma C++ é una funzione avente nome `main`. Tale
funzione deve essere globale e ne deve esistere una ed una sola copia. Il
suo tipo di ritorno deve essere `int`, perché ció che viene restituito é
il valore di successo o di errore dell'esecuzione del programma. Il suo
numero di argomenti é variabile (anche zero), e tali argomenti vengono
forniti al programma direttamente dall'utente quando il programma viene
avviato.

```
int main()
{
    ...
    return 0;
}
```

Il programma `Hello, World!` per il linguaggio C++, che stampa sullo standard
output tale stringa, é il seguente:

```
#include <iostream>

int main()
{
    std::cout << "Hello, World!" << std::endl;

    return 0;
}
```

`std::cout` é un oggetto definito nella libreria standard del C++ (nello
specifico, definito nell'header `iostream`, che viene importato) preposto
alla stampa sullo standard output. A prescindere di quale sia il tipo di
dato che `std::cout` debba stampare, questo lo restituisce come carattere.

La dicitura `std` rappresenta il *namespace*, ovvero uno spazio logico dentro
al quale sono definite delle funzionalitá. I namespace vengono in genere
utilizzati per suddividere le entitá di una libreria da tutte le altre, e
specificare che tali entitá appartengono allo stesso gruppo. Nello specifico,
`std` indica che l'entitá di cui `std` é prefisso proviene dalla libreria
standard. In questo modo, é anche possibile avere funzioni/variabili che
hanno lo stesso nome ma che hanno un significato diverso a seconda del
namespace a cui appartengono.

In maniera molto simile, per leggere input da tastiera é possibile sfruttare
`std::cin`

#showybox[
	```
	#include <iostream>

	int main()
	{
	    int something;
	    std::cin >> something;
	    std::cout << "I got " << something << std::endl;

	    return 0;
	}
	```
]

Nel caso in cui si voglia mostrare un messaggio di errore, é possibile
scrivere sullo standard error mediante `std::cerr`. Questo é in genere
piú rapido che scrivere sullo standard output perché lo standard error
non fa buffering, e quindi l'overhead é minore. Aiuta inoltre a separare
i messaggi di errore dal normale flusso di esecuzione del programma.

Gli operatori `<<` e `>>` sono operatori che rispettivamente inseriscono dati
in uno stream ed estraggono dati da uno stream. C++ supporta la *ridefinizione*
degli operatori, pertanto é possibile assegnare ad un operatore una funzione
diversa a seconda del tipo di dato che si richiede che questo manipoli. In
effetti, tali operatori sono essi stessi una ridefinizione, dato che il loro
uso di "default" é lo shift logico (a sinistra e a destra rispettivamente).

Sebbene i namespace abbiano il pregio di separare in maniera elegante
diversi package, riportarne il nome ogni volta che viene riportato un
suo oggetto o funzione puó diventare tedioso. Per questo motivo é possibile
includere l'istruzione `using namespace` per specificare al compilatore che,
all'interno del file corrente, tutte le funzioni e gli oggetti potrebbero
provenire da tale namespace. Dato che l'effetto di questa istruzione viene
propagato, é preferibile evitare di riportarla nei file header.

Il C++ é retrocompatibile con C, pertanto é possibile importare normalmente
librerie C; tali funzionalitá non sono legate ad un namespace vero e proprio,
ma si trovano nel namespace globale. Spesso le librerie pensate per il
linguaggio C possono venire utilizzate nel C++ in maniera nativa incapsulando
tali funzionalitá in un namespace. La differenza fra le due, ovvero fra le
librerie per C importate in C++ e librerie in C++ propriamente dette, sta
nel nome dell'header importato: le seconde sono importate specificando il
file per intero, estensione inclusa, mentre le seconde vengono importante
troncando l'estensione. Nel caso specifico della libreria standard del C,
molte delle funzionalitá di tale libreria sono incapsulate dalla libreria
standard del C++ in header che hanno il medesimo nome ed una 'c' come prefisso.

#showybox[
	La libreria standard del C `math.h` contiene alcune funzioni matematiche
	piú elaborate delle operazioni standard, come ad esempio il calcolo della
	radice quadrata (`sqrt`) o l'arrotondamento per eccesso o per difetto
	(`floor` e `ceiling`). Per importarla in un codice C++ é sufficiente
	specificare la direttiva `#include <math.h>` e le funzioni da questa
	fornite sono disponibili senza dover specificare un namespace (non
	avendolo). In alternativa, la libreria standard del C++ incapsula
	`math.h` nel namespace `std` (senza modificarne le funzionalitá) pertanto
	é anche possibile accedere alle funzioni di `math.h` mediante la direttiva
	`#include <cmath>`, e tali funzioni avranno `std` come namespace.

	#grid(
		columns: (0.5fr, 0.5fr),
		[
			```
			#include <math.h>
			sqrt(16);
			```
		],
		[
			```
			#include <cmath>
			std::sqrt(16);
			```
		]
	)
]
