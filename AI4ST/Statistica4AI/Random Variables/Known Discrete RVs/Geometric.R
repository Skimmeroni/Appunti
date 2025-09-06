library(ggplot2)
library(svglite)

svglite("geometric_PMF.svg")
ggplot() +
xlim(0, 10) +
stat_function(aes(fill = "p = 0.2"),
              geom = "point", shape = 21,
              size = 5, fun = dgeom, n = 11,
              args = list(p = 0.2)) +
stat_function(aes(fill = "p = 0.5"),
              geom = "point", shape = 21,
              size = 5, fun = dgeom, n = 11,
              args = list(p = 0.5)) +
stat_function(aes(fill = "p = 0.8"),
              geom = "point", shape = 21,
              size = 5, fun = dgeom, n = 11,
              args = list(p = 0.8)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Geometric Distribution PMF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("geometric_PMF.svg", units = "cm")

svglite("geometric_CDF.svg")
ggplot() +
xlim(0, 10) +
stat_function(aes(fill = "p = 0.2"),
              geom = "point", shape = 21,
              size = 5, fun = pgeom, n = 11,
              args = list(p = 0.2)) +
stat_function(aes(fill = "p = 0.5"),
              geom = "point", shape = 21,
              size = 5, fun = pgeom, n = 11,
              args = list(p = 0.5)) +
stat_function(aes(fill = "p = 0.8"),
              geom = "point", shape = 21,
              size = 5, fun = pgeom, n = 11,
              args = list(p = 0.8)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Geometric Distribution CDF") +
theme_classic() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
guides(fill = guide_legend(title = "")) + 
scale_fill_hue(h = c(180, 300))
ggsave("geometric_CDF.svg", units = "cm")
