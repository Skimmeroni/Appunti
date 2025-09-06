library(ggplot2)
library(svglite)

svglite("hypergeometric_PMF.svg")
ggplot() +
xlim(0, 60) +
stat_function(aes(fill = "n = 450, m = 50, k = 100"),
              geom = "point", shape = 21,
              size = 5, fun = dhyper, n = 61,
              args = list(n = 450, m = 50, k = 100)) +
stat_function(aes(fill = "n = 440, m = 60, k = 200"),
              geom = "point", shape = 21,
              size = 5, fun = dhyper, n = 61,
              args = list(n = 440, m = 60, k = 200)) +
stat_function(aes(fill = "n = 430, m = 70, k = 300"),
              geom = "point", shape = 21,
              size = 5, fun = dhyper, n = 61,
              args = list(n = 430, m = 70, k = 300)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Hypergeometric Distribution PMF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("hypergeometric_PMF.svg", units = "cm")

svglite("hypergeometric_CDF.svg")
ggplot() +
xlim(0, 60) +
stat_function(aes(fill = "n = 450, m = 50, k = 100"),
              geom = "point", shape = 21,
              size = 5, fun = phyper, n = 61,
              args = list(n = 450, m = 50, k = 100)) +
stat_function(aes(fill = "n = 440, m = 60, k = 200"),
              geom = "point", shape = 21,
              size = 5, fun = phyper, n = 61,
              args = list(n = 440, m = 60, k = 200)) +
stat_function(aes(fill = "n = 430, m = 70, k = 300"),
              geom = "point", shape = 21,
              size = 5, fun = phyper, n = 61,
              args = list(n = 430, m = 70, k = 300)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Hypergeometric Distribution CDF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("hypergeometric_CDF.svg", units = "cm")
