csvdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings="?")

csvdata[, 'DateTime'] <- as.POSIXct(strptime(paste (csvdata$Date, csvdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

csvdata[, 'Date'] <- as.Date(csvdata$Date,"%d/%m/%Y")

csvdata <- csvdata[csvdata$Date >= as.Date("2007-02-01", "%Y-%m-%d") & csvdata$Date < as.Date("2007-02-03", "%Y-%m-%d"), ]

png(file="plot3.png")
plot(csvdata$DateTime ,csvdata$Sub_metering_1,csvdata$Sub_metering_2, type="l", ylab="Energy sub metering", xlab="")
legend("topright",pch=1,  legend= c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()

