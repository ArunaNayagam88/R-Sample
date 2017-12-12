
# Environment variables and setting working directory

# Working with environment variables

dir()

ls()

rm("mtrx1")

rm(list = ls())

# get working directory func
getwd()

setwd("C:/Users/a541789/Desktop/R studio")


help(ggplot)

?ggplot



setwd("D:/Official/Data Science/RWORK")



# Your first R program

x <- "Hello World !!"

Y <- "My Name is Gautham"

z <- "I teach Data Science" 
    
a <- merge(Y, z)

a

merge(x,a)


z <- merge(x = x, y = y)

z

# (Press Cntrl + Shift + C to create a comment)
# Real life example 
# Does better clarity of diamonds always mean a better price
# -----------------------------------------------------------
# Install packages
install.packages("ggplot2")

library(ggplot2)

mydata <- read.csv(file.choose())

# Generate a graph showing price vs Carat
ggplot(data = mydata, aes(x= carat, y = price)) +
    geom_point()

# Add clarity to graph by assigning Variable Clarity to color
ggplot(data = mydata, aes(x= carat, y = price, color = clarity)) +
    geom_point()

# Improve the transperancy of the color
ggplot(data = mydata, aes(x= carat, y = price, color = clarity)) +
    geom_point(alpha = 0.6)

# Let us remove the statistically insignificant data and restrict x axis to around 3.3
ggplot(data = mydata[mydata$carat <3.3,]
       , aes(x= carat, y = price, color = clarity)) +
    geom_point(alpha = 0.6)


# Let us add the smoothers to show the patterns
ggplot(data = mydata[mydata$carat <3.3,]
       , aes(x= carat, y = price, color = clarity)) +
    geom_point(alpha = 0.4)+
    geom_smooth()

# Does a better clarity of diamonds always mean a better price?
# Complete ----------------------------------------------------



