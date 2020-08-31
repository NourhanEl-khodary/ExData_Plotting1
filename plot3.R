## Creating a time series graph for the Energy sub metering the 3 types
## Storing it as a png file called plot3.png



data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, 
                   comment.char = "", quote = '\"')                                ## Reading the data from the data txt file
reqData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")                   ## Extracting the required data which dates are (1/2/2007 and 2/2/2007)
reqData$DateTime <- strptime(paste(reqData$Date, reqData$Time),                    ## Adding new column to the required data merging the date and time
                             "%d/%m/%Y %H:%M:%S")                                  ## together and converting them from string format to date format
png("plot3.png", width = 480, height = 480)                                        ## Open a png graphic device with width 480 and height 480
par(mar = c(2.5,5,2,2))                                                            ## Set the margins for the plot graph
plot(reqData$DateTime, reqData$Sub_metering_1, type = "l",                         ## Plot on the x-axis the time and energy the y-axis sub metering (1) and 
     ylab = "Enery sub metering")                                                  ## the type line
lines(reqData$DateTime, reqData$Sub_metering_2, col = "red")                       ## Add the line for sub metering 2 with color red
lines(reqData$DateTime, reqData$Sub_metering_3, col = "blue")                      ## Add the line for sub metering 3 with color blue
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")## Add legend to the plot
       , col = c("black", "red", "blue"), lty = 1)
dev.off()                                                                          ## close the png graphic device