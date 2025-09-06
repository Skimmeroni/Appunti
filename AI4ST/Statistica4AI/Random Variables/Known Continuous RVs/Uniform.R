library(ggplot2)
library(svglite)

svglite("uniform_PDF.svg")
ggplot() +
xlim(0, 15) +
geom_function(aes(color = "a = 2, b = 7"), n = 1000, linewidth = 1,
              fun = dunif, args = list(min = 2, max = 7)) +
geom_function(aes(color = "a = 5, b = 8"), n = 1000, linewidth = 1,
              fun = dunif, args = list(min = 5, max = 8)) +
geom_function(aes(color = "a = 9, b = 11"), n = 1000, linewidth = 1,
              fun = dunif, args = list(min = 9, max = 11)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Uniform Distribution PDF") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_color_manual(name = "",
                   values = c("a = 2, b = 7" = "#00C1A9",
                              "a = 5, b = 8" = "#00A9FF",
                              "a = 9, b = 11" = "#E36EF6"))
ggsave("uniform_PDF.svg", units = "cm")

svglite("uniform_CDF.svg")
ggplot() +
xlim(0, 15) +
geom_function(aes(color = "a = 2, b = 7"), n = 1000, linewidth = 1,
              fun = punif, args = list(min = 2, max = 7)) +
geom_function(aes(color = "a = 5, b = 8"), n = 1000, linewidth = 1,
              fun = punif, args = list(min = 5, max = 8)) +
geom_function(aes(color = "a = 9, b = 11"), n = 1000, linewidth = 1,
              fun = punif, args = list(min = 9, max = 11)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Uniform Distribution CDF") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_color_manual(name = "",
                   values = c("a = 2, b = 7" = "#00C1A9",
                              "a = 5, b = 8" = "#00A9FF",
                              "a = 9, b = 11" = "#E36EF6"))
ggsave("uniform_CDF.svg", units = "cm")
