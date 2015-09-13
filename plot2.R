## Exploratory data analysis --> Course project 1
## Quick way to find out colclasses which can improve
## the way you read in large files

filename = "household_power_consumption.txt"
tabAll <- read.table(filename, header = TRUE, na.strings = "?", sep=";", stringsAsFactors=FALSE)

## Make Date an actual Date
tabAll <- transform(tabAll, Date = as.Date(strptime(Date,format="%d/%m/%Y",tz="UTC")))

## Filter the dates used
CleanData <- tabAll[tabAll$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

## Create plot
DateTimeCombined <- as.POSIXct(paste(CleanData$Date, CleanData$Time), format="%Y-%m-%d %H:%M:%S")
with(CleanData, plot(DateTimeCombined,Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
axis(1, at = as.POSIXct(c("2007-02-01 00:00:00","2007-02-01 24:00:00","2007-02-02 24:00:00")),labels = c("Thu","Fri","Sat"))     

## Save to PNG file 
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!