library(ggplot2)
library(desk)

old_D <- read.csv("example1.csv", header = FALSE)
colnames(old_D) <- c("X", "Y")
beta0 <- -0.5
beta1 <- 3
packed_dataframe <- data.frame(beta0 = numeric(), beta1 = numeric())

for (i in seq(1, 20)) {
	D <- old_D
	blob <- rnorm(n = 20, sd = 0.1, mean = 0)
	blob <- as.data.frame(blob)
	colnames(blob) <- c("epsilon")
	D$Y <- beta0 + beta1 * D$X + blob$epsilon
	est_beta1 <- Sxy(D$X, D$Y) / Sxy(D$X, D$X)
	est_beta0 <- mean(D$Y) - est_beta1 * mean(D$X)
	packed_dataframe[nrow(packed_dataframe) + 1, ] <- c(est_beta0, est_beta1)
}

print(packed_dataframe)

svg("example2.svg")
print(ggplot(data = D, mapping = aes(x = X, y = Y)) +
      labs(y = "y = -0.5 + 3x", x = "x") +

      stat_function(fun = eq))
dev.off()

