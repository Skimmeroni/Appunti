library(ggplot2)
library(svglite)

d <- read.csv("penguins.csv", header = FALSE, col.names = "X")

svglite("boxplot.svg")
ggplot(data = d, mapping = aes(x = X)) +
ylim(-1, 1) +
geom_boxplot(linewidth = 1.5, fill = "#3ea1fe") +
labs(x = "Observations") +
theme_minimal() +
theme(text = element_text(size = 24))
ggsave("boxplot.svg", units = "cm")
