library(ggplot2)
library(svglite)

X <- seq(0, 5)
Y <- c(1/8, 3/8, 3/8, 1/8, 0, 0)
data <- data.frame(X = X, Y = Y)

svglite("pmf.svg")
ggplot(data, aes(x = X, y = Y)) + 
geom_point(size = 3, color = "#3ea1fe") + 
geom_segment(mapping = aes(x = X, xend = X, y = 0, yend = Y), color = "#3ea1fe", linewidth = 1) + 
ylim(0, 1) +
labs(title = "Probability mass function", x = "x", y = "p(x) = P(X = x)") + 
theme_minimal() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"))
ggsave("pmf.svg", units = "cm")
