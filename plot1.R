#Loading the dataset
data <- read.csv('../data/household_power_consumption.txt', header=T, sep=';', na.strings="?")

#Converting dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subset the dataset
data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#Plotting
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

