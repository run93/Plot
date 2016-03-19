setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot")
data <- file("household_power_consumption.txt")
data2 <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE), col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3"), sep = ";", header = TRUE)
View(data2)
# hist(data2$global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# install.packages("timeDate")
library(timeDate)
data2$date <- as.Date(data2$date, format = "%d/%m/%Y")
data2$datetime <- paste(as.Date(data2$date), data2$time)
data2$datetime <- as.POSIXct(data2$datetime)
# plot(data2$global_active_power ~ data2$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

with(data2, {
    plot(sub_metering_1 ~ datetime, type = "l", 
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(sub_metering_2 ~ datetime, col = 'Red')
    lines(sub_metering_3 ~ datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 



