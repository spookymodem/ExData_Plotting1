# create vectors for data classes and column names
classes <- c("character", "character", rep("numeric", 7))
col_names <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")

# read in the data
d <- read.csv("household_power_consumption.txt", skip=66636, nrows = 2880, sep=";", colClasses = classes, col.names = col_names)

# generate the histogram
hist(d$global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
