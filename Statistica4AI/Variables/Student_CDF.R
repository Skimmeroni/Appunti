svg("Student_CDF.svg")

plot(xlim = c(-5, 5), ylim = c(0, 1), x = "", type = "l",
     main = "Student t distribution CDF", xlab = "x",
     ylab = "F(x) = P(X ≤ x)", bty = 'n', font.lab = 2)

points(seq(-5, 5, 1/1000), pt(seq(-5, 5, 1/1000), df = 1),
       type = 'l', lwd = 2, col = "red")
points(seq(-5, 5, 1/1000), pt(seq(-5, 5, 1/1000), df = 5),
       type = 'l', lwd = 2, col = "green")
points(seq(-5, 5, 1/1000), pt(seq(-5, 5, 1/1000), df = 10),
       type = 'l', lwd = 2, col = "blue")

legend('bottomright', legend = c('n = 1', 'n = 5', 'n = 10'),
       lwd = c(2, 2, 2), col = c('red', 'green', 'blue'), 
       bty = 'n')

dev.off()
