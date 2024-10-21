#import "@preview/showybox:2.0.1": showybox

In C++, esistono tre modi per passare un parametro ad una funzione. Di base,
quando un valore viene passato ad una funzione, il parametro di tale funzione
viene inizializzato con il valore passato. Al di lá di questo, che é comune a
tutti i modi, i modi sono i seguenti:

- *Passaggio per valore*, in cui viene semplicemente creata una copia locale
  alla funzione del parametro che viene passato, e tale copia non influenza
  in alcun modo la versione originale del dato nota alla funzione chiamante;
- *Passaggio per puntatore*, in cui viene passato un puntatore ad una risorsa
  nota alla funzione chiamante. Questo significa che se la funzione chiamata
  manipola il dato associato al puntatore, tale valore viene modificato anche
  rispetto alla funzione chiamante. Se nella funzione chiamata viene modificato
  il puntatore in sé, sia il puntatore originale che l'oggetto a cui si
  riferisce rimangono comunque intatti;
- *Passaggio per referenza*, in cui viene passata una reference ad un dato
  noto alla funzione chiamante; se la funzione chiamata lo modifica, tale
  modifica si ripercuote anche sul dato originale.

#showybox[
	```
	#include <iostream>

	void fun1(int j)
	{
		j = j / 2;
	}

	void fun2(int* j)
	{
		*j = *j + 3;
		int x = 30;
		j = &x;         // Nothing changes for i
	}

	void fun3(int& j)
	{
		j = j * 2;
		int& x = j;
		x++;            // Something changed for i
	}

	int main()
	{
		int i = 10;
		fun1(i);         // Nothing changes

		int* g = &i;
		fun2(g);        // i is now 13

		int& r = i;
		fun3(r);        // i is now 27

		return 0;
	}
	```
]
