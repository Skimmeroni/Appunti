library(ggplot2)
library(svglite)

d <- read.csv("rooms_occupants_result.csv", header = FALSE)
d <- d[, c(1, 2, 3)]
colnames(d) <- c("Rooms", "Occupants", "Frequency")

svglite("colormap.svg")
ggplot(data = d, mapping = aes(x = Rooms, y = Occupants, fill = Frequency)) +
geom_tile() +
labs(x = "Number of rooms", y = "Number of occupants") +
theme_minimal() +
theme(text = element_text(size = 18))
ggsave("colormap.svg", units = "cm")
