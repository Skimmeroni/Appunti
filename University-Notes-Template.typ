#let university-notes(
	title: none,
	doc,
) = {
	set text(
		font: "Gentium Plus",
		size: 11pt,
		lang: "en"
	)
	set page(
		paper: "a4",
		header: align(right)[#title],
		numbering: "1"
	)
	set par(justify: true)
	set heading(numbering: "1.")

	show heading.where(level: 1): set text(size: 24pt)
	show heading.where(level: 2): set text(size: 18pt)
	show heading.where(level: 3): set text(size: 14pt)
	show heading: set block(above: 1.4em, below: 1em)

	show figure.caption: set text(size: 9pt)
	show figure: set block(breakable: true)

	set table(
		inset: (
			x: 15pt,
			y: 9pt,
		),
		fill: (x, y) =>
		if y == 0 {
			rgb("#d6ffff")
		}
	)

	show table.cell: set text(size: 9pt, font: "Noto Sans")

	set document(
		title: "Notes on " + title,
		author: "Shania",
		date: auto
	)

	show link: underline
	doc
}
