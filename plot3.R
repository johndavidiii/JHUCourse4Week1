#Plot3.R

thpcDF <- read.csv("<your path to the Data directory>/Data/tidy_household_power_consumption.csv")
print(names(thpcDF))
print(nrow(thpcDF))


png("<your path to the main directory>/ExData_Plotting1/plot3.png",480,480)
#hist(as.numeric(thpcDF$Global_active_power),main="Global Active Power", col="red",ylim=c(0,1200),xlab="Global Active Power (kilowatts)",ylab="Frequency",breaks = 11)

#x <- Day
plot_colors <- c("black","red","blue")
y1 <- as.numeric(thpcDF$Sub_metering_1)
y2 <- as.numeric(thpcDF$Sub_metering_2)
y3 <- as.numeric(thpcDF$Sub_metering_3)
#print(max(y))
#par(mar=c(4.2,3.8,0.2,0.2))
plot(y1,axes=F,ylab = "Energy Sub Metering",cex=0.001,xlab="")
xtick <- seq(0,2880,by=1440)
ytick <- seq(0,30,by=10)
axis(side=1,at=xtick,labels = c("Thu","Fri","Sat"))
axis(side=2,at=ytick,labels=FALSE)
text(par("usr")[1],ytick,labels=ytick,xpd=TRUE,pos=2)
box()
lines(y1,type="l",lty=1,lwd=1,col=plot_colors[1])
lines(y2,type="l",lty=1,lwd=1,col=plot_colors[2])
lines(y3,type="l",lty=1,lwd=1,col=plot_colors[3])
legend("topright",legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),col=c("black","red","blue"),lty=1,cex=1,lwd=2)
#text(x=xtick,par("usr")[3],labels=c("Thu","Fri","Sat"),xpd=T,cex=0.8)
dev.off()
