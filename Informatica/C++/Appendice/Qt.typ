#import "../C++_definizioni.typ": *

*Qt* è una libreria open source per lo sviluppo di GUI cross-platform
(PC, dispositivi mobili e sistemi embedded), con supporto ai maggiori
sistemi operativi (Windows, Linux, MacOS, Android, iOS). Essendo scritta
nel linguaggio C++, si integra con quest'ultimo in maniera nativa.

Un programma che fa uso di Qt può essere scritto in maniera standard
oppure sfruttando un IDE apposito come QtCreator, che permette di
costruire interfacce grafiche in maniera interattiva e visiva.

Un codice Qt è inizialmente indipendente dalla piattaforma. Viene declinato
verso una piattaforma specifica per mezzo di *qmake*, un build system che
genera automaticamente un `Makefile` che si adatta alla piattaforma su cui
fare il deployment. Questo viene fatto a partire da un file con estensione
`.pro` che contiene le informazioni relative a quali parti della libreria
Qt è necessario importare.

```
qmake -project
qmake project_name.pro
make
```

Molte classi C++ in Qt sfruttano il meccanismo di *condivisione implicita*
per massimizzare l'impiego di risorse. Una interfaccia grafica è composta
di diverse componenti, che possono condividere le risorse, creando un
puntatore ai dati anzichè modificare i dati stessi, a meno che lo stato
dell'oggetto venga modificato. Un oggetto condiviso può essere copiata in
due modi: sdoppiando l'oggetto (*copia deep*) oppure creando un puntatore
al blocco di dati condiviso (*copia shallow*). La procedura di copia è
completamente automatizzata e gestita dalla libreria Qt (anche in caso
di multithreading).

#exercise[
  ```
  QPixmap p1, p2;
  p1.load("image.ppm");
  p2 = p1;                // p2 and p1 share data

  QPainter paint;
  paint.begin(&p2);       // p2 and p1 are detached
  paint.drawText(0, 50, "Hello, World!");    
  paint.end();
  ```
]

Le proprietà di un oggetto Qt possono essere ispezionate
e (eventualmente) modificate rispettivamente mediante
`QObject::property()` e `QObject::setProperty()`.

#exercise[
  ```
  QPushButton* button = new QPushButton;
  QObject* object = new Object;

  button->setDown(true);
  object->setProperty("down", true);
  ```
]

Informazioni aggiuntive per una classe possono essere specificate
per mezzo della macro `Q_CLASSINFO`:

```
Q_CLASSINFO(name, value)
```

#exercise[
  ```
  Q_CLASSINFO("Version", "3.0.0")
  ```
]

Oltre agli widget, la libreria Qt gestisce anche gli *eventi*, oggetti
derivati dalla classe `QEvent` e gestibili da qualsiasi istanza di una
sottoclasse `QObject`. Una istanza di `QObject` può supportare uno o
più tipi di eventi, in genere specializzati per ciascuna classe. Gli
eventi possono essere gestiti utilizzando funzioni virtuali oppure
reimplementando la funzione della classe.

A volte un oggetto deve osservare ed eventualmente intercettare gli
eventi che vengono consegnati ad un altro oggetto, ad esempio per
poter reagire solamente in presenza di una certa precondizione. La
funzione `QObject::installEventFilter()` consente ad un oggetto di
filtrare gli eventi di un oggetto target.

Oltre al ricevere eventi (click, keypress, ecc...) è anche possibile
inviare (o simulare) eventi mediante `QCoreApplication::sendEvent()`
e `QCoreApplication::postEvent()`. La prima invia l'evento immediatamente,
la seconda accoda l'evento in uno stack di eventi, venendo poi gestito
quando viene estratto dalla coda.

Per poter utilizzare attività temporizzate è necessario che l'applicazione
abbia un _event loop_, un ciclo che gestisce gli eventi uno per uno restando
idle quando non c'è nulla da gestire. L'event loop viene inizializzato
mediante `QApplication::exec()`. `QObject::startTimer()` avvia un timer
con un intervallo in millisecondi come argomento e restituisce un ID,
mentre `QObject::killTimer()` interrompe il processo avente l'argomento
per ID.

Ogni componente grafica di un programma Qt prende il nome di *widget*;
esempi di widget sono bottoni, barre, menu, ecc... Un widget non è
necessariamente un oggetto a sè stante, ma potrebbe contenere degli
widget a sua volta. La maggior parte delle applicazioni utilizzano
una `QMainWindow` o un `QDialog` come finestra principale dell'applicazione.

L'oggetto più semplice è `QLabel`, che permette di visualizzare
in maniera non interattiva testo e/o immagini. Sebbene possa infatti
reagire a degli eventi, l'utente non ha modo di interagirvi. Permette
di mostrare a schermo del testo mediante `QString::setText()`, delle
immagini mediante `QPixmap::setPixmap()` o dei video mediante
`QMovie::setMovie()`. I metodi `setAlignment()` e `setIndent()`
permettono di posizionare il contenuto del widget rispetto ai suoi
estremi; di default, il contenuto di `QLabel` è centrato e allineato
a sinistra.

#exercise[
  ```
  #include <QApplication>
  #include <QLabel>

  int main(int argc, char** argv)
  {
      QApplication a(argc, argv);
      QLabel label("Hello, World!");
      label.show();

      return a.exec();
  }
  ```
]

`QPushButton` scatena l'evento `clicked()` quando viene cliccato sul
bottone. Tale evento è associato ad una funzione, detta *slot*, che
deve essere eseguita. I segnali e gli slot sono i modi in cui gli 
oggetti Qt sono in grado di comunicare. Uno slot è sostanzialmente
analogo ad una normale funzione C++, con la differenza che non può
(non dovrebbe) essere chiamata "manualmente", mentre deve invece agire
esclusivamente in risposta ad un segnale.

```
connect(sender, SIGNAL(name_of_the_signal()), receiver, SLOT(name_of_the_slot()))
```

#exercise[
  ```
  #include <QApplication>
  #include <QPushButton>

  int main(int argc, char** argv)
  {
      QApplication a(argc, argv);
      QPushButton* button = new QPushButton("Click here to quit");   // Add a button

      QObject::connect(button, SIGNAL(clicked()),                    // Handle the event,
                       &app, SLOT(quit()));                          // Quitting the program

      button->show();
      return a.exec();
  }
  ```
]

Gli eventi ed i segnali sono concettualmente simili, dato che in
entrambi i casi si parla di interazioni che modificano lo stato
del programma scatenando una risposta. La differenza sta nel fatto
che gli eventi sono stimoli esterni, come la pressione di un pulsante
o il click del mouse, mentre invece i segnali sono generati di proposito
da uno degli widget per comunicare con gli altri o con il programma. I
segnali figurano quando un widget viene _usato_, perchè permettono la
comunicazione fra le parti, mentre gli eventi figurano quando un widget
viene _implementato_, perchè permettono di specificare a cosa un widget
debba reagire ed in che modo.
