library(ggplot2)
library(svglite)

svglite("student_t_PDF.svg")
ggplot() +
xlim(-5, 5) +
geom_function(aes(color = "n = 1"), n = 1000, linewidth = 1,
              fun = dt, args = list(df = 1)) +
geom_function(aes(color = "n = 5"), n = 1000, linewidth = 1,
              fun = dt, args = list(df = 5)) +
geom_function(aes(color = "n = 10"), n = 1000, linewidth = 1,
              fun = dt, args = list(df = 10)) +
labs(x = "x", y = "p(x) = P(X = x)",
     title = "Student T Distribution PDF") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_color_manual(name = "",
                   values = c("n = 1" = "#00C1A9",
                              "n = 5" = "#00A9FF",
                              "n = 10" = "#E36EF6"))
ggsave("student_t_PDF.svg", units = "cm")

svglite("student_t_CDF.svg")
ggplot() +
xlim(-5, 5) +
geom_function(aes(color = "n = 1"), n = 1000, linewidth = 1,
              fun = pt, args = list(df = 1)) +
geom_function(aes(color = "n = 5"), n = 1000, linewidth = 1,
              fun = pt, args = list(df = 5)) +
geom_function(aes(color = "n = 10"), n = 1000, linewidth = 1,
              fun = pt, args = list(df = 10)) +
labs(x = "x", y = "F(x) = P(X ≤ x)",
     title = "Student T Distribution CDF") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") +
scale_color_manual(name = "",
                   values = c("n = 1" = "#00C1A9",
                              "n = 5" = "#00A9FF",
                              "n = 10" = "#E36EF6"))
ggsave("student_t_CDF.svg", units = "cm")
