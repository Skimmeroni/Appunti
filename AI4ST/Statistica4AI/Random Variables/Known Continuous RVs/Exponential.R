library(ggplot2)
library(svglite)

svglite("exponential_PDF.svg")
ggplot() +
xlim(0, 5) +
geom_function(aes(color = "λ = 0.5"), n = 1000, linewidth = 1,
              fun = dexp, args = list(rate = 0.5)) +
geom_function(aes(color = "λ = 1"), n = 1000, linewidth = 1,
              fun = dexp, args = list(rate = 1)) +
geom_function(aes(color = "λ = 1.5"), n = 1000, linewidth = 1,
              fun = dexp, args = list(rate = 1.5)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Exponential Distribution PDF") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_color_manual(name = "",
                   values = c("λ = 0.5" = "#00C1A9",
                              "λ = 1" = "#00A9FF",
                              "λ = 1.5" = "#E36EF6"))
ggsave("exponential_PDF.svg", units = "cm")

svglite("exponential_CDF.svg")
ggplot() +
xlim(0, 5) +
geom_function(aes(color = "λ = 0.5"), n = 1000, linewidth = 1,
              fun = pexp, args = list(rate = 0.5)) +
geom_function(aes(color = "λ = 1"), n = 1000, linewidth = 1,
              fun = pexp, args = list(rate = 1)) +
geom_function(aes(color = "λ = 1.5"), n = 1000, linewidth = 1,
              fun = pexp, args = list(rate = 1.5)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Exponential Distribution CDF") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_color_manual(name = "",
                   values = c("λ = 0.5" = "#00C1A9",
                              "λ = 1" = "#00A9FF",
                              "λ = 1.5" = "#E36EF6"))
ggsave("exponential_CDF.svg", units = "cm")
