## Exploratory data analysis
## Download the data set, then unzip it and read it in, and subset just the dates 2007-02-01 and 2007-02-02
## create a date_time variable and then plot a line graph

## import the libraries needed
library(dplyr)
library(lubridate)

## First, download and unzip the data
destfile = "./data/dataset.zip"
fileURL <-fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists(destfile)) {
   if(!file.exists(dirname(destfile))){dir.create(dirname(destfile))}
    download.file(fileURL,destfile=destfile)
    unzip(destfile,exdir = dirname(destfile))
}

## Read the datset (onyl do this once)
if (!exists("epcdata")) {
    epcdata <- read.csv("./data/household_power_consumption.txt",sep=";",na.strings=c("?")) # remember that missing values are represented by '?'
    ##subset just the days 2007-02-01 and 2007-02-02 (these are in text format)
    epcdata <- filter(epcdata,Date == "1/2/2007" | Date == "2/2/2007")
}

## add a date_time column
fepcdat <- mutate(epcdata,Date_Time = dmy_hms(paste(Date,Time)))

## create the plot
png(filename = "plot3.png",width = 480, height = 480)
with(fepcdat,plot(Date_Time, Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "l"))
with(fepcdat,(lines(Date_Time,Sub_metering_2,col = "red")))
with(fepcdat,(lines(Date_Time,Sub_metering_3,col = "blue")))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))
dev.off()
