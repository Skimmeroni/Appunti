library(ggplot2)
D <- read.csv("example1.csv", header = FALSE)
colnames(D) <- c("X", "Y")
eq <- function(x){-0.48 + 3.15*x}
svg("example2.svg")
print(ggplot(data = D, mapping = aes(x = X, y = Y)) +
      ylim(0, 5) +
      xlim(0, 2) +
      labs(y = "y = -0.48 + 3.15x", x = "x") +
      stat_function(fun = eq) +
      geom_point())
dev.off()
