#import "@preview/showybox:2.0.1": showybox

Un *iteratore* é un oggetto che generalizza il concetto di puntatore. Un
iteratore permette di "scorrere" lungo i campi di una classe (specialmente
se tale classe é un container) in maniera specializzata rispetto alla struttura
della classe. Un iteratore viene definito come una classe all'interno della
classe stessa, ed espone metodi che permettono di accedere e scorrere sui
campi della classe. Gli iteratori possono essere implementati in maniera
standard implementando delle interfacce pubbliche.

Gli iteratori esistono in cinque forme principali:

- *Random access iterator*, che permette di accedere agli elementi della
  classe in maniera randomica (di fatto emulando i puntatori);
- *Forward iterator*, che permette di muoversi solamente in avanti di un
  elemento alla volta;
- *Bidirectional iterator*, che permette di muoversi sia in avanti che
  all'indietro di un elemento alla volta;
- *Input iterator*;
- *Output iterator*.
