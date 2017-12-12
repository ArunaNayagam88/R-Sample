ls()
rm(list = ls())
getwd()

setwd() # to set working directory

mydata <- read.csv("frauddata.csv")
mydata

# expoliring the data frame
head(mydata)

head(mydata, n=3)

tail(mydata, n=2)

# total number of rows and cols..
nrow(mydata)
ncol(mydata)

#under stand the data structure
str(mydata)

mydata$fraudRisk <- factor(mydata$fraudRisk)

#data statistics
summary(mydata)

mydata[3,4]

is.data.frame(mydata[4,4])
is.factor(mydata[4])
class(mydata)

#get the 3 column
mydata[,3]
mydata[,3,drop = F]

mydata[3,"balance"]

mydata

attach (mydata)

mydata[order(numTrans,decreasing = T),]

balanceIndex <- order(mydata$balance,decreasing = T)
balanceIndex

#conditional Filtering of Data

mydata$numTrans >=20

Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas")

mynewdf <- data.frame(Country = Countries_2012_Dataset, 
                      Region = Regions_2012_Dataset, 
                      Codes = Codes_2012_Dataset)

mynewdf
rm(mynewdf)

install.packages("reshape")

library(reshape)

?rename 

mydata <- rename(mydata, c("custID"="Cust_ID"))
mydata


install.packages("sqldf")
library (sqldf)

sqldf("select * from mydata")
