telecom <- read.csv("telecomcalls.csv")
telecom

#ODBC

install.packages("RODBC")

library(RODBC)

odbcDataSources()

odbcConnectExcel2007("AmazingMartEU.xls")

#read excel file
install.packages("xlsx")

library(xlsx)

install.packages("rjava")

library(rjava)

#read.xlsx can be used

# connecting to mysql dabas instance

install.packages("RMySQL")
library(RMySQL)

ucscDb <- dbConnect(MySQL(),user = "genome", 
                    host = "genome-mysql.cse.ucsc.edu")

result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);


#remove a package
remove.packages("RODBC")


#Reading from web

con <- url ("https://en.wikipedia.org/wiki/R_(programming_language)")
con

htmlcode = readLines(con)
close (con)

htmlcode

#Parsing with XML

library(xml)
