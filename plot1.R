## Exploratory data analysis
## Download the data set, then unzip it and read it in, and subset just the dates 2007-02-01 and 2007-02-02
## then produce a histogram plot of global active power

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

## format the date and time columns
fepcdat <- mutate(epcdata, Date = dmy(Date),Time = hms(Time))

## create the plot
png(filename = "plot1.png",width = 480, height = 480)
hist(fepcdat$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()




    







