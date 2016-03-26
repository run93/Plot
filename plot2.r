# set directory
setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot")
# read data
data <- file("household_power_consumption.txt")
# clean data and give them the name
data2 <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE), col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3"), sep = ";", header = TRUE)
# I would like to view it before plotting
View(data2)
# This is a previous code,, hist(data2$global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# I need timeDate function
install.packages("timeDate")
library(timeDate)
data2$date <- as.Date(data2$date, format = "%d/%m/%Y")
data2$datetime <- paste(as.Date(data2$date), data2$time)
data2$datetime <- as.POSIXct(data2$datetime)
# plot
plot(data2$global_active_power ~ data2$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
