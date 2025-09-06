library(ggplot2)
library(svglite)

svglite("scatter.svg")
flowers <- read.csv("iris.csv", header = FALSE, col.names = c("Petal.Length", "Petal.Width", "Species"))

ggplot(flowers, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
geom_point(size = 3) +
labs(x = "Petal length (in centimetres)", y = "Petal width (in centimetres)") +
theme_linedraw() +
theme(text = element_text(size = 18))

ggsave("scatter.svg", units = "cm")
