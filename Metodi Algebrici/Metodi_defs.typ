#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/ctheorems:1.1.2": *

#let example(title, content) = {
	colorbox(
		title: title,
		color: "blue",
		radius: 2pt,
		width: auto
	)[#content]
}

#let theorem = thmbox("theorem", "Teorema", fill: rgb("#e6eef5"))
#let principle = thmbox("principle", "Principio", fill: rgb("#e6eef5"))
#let proof = thmproof("proof", "Dimostrazione")
