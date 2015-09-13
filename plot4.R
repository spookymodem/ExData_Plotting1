# create vectors for data classes and column names
classes <- c("character", "character", rep("numeric", 7))
col_names <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")

# read in the data
d <- read.csv("household_power_consumption.txt", skip=66636, nrows = 2880, sep=";", colClasses = classes, col.names = col_names)

# create column with date and time
date_time <- strptime(paste(d$date, d$time, sep=" " ), format="%d/%m/%Y %H:%M:%S")

# configure params to display 4 plots (2x2)
par(mfrow = c(2,2))

# generate plots
with(d, {
  plot(date_time,
       global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power")
  plot(date_time,
       voltage,
       type="l",
       xlab="",
       ylab="Voltage")
  plot(date_time, d$sub_metering_1,type="l",
       col="black",
       xlab="",ylab="Energy sub metering")
  
  lines(date_time, d$sub_metering_2,col="red",type="l")
  lines(date_time, d$sub_metering_3,col="blue",type="l")
  
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1,lwd=2,col=c("black","red","blue"),
         ncol=1,cex=0.8)
  plot(date_time,
       global_reactive_power,
       type="l",
       xlab="",
       ylab="Global reactive power")
      }
     )