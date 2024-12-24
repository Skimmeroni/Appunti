#import "../C++_definizioni.typ": *

Prende il nome di *blocco* qualsiasi sezione di codice racchiusa all'interno
di due parentesi graffe. Ogni blocco induce uno *scope*, ovvero uno "spazio"
entro al quale le variabili possono essere dichiarate. Una variabile
dichiarata all'interno di un blocco si dice che é *locale* al blocco.

All'interno di uno stesso scope, le variabili non possono essere definite
piú di una volta, mentre due variabili possono essere definite uguali in
due scope diversi. Piú blocchi, e di conseguenza piú scope, possono essere
contenuti l'uno nell'altro. Le definizioni non si "trasmettono" attraverso
gli scope piú interni: due variabili con lo stesso nome e lo stesso tipo,
se si trovano in due scope diversi (che siano disgiunti o l'uno contenuto
nell'altro) sono considerate due entitá diverse. Gli argomenti di una funzione
sono considerati facenti parte del blocco indotto dalla funzione.

#exercise[
	```
	{
		int x = 10;

		{
			int x = 5;                     // Allowed: different scope
			std::cout << x << std::endl;   // Prints 5
		}

		std::cout << x << std::endl;       // Prints 10
	}

	void f(int y)
	{
		int x;                             // Allowed: different scope
		int y;                             // NOT allowed
	}
	```
]

Un *namespace* permette di raggruppare semanticamente funzioni, variabili,
dichiarazioni e tipi, che possono trovarsi anche in file diversi, assegnandovi
una etichetta univoca.

Tale etichetta diviene parte del nome dell'entitá stessa, e due entitá che
hanno lo stesso nome ma diverso namespace saranno comunque trattati come
distinti (naturalmente, all'interno di uno stesso namespace non possono
esistere due entitá con lo stesso nome). I confini del namespace sono
determinati dal blocco di codice indotto dal namespace: per specificare
che con una certa entitá del namespace al di fuori dello stesso é necessario
utilizzare l'operatore `::`. É possibile riferirsi a tutto ció che appartiene
ad un namespace da dentro il namespace stesso senza dover specificare `::`,
perché é sottointeso.

#grid(
	columns: (0.5fr, 0.5fr),
	[
	```
	namespace name_s
	{
	...
	}
	```
	],
	[
	```
	name_s::entity
	```
	]
)

Un namespace particolarmente importante é `std`, quello della libreria
standard del C++. Non a caso, diverse funzioni molto usate come `cin`
e `cout` appartengono a tale namespace.

#exercise[
	```
	namespace First
	{
		int s;
		int g() {...}
	}

	namespace Second
	{
		int s;             // Allowed, namespace is not the same
	}

	First::s = 10;
	Second::s = 5;

	int x = First::s;    // x = 10
	```
]

I namespace permettono la modularizzazione del codice, separandolo in diverse
componenti atomiche che dipendono fra di loro. Permettono inoltre di evitare
conflitti fra nomi, dato che due entitá con lo stesso nome di due namespace
diversi potrebbero avere due significati diversi. Infine, permettono di
oscurare i dettagli implementativi di una funzione o di una classe,
presentando solamente una interfaccia e la sua semantica.

Una entitá appartenente ad un namespace puó essere dichiarata e definita
all'interno del blocco indotto dal namespace stesso, oppure puó essere
dichiarata all'interno del blocco e (riferendovisi usando `::`) definita
al di fuori. Non é peró possibile dichiarare una entitá membro di un namespace
al di fuori del blocco da questi indotto. Le regole degli scope sono valide
anche per i namespace, pertanto in uno stesso namespace non possono esserci
due definizioni uguali.

#exercise[
	```
	namespace AAA
	{
		int f();
	}

	int AAA::f()    // Allowed
	{
		...
	}

	int AAA::g()     // NOT allowed
	{
		...
	}
	```
]

La keyword `using` permette di introdurre un sinonimo locale per un elemento
appartenente ad un namespace diverso da quello corrente. Dall'uso di `using`
in poi e per tutta la lunghezza dello scope/namespace, é possibile riferirsi a
quella entitá omettendo l'operatore `::`. Puó anche essere usato per indicare
che, dall'uso di `using` in poi e per tutta la lunghezza dello scope, ogni
entitá facente parte di un certo namespace diventa disponibile nello
scope/namespace corrente omettendo `::`.

`using` puó semplificare il codice, risparmiando diversi `::` ridondanti,
ma puó anche rendere il codice piú confuso, perché gli elementi del namespace
"importato" e gli elementi locali diventano di fatto indistinguibili. `using`
puó anche essere usato nello scope globale, di fatto stabilendo che lungo
tutto il codice gli elementi di tale namespace sono accessibili globalmente
omettendo `::`; questa scelta é considerata bad practice, ed é preferibile
evitarla. Anche utilizzare `using` all'interno di un header file é considerata
bad practice, perché tale scelta si propaga lungo tutto il codice che lo
importa. `using` puó essere utile nella definizione dei namespace, per
importare con piú facilitá entitá da altri namespace.

#grid(
	columns: (0.5fr, 0.5fr),
	[
	```
	using namespace name_s
	{
	...
	}
	```
	],
	[
	```
	using name_s::entity
	```
	]
)

#exercise[
	```
	namespace First
	{
		int s;
	}

	int main()
	{
		using First::s;      // Now First::s is just s
		int s = 10;          // NOT allowed
		s = 10;              // Allowed
	}
	```
]

I namespace devono per forza essere dichiarati globalmente, pertanto ogni file
che importa il file che contiene la sua dichiarazione lo ha disponibile.
Inoltre, i namespace possono essere dichiarati piú volte, anche in file
diversi; quando il codice viene compilato, le diverse occorrenze di uno
stesso namespace e le loro componenti vengono unite in una sola.

#exercise[
	```
	namespace Ex
	{
		int x;
	}

	namespace Ex     // Allowed
	{
		int s;
	}

	int main()
	{
		Ex::s = 30;
		Ex::x = 50;

		return 0;
	}
	```
]

I namespace possono anche essere usati per "occultare" delle dichiarazioni, di
modo che tale namespace sia accessibile soltanto nello scope locale e non al di
fuori e di modo che le dichiarazioni in tale namespace non interferiscano con
l'esterno. Per fare questo é possibile utilizzare i *namespace anonimi*, che
vengono introdotti dichiarando normalmente un namespace ma omettendone il nome.
Tali namespace sono inaccessibili agli altri file, nemmeno se importano il
file con tale definizione.

#exercise[
	```
	namespace
	{
		int s;
	}

	int main()
	{
		s = 10;    // Allowed
	}
	```
]

Ad un namespace puó venire assegnato un alias locale per semplificare il
codice, riferendosi ad un namespace con un nome piú comodo. Tale nome é
valido soltanto localmente, non é una ridefinizione, il nome originale
rimane intatto.

```
namespace new_name = old_name;
```

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

#exercise[
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
