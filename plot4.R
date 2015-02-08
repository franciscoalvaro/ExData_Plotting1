library(lubridate)
mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

par(mfrow = c(2, 2))

selection<-c("Global_active_power","Date","Time")
plot1<-mydata[selection]
plot2<-plot1[which((plot1$Date == "1/2/2007") | (plot1$Date == "2/2/2007")),]

plot2$DateTime <- strptime(paste(plot2$Date, plot2$Time), "%d/%m/%Y %H:%M:%S") 
plot(plot2$DateTime,as.numeric(levels(plot2$Global_active_power))[plot2$Global_active_power], type = "l", lty = "solid",ylab="Global Active Power (kilowatts)",xlab="")



selection1<-c("Voltage","Date","Time")
plotVoltage1<-mydata[selection1]
plotVoltage2<-plotVoltage1[which((plotVoltage1$Date == "1/2/2007") | (plotVoltage1$Date == "2/2/2007")),]

plotVoltage2$DateTime <- strptime(paste(plotVoltage2$Date, plotVoltage2$Time), "%d/%m/%Y %H:%M:%S")

plot(plotVoltage2$DateTime,as.numeric(levels(plotVoltage2$Voltage))[plotVoltage2$Voltage], type = "l", lty = "solid",ylab="Voltage",xlab="datetime")


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




selection<-c("Global_reactive_power","Date","Time")
plotReactive1<-mydata[selection]
plotReactive2<-plotReactive1[which((plotReactive1$Date == "1/2/2007") | (plotReactive1$Date == "2/2/2007")),]

plotReactive2$DateTime <- strptime(paste(plotReactive2$Date, plotReactive2$Time), "%d/%m/%Y %H:%M:%S")

plot(plotReactive2$DateTime,as.numeric(levels(plotReactive2$Global_reactive_power))[plotReactive2$Global_reactive_power], type = "l", lty = "solid",ylab="Global_reactive_power",xlab="datetime")


