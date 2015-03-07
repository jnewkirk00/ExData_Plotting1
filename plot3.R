## Read data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Convert time to a complete time including date
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## Convert to date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

##  Subset
hpc.sub <- subset(hpc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

## Open file
png(file="plot3.png", width=480, height=480, units="px" )

## Generate plot
plot(hpc.sub$Time, hpc.sub$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="")
lines(hpc.sub$Time,hpc.sub$Sub_metering_2, col=2)
lines(hpc.sub$Time,hpc.sub$Sub_metering_3, col=4)
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close file
dev.off()