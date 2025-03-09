d <- read.csv("frequencies_data.csv", header = FALSE)

library(ggplot2)
svg("frequencies_barplot_absolute.svg")
	print(ggplot(data = d, aes(V1)) +
	      geom_bar() +
	      labs(x = "Observations", y = "Absolute frequencies"))
dev.off()
svg("frequencies_barplot_relative.svg")
	print(ggplot(data = d, aes(V1, y = after_stat(count) /
	                               sum(after_stat(count)))) +
	      geom_bar() +
	      ylim(0, 1) +
	      labs(x = "Observations", y = "Relative frequencies"))
dev.off()

d <- as.vector(d)
d <- d$V1

T <- round(rbind(AbsoluteFrequency = table(d),
                 RelativeFrequency = table(d) / length(d),
                 CumulativeAbsoluteFrequency = cumsum(table(d)),
                 CumulativeRelativeFrequency = cumsum(table(d)) / length(d)),
           digits = 3)

T <- as.data.frame(T)
T <- t(T)
write.table(T, "frequencies_result.csv", sep = ',', col.names = FALSE)
