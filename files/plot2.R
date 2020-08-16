# initializing data
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_full$Date <- as.Date(data_full$Date, "%d/%m/%Y")
data <- subset(data_full, Date == "2007-02-01" | Date == "2007-02-02")
date_time <- as.POSIXct(paste(data$Date, data$Time))
data$date_time <- date_time

# plot
with(data, plot(Global_active_power~date_time, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# copy to png
dev.copy(png, file="plot2.png")
dev.off()
