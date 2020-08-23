# Read data 
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE)
summary(data)

#Filter dates 2007-02-01 and 2007-02-02
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data_fil<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

#Create datetime column
data_fil$dateTime<-paste(data_fil$Date,data_fil$Time)
data_fil$dateTime<-as.POSIXct(data_fil$dateTime)

## Create time seies plot
plot(data_fil$dateTime,data_fil$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

