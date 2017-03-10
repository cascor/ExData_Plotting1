#1-Read file (source:https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip )

download.file(url ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile ="household_power_consumption.zip")

unzip("household_power_consumption.zip")

HPconsumption<-read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#2-Convert column Date as.Date

HPconsumption$Date<- as.Date(HPconsumption$Date,"%d/%m/%Y")

#3-Select data from the dates 2007-02-01 and 2007-02-02

HPconsumptionFeb<-subset(HPconsumption, Date=="2007-02-01" | Date=="2007-02-02")

#4-Add column Date_Time

HPconsumptionFeb$Date_Time<-strptime(paste(HPconsumptionFeb$Date,HPconsumptionFeb$Time),
                                    format = "%Y-%m-%d %H:%M:%S")

#5-Plot2

png(filename = "Plot2.png", width=480, height = 480)

with(HPconsumptionFeb, plot(Date_Time,Global_active_power, type="l", xlab="", 
                            ylab = "Global Active Power (kilowatts)"))
par(oma=c(0,0,1,20))
mtext("Plot2", outer = TRUE)
dev.off()

