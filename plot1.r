# set my directory
setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot")
# read file
data <- file("household_power_consumption.txt")
# clean the data and give them the name
data2 <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE), col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3"), sep = ";", header = TRUE)
# I would like to review it before I plot it
View(data2)
# plot
hist(data2$global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
