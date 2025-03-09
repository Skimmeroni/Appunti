#import "../C++_definizioni.typ": *

La compilazione avviene invocando un compilatore per il linguaggio C++, 
come `gcc` o `clang`. Per generare un file oggetto `file.o` a partire da 
un file sorgente `file.cxx` è necessario invocare il compilatore con il
flag `-c`:

```
	$ gcc -c file.cxx -o file.o
```

Il flag `-o`, opzionale, serve ad esplicitare il nome che avrà il
file oggetto generato. Se non riportata, come nome viene scelto
automaticamente il nome del file originale con l'estensione
cambiata in `.o`.

Per linkare i file oggetto `file1.o`, `file2.o` e `file3.o` in
un file eseguibile non è necessario alcun flag obbligatorio:

```
	$ gcc file1.o file2.o file3.o -o file.exe
```

Se il flag `-o` non viene riportato, come nome di default un
file eseguibile avrà sempre `a.out`.

I file header non vanno compilati, pertanto non è necessario
notificare il compilatore della presenza di tali file. Tuttavia,
è possibile notificare al compilatore di considerare dei percorsi
extra nella ricerca degli header file con il flag `-I`. Mediante
`:` è possibile includere più di un percorso:

```
	$ gcc -I/extra/path1:/extra/path2:/extra/path3 -c file.cxx -o file.o
```

Un progetto complesso è in genere costituito da più cartelle e
sottocartelle, di modo da organizzare i file in maniera più chiara.
Spesso, i file sorgente si trovano in una cartella chiamata `src`
ed i file header in una cartella chiamata `include`. L'unico file
che si trova nella cartella principale è `main.cxx`.

```	
.
|--- main.cxx
|--- src
|    |--- file1.cxx
|    |--- file2.cxx
|    |--- ...
|--- include
     |--- file1.h
     |--- file2.h
     |--- ...
```

#exercise[
	Si consideri il seguente progetto C++:

	```
	.
	|--- main.cxx
	|--- src
	|    |--- Point.cxx
	|    |--- Rectangle.cxx
	|    |--- Circle.cxx
	|--- include
			|--- Point.h
			|--- Rectangle.h
			|--- Circle.h
	```

	Potrebbe venire compilato in questo modo:

	```
	$ gcc -c -Iinclude main.cxx -o main.o
	$ gcc -c -Iinclude src/Point.cxx -o Point.o
	$ gcc -c -Iinclude src/Rectangle.cxx -o Rectangle.o
	$ gcc -c -Iinclude src/Circle.cxx -o Circle.o
	$ gcc main.o Point.o Rectangle.o Circle.o -o main
	```
]

Modificare un file di un progetto potrebbe influire o non
influire su altri file, e di conseguenza potrebbe essere
o non essere necessario ricompilarli. Per avere una migliore
idea del modo in cui i file dipendono gli uni dagli altri è
possibile rappresentare questa interdipendenza mediante un
*grafo delle dipendenze*. Tale grafo è composto da tre 
sottografi:

- *Dipendenze di inclusione*. Rappresentano la relazione che 
  intercorre tra i file che vengono inclusi l'uno nell'altro,
  in genere header files. Se un file `A.cxx` (o `A.h`) necessita
  di importare un file `B.h` (o `B.cxx`), allora esiste un arco
  che unisce `A.cxx` (o `A.h`) e `B.h` (o `B.cxx`);
- *Dipendenze di compilazione*. Rappresentano la relazione fra
  i file oggetto ed i file sorgente necessari alla loro compilazione.
  Se un file oggetto `A.o` necessita di un file sorgente `B.cxx`
  per poter essere compilato, allora esiste un arco che unisce
  `A.o` e `B.cxx`;
- *Dipendenze di linking*. Rappresentano la relazione che
  intercorre tra un eseguibile ed i file oggetto necessari
  alla sua costruzione. Se un eseguibile `A` necessita di
  un file oggetto `B.o`, allora esiste un arco che unisce
  `A` e `B.o`.

Sfruttare il grafo delle dipendenze permette di evitare
ricompilazioni inutili, ricompilando quando necessario
solamente i file che è effettivamente necessario ricompilare.
Tuttavia, è possibile evitare di dover controllare manualmente
il grafo mediante il programma `make`.

`make` è uno strumento in grado di determinare in maniera del 
tutto automatica quando un file di un progetto C++ #footnote[
`make` può essere utilizzato per gestire qualsiasi progetto che
faccia uso di un linguaggio compilato, come `C` o `LaTeX`.]
necessita di essere ricompilato e quali sono i file che, a sua
volta, devono essere ricompilati per introdurre il cambiamento.
`make` fa uso di un file speciale, chiamato `Makefile`, che
contiene una rappresentazione testuale del grafo delle dipendenze
del progetto.

Un `Makefile` è costituito da una serie di *target*. Ogni target è
riportato su una riga, seguita dal carattere `:` e da uno o più
file separati da spazi. Il target rappresenta un nodo del grafo
delle dipendenze, mentre i file alla destra di `:` rappresentano
i nodi con il quale tale nodo ha un arco.

