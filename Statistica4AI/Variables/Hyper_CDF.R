svg("Hyper_CDF.svg")

plot(xlim = c(0, 60), ylim = c(0, 1), x = "",
     main = "Hypergeometric distribution CDF", xlab = "x",
     ylab = "F(x) = P(X ≤ x)", bty = 'n', font.lab = 2)

points(0:60, phyper(0:60, n = 450, m = 50, k = 100),
       type = 'p', pch = 21, cex = 1.5, bg = "red", col = "black")
points(0:60, phyper(0:60, n = 440, m = 60, k = 200),
       type = 'p', pch = 21, cex = 1.5, bg = "green", col = "black")
points(0:60, phyper(0:60, n = 430, m = 70, k = 300),
       type = 'p', pch = 21, cex = 1.5, bg = "blue", col = "black")

legend('bottomright', legend = c('N = 500, M = 50, n = 100',
			      'N = 500, M = 50, n = 100', 
			      'N = 500, M = 50, n = 100'),
       col = c('red', 'green', 'blue'), pch = 21, bty = 'n')

dev.off()
