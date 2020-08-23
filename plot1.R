# Read data 
data<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE)

#Filter dates 2007-02-01 and 2007-02-02
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data_fil<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

#Create histogram
hist(data_fil$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()