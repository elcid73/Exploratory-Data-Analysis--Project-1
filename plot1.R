rm(list=ls())

data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

dt <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dt$datetime <- as.POSIXct(paste(as.Date(dt$Date), dt$Time))

hist(dt$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
