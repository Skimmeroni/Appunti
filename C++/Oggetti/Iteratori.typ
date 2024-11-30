#import "@preview/showybox:2.0.1": showybox

Un *iteratore* é un oggetto che generalizza il concetto di puntatore. 
Un iteratore permette di "scorrere" lungo gli elementi di una classe 
(specialmente se tale classe é un container) in maniera specializzata 
rispetto alla struttura della classe. Gli iteratori esistono in cinque 
forme principali:

- *Forward iterator*, che permette di muoversi solamente in avanti 
  di un elemento alla volta;
- *Bidirectional iterator*, che permette di muoversi sia in avanti 
  che all'indietro di un elemento alla volta;
- *Random access iterator*, che permette di muoversi di un numero 
  arbitrario di elementi sia in avanti che all'indietro (i puntatori
  sono di fatto dei random access iterator);
- *Input iterator*;
- *Output iterator*.

La scelta di quale iteratore utilizzare dipende dalla logica della 
classe. Le operazioni supportate da ciascun iteratore sono riassunte
di seguito:

#table(
	columns: (0.15fr, 0.125fr, 0.125fr, 0.15fr, 0.15fr, 0.3fr),
	[*Categoria*], [*Output*], [*Input*], [*Forward*], [*Backward*], 
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

Un iteratore è un oggetto completamente slegato dalla classe a cui si 
riferisce; l'iteratore è solo un "tramite" per accedere agli elementi
di una classe, non li possiede effettivamente. Un iteratore espone dei 
dati come fossero una sequenza, anche se questi potrebbero provenire 
da una struttura dati di qualsiasi tipo. 

Un iteratore viene chiesto ad una classe, che fornisce un iteratore 
inizializzato (idealmente) facendo riferimento al "primo" elemento
della classe. Una classe deve fornire un iteratore speciale finale 
che indica che non esiste più alcun elemento oltre ad esso; questo
non è un iteratore davvero accessibile.

Un iteratore viene definito come una classe all'interno della classe
stessa, ed espone metodi che permettono di accedere e scorrere sugli
elementi della classe. Gli iteratori possono essere implementati in 
maniera standard implementando delle interfacce pubbliche, che si 
trovano negli header file `iterator` e `cstddef`. In particolare, 
la libreria standard si aspetta che una classe che implementa gli 
iteratori contenga (almeno):

- Un tipo (definito come classe) membro `iterator`, che permette 
  l'accesso ai dati della classe in lettura e scrittura;
- Un tipo (definito come classe) membro `const_iterator`, che permette 
  l'accesso ai dati della classe in sola lettura sull'oggetto `const`;
- Una funzione membro `begin`, che ritorna un iteratore che si 
  riferisce al primo elemento della sequenza. Deve esistere una
  versione per `iterator` ed una per `const_iterator`; 
- Una funzione membro `end`, che ritorna un iteratore che si riferisce
  all'ultimo elemento della sequenza. Deve esistere una versione per 
  `iterator` ed una per `const_iterator`.

Oltre a queste funzioni, un iteratore è un oggetto a tutti gli effetti,
ed è pertanto necessario implementare tutti i metodi fondamentali di 
una classe (default constructor, copy constructor, destructor, ecc...).
Inoltre, dato che un iteratore necessita di "scorrere" lungo gli 
elementi di un oggetto, è anche necessario ridefinire gli operatori
di incremento/decremento di modo che il loro significato sia lo 
spostarsi di una posizione (avanti o indietro). Infine, per un 
iteratore occorre ridefinire gli operatori di confronto, per poter
verificare se si è giunti alla fine della sequenza oppure no.
