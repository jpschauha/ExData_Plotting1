hpc<-read.table("./Data/household_power_consumption.txt",header = TRUE, sep = ";")
hpc[['datetime']] <- strptime(paste(hpc[['Date']],hpc[['Time']],sep=" "),format = "%d/%m/%Y %H:%M:%S")
mydata <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with( mydata, {
  plot(datetime,Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(datetime,Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(datetime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime,Sub_metering_2, col='red')
  lines(datetime,Sub_metering_3, col='blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime,Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
}
)
dev.off()