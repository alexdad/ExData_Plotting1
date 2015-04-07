csvfile<-"household_power_consumption.txt"
f<-read.csv(csvfile,header=TRUE,na.strings="?",sep=";")
f$dtt<-strptime( paste(f$Date, f$Time), "%d/%m/%Y %H:%M:%S")
f$dt<-as.Date(format(f$dtt, "%Y-%m-%d"))
f$Date<-NULL
f$Time<-NULL
dmin<-as.Date("2007-02-01", "%Y-%m-%d")
dmax<-as.Date("2007-02-02", "%Y-%m-%d")
f1<-f[ which(f$dt >= dmin & f$dt <=dmax), ]

png(filename="plot2.png")
with(f1, plot(dtt, Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="",main=""))
dev.off()