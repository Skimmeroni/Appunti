#import "@preview/algo:0.3.6": algo, i, d, comment, code
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.4"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/syntree:0.2.1": syntree
#import "@preview/game-theoryst:0.1.0": *

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#e7f7e6"))
#let lemma = thmbox("lemma", "Lemma", fill: rgb("#f7ebf4"))
#let corollary = thmbox("corollary", "Corollary", fill: rgb("#f7ebf4"))
#let proof = thmproof("proof", "Proof")
#let exercise = thmbox("exercise", "Exercise", fill: rgb("#e9eef7"))
#let solution = thmproof("solution", "Solution")

#let pseudocode(content: [], title: "", parameters: ()) = algo(
                content,
                stroke: 0pt,
                indent-guides: 1pt + gray,
                fill: none,
                main-text-styles: (font: "New Computer Modern Math"),
                comment-styles: (font: "New Computer Modern Math", fill: rgb(45%, 45%, 45%)),
                line-number-styles: (font: "New Computer Modern Math"),
                keywords: ("if", "else", "then", "while", "for", "foreach", "do",
                           "until", "and", "or", "not", "in", "let", "return", "to"),
                title: title,
                parameters: parameters)

#let dsl = $bracket.l.double$
#let dsr = $bracket.r.double$
