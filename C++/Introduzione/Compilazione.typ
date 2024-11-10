#import "@preview/showybox:2.0.1": showybox

Raramente un programma scritto nel linguaggio C++ é costituito da un solo
file sorgente che contiene l'intero codice. In genere, questo é costituito
da uno o piú *file sorgente*, ciascuno contenente una parte del codice.
Questo permette sia di suddividere logicamente il codice in piú componenti,
enfatizzando quindi la sua struttura logica, sia di sfruttare la *compilazione
separata*: quando una parte di codice viene modificata, é necessario
ricompilare solamente il file che la contiene, non l'intero codice.

Quando la compilazione viene invocata, prima che avvenga la compilazione
vera e propria ciascun file viene modificato da una componente specifica
del compilatore chiamata *preprocessore*. Questo converte il file di testo
originale in un altro file di testo, nel quale sono state peró fatte delle
specifiche sostituzioni sulla base di *direttive*, contenute nel file stesso.
Il risultato dell'operato del preprocessore é un file testuale di codice
"puro", dove le direttive sono sostituite dalle rispettive valutazioni.
Ciascuno di questi file viene detto *unitá di compilazione*. Tale file
esiste solo in memoria e viene passato al compilatore, a meno di richiederlo
direttamente.

Le direttive sono riconoscibili perché sono precedute dal simbolo `#`. Le
direttive piú importanti e piú utilizzate sono:

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

Il compilatore analizza sintatticamente ciascuna unitá di compilazione
per verificare che non siano presenti errori di sintassi. Effettua inoltre
una parziale analisi semantica, in particolare il *type checking* (ad
esempio, valutare che un valore passato ad una funzione sia del tipo
specificato nella firma della funzione, oppure che una variabile venga
inizializzata con un dato coerente col suo tipo) e l'identificazione di
variabili e funzioni esterne, che non possono essere incluse immediatamente
ma che devono attendere le fasi successive e devono pertanto venire
contrassegnate da dei "placeholder". Il compilatore, aggiunge poi, se
necessario delle informazioni di debug aggiuntive utili per la fase di
testing.

Il compilatore converte ciascuna unitá di compilazione in un *file
oggetto*. Tali file non sono portabili, perché il loro contenuto
dipende sia dall'architettura su cui il compilatore é stato eseguito,
sia dal sistema operativo su cui il compilatore é stato eseguito sia
dal compilatore stesso. Tali file di per loro non sono eseguibili,
perché potrebbero avere dei riferimenti a variabili o funzioni che
sono state dichiarate ma non definite nell'unitá di compilazione stessa.

I file oggetto vengono unificati in un solo eseguibile dal *linker*.
Questo cerca negli altri file oggetto le variabili e le funzioni che
nel file in esame sono state dichiarate ma non definite, sostituendo
il "placeholder" con l'indirizzo di memoria della variabile/funzione
presa dal file oggetto dove é contenuta. Se in un file oggetto riportato
il nome di una funzione/variabile che non ha peró una definizione in
nessun altro file oggetto, viene restituito il messaggio di errore
`Unresolved External Symbol`.

#showybox[
	```
	// file2.c
	extern int x;
	int f();
	void g() { x = f(); }

	// file1.c
	int x = 1;
	int f() { return 9; }
	int main() { return 0; }
	```
]

Il linker, oltre ad unificare i vari file oggetto in un solo eseguibile,
introduce del codice di *startup* per renderlo riconoscibile dal sistema
operativo come tale. Il linker si occupa inoltre di aggiungere (se necessario)
le librerie esterne. Queste, tranne la libreria standard (che viene inclusa
sempre in automatica) devono essere specificate manualmente.

La fase di linking termina con successo se ogni variabile/funzione é stata
dichiarata in ogni file oggetto in cui compare, se (eventuali) dichiarazioni
multiple sono fra loro consistenti, se ogni variabile/funzione usata é stata
definita in uno dei file file oggetto che la utilizza e se tale definizione
viene fatta esattamente una sola volta.

#showybox[
	```
	// file2.c
	int x = 0;
	extern double b;
	extern int c;

	// file1.c
	int x = 1;       // NOT allowed, x is already defined
	int b = 1;       // NOT allowed, b was defined double
	extern int c;    // Allowed, but pointless

	int main()
	{
		return 0;
	}
	```
]

Sebbene i file sorgente possono avere estensioni a piacere (fintanto che sono
file di testo), per convenzione i file sorgente si dividono in due categorie:

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
