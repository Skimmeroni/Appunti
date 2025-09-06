library(ggplot2)
library(svglite)

interval <- c(0, 1)
d1 <- data.frame(X = interval, Y = dbinom(interval, size = 1, prob = 0.3), Parameters = "p = 0.3")
d2 <- data.frame(X = interval, Y = dbinom(interval, size = 1, prob = 0.5), Parameters = "p = 0.5")
d3 <- data.frame(X = interval, Y = dbinom(interval, size = 1, prob = 0.7), Parameters = "p = 0.7")
d <- rbind(d1, d2, d3)

svglite("bernoulli_PMF.svg")
ggplot(data = d, mapping = aes(x = X, y = Y, fill = Parameters)) +
geom_point(shape = 21, size = 5, color = "black") +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Bernoulli Distribution PMF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_fill_hue(h = c(180, 300))
ggsave("bernoulli_PMF.svg", units = "cm")

d1 <- data.frame(X = interval, Y = pbinom(interval, size = 1, prob = 0.3), Parameters = "p = 0.3")
d2 <- data.frame(X = interval, Y = pbinom(interval, size = 1, prob = 0.5), Parameters = "p = 0.5")
d3 <- data.frame(X = interval, Y = pbinom(interval, size = 1, prob = 0.7), Parameters = "p = 0.7")
d <- rbind(d1, d2, d3)

svglite("bernoulli_CDF.svg")
ggplot(data = d, mapping = aes(x = X, y = Y, fill = Parameters)) +
geom_point(shape = 21, size = 5, color = "black") +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Bernoulli Distribution CDF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_fill_hue(h = c(180, 300))
ggsave("bernoulli_CDF.svg", units = "cm")
