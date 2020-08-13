# initializing data
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_full$Date <- as.Date(data_full$Date, "%d/%m/%Y")
data <- subset(data_full, Date == "2007-02-01" | Date == "2007-02-02")
date_time <- as.POSIXct(paste(data$Date, data$Time))
data$date_time <- date_time
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric((data$Global_reactive_power))
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

par(mfrow=c(2,2), mar=c(4,4,1,1))

# top left
with(data, plot(Global_active_power~date_time, type="l", xlab="", ylab="Global Active Power"))

# top right
with(data, plot(Voltage~date_time, type="l", xlab="datetime"))

# bottom left
with(data, plot(Sub_metering_1~date_time, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(Sub_metering_2~date_time, col="red"))
with(data, lines(Sub_metering_3~date_time, col="blue"))
legend("topright", lty=1, bty="n", cex=0.6, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# bottom right
with(data, plot(Global_reactive_power~date_time, type="l", xlab="datetime"))

# copy to png
dev.copy(png, file="plot4.png")
dev.off()
