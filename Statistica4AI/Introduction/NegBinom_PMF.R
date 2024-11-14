svg("NegBinom_PMF.svg")

plot(xlim = c(0, 35), ylim = c(0, 0.15), x = "",
     main = "Negative Binomial distribution PMF", xlab = "x",
     ylab = "p(x) = P(X = x)", bty = 'n', font.lab = 2)

points(0:35, dnbinom(0:35, size = 25, prob = 0.55), type = 'p', 
       pch = 21, cex = 1.5, bg = "red", col = "black")
points(0:35, dnbinom(0:35, size = 25, prob = 0.65), type = 'p', 
       pch = 21, cex = 1.5, bg = "green", col = "black")
points(0:35, dnbinom(0:35, size = 25, prob = 0.8), type = 'p', 
       pch = 21, cex = 1.5, bg = "blue", col = "black")

legend('topright', legend = c('p = 0.55', 'p = 0.65', 'p = 0.8'),
       col = c('red', 'green', 'blue'), pch = 21, bty = 'n')

dev.off()
