library(ggplot2)
library(svglite)

d <- read.csv("rooms_result.csv", header = FALSE)
d <- d[, c(1, 3)]
colnames(d) <- c("Rooms", "Frequency")
d$Rooms <- sapply(d$Rooms, as.character)

svglite("barplot.svg")
ggplot(data = d, mapping = aes(x = Rooms, y = Frequency)) +
geom_col(fill = "#3ea1fe") +
ylim(0, 1) +
labs(x = "Number of rooms", y = "Relative frequencies") +
theme_minimal() +
theme(text = element_text(size = 24))
ggsave("barplot.svg", units = "cm")
