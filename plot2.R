# 
# Construct a plot of "Global Active Power (kilowatts)" vs "Date and Time" from
# the data 2007-02-01 to 2007-02-02

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
  
# construct plot2 and display it on screen
  plot(dtt,sdata$Global_active_power,type = "l",
       xlab="",ylab = "Global Active Power (kilowatts)")

# save plot2 to a PNG file with a width of 480 pixels and
# a height of 480 pixels
  png(filename="plot2.png",width = 480, height = 480)
  plot(dtt,sdata$Global_active_power,type = "l",
       xlab="",ylab = "Global Active Power (kilowatts)")
  dev.off()