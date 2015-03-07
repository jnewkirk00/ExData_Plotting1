## Read data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Conter time to a complete time including date
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## Convert to date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

##  Subset
hpc.sub <- subset(hpc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

## Open file
png(file="plot1.png", width=480, height=480, units="px" )

## Generate histogram
hist(hpc.sub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Close file
dev.off()