#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.4.0"
#import "@preview/metro:0.3.0": unit, units, prefixes, num
#import units: *
#import prefixes: *

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#e7f7e6"))
#let lemma = thmbox("lemma", "Lemma", fill: rgb("#f7ebf4"))
#let corollary = thmbox("corollary", "Corollary", fill: rgb("#f7ebf4"))
#let proof = thmproof("proof", "Proof")
#let exercise = thmbox("exercise", "Exercise", fill: rgb("#e9eef7"))
#let solution = thmproof("solution", "Solution")
