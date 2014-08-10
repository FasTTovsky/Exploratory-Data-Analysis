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

## Convert Date to actual date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Add new column with datetime
datetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datetime)

## Plot 4
par( mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data$Global_active_power~data$DateTime, ylab="Global Active Power", 
     xlab="", type="l")

plot(data$Voltage~data$DateTime, ylab="Voltage", xlab="datetime", type="l")

plot(data$Sub_metering_1~data$DateTime, ylab="Energy sub metering", 
     xlab="", type="l")
lines(data$Sub_metering_2~data$DateTime,col='Red')
lines(data$Sub_metering_3~data$DateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Global_reactive_power~data$DateTime, ylab="Global_reactive_power", 
     xlab="datetime", type="l")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()