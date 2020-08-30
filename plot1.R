## Creating a histogram for the Global Active Power variable
## Storing it as a png file called plot1.png

library(lubridate)


data <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?") ## Reading the data from the data txt file
reqData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")                   ## Extracting the required data which dates are (1/2/2007 and 2/2/2007)
reqData[,"Date"] <- dmy(reqData[,"Date"])                                          ## Convert the date from string to date object
reqData[,"Time"] <- hms(reqData[,"Time"])                                          ## Convert the date from string to time object
reqData[,"Global_active_power"] <- as.numeric(reqData[,"Global_active_power"])     ## Convert the date from string to numeric object
png("plot1.png", width = 480, height = 480)                                        ## Open a png graphic device with width 480 and height 480
hist(reqData$Global_active_power, breaks = 12, col = "red",                        ## Create the histogram for global active power, set the breaks to 12, colour as red
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")       ## label the x-axis and put a title to the plot
dev.off()                                                                          ## close the png graphic device
