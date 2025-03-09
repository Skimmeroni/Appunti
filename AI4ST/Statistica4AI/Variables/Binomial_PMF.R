svg("Binomial_PMF.svg")

plot(xlim = c(0, 40), ylim = c(0, 0.175), x = "",
     main = "Binomial distribution PMF", xlab = "x",
     ylab = "p(x) = P(X = x)", bty = 'n', font.lab = 2)

points(0:40, dbinom(0:40, size = 40, prob = 0.3),
       type = 'p', pch = 21, cex = 1.5, bg = "red", col = "black")
points(0:40, dbinom(0:40, size = 40, prob = 0.5),
       type = 'p', pch = 21, cex = 1.5, bg = "green", col = "black")
points(0:40, dbinom(0:40, size = 40, prob = 0.7),
       type = 'p', pch = 21, cex = 1.5, bg = "blue", col = "black")

legend('topright', legend = c('size = 40, p = 0.3', 'size = 40, p = 0.5', 'size = 40, p = 0.7'),
       col = c('red', 'green', 'blue'), pch = 21, bty = 'n')

dev.off()
