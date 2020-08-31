## Creating 4 time series graphs for:
## 1. the global active power
## 2. Voltage
## 3. the Energy sub metering the 3 types
## 4. the global reactive power
## Storing it as a png file called plot4.png



data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, 
                   comment.char = "", quote = '\"')                                ## Reading the data from the data txt file
reqData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")                   ## Extracting the required data which dates are (1/2/2007 and 2/2/2007)
reqData$DateTime <- strptime(paste(reqData$Date, reqData$Time),                    ## Adding new column to the required data merging the date and time
                             "%d/%m/%Y %H:%M:%S")                                  ## together and converting them from string format to date format
png("plot4.png", width = 480, height = 480)                                        ## Open a png graphic device with width 480 and height 480
par(mfrow=c(2,2), tcl=-0.5, mai=c(0.3,0.3,0.3,0.3), mar = c(4,4,2,2))              ## Adjusting the margins and setting the plot to take 4 graphs

## Plot 1
plot(reqData$DateTime, reqData$Global_active_power, type = "l", xlab = "",         ## Plot on the x-axis the time and the y-axis global active power and 
     ylab = "Global Active Power")                                                 ## the type line

## Plot 2
plot(reqData$DateTime, reqData$Voltage, type = "l", xlab = "datetime",             ## Plot on the x-axis the time and the y-axis Voltage and the type line
     ylab = "Voltage") 

## Plot 3
plot(reqData$DateTime, reqData$Sub_metering_1, type = "l",                         ## Plot on the x-axis the time and energy the y-axis sub metering (1) and 
     ylab = "Energy sub metering", xlab = "")                                      ## the type line
lines(reqData$DateTime, reqData$Sub_metering_2, col = "red")                       ## Add the line for sub metering 2 with color red
lines(reqData$DateTime, reqData$Sub_metering_3, col = "blue")                      ## Add the line for sub metering 3 with color blue
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")## Add legend to the plot
       , col = c("black", "red", "blue"), lty = 1, cex = 0.9, bty = "n")

## Plot 4
plot(reqData$DateTime, reqData$Global_reactive_power, xlab = "datetime",           ## Plot on the x-axis the time and the y-axis global reactive power and
     ylab = "Global_reactive_power", type = "l")                                   ## the type line

dev.off()                                                                          ## close the png graphic device