library(lubridate)
mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
selection<-c("Global_active_power","Date","Time")
plot1<-mydata[selection]
plot2<-plot1[which((plot1$Date == "1/2/2007") | (plot1$Date == "2/2/2007")),]

plot2$DateTime <- strptime(paste(plot2$Date, plot2$Time), "%d/%m/%Y %H:%M:%S") 
plot(plot2$DateTime,as.numeric(levels(plot2$Global_active_power))[plot2$Global_active_power], type = "l", lty = "solid",ylab="Global Active Power (kilowatts)",xlab="")

