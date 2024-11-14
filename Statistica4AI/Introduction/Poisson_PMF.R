svg("Poisson_PMF.svg")

plot(xlim = c(0, 20), ylim = c(0, 0.4), x = "",
     main = "Poisson distribution PMF", xlab = "x",
     ylab = "p(x) = P(X = x)", bty = 'n', font.lab = 2)

points(0:20, dpois(0:20, lambda = 1), type = 'p', 
       pch = 21, cex = 1.5, bg = "red", col = "black")
points(0:20, dpois(0:20, lambda = 4), type = 'p', 
       pch = 21, cex = 1.5, bg = "green", col = "black")
points(0:20, dpois(0:20, lambda = 10), type = 'p', 
       pch = 21, cex = 1.5, bg = "blue", col = "black")

legend('topright', legend = c('λ = 1', 'λ = 4', 'λ = 10'),
       col = c('red', 'green', 'blue'), pch = 21, bty = 'n')

dev.off()
