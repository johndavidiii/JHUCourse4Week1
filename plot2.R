#Plot2.R

thpcDF <- read.csv("<your path to the Data directory>/Data/tidy_household_power_consumption.csv")
print(names(thpcDF))
print(nrow(thpcDF))


png("<your path to the main directory> /ExData_Plotting1/plot2.png",480,480)
#hist(as.numeric(thpcDF$Global_active_power),main="Global Active Power", col="red",ylim=c(0,1200),xlab="Global Active Power (kilowatts)",ylab="Frequency",breaks = 11)

#x <- Day
#plot_colors <- c(rgb(r=0,g=0,b=0.9),"red","forestgreen")
y <- as.numeric(thpcDF$Global_active_power)
#print(max(y))
#par(mar=c(4.2,3.8,0.2,0.2))
plot(y,axes=F,ylab = "Global Access Power(kilowatts)",cex=0.01,xlab="")
xtick <- seq(0,2880,by=1440)
ytick <- seq(0,6,by=2)
axis(side=1,at=xtick,labels = c("Thu","Fri","Sat"))
axis(side=2,at=ytick,labels=FALSE)
text(par("usr")[1],ytick,labels=ytick,xpd=TRUE,pos=2)
box()
lines(y,type="l",lty=2,lwd=2)
#text(x=xtick,par("usr")[3],labels=c("Thu","Fri","Sat"),xpd=T,cex=0.8)
dev.off()
