library(ggplot2)
library(svglite)

set.seed(45)
runs <- 500

data <- sample(1:6, runs, replace = TRUE)
result <- data.frame(Count = integer(), Frequency = numeric())
count <- 0

# Yes, there's the table() function, good stuff
for (i in seq(1, runs)) {
	if (data[i] == 6) {
		count <- count + 1
	}
	result[i, 1] <- i
	result[i, 2] <- count / i
}

svglite("die.svg", width = 12, height = 8)
ggplot(result, aes(x = Count, y = Frequency)) +
labs(x = "Number of iterations", y = "Relative frequency") +
geom_line(color = "#3ea1fe", linewidth = 1) +
geom_hline(yintercept = 1/6) +
theme_linedraw() +
theme(text = element_text(size = 24))
ggsave("die.svg", units = "px")
