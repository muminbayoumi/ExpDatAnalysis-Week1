if(!file.exists("data.zip")) {
        download.file(
                "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = "data.zip",
                method = "curl"
        )
}
if (!file.exists("household_power_consumption.txt")) {
        unzip("data.zip", overwrite = T,exdir ="../ExpDatAnalysis-Week1" )

}
library(here)
library(tidyverse)
library(sqldf)
library(RSQLite)
library(data.table)
library(magrittr)




#### Reading Data####
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
# I've tried  multiple methods, using SQLDF made most sense however it has problem parsing date as  string and comparing
# values if date not standardized as in this data set. examples of  formats 01/1/2006,1/01/2006,01/01/2006.

#using read.table with skip and nrow function using readLines works but appears to be slow.
#not sure what the memory consumption like.

dataHeader <- read.table('household_power_consumption.txt',nrows = 1,sep = ';') #this is used to preserve first row.


con <- file("household_power_consumption.txt")

#the following code i got from multiple different sources
# this discussion forum was really helpful to put it into action
# https://www.coursera.org/learn/exploratory-data-analysis/discussions/weeks/1/threads/2M337rTnEeWHMgod_NjFNw

dat <- read.table('household_power_consumption.txt', skip = grep("1/2/2007", readLines(con = con))[1]-1,
           nrow =  grep("3/2/2007",readLines(con=con))[1] - grep("1/2/2007", readLines(con=con))[1],sep = ';')

colnames(dat) <- dataHeader[1,]

####cleaning  up date column####
dat$Date<- str_replace_all(dat$Date,'/','-')
dat$Date <- paste(dat$Date,dat$Time)
dat$Date <- lubridate::dmy_hms(dat$Date)


################# Failed  Attempts #################################
# dbGetQuery(con ,'SELECT * FROM household_power_consumption.txt WHERE Date BETWEEN "01/02/2007" AND "03/02/2007"')
#
#
# my_tbl <- 'SELECT * FROM household_power_consumption.txt WHERE Date BETWEEN "01/02/2007" AND "03/02/2007"' %>% sql() %>% tbl(con, .)

#
# sqldf::read.csv.sql(file = 'household_power_consumption.txt',
#                     sep = ';',
#                     sql = "SELECT * FROM file where substr(Date,6,9)||substr(Date,3,4)||substr(Date,1,1)
#       between '2007021' and '2007022' ",
#                     header = T)
