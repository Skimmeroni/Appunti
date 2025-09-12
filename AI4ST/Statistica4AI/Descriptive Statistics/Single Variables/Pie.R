library(ggplot2)
library(svglite)

d <- read.csv("rooms_result.csv", header = FALSE)
d <- d[, c(1, 2)]
colnames(d) <- c("Rooms", "Frequency")
d$Rooms <- sapply(d$Rooms, as.character)

svglite("pie.svg")
ggplot(data = d, mapping = aes(x = "", y = Frequency, fill = Rooms)) +
geom_col() +
coord_polar("y", start = 0) +
theme_classic() +
theme(text = element_text(size = 24),
      axis.text = element_blank(),
      axis.line = element_blank()) +
labs(x = NULL, y = NULL) +
scale_fill_hue(h = c(150, 350))
ggsave("pie.svg", units = "cm")

