## Electric Power Consumption Data

#Clear the environment
rm(list=ls())
#Read the test and train files
#require("data.table")
setwd("C:/Users/priya/Documents/GitHub/power_consumption")
#getwd()
#library(plyr)
#library(data.table)
#power_consumption<- read.table('./household_power_consumption.txt',sep=";",header=TRUE)
#pc<-power_consumption
#pc<- read.table('./pc.txt',sep=";",header=TRUE)
#write.table(pc, "C:/Users/priya/Documents/GitHub/power_consumption/pc.txt", sep="\t")
pc<-read.table('./pc.txt',sep="\t",header=TRUE)

#Convert data and Time variables
#convert to character
pc$Date<- as.Date(pc$Date)
pc <- pc[(pc$Date=="2007-02-01") | (pc$Date=="2007-02-02"),]


pc$Global_active_power <- as.numeric(as.character(pc$Global_active_power))
pc$Global_reactive_power <- as.numeric(as.character(pc$Global_reactive_power))
pc$Voltage <- as.numeric(as.character(pc$Voltage))
pc <- transform(pc, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
pc$Sub_metering_1 <- as.numeric(as.character(pc$Sub_metering_1))
pc$Sub_metering_2 <- as.numeric(as.character(pc$Sub_metering_2))
pc$Sub_metering_3 <- as.numeric(as.character(pc$Sub_metering_3))

plot(pc$timestamp,pc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png has been saved in", getwd())


