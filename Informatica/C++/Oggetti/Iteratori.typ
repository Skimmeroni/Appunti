#import "../C++_definizioni.typ": *

Gli *iteratori* forniscono una astrazione all'accesso degli elementi
delle classi container. In questo modo, un algoritmo puó funzionare
su container diversi senza doverlo modificare e senza dover conoscere
i dettagli implementativi della classe. Allo stesso tempo, una classe
container puó fare uso di iteratori per permettere un accesso ai suoi
dati standardizzato.

Un *iteratore* é un oggetto che generalizza il concetto di puntatore
ad un elemento di una sequenza. Non esiste in sé e per sé il tipo di
dato "iteratore"; qualsiasi classe che implementi (almeno) determinate
caratteristiche, riportate nell'interfaccia `std::iterator`, é di fatto
un iteratore. Nello specifico, é definibile iteratore qualsiasi
implementazione di `std::iterator` che possieda almeno queste nozioni:

- Una nozione di "l'elemento che sta venendo puntato";
- Una nozione di "elemento successivo a quello puntato";
- Una nozione di uguaglianza.

Con "sequenza" si intende qualsiasi struttura dati lungo la quale sia
possibile spostarsi dal suo primo elemento al suo ultimo elemento mediante
la nozione di elemento successivo. Ad esempio, gli array, le liste, gli
alberi e i vettori sono considerabili sequenze, ed é pertanto possibile
associarvi degli iteratori.

Un iteratore non é un puntatore templato, é invece una generalizzazione
del concetto di puntatore, e che quindi potrebbe anche non manipolare
direttamente gli indirizzi di memoria. Infatti, non esiste un "iteratore
nullo": per testare se un iteratore sta effettivamente puntando a qualcosa
oppure no, il metodo standard é di testare se stia puntando all'ultimo
elemento della sequenza #footnote[Questo permette di semplificare diversi
algoritmi, che altrimenti richiederebbero un caso speciale quando devono
gestire la fine del loro input.].

L'interfaccia `std::iterator` specifica cinque sottotipi di iteratori:

- *Forward iterator*, che permette di muoversi solamente in avanti 
  di un elemento alla volta (é l'iteratore piú semplice possibile);
- *Bidirectional iterator*, che permette di muoversi sia in avanti 
  che all'indietro di un elemento alla volta;
- *Random access iterator*, che permette di muoversi di un numero 
  arbitrario di elementi sia in avanti che all'indietro (i puntatori
  sono di fatto dei random access iterator);
- *Input iterator*;
- *Output iterator*.

La classificazione viene fatta in base a quali operazioni tali iteratori
sono in grado di supportare in maniera efficiente (in tempo lineare):

#table(
	columns: (0.15fr, 0.125fr, 0.125fr, 0.15fr, 0.15fr, 0.3fr),
	[*Categoria*], [*Output*], [*Input*], [*Forward*], [*Bidirectional*],
	[*Random Access*],
	[Read], [], [`*i`, `i->`], [`*i`, `i->`], [`*i`, `i->`], 
	[`*i`, `i->`, `[]`],
	[Write], [`*i`, `i->`], [], [`*i`, `i->`], [`*i`, `i->`], 
	[`*i`, `i->`, `[]`],
	[Iteration], [`++`], [`++`], [`++`], [`++`, `--`], 
	[`++`, `--`, `+`, `-`, `+=`, `-=`],
	[Comparison], [], [`==`, `!=`], [`==`, `!=`], [`==`, `!=`], 
	[`==`, `!=`, `<`, `>`, `<=`, `>=`],
)

La scelta di quale iteratore utilizzare dipende dalla logica della
classe. Non esiste un iteratore che sia il migliore per qualsiasi
esigenza.

Un iteratore viene implementato come sottoclasse di una classe, che
espone metodi per generarli e restituirli. Idealmente, l'iteratore
restituito da una classe dovrebbe puntare al "primo" elemento della
classe. Una classe deve fornire un iteratore speciale finale che
indica che non esiste più alcun elemento oltre ad esso; questo
non è un iteratore davvero accessibile.

Ogni iteratore deve ridefinire gli operatori `*` e `->` per permettere
l'accesso ai suoi membri, l'operatore `++` per spostarsi da un elemento
all'elemento successivo e l'operatore `==` per confrontare due iteratori
e vedere se puntano allo stesso elemento. Inoltre, ogni operatore deve
esistere in due versioni, una non-costante che permette di accedere ai
suoi membri in lettura e scrittura e una costante che permette di accedere
in sola lettura. Infine, la classe che implementa gli iteratori deve
supportare due metodi, `begin()` e `end()`, che restituiscono iteratori
rispettivamente all'inizio e alla fine della sequenza dei suoi elementi.

Si noti come un iteratore sia un oggetto a tutti gli effetti, ed è
pertanto raccomandato implementare, oltre a tutto quanto citato sopra,
anche tutti i metodi fondamentali di una classe (default constructor,
copy constructor, destructor, ecc...). Tecnicamente questo esula
dall'interfaccia standard, ma é comunque buona pratica farlo.

Per sapere come poter manipolare i dati puntati da un iteratore é
necessario che questo metta a disposizione delle informazioni relative
ai tipi di dato a cui si riferisce. L'interfaccia di `std::iterator`
riporta tali informazioni secono il seguente formato:

```
template<class Iter> struct iterator_traits {
	typedef typename Iter::iterator_category iterator_category;
	typedef typename Iter::value_type value_type;
	typedef typename Iter::difference_type difference_type;
	typedef typename Iter::pointer pointer;
	typedef typename Iter::reference reference;
}
```

Ogni classe iteratore deve quindi implementare una sua versione di
`iterator_traits`. Il significato dei campi é riportato di seguito:

