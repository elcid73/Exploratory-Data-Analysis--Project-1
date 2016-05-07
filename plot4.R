rm(list=ls())

data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

dt <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dt$datetime <- as.POSIXct(paste(as.Date(dt$Date), dt$Time))

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dt, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
