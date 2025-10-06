#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/cetz-plot:0.1.3": plot

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#e7f7e6"))
#let axiom = thmbox("axiom", "Axiom", fill: rgb("#d6ffff"))
#let lemma = thmbox("lemma", "Lemma", fill: rgb("#f7ebf4"))
#let corollary = thmbox("corollary", "Corollary", fill: rgb("#f7ebf4"))
#let proof = thmproof("proof", "Proof")
#let exercise = thmbox("exercise", "Exercise", fill: rgb("#e9eef7"))
#let solution = thmproof("solution", "Solution")
