full_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

useful_data <- subset(full_data, as.Date(full_data$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(full_data$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

png("plot1.png", width = 480, height = 480)

hist(useful_data$Global_active_power, col = "Red", xlab = "Global Active Power(in kilowatts)", main = "Global Active Power")

dev.off()