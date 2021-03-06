
#  Data Visualization in R

ls()
rm(list = ls())

ls()

# Lets start with plotting a simple point

x<-4
y<-9

dat <- data.frame(x,y)

dat

install.packages("ggplot2")

library(ggplot2)


ggplot() +
    geom_point(data = dat, aes(x = dat$x, y = dat$y), size = 9, color = "red")


ggplot() +
    geom_point(data = dat, aes(x = x, y = y), 
               size = 5, color = "blue")

# Let us modify this

ggplot() +
    geom_point(data = dat, aes(x = x, y = y), 
               size = 25, color = "red")


# Lets plot a set of point

x<- 4:9

y<- 9:4

x
y

dat <- data.frame(x,y)

dat

plot(dat$x, dat$y)

ggplot() +
    geom_point(data = dat, aes(x=x, y=y), 
               size = 5, color = "green")


# Lets plot 

x<- c(2,5,1)
y<- c(6,4,9)

dat <- data.frame(x,y)

dat

ggplot() +
    geom_point(data = dat, aes(x=x, y=y), 
               size = 5, color = "blue")


# Normal population of numbers

rnorm(100, mean = 50, sd = 10)

summary(rnorm(100, mean = 50, sd = 20))

rep(1,100)

x<- rep(1,100)

y<- rnorm(100, mean = 50, sd = 50)


ndat <- data.frame(x,y)

ndat

x<- 1
y<- 50
mean <- data.frame(x,y)

mean



ggplot()+
    geom_point(data = ndat, aes(x,y)) +
    geom_point(data = mean, aes(x,y), 
               size = 10, color = "red") 



ggplot()+
    geom_boxplot(data = ndat, aes(x,y))+
    geom_point(data = ndat, aes(x,y)) +
    geom_point(data = mean, aes(x,y), 
               size = 10, color = "red")
    


# Lets try to control the axis

ggplot() +
    geom_point(data = ndat, aes(x=x, y=y), 
               size = 3, color = "blue")+
    geom_point(data = mean, aes(x,y), size = 10, color = "red")+
    scale_x_continuous(limits = c(0,10)) +
    scale_y_continuous(limits = c(0,10))

# Lets use sequence function to break the distribution of data
# in both x and y axis


seq(5, 50, length.out = 20 )

ggplot() +
    geom_point(data = ndat, aes(x=x, y=y),size = 5, color = "blue")+
    scale_x_continuous(limits = c(0,10), breaks = seq(0,10,1)) +
    scale_y_continuous(limits = c(0,10), breaks = seq(0,10,1))

# More colors

ggplot() +
    geom_point(data = ndat, aes(x=x, y=y),size = 5, color = "chocolate")+
    scale_x_continuous(limits = c(0,10), breaks = seq(0,10,1)) +
    scale_y_continuous(limits = c(0,10), breaks = seq(0,10,1))



# Lets change the shape of the points

ggplot() +
    geom_point(data = dat, aes(x=x, y=y), size = 5, 
    color = "chocolate", shape = 23) +
    scale_x_continuous(limits = c(0,10), breaks = seq(0,10,1)) +
    scale_y_continuous(limits = c(0,10), breaks = seq(0,10,1))

ggplot() +
    geom_point(data = dat, aes(x=x, y=y), size = 5, 
               color = "chocolate",shape = 23, fill = "blue") +
    scale_x_continuous(limits = c(0,10), breaks = seq(0,10,1)) +
    scale_y_continuous(limits = c(0,10), breaks = seq(0,10,1))

# clear
ggplot()
    
# Adding text to shape

ggplot() +
    geom_point(data = dat, aes(x=x, y=y), size = 5, 
               color = "chocolate",shape = 25, fill = "red") +
    geom_text(data = dat, mapping = aes(x=x%%10, y=y%%10, 
                label= x),size=2) +
    scale_x_continuous(limits = c(0,10), breaks = seq(0,10,1)) +
    scale_y_continuous(limits = c(0,10), breaks = seq(0,10,1))
    

    
# Adding a line

x<- c(1,8)
y<- c(3,10)
x
y
dat <- data.frame(x,y)

dat

ggplot()+
    geom_line(data = dat, aes(x=x, y=y)) +
scale_x_continuous(limits = c(0,15), breaks = seq(0,15,1)) +
    scale_y_continuous(limits = c(0,15), breaks = seq(0,15,1))



x<- c(-2,7)
y<- c(13,-5)


dat <- data.frame(x,y)

