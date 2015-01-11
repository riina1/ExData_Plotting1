csvdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings="?")

csvdata[, 'DateTime'] <- as.POSIXct(strptime(paste (csvdata$Date, csvdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

csvdata[, 'Date'] <- as.Date(csvdata$Date,"%d/%m/%Y")

csvdata <- csvdata[csvdata$Date >= as.Date("2007-02-01", "%Y-%m-%d") & csvdata$Date < as.Date("2007-02-03", "%Y-%m-%d"), ]



png(file="plot2.png")
plot(csvdata$DateTime ,csvdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


