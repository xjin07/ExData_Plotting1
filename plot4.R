# 
# Construct plot4 of course project 1, it has four subplots
#

# read the data file, and only part of the data was read to save the memory
  data<- read.table("household_power_consumption.txt", header = TRUE,
                    comment.char = "", sep= ";", na.string= "?",nrows = 70000)

# convert Date strings into a Date object
  dt<-as.Date(data$Date,"%d/%m/%Y")

# subset the data by finding data from dates 2007-02-01 and 2007-02-02
  sdata <- subset(data, dt=="2007-02-01"|dt=="2007-02-02")

# use strptime() to convert dates and times into a POSIXlt object
  dtt<-paste(sdata$Date, sdata$Time)
  dtt<-strptime(dtt, "%d/%m/%Y %H:%M:%S")

# construct plot4 and display it on screen
  par(mfrow = c(2,2),mar=c(4,4,3,3))
  
  plot(dtt,sdata$Global_active_power,type = "l",
       xlab="",ylab = "Global Active Power (kilowatts)")
  
  plot(dtt,sdata$Voltage,type = "l", xlab="datatime",
       ylab = "Global Active Power (kilowatts)")
  
  yrange<- range(c(sdata$Sub_metering_1,sdata$Sub_metering_2,sdata$Sub_metering_3))
  
  plot(dtt,sdata$Sub_metering_1,type = "l", ylim=yrange, xlab="",
       ylab = "Energy Sub Metering")
  par(new=TRUE)
  plot(dtt,sdata$Sub_metering_2,type = "l", ylim=yrange, col="red",xlab="",ylab = "")
  par(new=TRUE)
  plot(dtt,sdata$Sub_metering_3,type = "l", ylim=yrange, col="blue", xlab="",ylab = "")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"), lty=1,cex=0.75, bty="n" )
  
  plot(dtt,sdata$Global_reactive_power,type = "l", xlab="datatime")

# save plot4 to a PNG file with a width of 480 pixels and
# a height of 480 pixels
  
  png(filename="plot4.png",width = 480, height = 480)
  par(mfrow = c(2,2),mar=c(4,4,3,3))
  
  plot(dtt,sdata$Global_active_power,type = "l",
       xlab="",ylab = "Global Active Power (kilowatts)")
  
  plot(dtt,sdata$Voltage,type = "l", xlab="datatime",
       ylab = "Global Active Power (kilowatts)")
  
  yrange<- range(c(sdata$Sub_metering_1,sdata$Sub_metering_2,sdata$Sub_metering_3))
  
  plot(dtt,sdata$Sub_metering_1,type = "l", ylim=yrange, xlab="",
       ylab = "Energy Sub Metering")
  par(new=TRUE)
  plot(dtt,sdata$Sub_metering_2,type = "l", ylim=yrange, col="red",xlab="",ylab = "")
  par(new=TRUE)
  plot(dtt,sdata$Sub_metering_3,type = "l", ylim=yrange, col="blue", xlab="",ylab = "")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"), lty=1,cex=0.75, bty="n" )
  
  plot(dtt,sdata$Global_reactive_power,type = "l", xlab="datatime")
  dev.off()