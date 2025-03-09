d <- read.csv("correlation_data.csv", header = FALSE)

T <- as.data.frame(table(d$V1, d$V2))
colnames(T) <- c("X", "Y", "AbsFreq")
T <- T[order(T$X, T$Y), ]
T$RelFreq <- T$AbsFreq / nrow(d)
T$CumAbsFreq <- cumsum(T$AbsFreq)
T$CumRelFreq <- cumsum(T$AbsFreq) / nrow(d)
T$RelFreq <- round(T$RelFreq, digits = 3)
T$CumRelFreq <- round(T$CumRelFreq, digits = 3)

library(ggplot2)
H <- T[, c(1, 2, 3)]
svg("correlation_result.svg")
print(ggplot(data = H, aes(X, Y, fill = AbsFreq)) +
      geom_tile() +
      labs(x = "Number of rooms", y = "Number of occupants"))
dev.off()

write.table(T, "correlation_result.csv", sep = ',',
            row.names = FALSE, col.names = FALSE)
