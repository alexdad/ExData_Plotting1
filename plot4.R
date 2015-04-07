
csvfile<-"household_power_consumption.txt"
f<-read.csv(csvfile,header=TRUE,na.strings="?",sep=";")
f$dtt<-strptime( paste(f$Date, f$Time), "%d/%m/%Y %H:%M:%S")
f$dt<-as.Date(format(f$dtt, "%Y-%m-%d"))
f$Date<-NULL
f$Time<-NULL
dmin<-as.Date("2007-02-01", "%Y-%m-%d")
dmax<-as.Date("2007-02-02", "%Y-%m-%d")
f1<-f[ which(f$dt >= dmin & f$dt <=dmax), ]

png(filename="plot4.png")
par(mfrow = c(2, 2))
with(f1, { 
    plot(dtt, Global_active_power, type="l",ylab="Global Active Power",xlab="",main="")
    plot(dtt, Voltage, type="l",ylab="Voltage",xlab="datetime",main="")
    plot(dtt, Sub_metering_1, type="l",ylab="Energy sub metering",xlab="",main="")
    points(dtt, Sub_metering_2, type="l",col="red")
    points(dtt, Sub_metering_3, type="l",col="blue")
    legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(dtt, Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime",main="")
})
dev.off()