#import "../C++_definizioni.typ": *

Una classe si dice *polimorfa* se puó essere usata su una classe base
mantenendo delle caratteristiche della classe derivata. A differenza
di altri linguaggi di programmazione ad oggetti (es. Java), una classe
C++ non é polimorfa di default, ma solo se si specifica che debba esserlo.
Questo perché introdurre il polimorfismo richiede risorse aggiuntive da
mettere a disposizione a runtime.

Per rendere polimorfo un metodo é possibile utilizzare la keyword `virtual`:

```
virtual ret_value polymorph_function(arg1, ..., argN)
```

Una metodo dichiarato `virtual` é automaticamente `virtual` anche per
tutte le classi derivate da quella che lo contiente. Una classe polimorfa
é quindi una classe che contiene almeno un metodo polimorfo (definito con
`virtual`).

Un metodo dichiarato `virtual` puó essere ridefinito come non piú `virtual`
(omettendo la keyword) in una classe derivata. Questa particolare forma di
overloading é detta *overriding*.

#exercise[
	```
	class Instrument
	{
	public:
		Instrument(void) {/* ... */}
		virtual void play() {/* ... */}
	}

	class Guitar : public Instrument
	{
	public:
		Guitar(void) {/* ... */}
		void play() {/* ... */}   // Override
	}

	class Drums : public Instrument
	{
	public:
		Drums(void) {/* ... */}
		void play() {/* ... */}   // Override
	}

	void play_instrument(Instrument& b)   // Has Instrument as input
	{
		b.play();
	}

	int main()
	{
		Guitar g;
		play_instrument(g);   // Calls Guitar::play(), not Instrument::play()

		Drums d;
		play_instrument(d);   // Calls Drums::play(), not Instrument::play()

		return 0;
	}
	```
]

É possibile forzare un metodo `virtual` ad essere "puramente" `virtual`,
senza implementazione, dichiarandolo uguale a $0$:

```
virtual ret_value polymorph_function(arg1, ..., argN) = 0;
```

Una classe che contiene uno o piú metodi "puramente" `virtual` viene detta
*classe astratta*. Tale classe non puó essere istanziata, puó solamente
essere ereditata da un'altra classe che ne implementi (del tutto o in parte)
l'interfaccia. Se la classe che eredita una classe astratta fa un override
di tutti i metodi `virtual` "puri" che eredita, allora diviene effettivamente
istanziabile; se invece fa override soltanto di una parte dei metodi `virtual`
puri che eredita, é a sua volta considerata classe astratta. 

#exercise[
	```
	class Instrument
	{
	public:
		Instrument(void) {/* ... */}
		virtual void play() = 0;   // Pure virtual; Instrument is abstract
	}

	class Guitar : public Instrument
	{
	public:
		Guitar(void) {/* ... */}
		void play() {/* ... */}   // Override, can now be instantiated
	}

	class Drums : public Instrument
	{
	public:
		Drums(void) {/* ... */}
		void play() {/* ... */}   // Override, can now be instantiated
	}

	void play_instrument(Instrument& b)   // Has Instrument as input
	{
		b.play();
	}

	int main()
	{
		Instrument i;         // NOT allowed

		Guitar g;
		play_instrument(g);   // Calls Guitar::play(), not Instrument::play()

		Drums d;
		play_instrument(d);   // Calls Drums::play(), not Instrument::play()

		return 0;
	}
	```
]

Oltre all'upcasting é anche possibile compiere *downcasting*, ovvero
passare da una classe piú generica ad una classe piú specifica. A
differenza dell'upcasting, che é una operazione sempre sicura, il
downcasting é quasi sempre insicuro, perché le informazioni che la
classe che vuole fare il downcasting ha rispetto alla classe bersaglio
sono in genere parziali o assenti. Cosí come per l'upcasting, il
downcasting é possibile solo rispetto a puntatori o reference.

L'unico caso in cui il downcasting é effettivamente sicuro si ha quando
la classe in questione é polimorfa. In particolare, il downcasting per
classi polimorfe viene eseguito mediante `dynamic_cast`:

```
BaseClass b;
DerivedClass& d = dynamic_cast<DerivedClass&>(b);
```

Il downcasting mediante `dynamic_cast` é considerato sicuro perché, in
caso di fallimento dell'operazione, viene restituito un errore a runtime.
In particolare, se il downcasting é stato fatto su un puntatore, viene
restituito il puntatore nullo, mentre se é stato fatto su una reference
viene lanciata l'eccezione apposita `std::bad_cast()`. Cercando di usare
`dynamic_cast` su una classe non polimorfa o su qualcosa che non sia una
classe comporta un errore di compilazione.
