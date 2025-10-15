library(ggplot2)
library(svglite)

X <- c(80, 90, 100, 110, 120)
Y <- c(0.04, 0.12, 0.29, 0.3, 0.25)
d <- data.frame(X = X, Y = Y)

svglite("mp3_mean.svg")
ggplot(data = d, mapping = aes(x = X, y = Y)) +
geom_segment(yend = 0, linewidth = 1, color = "#00A9FF") + 
geom_point(size = 4, color = "#00A9FF") +
geom_vline(xintercept = 106, linewidth = 1, color = "#E36EF6") +
ylim(0, 1) +
labs(x = "Sample mean", y = "Probability of the sample mean",
     title = "Sample mean stem plot") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") 
ggsave("mp3_mean.svg", units = "cm")


X <- c(0, 200, 800)
Y <- c(0.42, 0.38, 0.2)
d <- data.frame(X = X, Y = Y)

svglite("mp3_variance.svg")
ggplot(data = d, mapping = aes(x = X, y = Y)) +
geom_segment(yend = 0, linewidth = 1, color = "#00A9FF") + 
geom_point(size = 4, color = "#00A9FF") +
geom_vline(xintercept = 244, linewidth = 1, color = "#E36EF6") +
ylim(0, 1) +
labs(x = "Sample variance", y = "Probability of the sample variance",
     title = "Sample variance stem plot") +
theme_linedraw() +
theme(text = element_text(size = 24),
      title = element_text(face = "bold"),
      legend.position = "top") 
ggsave("mp3_variance.svg", units = "cm")
