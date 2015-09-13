# create vectors for data classes and column names
classes <- c("character", "character", rep("numeric", 7))
col_names <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")

# read in the data
d <- read.csv("household_power_consumption.txt", skip=66636, nrows = 2880, sep=";", colClasses = classes, col.names = col_names)

# create column with date and time
date_time <- strptime(paste(d$date, d$time, sep=" " ), format="%d/%m/%Y %H:%M:%S")

# generate the plot
plot(date_time,
     d$global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
