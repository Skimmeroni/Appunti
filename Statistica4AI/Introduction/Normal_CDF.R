svg("Normal_CDF.svg")

plot(xlim = c(-5, 5), ylim = c(0, 1), x = "", type = "l",
     main = "Normal distribution CDF", xlab = "x",
     ylab = "F(x) = P(X ≤ x)", bty = 'n', font.lab = 2)

points(seq(-5, 5, 1/1000), pnorm(seq(-5, 5, 1/1000), mean = 0, sd = 2),
       type = 'l', lwd = 2, col = "red")
points(seq(-5, 5, 1/1000), pnorm(seq(-5, 5, 1/1000), mean = 0, sd = 1),
       type = 'l', lwd = 2, col = "green")
points(seq(-5, 5, 1/1000), pnorm(seq(-5, 5, 1/1000), mean = -2, sd = 0.5),
       type = 'l', lwd = 2, col = "blue")

legend('bottomright', legend = c('μ = 0, σ = 2', 'μ = 0, σ = 1', 'μ = -2, σ = 0.5'),
       lwd = c(2, 2, 2), col = c('red', 'green', 'blue'), 
       bty = 'n')

dev.off()
