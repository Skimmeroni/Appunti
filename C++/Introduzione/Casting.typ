#import "@preview/showybox:2.0.1": showybox

Cosí come in (quasi) tutti i linguaggi di programmazione tipizzati, in C++ é
possibile fare *casting*, ovvero trasformare il tipo di dato di una variabile
in un tipo di dato diverso, purché compatibile. Alcuni cast sono *impliciti*,
ovvero dove il compilatore opera "dietro le quinte" un cambio di tipo se questo
é in grado di intuirlo da solo. Questo é comodo, perché non é necessario
specificare istruzioni aggiuntive, ma puó essere rischioso perché potrebbe
diventare difficile ricostruire a ritroso che tale casting é avvenuto. Il
cast C *esplicito* ha invece questa forma:

```
var_type1 = (Type1)var_type2
```

C++, per quanto possa utilizzare i due cast sopra citati, possiede i seguenti
cast speciali:

```
var_type1 = static_cast<Type1>(var_type2)
var_type1 = const_cast<Type1>(var_type2)
var_type1 = reinterpret_cast<Type1>(var_type2)
var_type1 = dynamic_cast<Type1>(var_type2)
```

- `static_cast` é sostanzialmente analogo al casting esplicito del C;
- `const_cast` é un cast speciale utile per "de-proteggere" i dati,
  permettendo di accedere ad un dato costante attraverso un puntatore;
- `reinterpret_cast` é un cast speciale che "forza" un cast anche quando
  questo porta a conclusioni ambigue, di fatto "reinterpretando" il significato
  dei singoli byte;
- `dynamic_cast` é un cast speciale che permette di fare downcasting in una
  gerarchia di classi.

#showybox[
	```
	int i;
	double d;
	i = static_cast<int>(d);              // Similar to i = (int)d in C fashion

	int* pi;
	const int* cpi = &i;
	pi = static_cast<int*>(cpi);          // NOT allowed, can't edit i through cpi
	pi = const_cast<int*>(cpi);           // Allowed

	char* c;
	c = reinterpret_cast<char*>(&i);      // Allowed, integer now a char sequence
	*(c + 2)                              // Editing i byte by byte
	```
]
