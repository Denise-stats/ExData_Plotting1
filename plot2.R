Power <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
Power <- Power[(Power$Date=='1/2/2007'|Power$Date=='2/2/2007'),]
Power$Date <- as.Date(Power$Date, "%d/%m/%y")
Power$Time <- strptime(Power$Time, "%H:%M:%S")
Power$Global_active_power <- as.numeric(Power$Global_active_power)
attach(Power)
plot(Global_active_power, type='l', xaxt="n",
     ylab = "Global Active Power (kilowatts)", xlab=" ")
axis(1, at=seq(1,2881,1440), label=c("Thu","Fri","Sat"))
dev.copy(png, file="plot2.png", width =480, height =480)
dev.off()
