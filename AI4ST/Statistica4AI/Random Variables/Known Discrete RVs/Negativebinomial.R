library(ggplot2)
library(svglite)

svglite("negativebinomial_PMF.svg")
ggplot() +
xlim(0, 35) +
stat_function(aes(fill = "n = 25, p = 0.55"),
              geom = "point", shape = 21,
              size = 5, fun = dnbinom, n = 36,
              args = list(size = 25, p = 0.55)) +
stat_function(aes(fill = "n = 25, p = 0.65"),
              geom = "point", shape = 21,
              size = 5, fun = dnbinom, n = 36,
              args = list(size = 25, p = 0.65)) +
stat_function(aes(fill = "n = 25, p = 0.80"),
              geom = "point", shape = 21,
              size = 5, fun = dnbinom, n = 36,
              args = list(size = 25, p = 0.80)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Negative Binomial Distribution PMF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("negativebinomial_PMF.svg", units = "cm")

svglite("negativebinomial_CDF.svg")
ggplot() +
xlim(0, 35) +
stat_function(aes(fill = "n = 25, p = 0.55"),
              geom = "point", shape = 21,
              size = 5, fun = pnbinom, n = 36,
              args = list(size = 25, p = 0.55)) +
stat_function(aes(fill = "n = 25, p = 0.65"),
              geom = "point", shape = 21,
              size = 5, fun = pnbinom, n = 36,
              args = list(size = 25, p = 0.65)) +
stat_function(aes(fill = "n = 25, p = 0.80"),
              geom = "point", shape = 21,
              size = 5, fun = pnbinom, n = 36,
              args = list(size = 25, p = 0.80)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Negative Binomial Distribution CDF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("negativebinomial_CDF.svg", units = "cm")
