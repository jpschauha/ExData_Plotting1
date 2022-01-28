hpc<-read.table("./Data/household_power_consumption.txt",header = TRUE, sep = ";")
hpc[['datetime']] <- strptime(paste(hpc[['Date']],hpc[['Time']],sep=" "),format = "%d/%m/%Y %H:%M:%S")
mydata <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
png("plot3.png", width=480, height=480)
with(mydata, {
  plot(datetime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime,Sub_metering_2, col='red')
  lines(datetime,Sub_metering_3, col='blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

