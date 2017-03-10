#1-Read file (source:https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip )

download.file(url ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile ="household_power_consumption.zip")

unzip("household_power_consumption.zip")

HPconsumption<-read.table(file = "household_power_consumption.txt", 
                          header = TRUE, sep = ";", na.strings = "?")

#2-Convert column Date as.Date

HPconsumption$Date<- as.Date(HPconsumption$Date,"%d/%m/%Y")

#3-Select data from the dates 2007-02-01 and 2007-02-02

HPconsumptionFeb<-subset(HPconsumption, Date=="2007-02-01" | Date=="2007-02-02")

#4-Add column Date_Time

HPconsumptionFeb$Date_Time<-strptime(paste(HPconsumptionFeb$Date,
                                           HPconsumptionFeb$Time),
                                    format = "%Y-%m-%d %H:%M:%S")

#5-Plot3

png(filename = "Plot3.png", width=480, height = 480)

with(HPconsumptionFeb, plot(Date_Time,Sub_metering_1, type="l", xlab="", 
                            col="black", 
                            ylab = "Energy sub metering"))
with(HPconsumptionFeb,lines(Date_Time, Sub_metering_2, col="red"))
with(HPconsumptionFeb,lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty =c(1,1,1))
par(oma=c(0,0,1,20))
mtext("Plot 3", outer = TRUE)
dev.off()

