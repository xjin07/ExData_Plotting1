# 
# Construct a histogram for "Global Active Power" from
# the data 2007-02-01 to 2007-02-02

# read the data file, and only part of the data was read to save the memory
  data<- read.table("household_power_consumption.txt", header = TRUE,
                  comment.char = "", sep= ";", na.string= "?",nrows = 70000)

# convert Date strings into a Date object
  dt<-as.Date(data$Date,"%d/%m/%Y")

# subset the data by finding data from dates 2007-02-01 and 2007-02-02
  sdata <- subset(data, dt=="2007-02-01"|dt=="2007-02-02")

# construct plot1 and display it on screen
  hist(sdata$Global_active_power,xlab = "Global Active Power (kilowatts)",
       main  = "Global Active Power", col = "red")
  
# save plot1 to a PNG file with a width of 480 pixels and
# a height of 480 pixels
  png(filename="plot1.png",width = 480, height = 480)
  hist(sdata$Global_active_power,xlab = "Global Active Power (kilowatts)",
       main  = "Global Active Power", col = "red")
  dev.off()
  

  

