# Program: plot1.R
#install.packages("dplyr")
#library("dplyr")

thpcDF <- read.csv("<your path to the Data directory>/Data/tidy_household_power_consumption.csv")
print(names(thpcDF))


png("<your path to the main directory>/ExData_Plotting1/plot1.png",480,480)
hist(as.numeric(thpcDF$Global_active_power),main="Global Active Power", col="red",ylim=c(0,1200),xlab="Global Active Power (kilowatts)",ylab="Frequency",breaks = 11)
dev.off()





