# initializing data
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_full$Date <- as.Date(data_full$Date, "%d/%m/%Y")
data <- subset(data_full, Date == "2007-02-01" | Date == "2007-02-02")
date_time <- as.POSIXct(paste(data$Date, data$Time))
data$date_time <- date_time
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# plot
with(data, plot(Sub_metering_1~date_time, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(Sub_metering_2~date_time, col="red"))
with(data, lines(Sub_metering_3~date_time, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# copy to png
dev.copy(png, file="plot3.png")
dev.off()
