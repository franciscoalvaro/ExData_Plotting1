library(lubridate)
mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
selection<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3","Date","Time")
plotSubmetering<-mydata[selection]
plotSubmetering<-plotSubmetering[which((plotSubmetering$Date == "1/2/2007") | (plotSubmetering$Date == "2/2/2007")),]

plotSubmetering$DateTime <- strptime(paste(plotSubmetering$Date, plotSubmetering$Time), "%d/%m/%Y %H:%M:%S") 


plot(plotSubmetering$DateTime,as.numeric(levels(plotSubmetering$Sub_metering_1))[plotSubmetering$Sub_metering_1], type = "l", ylim=c(0,40),lty = "solid",ylab="Energy Submetering",xlab="")
par(new=TRUE)
plot(plotSubmetering$DateTime,as.numeric(levels(plotSubmetering$Sub_metering_2))[plotSubmetering$Sub_metering_2], type = "l", ylim=c(0,40),lty = "solid",col = "red",ylab="Energy Submetering",xlab="")
par(new=TRUE)
plot(plotSubmetering$DateTime,as.numeric(plotSubmetering$Sub_metering_3), type = "l", ylim=c(0,40),lty = "solid",col = "blue",ylab="Energy Submetering",xlab="")

legend("topright", pch = 45, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))