library(ggplot2)
library(svglite)
data(faithful)

M <- as.matrix(faithful)
result <- kmeans(M, centers = 2)$cluster

data_to_plot <- data.frame(var1 = M, var2 = result)
colnames(data_to_plot) <- c("X", "Y", "cluster")
data_to_plot <- transform(data_to_plot, cluster = as.character(cluster))

svglite("geyser.svg")
ggplot(data = data_to_plot, mapping = aes(x = X, y = Y, color = cluster)) +
geom_point() + labs(title = "Applying K-means (k = 2) to the 'faithful' dataset",
	                x = "Eruption duration (in minutes)", y = "Waiting time (in minutes)") +
theme(text = element_text(size = 16))
ggsave("geyser.svg", units = "cm")
