svg("Geometric_CDF.svg")

plot(xlim = c(0, 10), ylim = c(0, 1), x = "",
     main = "Geometric distribution CDF", xlab = "x",
     ylab = "F(x) = P(X ≤ x)", bty = 'n', font.lab = 2)

points(0:40, pgeom(0:40, prob = 0.2),
       type = 'p', pch = 21, cex = 1.5, bg = "red", col = "black")
points(0:40, pgeom(0:40, prob = 0.5),
       type = 'p', pch = 21, cex = 1.5, bg = "green", col = "black")
points(0:40, pgeom(0:40, prob = 0.8),
       type = 'p', pch = 21, cex = 1.5, bg = "blue", col = "black")

legend('bottomright', legend = c('p = 0.2', 'p = 0.5', 'p = 0.8'),
       col = c('red', 'green', 'blue'), pch = 21, bty = 'n')

dev.off()
