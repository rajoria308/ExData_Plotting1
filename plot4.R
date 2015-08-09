full_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

useful_data <- subset(full_data, as.Date(full_data$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(full_data$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

date_time <- as.POSIXct(paste(useful_data$Date, useful_data$Time), format = "%d/%m/%Y %H:%M:%S")

useful_data$date_time <- date_time

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(useful_data$date_time, useful_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(in kilowatts)")

plot(useful_data$date_time, useful_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

with(useful_data, plot(useful_data$date_time, useful_data$Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", type = "l", col = "Black"))

with(useful_data, lines(useful_data$date_time, useful_data$Sub_metering_2, type = "l", col = "Red"))

with(useful_data, lines(useful_data$date_time, useful_data$Sub_metering_3, type = "l", col = "dark blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "dark blue"), lwd = c(2.5, 2.5, 2.5), bty = "n", cex = .8)

plot(useful_data$date_time, useful_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()