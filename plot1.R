csvdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings="?")

csvdata[, 'Date'] <- as.Date(csvdata$Date,"%d/%m/%Y")

csvdata <- csvdata[csvdata$Date >= as.Date("2007-02-01", "%Y-%m-%d") & csvdata$Date < as.Date("2007-02-03", "%Y-%m-%d"), ]
png(file="plot1.png")
hist(csvdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

