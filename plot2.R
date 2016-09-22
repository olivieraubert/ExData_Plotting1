###########################################################################################
########################   Plot2.R                          ############################## ���Plo𝚁                    ##################################
###########################################################################################

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
png(filename="plot2.png", height=480, width=480)

# Create the plot
plot(HOUSING_2$Time_date,
     HOUSING_2$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# SAve the figure
dev.off ()
