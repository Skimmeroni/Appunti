data <- read.csv("rooms_occupants_data.csv", header = FALSE)

frequencies <- as.data.frame(table(data))
colnames(frequencies) <- c("Rooms", "Occupants", "AbsFreq")
frequencies$RelFreq <- round(frequencies$AbsFreq / nrow(data), digits = 3)
frequencies$CumAbsFreq <- cumsum(frequencies$AbsFreq)
frequencies$CumRelFreq <- round(cumsum(frequencies$AbsFreq) / nrow(data), digits = 3)

write.table(frequencies, "rooms_occupants_result.csv", sep = ',', col.names = FALSE, row.names = FALSE)
