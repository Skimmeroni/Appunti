#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.2"
#import "@preview/quill:0.6.1": *

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#e7f7e6"))
#let lemma = thmbox("lemma", "Lemma", fill: rgb("#f7ebf4"))
#let corollary = thmbox("corollary", "Corollary", fill: rgb("#f7ebf4"))
#let proof = thmproof("proof", "Proof")
#let exercise = thmbox("exercise", "Exercise", fill: rgb("#e9eef7"))
#let solution = thmproof("solution", "Solution")

#let ket(x) = $|#x angle.r$
#let bra(x) = $angle.l #x|$
#let braket(x, y) = $angle.l #x|#y angle.r$
#let ketbra(x, y) = $|#x angle.r angle.l #y|$
