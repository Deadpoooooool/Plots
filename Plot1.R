#reading the file and removing the original after subsetting due to slow computer :/
library(readr)
hpc <- read_delim("~/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
hpc$date2<-strptime(hpc$Date, format = "%d/%m/%Y")
hpc1 <- subset(hpc, date2 == "2007-02-01" | date2 == "2007-02-02")
rm(hpc)

#printing the plot
png("Plot1.png", width = 480, height = 480)
hist(hpc1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
