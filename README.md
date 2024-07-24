# Appunti

Appunti su alcuni corsi della facoltá di Informatica all'_Universitá degli Studi di Milano - Bicocca_.

## Compilare da sorgente

Nelle varie cartelle sono giá presenti i file PDF precompilati, quindi basta scaricare quelli (o clonare l'intera repo).

Se si volesse comunque compilare i file sorgente, questi sono scritti con [SILE](https://sile-typesetter.org), un sostituto moderno di LaTeX. Banalmente:

```
sile filename.sil
```

Oltre ai pacchetti inclusi di default in SILE, servono `ptable` per tabelle e box di testo e `textsubsuper` per il testo in apice/pedice.

Ora sto sperimentando con [Typst](https://typst.app), probabilmente riscriveró gli appunti in questo linguaggio. Per compilare:

```
typst compile filename.typ
```

I diagrammi sono scritti con [Pikchr](https://pikchr.org). I file SVG che questo restituisce possono poi essere convertiti in PDF con, ad esempio, [CairoSVG](https://cairosvg.org) o [Inkscape](https://inkscape.org):

```
pikchr --svg-only filename.pikchr | cairosvg -o filename.pdf -
```
