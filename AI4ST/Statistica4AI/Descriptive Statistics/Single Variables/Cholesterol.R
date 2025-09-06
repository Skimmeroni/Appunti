data <- read.csv("cholesterol_data.csv", header = FALSE)
data <- sapply(data, as.numeric)
data <- cut(data, breaks = 6)

frequencies <- as.data.frame(table(data))
colnames(frequencies) <- c("ChoLevel", "AbsFreq")
frequencies$RelFreq <- round(frequencies$AbsFreq / length(data), digits = 3)
frequencies$CumAbsFreq <- cumsum(frequencies$AbsFreq)
frequencies$CumRelFreq <- round(cumsum(frequencies$AbsFreq) / length(data), digits = 3)

write.table(frequencies, "cholesterol_result.csv", sep = ',', col.names = FALSE, row.names = FALSE)
