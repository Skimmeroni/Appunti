# Appunti

Appunti su alcuni corsi delle facoltá di __Informatica__ e di __Artificial Intelligence for Science and Technology__ all'_Universitá degli Studi di Milano - Bicocca_. I primi sono in italiano, i secondi in inglese. La qualitá puó variare.

## Compilare da sorgente

Nelle varie cartelle sono giá presenti i file PDF precompilati, quindi basta scaricare quelli (o clonare l'intera repo).

Se si volesse comunque compilare i file sorgente, questi sono scritti con [Typst](https://typst.app), un sostituto moderno di LaTeX:

```
typst compile filename.typ
```

Oltre a queste, sono presenti diversi frammenti di codice e/o di grafici. Il codice C/C++ é corredato di Makefile per guidare la compilazione. Gli script Python e R possono essere eseguiti immediatamente, tranne il codice Python che sfrutta SWIG e che richiede di generare il codice C corrispondente.

## Nota

Alcuni appunti molto vecchi sono scritti in [SILE](https://sile-typesetter.org). L'idea é quella di, prima o poi, riscriverli in Typst.
