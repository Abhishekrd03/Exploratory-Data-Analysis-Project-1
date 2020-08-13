# initializing data
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_full$Date <- as.Date(data_full$Date, "%d/%m/%Y")
data <- subset(data_full, Date == "2007-02-01" | Date == "2007-02-02")
data$Global_active_power <- as.numeric(data$Global_active_power)

# plot
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# copy to png
dev.copy(png, file="plot1.png")
dev.off()
