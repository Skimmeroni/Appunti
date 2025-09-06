library(ggplot2)
library(svglite)

svglite("normal_PDF.svg")
ggplot() +
xlim(-5, 5) +
geom_function(aes(color = "μ = 0, σ = 2"), n = 1000, linewidth = 1,
              fun = dnorm, args = list(mean = 0, sd = 2)) +
geom_function(aes(color = "μ = 0, σ = 1"), n = 1000, linewidth = 1,
              fun = dnorm, args = list(mean = 0, sd = 1)) +
geom_function(aes(color = "μ = -2, σ = 0.5"), n = 1000, linewidth = 1,
              fun = dnorm, args = list(mean = -2, sd = 0.5)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Normal Distribution PDF") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_color_manual(name = "",
                   values = c("μ = 0, σ = 2" = "#00C1A9",
                              "μ = 0, σ = 1" = "#00A9FF",
                              "μ = -2, σ = 0.5" = "#E36EF6"))
ggsave("normal_PDF.svg", units = "cm")

svglite("normal_CDF.svg")
ggplot() +
xlim(-5, 5) +
geom_function(aes(color = "μ = 0, σ = 2"), n = 1000, linewidth = 1,
              fun = pnorm, args = list(mean = 0, sd = 2)) +
geom_function(aes(color = "μ = 0, σ = 1"), n = 1000, linewidth = 1,
              fun = pnorm, args = list(mean = 0, sd = 1)) +
geom_function(aes(color = "μ = -2, σ = 0.5"), n = 1000, linewidth = 1,
              fun = pnorm, args = list(mean = -2, sd = 0.5)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Normal Distribution CDF") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_color_manual(name = "",
                   values = c("μ = 0, σ = 2" = "#00C1A9",
                              "μ = 0, σ = 1" = "#00A9FF",
                              "μ = -2, σ = 0.5" = "#E36EF6"))
ggsave("normal_CDF.svg", units = "cm")
