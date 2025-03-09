#import "../C++_definizioni.typ": *

*Doxygen* é uno strumento che permette di generare documentazione del codice
C++ in maniera automatica a partire da dei commenti propriamente formattati.
Tali commenti é best practise riportarli nei file header in cui sono riportate
le firme dei metodi.

Doxygen riconosce un commento speciale tipo perché é un commento multilinea
che inizia con un doppio asterisco:

```
/**

Comment to be generated goes here...

*/
```

Doxygen formatta la documentazione per mezzo di _direttive_, parole chiave
che iniziano con `@`. Una prima direttiva che é bene porre é `@brief`, con
cui viene specificata una descrizione sommaria (lunga una sola riga) della
funzione e del suo significato. Un commento piú descrittivo puó essere
riportato lasciando una riga vuota.

```
/**
	@brief brief description goes here...

	longer description goes here...
*/
```

La direttiva `@param` permette di descrivere un parametro di una funzione; una
direttiva `@param` va riportata per ogni parametro della funzione. La direttiva
`@return` descrive il valore di ritorno della funzione.

```
/**
	@param first parameter is this... and does that...
	@param second parameter is this... and does that...

	@param nth parameter is this... and does that...

	@return return value is this... and does that...
*/
```

#exercise[
	```
	/**
		@brief Computes the Euclidean distance

		Computes the Euclidean distance between two points

		@param x1 the x-coordinate of the first point
		@param x2 the x-coordinate of the second point
		@param y1 the y-coordinate of the first point
		@param y2 the y-coordinate of the second point

		@return the Euclidean distance
	*/

	float euclidean_distance(float x1, float x2, float y1, float y2);
	```
]

La direttiva `@pre` permette di descrivere una _precondizione_ necessaria
affinchè un metodo o una classe funzioni correttamente. Ha particolare
valore per documentare il senso degli `assert`. La direttiva `@post` 
permette di descrivere una _postcondizione_.

#exercise[
	```
	/**
		@brief Computes the Pearson correlation coefficient 

		@pre sigmaX != 0
		@pre sigmaY != 0
	*/

		float pearson_coefficient(float covariance, float sigmaX, float sigmaY)
		{
			assert(sigmaX != 0);
			assert(sigmaY != 0);

			...
		}
	```
]
