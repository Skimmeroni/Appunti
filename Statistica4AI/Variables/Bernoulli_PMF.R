svg("Bernoulli_PMF.svg")
library(Rlab)

plot(xlim = c(-0.5, 1.5), ylim = c(0, 1), x = "",
     main = "Bernoulli distribution PMF", xlab = "x",
     ylab = "p(x) = P(X = x)", bty = 'n', font.lab = 2)

points(c(0, 1), dbern(c(0, 1), prob = 0.3), type = 'p', 
       pch = 21, cex = 1.5, bg = "red", col = "black")
points(c(0, 1), dbern(c(0, 1), prob = 0.5), type = 'p', 
       pch = 21, cex = 1.5, bg = "green", col = "black")
points(c(0, 1), dbern(c(0, 1), prob = 0.7), type = 'p', 
       pch = 21, cex = 1.5, bg = "blue", col = "black")

legend('topright', legend = c('p = 0.3', 'p = 0.5', 'p = 0.7'),
       col = c('red', 'green', 'blue'), pch = 21, bty = 'n')

dev.off()
