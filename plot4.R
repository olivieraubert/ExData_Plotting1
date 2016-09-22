################################################################################################
############################# Plot4.R                  #########################################
################################################################################################

getwd()
setwd ("/Users/olivieraubert/ExData_Plotting1")


fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./household_power_consumption.zip", method="curl")
unzip ("./household_power_consumption.zip")
HOUSING<-  read.table ("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
dim (HOUSING)

## Data from 2007-02-01 and 2007-02-02

HOUSING$Time_date  <- strptime(paste(HOUSING$Date,HOUSING$Time),
                               format="%d/%m/%Y %H:%M:%S")
View (HOUSING)
HOUSING_2 = subset(HOUSING,as.Date(HOUSING$Time_date) >= "2007-02-01" 
                   & as.Date(HOUSING$Time_date) < "2007-02-03")
View(HOUSING_2)

## png device
png(filename="plot4.png", height=480, width=480)

## 2x2
par(mfrow=c(2,2))

## FIRST PLOT
plot(HOUSING_2$Time_date,
     HOUSING_2$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

## SECOND PLOT
plot(HOUSING_2$Time_date,
     HOUSING_2$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

## THIRD PLOT
## First sub-meter
plot(HOUSING_2$Time_date, HOUSING_2$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l",)

## Second sub-meter
lines(HOUSING_2$Time_date, HOUSING_2$Sub_metering_2, col="red", type="l")

## Third sub-meter
lines(HOUSING_2$Time_date, HOUSING_2$Sub_metering_3,col="blue", type="l")

## Legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"))

## FOURTH PLOT
plot(sub_data$Time_date,
     sub_data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")


# Save the figure
dev.off()
