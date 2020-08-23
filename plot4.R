# Read data 
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE)
summary(data)

#Filter dates 2007-02-01 and 2007-02-02
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data_fil<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

#Create datetime column
data_fil$dateTime<-paste(data_fil$Date,data_fil$Time)
data_fil$dateTime<-as.POSIXct(data_fil$dateTime)

## Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))