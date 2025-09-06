library(ggplot2)
library(svglite)

svglite("poisson_PMF.svg")
ggplot() +
xlim(0, 20) +
stat_function(aes(fill = "λ = 1"),
              geom = "point", shape = 21,
              size = 5, fun = dpois, n = 21,
              args = list(lambda = 1)) +
stat_function(aes(fill = "λ = 4"),
              geom = "point", shape = 21,
              size = 5, fun = dpois, n = 21,
              args = list(lambda = 4)) +
stat_function(aes(fill = "λ = 10"),
              geom = "point", shape = 21,
              size = 5, fun = dpois, n = 21,
              args = list(lambda = 10)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Poisson Distribution PMF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("poisson_PMF.svg", units = "cm")

svglite("poisson_CDF.svg")
ggplot() +
xlim(0, 20) +
stat_function(aes(fill = "λ = 1"),
              geom = "point", shape = 21,
              size = 5, fun = ppois, n = 21,
              args = list(lambda = 1)) +
stat_function(aes(fill = "λ = 4"),
              geom = "point", shape = 21,
              size = 5, fun = ppois, n = 21,
              args = list(lambda = 4)) +
stat_function(aes(fill = "λ = 10"),
              geom = "point", shape = 21,
              size = 5, fun = ppois, n = 21,
              args = list(lambda = 10)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Poisson Distribution CDF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("poisson_CDF.svg", units = "cm")
