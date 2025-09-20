library(ggplot2)
library(svglite)

f <- function(x) {
    return(ifelse(x >= 0, ifelse(x <= 1, 0.5 * x * (3 - (x * x)), 1), 0))
}

X <- seq(-0.5, 1.5, length.out = 1000)
data <- data.frame(x = X, y = f(X))

svglite("cdf.svg")
ggplot(data = data, mapping = aes(x = x, y = y)) +
geom_line(color = "#3ea1fe", linewidth = 1) +
labs(x = "x", y = "F(x) = P(X ≤ x)", title = "Cumulative distribution function") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"))
ggsave("cdf.svg", units = "cm")
