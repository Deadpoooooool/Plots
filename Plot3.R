#reading the file and removing the original after subsetting due to slow computer :/
library(readr)
hpc <- read_delim("~/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
hpc$date2<-strptime(hpc$Date, format = "%d/%m/%Y")
hpc1 <- subset(hpc, date2 == "2007-02-01" | date2 == "2007-02-02")
hpc1$datetime <- as.POSIXct(paste(hpc1$date2, hpc1$Time), format="%Y-%m-%d %H:%M:%S")
rm(hpc)

#making the "Plot3": First I set date and time in English, then I plot the graph 
Sys.setlocale("LC_TIME", "English")
png("Plot3.png", width = 480, height = 480)
plot(x = hpc1$datetime, y = hpc1$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")
lines(x = hpc1$datetime, y =hpc1$Sub_metering_2, col = "red")
lines(x = hpc1$datetime, y =hpc1$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()