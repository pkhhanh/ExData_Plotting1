#Loading the dataset
data <- read.csv('../data/household_power_consumption.txt', header=T, sep=';', na.strings="?")
head(data)

#Converting dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Subset the dataset
data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#Plot & Save file
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(data, {
  plot(Sub_metering_1~Datetime, ylab="Global Active Power (kilowatts)", xlab=""type="l",
       )
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
