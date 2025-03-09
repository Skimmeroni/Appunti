#import "../C++_definizioni.typ": *

Nel C++ si fa distinzione fra *dichiarazione* e definizione di una entitá
(che sia un tipo, un oggetto o una funzione). Una dichiarazione introduce un
nome (identificatore) e descrive il suo tipo. Una dichiarazione é ció che il
compilatore deve sapere si riferisce a tale identificatore. Una *definizione*
é l'istanziazione/implementazione di tale identificatore. Una definizione é
ció che il linker deve sapere si riferisce a tale identificatore.

Dichiarare una variabile significa notificare al compilatore che tale
variabile esiste ed ha un certo nome. Definire una variabile significa
richiedere esplicitamente di allocare la memoria necessaria a contenerne
il valore.

La definizione é distinta dall'*inizializzazione*, ovvero assegnare un
valore iniziale. Una variabile puó essere sia inizializzata mentre la si
definisce, oppure puó essere fatto separatamente. Se una variabile non
viene inizializzata, il suo valore potrebbe essere indeterminato.

#exercise[
	```
	// Declaration without definition

	extern int error_number;
	struct User;
	class Person;

	// Declaration with definition

	int error_number;
	double funny = 6.9;
	char* name = "Hello, World!";
	struct Date {int day, int month, int year;};
	```
]

Dichiarare una funzione significa riportarne la *firma*, ovvero il tipo
del valore di ritorno, il suo nome ed il numero e tipo dei suoi argomenti.
Definire una funzione significa, oltre a dichiararla, anche specificarne il
corpo.

#exercise[
	```
	// Declaration without definition

	double square_root(double n);

	// Declaration with definition

	double square_root(double n)
	{
		// body goes here...

		return ...;
	}

	```
]

Se un nome viene utilizzato all'interno di un programma ma non viene
dichiarato, il programma non puó essere compilato. Se un nome viene
utilizzato all'interno di un programma ma non viene definito, il
programma puó comunque essere compilato, ma non puó essere linkato.
Una definizione implica anche una dichiarazione, il contrario non é
necessariamente vero.

Dichiarare piú volte una stessa variable/funzione allo stesso modo non
dá errore, perché si sta semplicemente specificando piú volte al compilatore
che quella entitá "esiste". Viene restituito un messaggio di errore durante
la compilazione nel caso in cui che vi siano piú dichiarazioni di una stessa
variabile/funzione se queste sono discordanti fra loro. Definire piú volte
una stessa variable/funzione restituisce sempre un messaggio di errore durante
la compilazione. Due dichiarazioni/definizioni per variabili con lo stesso nome,
anche se di tipo diverso, non sono ammesse.

#exercise[
	```
	int x;
	int x;                   // NOT allowed

	float y;
	char y;                  // NOT allowed

	extern double pi;
	extern double pi;        // Allowed

	extern int err_code;
	extern long err_code;    // NOT allowed
	```
]

Una dichiarazione é costituita da quattro componenti: una specifica opzionale,
un tipo base #footnote[Nei precedenti standard del C e del C++, il tipo base
era opzionale, e se veniva omesso veniva implicitamente considerato `int`.
Questa feature é stata rimossa.], un dichiaratore, una inizializzazione
opzionale. Ad eccezione delle funzioni e dei namespace, una dichiarazione
termina con un punto e virgola. La specifica é costituita da una parola chiave
come `virtual` o `extern`, che riporta una caratteristica dell'identificatore
che esula dal suo tipo. Un dichiaratore é costituito da un nome e opzionalmente
da un operatore. Gli operatori possono essere sia prefissi che postfissi;
gli operatori prefissi, nella grammatica, hanno prioritá maggiore. Gli
operatori piú comuni sono:

#table(
	columns: 3,
	[`*`], [puntatore], [prefisso (prima del dichiaratore)],
	[`&`], [referenza], [prefisso (prima del dichiaratore)],
	[`[]`], [array], [postfisso (dopo il dichiaratore)],
	[`()`], [funzione], [postfisso (dopo il dichiaratore)]
)

É possibile dichiarare piú nomi in una sola dichiarazione. La dichiarazione
é semplicemente costituita da una lista di dichiaratori separati da virgole.
Gli operatori non vengono estesi a tutti i dichiaratori in una dichiarazione
multipla, sono legati esclusivamente al dichiaratore in cui figurano.

#exercise[
	```
	int x, y, z;      // int x; int y; int z;
	int *x, y, z;     // int *x; int y; int z;
	int x, *y, z;     // int x; int *y; int z;
	```
]

Un nome (identificatore) consiste di una sequenza di lettere e cifre. Il
primo carattere di un nome deve per forza essere una lettera; il carattere
`_` viene considerato come lettera. Lo standard C++ non impone un limite
alla lunghezza di un nome, ma un compilatore o un linker potrebbe farlo.
Alcune implementazioni del C++ permettono di utilizzare caratteri speciali
(come `$`) nei nomi, ma é best practice comunque evitarlo per aumentare la
compatibilitá. I nomi delle parole chiave della grammatica del C++ (`int`,
`if`, `throw`, ecc...) non possono essere usati come nomi.

#exercise[
	```
	// Valid identifiers
	hello    ___    a123    INT    Hello_World    _x_y_z_    tHiSnAmE    __0__
	// Non valid identifiers
	Hello World    012345    float    $name    var.iable    else
	```
]

I nomi che iniziano con il carattere `_` sono in genere riservati per
l'implementazione e l'ambiene run-time, ed é pertanto best practice non
usarli. Il carattere di spazio serve a separare i token della grammatica,
pertanto due sequenze di caratteri inframezzati da spazi vengono sempre
considerati due token distinti. C++ é case sensitive, pertanto le lettere
maiuscole e minuscole sono considerate caratteri distinti.

É considerata bad practice scegliere due identificatori distinti che
differiscono per pochi caratteri. I nomi di grandi scope é bene che
abbiano un nome lungo di modo da metterli in evidenza, mentre le variabili
poco importanti di scope piccoli possono essere chiamati anche con singole
lettere. In genere, é piú utile dare nomi che riflettono la semantica che
ha quell'entitá, piuttosto che il modo in cui viene implementata, perché
rende il codice piú leggibile.
