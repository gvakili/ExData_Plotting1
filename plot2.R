# After setting the working directory, import the dataset.

x <- read.table(file="household_power_consumption.txt", header= T, sep= ";", na.strings= "?")

x$Time <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%OS")
x$Date <- as.Date(x$Date, "%d/%m/%Y")


# Extracting the data from the dates 2007-02-01 and 2007-02-02.
strTime <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%OS")
stpTime <- strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%OS")

x <- x[x$Time > strTime & x$Time < stpTime, ]

# Setup the graphic device and construct the plot.
png(file="plot2.png",width= 480, height= 480)

plot(x$Time, x$Global_active_power, type = "l", ylab= "Global Active Power (Kilowatts)")

dev.off()


