## Read data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Convert time to a complete time including date
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## Convert to date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Subset
hpc.sub <- subset(hpc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

## Open file
png(file="plot4.png", width=480, height=480, units="px" )

## Set up for 2 rows and 2 columns of plots
par(mfrow=c(2,2))

## Generate plot
with(hpc.sub, {
  plot(hpc.sub$Time, hpc.sub$Global_active_power, ylab="Global Active Power", type="l", xlab="")
  plot(hpc.sub$Time, hpc.sub$Voltage, ylab="Voltage", type="l", xlab="datetime")
  plot(hpc.sub$Time, hpc.sub$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="")
  lines(hpc.sub$Time,hpc.sub$Sub_metering_2, col=2)
  lines(hpc.sub$Time,hpc.sub$Sub_metering_3, col=4)
  legend("topright", lwd=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(hpc.sub$Time, hpc.sub$Global_reactive_power, ylab="Global_reactive_power", type="l", xlab="datetime")
  })

## Close file
dev.off()