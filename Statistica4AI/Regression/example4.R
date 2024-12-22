D <- read.csv("example4.csv", header = FALSE)
colnames(D) <- c("n", "X", "Y", "F", "R")
D[, 4] <- sapply(D[, 2], function(x){-0.48 + 3.15*x})
D[, 4] <- sapply(D[, 4], function(x){round(x, digits = 2)})
D[, 5] <- D[, 3] - D[, 4]
D[, 5] <- sapply(D[, 5], function(x){round(x, digits = 2)})
write.table(D, "example4.csv", sep = ",", row.names = FALSE, col.names = FALSE)
