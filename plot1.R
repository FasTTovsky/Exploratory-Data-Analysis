## Getting full dataset
## This conditional check is for test purposes only.
## If d exists in global environment, use it to avoid reading the file again
## For this to work, d must be defined in the Global Env
if ( !exists( "filedata" ) ) {
        filedata <- read.csv("Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                             check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
}

## Subsetting the data
data <- subset( filedata, Date == "1/2/2007" | Date == "2/2/2007" )

## Plot 1
## Creating Plot1
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", main="Global Active Power", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()