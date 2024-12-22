svg("Exponential_PDF.svg")

plot(xlim = c(0, 5), ylim = c(0, 1.4), x = "", type = "l",
     main = "Exponential distribution PDF", xlab = "x",
     ylab = "p(x) = P(X = x)", bty = 'n', font.lab = 2)

points(seq(0, 5, 1/1000), dexp(seq(0, 5, 1/1000), rate = 0.5),
       type = 'l', lwd = 2, col = "red")
points(seq(0, 5, 1/1000), dexp(seq(0, 5, 1/1000), rate = 1),
       type = 'l', lwd = 2, col = "green")
points(seq(0, 5, 1/1000), dexp(seq(0, 5, 1/1000), rate = 1.5),
       type = 'l', lwd = 2, col = "blue")

legend('topright', legend = c('λ = 0.5', 'λ = 1', 'λ = 1.5'),
       lwd = c(2, 2, 2), col = c('red', 'green', 'blue'), 
       bty = 'n')

dev.off()
