svg("Uniform_PDF.svg")

plot(xlim = c(0, 15), ylim = c(0, 0.75), x = "", type = "l",
     main = "Uniform distribution PDF", xlab = "x",
     ylab = "p(x) = P(X = x)", bty = 'n', font.lab = 2)

points(seq(0, 15, 1/1000), dunif(seq(0, 15, 1/1000), min = 2, max = 7),
       type = 'l', lwd = 2, col = "red")
points(seq(0, 15, 1/1000), dunif(seq(0, 15, 1/1000), min = 5, max = 8),
       type = 'l', lwd = 2, col = "green")
points(seq(0, 15, 1/1000), dunif(seq(0, 15, 1/1000), min = 9, max = 11),
       type = 'l', lwd = 2, col = "blue")

legend('topright', legend = c('a = 2, b = 7', 'a = 5, b = 8', 'a = 9, b = 11'),
       lwd = c(2, 2, 2), col = c('red', 'green', 'blue'), 
       bty = 'n')

dev.off()
