library(ggplot2)
library(svglite)

d <- read.csv("rooms_data.csv", header = FALSE, col.names = "X")

svglite("barplot_absolute.svg")
ggplot(data = d, mapping = aes(x = X)) +
geom_bar(fill = "steelblue") +
labs(x = "Observations", y = "Absolute frequencies") +
theme_minimal() +
theme(text = element_text(size = 24))
ggsave("barplot_absolute.svg", units = "cm")

svglite("barplot_relative.svg")
ggplot(data = d, mapping = aes(x = X, y = after_stat(count) / sum(after_stat(count)))) +
geom_bar(fill = "steelblue") +
ylim(0, 1) +
labs(x = "Observations", y = "Relative frequencies") +
theme_minimal() +
theme(text = element_text(size = 24))
ggsave("barplot_relative.svg", units = "cm")
