library(ggplot2)
library(svglite)

f <- function(x) {
    return(ifelse(x >= 0 & x <= 1, 1.5 * (1 - (x * x)), 0))
}

X <- seq(-0.5, 1.5, length.out = 1000)
A <- seq(0.75, 0.9, length.out = 1000)
data <- data.frame(x = X, y = f(X))
area <- data.frame(x = A, y = f(A))

svglite("pdf.svg")
ggplot() +
geom_line(data = data, mapping = aes(x = x, y = y),
          color = "#3ea1fe", linewidth = 1) +
geom_area(data = area, mapping = aes(x = x, y = y),
          fill = "#3ea1fe", alpha = 0.3) +
labs(x = "x", y = "f(x)", title = "Density curve") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"))
ggsave("pdf.svg", units = "cm")
