library(ggplot2)
library(svglite)

X1 <- c(0, 1, 2, 4, 8, 16)
X2 <- c(1, 2, 4, 8, 16, 20)
Y <- c(0.00, 0.05, 0.15, 0.50, 0.90, 1.00)
data <- data.frame(X1 = X1, X2 = X2, Y = Y)

svglite("cdf.svg")
ggplot(data, aes(x = X2, y = Y)) + 
geom_segment(mapping = aes(x = X1, xend = X2, y = Y, yend = Y),
             color = "#3ea1fe", linewidth = 1) + 
geom_point(data = subset(data, X1 > 0), shape = 21, mapping = aes(x = X1),
           size = 3, stroke = 2, fill = "#3ea1fe", color = "#3ea1fe") + 
geom_point(data = subset(data, X2 < 20), shape = 21, mapping = aes(x = X2),
           size = 3, stroke = 2, fill = "white", color = "#3ea1fe") + 
ylim(0, 1) +
labs(title = "Cumulative distribution function", x = "x", y = "F(x) = P(X ≤ x)") + 
theme_minimal() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"))
ggsave("cdf.svg", units = "cm")
