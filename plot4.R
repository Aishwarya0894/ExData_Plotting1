# Read data 
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE)
summary(data)

#Filter dates 2007-02-01 and 2007-02-02
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data_fil<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

#Create datetime column
data_fil$dateTime<-paste(data_fil$Date,data_fil$Time)
data_fil$dateTime<-as.POSIXct(data_fil$dateTime)

# Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data_fil, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

#Save file and close device
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
