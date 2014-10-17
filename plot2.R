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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

