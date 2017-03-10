#1-Read file (source:https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip )

download.file(url ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile ="household_power_consumption.zip")

unzip("household_power_consumption.zip")

HPconsumption<-read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#2-Convert column Date as.Date

HPconsumption$Date<- as.Date(HPconsumption$Date,"%d/%m/%Y")

#3-Select data from the dates 2007-02-01 and 2007-02-02

HPconsumptionFeb<-subset(HPconsumption, Date=="2007-02-01" | Date=="2007-02-02")

#4-Plot1

png(filename = "Plot1.png", width=480, height = 480)

hist(HPconsumptionFeb$Global_active_power,col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
par(oma=c(0,0,1,20))
mtext("Plot1", outer = TRUE)
dev.off()

