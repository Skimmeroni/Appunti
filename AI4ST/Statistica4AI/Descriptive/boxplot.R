library(ggplot2)

dataset <- read.csv("boxplot.csv", header = FALSE)
colnames(dataset) <- c("X")

svg("boxplot.svg")
ggplot(data = dataset, mapping = aes(x = X)) +
ylim(-1, 1) + geom_boxplot() + labs(x = "")
dev.off()
