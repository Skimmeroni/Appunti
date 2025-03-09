d <- read.csv("frequencies2_data.csv", header = FALSE)
d <- as.vector(d)
d <- d$V1

n_classes <- 6
d <- cut(d, breaks = n_classes)

T <- round(rbind(AbsoluteFrequency = table(d),
                 RelativeFrequency = table(d) / length(d),
                 CumulativeAbsoluteFrequency = cumsum(table(d)),
                 CumulativeRelativeFrequency = cumsum(table(d)) / length(d)),
           digits = 3)

T <- as.data.frame(T)
T <- t(T)
write.table(T, "frequencies2_result.csv", sep = ',', col.names = FALSE)
