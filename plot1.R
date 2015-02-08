library(lubridate)
mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
selection<-c("Date","Global_active_power")
plot1<-mydata[selection]
plot2<-plot1[which((plot1$Date == "1/2/2007") | (plot1$Date == "2/2/2007")),]
hist(as.numeric(levels(plot2$Global_active_power))[plot2$Global_active_power],main="Global active power",xlab ="Global Active Power (kilowatts)",col="red")

