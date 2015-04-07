csvfile<-"household_power_consumption.txt"
f<-read.csv(csvfile,header=TRUE,na.strings="?",sep=";")
f$dtt<-strptime( paste(f$Date, f$Time), "%d/%m/%Y %H:%M:%S")
f$dt<-as.Date(format(f$dtt, "%Y-%m-%d"))
f$Date<-NULL
f$Time<-NULL
dmin<-as.Date("2007-02-01", "%Y-%m-%d")
dmax<-as.Date("2007-02-02", "%Y-%m-%d")
f1<-f[ which(f$dt >= dmin & f$dt <=dmax), ]

png(filename="plot3.png")
with(f1, plot(dtt, Sub_metering_1, type="l",ylab="Energy sub metering",xlab="",main=""))
legend("topright", bty="n", col=c("black", "red", "blue"), lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(f1, points(dtt, Sub_metering_2, type="l",col="red"))
with(f1, points(dtt, Sub_metering_3, type="l",col="blue"))
dev.off()