ggplot()+
    geom_line(data = dat, aes(x=x, y=y)) +
    scale_x_continuous(limits = c(-5,15), breaks = seq(-5,15,1)) +
    scale_y_continuous(limits = c(-5,15), breaks = seq(-5,15,1))


# plotting lines based on functions
#  y= 3x+1; y=-5x-7; y= .5x-.73

x<- c(1,10)

y <- (3*x) + 1

dat<- data.frame(x,y)

dat

ggplot()+
    geom_line(data = dat, aes(x=x, y=y)) +
    scale_x_continuous(limits = c(0,15), breaks = seq(0,15,1)) +
    scale_y_continuous(limits = c(0,35), breaks = seq(0,35,5))



# Creating visualizations based on real examples

ls()
rm(list = ls())

list.dirs()
list.files()

dat <- read.csv("Movie-Ratings.csv")

names(dat)

colnames(dat) <- c("Film", "Genre", "Critics_Rating", 
                   "Audience_Rating", "Budjet_Million", "Year_Release")


head(dat, 20)

str(dat)

nrow(dat)
    
levels(dat$Genre)

levels(dat$Genre)    
    
summary(dat)

levels(dat$Year_Release)
# Since year is not a qualitative data, and we would 
# like to use it as qualitative, we are using the factor function

factor(dat$Year_Release)

dat$Year_Release1 <- factor(dat$Year_Release)

dat$Year_Release <- factor(dat$Year_Release)

str(dat)

# Aesthetics
# ------------
library(ggplot2)

# Compare critics rating to budjet.
# Is there an impact of critics rating on big budjet?
# Why am I asking this question?

ggplot()+
    geom_point(data = dat, aes(x=Critics_Rating, 
                y = Budjet_Million))


ggplot()+
    geom_point(data = dat, aes(x= dat$Audience_Rating, 
                               y = Budjet_Million))



# Compare critics rating and audience ratings
ggplot()+
    geom_point(data = dat, 
               aes(x=dat$Audience_Rating, 
                   y= dat$Critics_Rating, color = "chocolate"))

# Add some color for Genre
ggplot()+
    geom_point(data = dat, 
               aes(x=dat$Audience_Rating, y= dat$Critics_Rating,
                   color = dat$Genre))

# Points of different color and size
# Analyze the data
ggplot()+
    geom_point(data = dat, 
               aes(x=dat$Audience_Rating, y= dat$Critics_Rating,
                   color = dat$Genre, size = dat$Budjet_Million))
    


# Layers
# -------

# Assigning plot to a variable as an object
# Remove the geom's

p <- ggplot(data = dat, 
               aes(x=dat$Audience_Rating, y= dat$Critics_Rating,
                   color = dat$Genre, size = dat$Budjet_Million))


p + geom_point()

p + geom_line()

p + geom_col()

p  + geom_bin2d()

p + geom_density2d()

p + geom_density_2d() + geom_point()

p <- ggplot(data = dat, 
            aes(x=dat$Audience_Rating, y= dat$Critics_Rating,
                color = dat$Genre))


# Over-riding

p + geom_point(aes(x= dat$Budjet_Million)) + 
    xlab("Budjet Million $$$")


# Histogram

h <- ggplot(data = dat, aes(x= dat$Budjet_Million))

h + geom_histogram(binwidth = 10)

# Creates a bin and adds all the movies in that budjet to the bin

# Add color
h + geom_histogram(binwidth = 20, fill = "blue")

h + geom_histogram(binwidth = 20, aes(fill = dat$Genre))

# border
h + geom_histogram(binwidth = 20, 
                   aes(fill = dat$Genre), color = "black")

# Factes

v<-ggplot(data = dat, aes(x= dat$Budjet_Million))
    
v + geom_histogram(binwidth = 20, 
                   aes(fill = dat$Genre), colour = "black")

v + geom_histogram(binwidth = 20, 
                   aes(fill = dat$Genre), colour = "black") +
    facet_grid(dat$Genre~.)


# Density
h + geom_density(aes(fill = dat$Genre))

h + geom_density(aes(fill = dat$Genre), position = "stack")


p

# Statistical transformation
p + geom_point() + geom_smooth()

p + geom_point() + geom_smooth(method = "lm", fill = NA)


# box plots

b<- ggplot(data = dat, aes(x= dat$Genre, y = dat$Audience_Rating, 
                           color = dat$Genre))

b + geom_boxplot()

b + geom_boxplot() + geom_point()


# use xlab and ylab for adding labels

# export your graphs

