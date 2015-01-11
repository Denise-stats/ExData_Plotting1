Power <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
Power <- Power[(Power$Date=='1/2/2007'|Power$Date=='2/2/2007'),]
Power$Date <- as.Date(Power$Date, "%d/%m/%y")
Power$Time <- strptime(Power$Time, "%H:%M:%S")
Power$Global_active_power <- as.numeric(Power$Global_active_power)
attach(Power)

plot(Sub_metering_1, type='l', xaxt="n", ylab = "Energy sub metering", xlab=" ")
lines(Sub_metering_2,type='l',col="red")
lines(Sub_metering_3,type='l',col="blue")
axis(1, at=seq(1,2881,1440), label=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       cex=0.8)

dev.copy(png, file="plot3.png",width =480, height =480)
dev.off()