```
	target: file1 file2 ... fileN
```

Al di sotto di ciascun target ed indentato di un tab sono riportate
tutte le azioni che è necessario compiere per compilare tale target.

```
	target: file1 file2 ... fileN
	<TAB> command1
	<TAB> command2
	<TAB> ...
	<TAB> commandN
```

Il comando `make`, se eseguito senza parametri, cerca di eseguire le 
azioni specifiche per il target che si trova più in alto nel file che
si chiama `Makefile`.

```
$ make
```

Per indicare a `make` di scegliere un target specifico, è sufficiente
riportarlo di seguito a `make`. Più target possono essere riportati;
in tal caso, verranno eseguite le relative azioni ordinatamente.

```
$ make target1 target2 ... targetN
```

Le azioni relative ad un certo target vengono eseguite solamente
se uno o più file fra quelli riportati a destra di `:` sono stati
modificati. Se uno fra questi file è un target a sua volta, anche
tale target viene gestito. In questo modo, la risoluzione delle
interdipendenze fra i target viene gestita in maniera ricorsiva.

Per determinare se è necessario eseguire le azioni relative ad un
target, `make` ne controlla il _timestamp_: se almeno uno dei file
che si trovano alla destra di `:` è stato modificato per l'ultima
volta dopo l'ultima modifica del target, allora `make` esegue le
azioni relative al target. Si noti come le azioni relative al target
sono eseguite a prescindere dall'entità della modifica: anche se un
file a destra di `:` viene modificato lasciando intatta la semantica
(ad esempio, aggiungendo un commento), le azioni sono eseguite comunque.

Se il `Makefile` non ha per nome "`Makefile`", occorre specificarne
il nome invocando `make` con il flag `-f`.

```
$ make -f makefile_filename target1 target2 ... targetN
```

Di norma, appena un target fallisce per un qualsiasi motivo, `make`
fallisce. Specificando il flag `-k` è possibile spingere `make` a
non fermarsi al primo errore ma proseguire comunque.

Oltre ai target, in un `Makefile` è possibile definire delle
variabili che verranno poi valutate quando tale viene processato
da `make`. Le variabili di un `Makefile` non hanno tipo, e vengono
dichiarate con la medesima sintassi del C++. Per convenzione, sono
in maiuscolo:

```
VARIABLE = values
```

Per riferirsi ad una variabile all'interno del `Makefile` è
sufficiente racchiuderla fra parentesi tonde e accodare `$`
in testa:

```
$(VARIABLE)
```

Nello specifico caso dei `Makefile` per il C++, variabili utili
da definire sono le seguenti:

- `CXX`, che indica quale compilatore C++ da utilizzare;
- `CXXFLAGS`, che indica quali flag è necessario passare al compilatore;
- `LDFLAGS`, che indica quali flag è necessario passare al linker.

#exercise[
	```
	CXX = g++
	CXXFLAGS = -Wall -g -Iinclude
	LDFLAGS = -Wl

	main.exe: Point.o Rectangle.o main.o
		$(CXX) $(LDFLAGS) -o main.exe Point.o Rectangle.o main.o

	main.o: main.cxx
		$(CXX) $(CXXFLAGS) -c main.cxx -o main.o

	Rectangle.o: Rectangle.cxx
		$(CXX) $(CXXFLAGS) -c src/Rectangle.cxx -o Rectangle.o

	Circle.o: Circle.cxx
		$(CXX) $(CXXFLAGS) -c src/Circle.cxx -o Circle.o

	Point.o: Point.cxx
		$(CXX) $(CXXFLAGS) -c src/Point.cxx -o Point.o
	```
]

Oltre alle variabili definite dall'utente, è possibile utilizzare
delle variabili che `make` interpreta in maniera automatica. Le più
importanti sono le seguenti:

- `$@`, che indica il target corrente;
- `$%`, che indica il target corrente, membro di un archivio;
- `$^`, che indica tutte le dipendenze del target corrente, separate
  da spazi;
- `$<`, che indica la prima dipendenza del target corrente
  (quella più a sinistra);
- `$?`, che indica le dipendenze del target corrente che sono
  state aggiornate più di recente;
- `$+`, che indica tutte le dipendenze del target corrente, con
  i duplicati in ordine.

Talvolta potrebbe essere necessario avere dei target che non sono
associati ad alcun file reale. Target di questo tipo possono essere
indicati mediante `.PHONY`:

```
.PHONY: target_name
target_name:
<TAB> command1
<TAB> command2
<TAB> ...
<TAB> commandN
```

Uno degli utilizzi più comuni di `.PHONY` è quello di avere un 
target che permetta di eliminare tutti i file oggetto, di modo
da essere assolutamente certi di ripartire dalla situazione 
iniziale. Tale target è in genere chiamato `clean`:

```
.PHONY: clean
clean:
	rm -rf *.o *.exe
```
