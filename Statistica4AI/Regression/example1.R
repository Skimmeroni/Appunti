library(ggplot2)
D <- read.csv("example1.csv", header = FALSE)
colnames(D) <- c("X", "Y")
svg("example1.svg")
print(ggplot(data = D, mapping = aes(x = X, y = Y)) +
      ylim(0, 5) +
      xlim(0, 2) +
      geom_point())
dev.off()
