#import "@preview/thmbox:0.2.0": *

#let theorem = theorem.with(title-fonts: "Noto Sans")
#let lemma = lemma.with(title-fonts: "Noto Sans")
#let corollary = corollary.with(title-fonts: "Noto Sans")
#let exercise = exercise.with(title-fonts: "Noto Sans")
#let proof = proof.with(title-fonts: "Noto Sans")
#let solution = proof.with(title-fonts: "Noto Sans", variant: "Solution")

#set text(
	font: "Gentium Plus",
	size: 10pt,
	lang: "en"
)
#set page(
	paper: "a4",
	header: align(right)[_Advanced Foundations of Mathematics for AI_],
	numbering: "1"
)
#set par(
	justify: true
)
#set heading(
	numbering: "1."
)
