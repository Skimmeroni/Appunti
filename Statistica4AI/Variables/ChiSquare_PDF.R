svg("ChiSquare_PDF.svg")

plot(xlim = c(0, 40), ylim = c(0, 0.2), x = "", type = "l",
     main = "Chi Square distribution PDF", xlab = "x",
     ylab = "p(x) = P(X = x)", bty = 'n', font.lab = 2)

points(seq(0, 40, 1/1000), dchisq(seq(0, 40, 1/1000), df = 1),
       type = 'l', lwd = 2, col = "red")
points(seq(0, 40, 1/1000), dchisq(seq(0, 40, 1/1000), df = 5),
       type = 'l', lwd = 2, col = "green")
points(seq(0, 40, 1/1000), dchisq(seq(0, 40, 1/1000), df = 10),
       type = 'l', lwd = 2, col = "blue")

legend('topright', legend = c('n = 1', 'n = 5', 'n = 10'),
       lwd = c(2, 2, 2), col = c('red', 'green', 'blue'), 
       bty = 'n')

dev.off()
