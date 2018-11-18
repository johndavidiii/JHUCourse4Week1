# Convert Text file to csv file
#install.packages("data.table")
#install.packages("gtools")
library("data.table")
library("gtools")
library("dplyr")


elecDF <- read.csv("<your path to the Data directory>/Data/household_power_consumption.csv",stringsAsFactors = FALSE)

#print(head(elecDF))
#print(str(elecDF))

Date <- c()
Time <- c()
Global_active_power <- c()
Global_reactive_power <- c()
Voltage <- c()
Global_intensity <- c()
Sub_metering_1 <- c()
Sub_metering_2 <- c()
Sub_metering_3 <- c()

indx <- which(elecDF$Date == "1/2/2007")
for (k in 1:length(indx)){
  tmpIndx <- indx[k]
  Date <- c(Date, elecDF$Date[tmpIndx])
  Time <- c(Time, elecDF$Time[tmpIndx])
  Global_active_power <- c(Global_active_power, elecDF$Global_active_power[tmpIndx])
  Global_reactive_power <- c(Global_reactive_power,elecDF$Global_reactive_power[tmpIndx])
  Voltage <- c(Voltage,elecDF$Voltage[tmpIndx])
  Global_intensity <- c(Global_intensity,elecDF$Global_intensity[tmpIndx])
  Sub_metering_1 <- c(Sub_metering_1,elecDF$Sub_metering_1[tmpIndx])
  Sub_metering_2 <- c(Sub_metering_2,elecDF$Sub_metering_2[tmpIndx])
  Sub_metering_3 <- c(Sub_metering_3,elecDF$Sub_metering_3[tmpIndx])
}
indx <- which(elecDF$Date == "2/2/2007")
for (k in 1:length(indx)){
  tmpIndx <- indx[k]
  Date <- c(Date, elecDF$Date[tmpIndx])
  Time <- c(Time, elecDF$Time[tmpIndx])
  Global_active_power <- c(Global_active_power, elecDF$Global_active_power[tmpIndx])
  Global_reactive_power <- c(Global_reactive_power,elecDF$Global_reactive_power[tmpIndx])
  Voltage <- c(Voltage,elecDF$Voltage[tmpIndx])
  Global_intensity <- c(Global_intensity,elecDF$Global_intensity[tmpIndx])
  Sub_metering_1 <- c(Sub_metering_1,elecDF$Sub_metering_1[tmpIndx])
  Sub_metering_2 <- c(Sub_metering_2,elecDF$Sub_metering_2[tmpIndx])
  Sub_metering_3 <- c(Sub_metering_3,elecDF$Sub_metering_3[tmpIndx])
}

gsub("?","NA",Date)
gsub("?","NA",Time)
gsub("?","NA",Global_active_power)
gsub("?","NA",Global_reactive_power)
gsub("?","NA",Voltage)
gsub("?","NA",Global_intensity)
gsub("?","NA",Sub_metering_1)
gsub("?","NA",Sub_metering_2)
gsub("?","NA",Sub_metering_3)


#print(length(Date))
#print(length(Time))
#print(length(Global_active_power))
#print(length(Global_reactive_power))
#print(length(Voltage))
#print(length(Global_intensity))
#print(length(Sub_metering_1))
#print(length(Sub_metering_2))
#print(length(Sub_metering_3))

tmpDF <- data.frame(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3)
#print(head(tmpDF,20))
#print(nrow(tmpDF))

tmpDF2 <- na.omit(tmpDF)
#print(nrow(tmpDF2))

write.csv(tmpDF2,"<your path to the Data directory>/Data/tidy_household_power_consumption.csv")

