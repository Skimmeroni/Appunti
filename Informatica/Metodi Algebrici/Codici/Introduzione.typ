#import "../Metodi_defs.typ": *

Prende il nome di *sistema di comunicazione* la struttura di seguito
schematizzata:

#set math.mat(delim: none)
$ mat(
	space, space, space, space, "rumore", space, space, space, space;
	space, space, space, space, arrow.b, space, space, space, space;
	"Trasmettitore", attach(-->, t: m), "Codificatore", attach(-->, t: x),
	"Canale", attach(-->, t: y), "Decodificatore", attach(-->, t: tilde(m)),
	"Ricevitore";
) $

La descrizione dei componenti é qui riportata:

- Trasmettitore: emette il messaggio $m$;
- Codificatore: traduce il messaggio $m$ nella parola $x$
  in modo che possa attraversare il canale;
- Canale: mezzo attraverso il quale viaggiano le parole;
- Decodificatore: trasforma la parola $y$ in uscita dal canale
  nel messaggio $tilde(m)$;
- Ricevitore: riceve il messaggio $tilde(m)$;
- Rumore: disturbi di vario genere che potrebbero alterare le parole.

In una situazione ideale, il segnale inviato $x$ ed il segnale ricevuto
$y$ dovrebbero coincidere. In uno scenario piú realistico, i due segnali
saranno piú o meno diversi, in quanto ogni canale di comunicazione é
soggetto a rumore, e quindi parte dell'informazione giunta a destinazione
differirá dall'originale. In termini molto generali, i tipi di errori
che possono presentarsi nella trasmissione di un segnale $x$ e nella
ricezione del segnale $y$ sono tre:

- Parte dell'informazione contenuta in $x$ viene alterata;
- Parte dell'informazione contenuta in $x$ viene perduta;
- Il segnale $x$ si ritrova ad avere piú informazioni dell'originale
  quando viene ricevuto.

Essendo la presenza di tali errori inevitabile, l'interesse é quello di
costruire canali di comunicazione che, pur essendo vulnerabili al rumore,
sono comunque in grado di tollerarlo, di modo che il messaggio ricevuto
$tilde(m)$ sia una buona approssimazione di quello inviato $m$.
