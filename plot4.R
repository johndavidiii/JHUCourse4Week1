#Plot4.R

thpcDF <- read.csv("<your path to the Data directory>/Data/tidy_household_power_consumption.csv")
print(names(thpcDF))
print(nrow(thpcDF))


png("<your path to the main directory>/ExData_Plotting1/plot4.png",1200,1200)

plot_colors <- c("black","red","blue")
v <- as.numeric(thpcDF$Voltage)
y1 <- as.numeric(thpcDF$Global_active_power)
y2 <- as.numeric(thpcDF$Global_reactive_power)
y1sub <- as.numeric(thpcDF$Sub_metering_1)
y2sub <- as.numeric(thpcDF$Sub_metering_2)
y3sub <- as.numeric(thpcDF$Sub_metering_3)

par(mfrow=c(2,2),mar=c(4,4,2,1))
with(thpcDF, {
  xtick <- seq(0,2880,by=1440)
  ytick1 <- seq(0,6,by=2)
  plot(y1,axes=F,ylab = "Global Active Power (kilowatts)",cex=0.001,xlab="")
  lines(y1,type="l",lty=1,lwd=1,col=plot_colors[1])
  axis(side=1,at=xtick,labels = c("Thu","Fri","Sat"))
  axis(side=2,at=ytick1,labels=FALSE)
  text(par("usr")[1],ytick1,labels=ytick1,xpd=TRUE,pos=2)
  box()
  
  plot(v, axes=F,ylab = "Voltage",cex=0.001,xlab="datetime")
  ytick2 <- seq(234,246,by=4)
  axis(side=1,at=xtick,labels = c("Thu","Fri","Sat"))
  axis(side=2,at=ytick2,labels=FALSE)
  lines(v,type="l",lty=1,lwd=1,col=plot_colors[1])
  text(par("usr")[1],ytick2,labels=ytick2,xpd=TRUE,pos=2)
  box()

  plot(y1sub,axes=F,ylab = "Energy Sub Metering",cex=0.001,xlab="")
  ytick3 <- seq(0,30,by=10)
  axis(side=2,at=ytick3,labels=FALSE)
  text(par("usr")[1],ytick3,labels=ytick,xpd=TRUE,pos=2)
  lines(y1sub,type="l",lty=1,lwd=1,col=plot_colors[1])
  lines(y2sub,type="l",lty=1,lwd=1,col=plot_colors[2])
  lines(y3sub,type="l",lty=1,lwd=1,col=plot_colors[3])
#  axis(side=1,at=xtick,labels = c("Thu","Fri","Sat"))
  axis(side=1,at=xtick,labels = c("Thu","Fri","Sat"))
  axis(side=2,at=ytick3,labels=FALSE)
  text(par("usr")[1],ytick3,labels=ytick3,xpd=TRUE,pos=2)
  legend("top",legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),col=c("black","red","blue"),lty=1,cex=1,bty="n",lwd=1)
  box()
  
  plot(y2,axes=F,ylab = "Global Reactive Power ",cex=0.001,xlab="datetime")
  ytick4 <- seq(0.0,0.5,by=0.1)
  axis(side=1,at=xtick,labels = c("Thu","Fri","Sat"))
  axis(side=2,at=ytick4,labels=FALSE)
  lines(y2,type="l",lty=1,lwd=1,col=plot_colors[1])
  text(par("usr")[1],ytick4,labels=ytick4,xpd=TRUE,pos=2)
  box()
})

dev.off()
