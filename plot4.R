Power <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
Power <- Power[(Power$Date=='1/2/2007'|Power$Date=='2/2/2007'),]
Power$Date <- as.Date(Power$Date, "%d/%m/%y")
Power$Time <- strptime(Power$Time, "%H:%M:%S")
Power$Global_active_power <- as.numeric(Power$Global_active_power)
attach(Power)

par(mfrow = c(2, 2))
plot(Global_active_power, type='l', xaxt="n",
     ylab = "Global Active Power (kilowatts)", xlab=" ")
axis(1, at=seq(1,2881,1440), label=c("Thu","Fri","Sat"))

plot(Voltage, type='l', xaxt="n", xlab="datetime")
axis(1, at=seq(1,2881,1440), label=c("Thu","Fri","Sat"))

plot(Sub_metering_1, type='l', xaxt="n", ylab = "Energy sub metering", xlab=" ",cex=0.5)
lines(Sub_metering_2,type='l',col="red")
lines(Sub_metering_3,type='l',col="blue")
axis(1, at=seq(1,2881,1440), label=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
      bty="n",text.font=8, cex=0.5)

plot(Global_reactive_power, type='l', xaxt="n", xlab="datetime")
axis(1, at=seq(1,2881,1440), label=c("Thu","Fri","Sat"))

dev.copy(png, file="plot4.png", width =480, height =480)
dev.off()
