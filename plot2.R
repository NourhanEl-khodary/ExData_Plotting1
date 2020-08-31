## Creating a time series graph for the Global Active Power variable
## Storing it as a png file called plot2.png



data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, 
                   comment.char = "", quote = '\"')                                ## Reading the data from the data txt file
reqData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")                   ## Extracting the required data which dates are (1/2/2007 and 2/2/2007)
reqData$DateTime <- strptime(paste(reqData$Date, reqData$Time),                    ## Adding new column to the required data merging the date and time
                             "%d/%m/%Y %H:%M:%S")                                  ## together and converting them from string format to date format
png("plot2.png", width = 480, height = 480)                                        ## Open a png graphic device with width 480 and height 480
par(mar = c(2.5,5,2,2))                                                            ## Set the margins for the plot graph
plot(reqData$DateTime, reqData$Global_active_power, type = "l",                    ## Plot on the x-axis the time and the y-axis global active power and 
     ylab = "Global Active Power (kilowatts)")                                     ## the type line
dev.off()                                                                          ## close the png graphic device