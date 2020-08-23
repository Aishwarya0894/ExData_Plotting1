# Read data 
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE)
summary(data)

#Filter dates 2007-02-01 and 2007-02-02
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data_fil<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

#Create datetime column
data_fil$dateTime<-paste(data_fil$Date,data_fil$Time)
data_fil$dateTime<-as.POSIXct(data_fil$dateTime)

# Create Plot 3
with(data_fil, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save file and close device
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
