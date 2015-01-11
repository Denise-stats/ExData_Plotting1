Power <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
Power <- Power[(Power$Date=='1/2/2007'|Power$Date=='2/2/2007'),]
Power$Date <- as.Date(Power$Date, "%d/%m/%y")
Power$Time <- strptime(Power$Time, "%H:%M:%S")
Power$Global_active_power <- as.numeric(Power$Global_active_power)
attach(Power)
hist(Global_active_power, col ="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width =480, height =480)
dev.off()
