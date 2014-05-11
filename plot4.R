# After setting the working directory, import the dataset.

x <- read.table(file="household_power_consumption.txt", header= T, sep= ";", na.strings= "?")

x$Time <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%OS")
x$Date <- as.Date(x$Date, "%d/%m/%Y")


# Extracting the data from the dates 2007-02-01 and 2007-02-02.
strTime <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%OS")
stpTime <- strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%OS")

x <- x[x$Time > strTime & x$Time < stpTime, ]

# Setup the graphic device and construct the plot.
png(file="plot4.png",width= 480, height= 480)

par(mfrow = c(2,2))
with(x, {
 plot(Time, Global_active_power, type= "l", ylab= "Global Active Power", col="black")
 plot(Time, Voltage, type= "l", xlab= "datetime", ylab= "Voltage", col="black")
 with(x, plot(Time, Sub_metering_1, type= "n", ylab= "Energy Submetering"))
 with(x, points(Time, Sub_metering_1,type= "l", col= "black"))
 with(x, points(Time, Sub_metering_2,type = "l", col= "red"))
 with(x, points(Time, Sub_metering_3,type = "l", col= "blue"))
 legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1, 1, 1), col= c("black", "red", "blue"), lwd = 2, bty = "n")
 plot(Time, Global_reactive_power, type= "l", xlab = "datetime", col="black")
})

dev.off()