- `iterator_category` indica il sottotipo di iteratore (forward iterator,
  random access iterator, ecc...);
- `value_type` indica il tipo di dato a cui l'iteratore punta (in genere,
  il tipo di dato per cui la classe container é costruita);
- `difference_type` indica il tipo di dato con cui esprimere la differenza
  fra due iteratori;
- `pointer` indica il tipo di dato ritornato dall'applicare `operator->`
  sull'iteratore;
- `reference` indica il tipo di dato ritornato dall'applicare `operator*`
  sull'iteratore.

Algoritmi differenti richiedono diversi tipi di iteratori come argomenti.
Inoltre, uno stesso algoritmo puó venire implementato con diversi gradi di
efficienza utilizzando iteratori diversi. Per questo motivo, la libreria
standard organizza i sottotipi di iteratori in una gerarchia di classi.
In questo modo, una funzione puó avere una forma per un iteratore generico
ed una o piú forme per sottotipi specifici di iteratore. La gerarchia é
la seguente:

```
	struct input_iterator_tag {};
	struct output_iterator_tag {};
	struct forward_iterator_tag : public input_iterator_tag {};
	struct bidirectional_iterator_tag : public forward_iterator_tag {};
	struct random_access_iterator_tag : public bidirectional_iterator_tag {};
```

Gli iteratori, per convenzione, devono essere sottoclassi chiamate `iterator`
(lettura e scrittura) oppure `const_iterator` (sola lettura). A seconda delle
necessitá implementative, é possibile avere solo `iterator`, solo `const_iterator`
oppure entrambe. Le due classi devono essere distinte, ciascuna con i propri metodi,
in genere praticamente identici:

```
	Class Example {
		/* ... */
	public:
		class iterator {
			/* ... */
		}
		class const_iterator {
			/* ... */
		}
	}

	int main()
	{
		Example::iterator i;
		Example::const_iterator c;
	}
```

Naturalmente, le classi iteratore devono essere riportati in una sezione 
pubblica della classe principale, altrimenti non sarebbe possibile richiederli.

La sezione privata di una classe iteratore é in genere costituita da un puntatore
ad un elemento della classe principale e da un costruttore che permette di creare
un iteratore a partire da tale puntatore. Tale costruttore dovrebbe essere privato,
ma al contempo `friend` della classe principale, di modo che possano essere costruiti
solamente passando dalla classe che contiene l'iteratore, che puó quindi filtrare
l'accesso.

Nella maggior parte dei casi, un iteratore non alloca memoria dinamica, pertanto non
é necessario scrivere esplicitamente il copy constructor, il destructor e l'operatore
assegnamento. D'altra parte, avendo scritto un costruttore privato accessibile alla
classe che lo contiene, la classe iteratore deve disporre di un default constructor
scritto esplicitamente.

L'operatore `*` applicato ad un iteratore deve ritornare il valore contenuto nel nodo
della classe container, non il nodo in sé. Questo perché gli iteratori hanno il preciso 
scopo di astrarre i dettagli implementativi della classe e poter accedere ai suoi valori
in maniera naturale. L'operatore `*` non modifica l'iteratore in sé, pertanto puó essere 
ridefinito `const`. Naturalmente, l'operatore per `iterator` deve permette l'accesso con 
modifica, mentre l'operatore per `const_iterator` l'accesso in sola lettura.

```
value_type& operator*() const
{
	return p->item();
}
```

L'operatore `->` applicato ad un iteratore deve ritornare l'indirizzo di memoria 
a cui il dato si riferisce. Anche in questo caso, l'operatore `->` puó essere 
ridefinito `const`.

```
value_type* operator->() const
{
	return &**this;
}
```

L'operatore `++` permette all'iteratore di spostarsi lungo gli elementi 
della sequenza, astraendo il concetto di "prossimo elemento" dietro la 
stessa operazione. L'operatore `++` esiste in due forme: _pre_ e _post_.
Dato che l'unica differenza fra i due é il momento in cui avviene l'operazione
(per prima o per ultima), é possibile definire l'uno in funzione dell'altro.

#grid(
	columns: (0.5fr, 0.5fr),
	[
		```
		// pre-incremento
		iterator& operator++()
		{
			/* Raggiunto l'elemento successivo */
			return *this;
		}
		```
	],
	[
		```
		// post-incremento
		iterator operator++(int dummy)
		{
			iterator tmp = *this;
			++(*this);
			return tmp;
		}
		```
	]
)

É poi necessario dotare gli iteratori di un operatore `==` che valuti
se due iteratori sono uguali e l'operatore `!=` che valuti se sono 
diversi. Questo permette, ad esempio, di capire se un iteratore si
trova alla fine della sequenza, comparandolo con l'iteratore di fine.
Si noti come sia necessario implementare sia una versione per quando
i tipi sono gli stessi (due `iterator` o due `const_iterator`) sia per
quando non lo sono (un `iterator` confrontato con un `const_iterator`
e viceversa).

Infine, é necessario introdurre un costruttore per la classe `const_iterator`
che abbia un `iterator` come input, di modo che sia possibile convertire il
secondo nel primo. Dato che si vuole che tale costruttore operi una conversione,
occorre espressamente non dichiararlo `explicit`.

Per un forward iterator, gli operatori e i costruttori sopra citati sono 
sufficienti. Per un bidirectional iterator, é necessario ridefinire anche
l'operatore `--` sulla falsa riga di quanto fatto per `++`. Per un random
access iterator, oltre a `--` é necessario ridefinire anche `[]` per potersi
spostare lungo la sequenza a partire da un indice, gli operatori di disuguaglianza
per confrontare la posizione di iteratori diversi e lo "shifting" di $n$ posizioni,
mediante `+`, `-`, `+=` e `-=`.
