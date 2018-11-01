#reading the file and removing the original after subsetting due to slow computer :/
library(readr)
hpc <- read_delim("~/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
hpc$date2<-strptime(hpc$Date, format = "%d/%m/%Y")
hpc1 <- subset(hpc, date2 == "2007-02-01" | date2 == "2007-02-02")
hpc1$datetime <- as.POSIXct(paste(hpc1$date2, hpc1$Time), format="%Y-%m-%d %H:%M:%S")
rm(hpc)


#making the "Plot2": First I set date and time in English, then I plot the graph 
Sys.setlocale("LC_TIME", "English")

#printing the plot
png("Plot2.png", width = 480, height = 480)
plot(x = hpc1$datetime, y = hpc1$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = ' ')
dev.off()