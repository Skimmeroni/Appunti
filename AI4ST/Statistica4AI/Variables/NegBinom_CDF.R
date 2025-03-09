svg("NegBinom_CDF.svg")

plot(xlim = c(0, 35), ylim = c(0, 1), x = "",
     main = "Negative Binomial distribution CDF", xlab = "x",
     ylab = "F(x) = P(X ≤ x)", bty = 'n', font.lab = 2)

points(0:35, pnbinom(0:35, size = 25, prob = 0.55), type = 'p', 
       pch = 21, cex = 1.5, bg = "red", col = "black")
points(0:35, pnbinom(0:35, size = 25, prob = 0.65), type = 'p', 
       pch = 21, cex = 1.5, bg = "green", col = "black")
points(0:35, pnbinom(0:35, size = 25, prob = 0.8), type = 'p', 
       pch = 21, cex = 1.5, bg = "blue", col = "black")

legend('bottomright', legend = c('p = 0.55', 'p = 0.65', 'p = 0.8'),
       col = c('red', 'green', 'blue'), pch = 21, bty = 'n')

dev.off()
