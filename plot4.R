csvdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings="?")

csvdata[, 'DateTime'] <- as.POSIXct(strptime(paste (csvdata$Date, csvdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

csvdata[, 'Date'] <- as.Date(csvdata$Date,"%d/%m/%Y")

csvdata <- csvdata[csvdata$Date >= as.Date("2007-02-01", "%Y-%m-%d") & csvdata$Date < as.Date("2007-02-03", "%Y-%m-%d"), ]
png(file="plot4.png")
par(mfrow=c(2,2))
plot(csvdata$DateTime ,csvdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(csvdata$DateTime ,csvdata$Voltage, type="l", ylab="Voltage", xlab="")
plot(csvdata$DateTime ,csvdata$Global_active_power, type="l", ylab="Energy sub metering", xlab="")
legend("topright",pch=1,  legend= c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"))
plot(csvdata$DateTime ,csvdata$Global_reactive_power, type="l", ylab="Global Reactive Power", xlab="")
legend("topright",pch=1,  legend= c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()

