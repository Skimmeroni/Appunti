library(ggplot2)
library(svglite)

svglite("binomial_PMF.svg")
ggplot() +
xlim(0, 40) +
stat_function(aes(fill = "n = 40, p = 0.3"),
              geom = "point", shape = 21,
              size = 5, fun = dbinom, n = 41,
              args = list(size = 40, p = 0.3)) +
stat_function(aes(fill = "n = 40, p = 0.5"),
              geom = "point", shape = 21,
              size = 5, fun = dbinom, n = 41,
              args = list(size = 40, p = 0.5)) +
stat_function(aes(fill = "n = 40, p = 0.7"),
              geom = "point", shape = 21,
              size = 5, fun = dbinom, n = 41,
              args = list(size = 40, p = 0.7)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Binomial Distribution PMF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("binomial_PMF.svg", units = "cm")

svglite("binomial_CDF.svg")
ggplot() +
xlim(0, 40) +
stat_function(aes(fill = "n = 40, p = 0.3"),
              geom = "point", shape = 21,
              size = 5, fun = pbinom, n = 41,
              args = list(size = 40, p = 0.3)) +
stat_function(aes(fill = "n = 40, p = 0.5"),
              geom = "point", shape = 21,
              size = 5, fun = pbinom, n = 41,
              args = list(size = 40, p = 0.5)) +
stat_function(aes(fill = "n = 40, p = 0.7"),
              geom = "point", shape = 21,
              size = 5, fun = pbinom, n = 41,
              args = list(size = 40, p = 0.7)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Binomial Distribution CDF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("binomial_CDF.svg", units = "cm")
