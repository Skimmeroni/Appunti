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
	show heading.where(level: 1): set text(size: 18pt)
	show heading.where(level: 2): set text(size: 14pt)
	show heading: set block(above: 1.4em, below: 1em)

	set document(
		title: "Notes on " + title,
		author: "Shania",
		date: auto
	)

	show link: underline
	doc
}
