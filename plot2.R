full_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

useful_data <- subset(full_data, as.Date(full_data$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(full_data$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

date_time <- as.POSIXct(paste(useful_data$Date, useful_data$Time), format = "%d/%m/%Y %H:%M:%S")

useful_data$date_time <- date_time

png("plot2.png", width = 480, height = 480)

plot(useful_data$date_time, useful_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(in kilowatts)")

dev.off()