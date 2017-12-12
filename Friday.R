ls()
rm(list = ls())

# Exercise in R - swirl()
install.packages("swirl")

library(swirl)

swirl()


# Probability
x <- 0:5
y <- dbinom (x,size = 5,prob=0.5)
plot (x,y,type = "b")


#Get a list of random phonenames from phone

getwd()
setwd ("C:/Users/a541789/Desktop/R studio")
phone <- read.csv ("phonenumber.csv")

x<- 1:13


phone$sum <- phone$X2+phone$X3+phone$X6+phone$X9
phone$sum

names(phone) <- c("p1", "p2", "p3", "p4", "sum")

names(phone)

hist(phone$sum,xlim = c(0, 36))

# http://www.statisticalengineering.com/central_limit_theorem.htm



#Data Explorations

head(mtcars)

summary (mtcars)

str(mtcars)

attach(mtcars)
mpg
mtcars$mpg

plot(mpg,cyl)
plot(mpg~cyl+am+hp+disp)


plot(mtcars)

mtcars_new <- data.frame(mpg, cyl, disp, hp, am, gear)

mtcars_new

plot(mtcars_new)

cor(mtcars_new)

install.packages("Hmisc")

library(Hmisc)

unique(disp)
cor(mtcars)

install.packages("corrgram")
library(corrgram)
corrgram(mtcars)

boxplot(mtcars$mpg ~cyl)

boxplot(mtcars$mpg ~am, main = "Boxplot of Mpg vs AM",xlab = "AM", ylab = "MPG")

stars(mtcars,draw.segments = T,key.loc = c(13,1.5))

dist (mtcars_new)

plot (hclust(dist(mtcars)),main = "Hierarchy Clustering")

# pairs example
startup50 <- read.csv(file.choose())

head(startup50)

str(startup50)

summary(startup50)

levels(startup50$State)

#plotting all the corelation on a startup
pairs(startup50)

#value of R the corelation
cor(startup50)

#Dummify

startup50$State <- ifelse(startup50$State == 'New York',1,0)
startup50$State

#export 

write.csv()

#ggplot
library(ggplot2)

ggplot()  # function to clear the plot screen

x<-4
y<-9

dat<- data.frame(x,y)


ggplot()+geom_point(data= dat, aes(x =x, y=y), size = 5, color = "purple" )

x<-4:9
y<-9:4

ggplot()+geom_point(data= dat, aes(x =x, y=y), size = 5, color = "pink" )
ggplot()+geom_point(data= dat, aes(x =x, y=y), size = 5, color = "orange" )
ggplot()+geom_point(data= dat, aes(x =x, y=y), size = 5, color = "purple" )

?geom_bar
