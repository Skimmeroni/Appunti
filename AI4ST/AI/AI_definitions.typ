#import "@preview/algo:0.3.6": algo, i, d, comment, code
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.4"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/board-n-pieces:0.6.0": board, position
#import "@preview/syntree:0.2.1": syntree
#import "@preview/game-theoryst:0.1.0": *

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#e7f7e6"))
#let lemma = thmbox("lemma", "Lemma", fill: rgb("#f7ebf4"))
#let corollary = thmbox("corollary", "Corollary", fill: rgb("#f7ebf4"))
#let proof = thmproof("proof", "Proof")
#let exercise = thmbox("exercise", "Exercise", fill: rgb("#e9eef7"))
#let solution = thmproof("solution", "Solution")

#let dsl = $bracket.l.double$
#let dsr = $bracket.r.double$
