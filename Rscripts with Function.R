
# Creating your function and packages

#  Clear your environment, Copy files to your working directory

data()

ls()
rm(list = ls())
getwd()

setwd("D:/Official/Data Science/RWORK")

# logical operators

4<5
4>5

result1 <- 4<5
result2 <- 4>5

result1
result2

# Or operator
result1 | result2

# And operator
result1 & result2

# Not operator
!(result1 & result2)

isTRUE(result1)

isTRUE(result1 & result2)

# Control Structures

# Help regarding Control
?Control

# if statement structure
if (condition){
    +     statement  
    +     } 
else{
    +     alternative
    +     }


#  example for if statement

x<- 4

x

if(x==2) {
    print("This is True")
} else {
    print("This is False")
}

#  using more than 1 condition in if statement

x<- 2
y <- 4 # y gets the value 4

x
y

 if(x==2 && y>6)
     {
    print("x equals 2 and y is greater than 2")
 }


#  ifelse

x<- 1:10
x

ifelse(x<5 | x>8, x, 0)

# implicit loops (apply, lapply, sapply, tapply )

N <- 10
x1 <- rnorm(N)
x2 <- rnorm(N) + x1 + 1

x1
x2

?rbinom()

male <- rbinom(N,1,.4)

rbinom(10, 1, 0.4)


male


y <- 1 + x1 + x2 + male + rnorm(N)

y

mydat <- data.frame(y,x1,x2,male)

mydat

?lapply

lapply(mydat, mean) # returns a list

la <- lapply(X = mydat, FUN = mean)

typeof(la)

lapply(mydat, sd)


sa <- sapply(mydat,mean) # returns a vector

is.vector(sa)

mydat

?apply
apply(mydat,1,mean) # applies the function to each row

apply(mydat,2,mean) # applies the function to each column

?tapply

tapply(mydat$y, mydat$male, mean) # applies the function to each level of the factor


head(mtcars, 20)

# know the average miles per gallon of cars as a factor of 
# cars being Automatic and Manual
tapply(mtcars$mpg, mtcars$am, mean)

# cars with different number of cylinders
tapply(mtcars$mpg, mtcars$cyl, mean)

# more than one value  -- getting error
tapply(mtcars$mpg, c(mtcars$vs, mtcars$am) , mean)


# explicit loops

for (k in 1:5)  {
    if (k >=3)
        {
        print(k)
        }
    }




head(mtcars)

# write an ananymous function to 
# print cars belonging to 2 categories
# Super Cars with horsepower > 250 and value for Money cars
# with horsewpower >= 150 and mpg > 15
head(mtcars, 25)
nrow(mtcars)
mtcars$hp[25]
mtcars$mpg[25]

supercar <- ""
ValueForMoney <- "Value For Money Cars are"


for (i in 1:nrow(mtcars)){
    if (mtcars$hp[i] > 250) {
    supercar <- rbind(supercar, row.names(mtcars)[i])
    } else { 
        if (mtcars$hp[i] >= 150 && mtcars$mpg[i] > 15) {
        ValueForMoney <- rbind(ValueForMoney, row.names(mtcars)[i])
    }
    }
}

print( paste(supercar, " is a super car", sep = ""))
print(ValueForMoney)



# Save the above anonymous function as an R script in your 
# working directory and use the source function to execute it

source('Car_test.R')


mtcars

# Functions

?function

add2 <- function(x, y) {
    x + y
}


add2(2,5)

above10 <- function(x) {
    use <- x > 10
    x[use]
}

above10(11)

above <- function(x, n) {
    use <- x > n
    x[use]
}

above(8,6)


above <- function(x, n = 10) {
    use <- x > n
    x[use]
}

above(8,6  # n=10 will get overridden by 6

columnmean <- function(x) {
    nc <- ncol(x)
    means <- numeric(nc)
    for(i in seq_len(nc)) {
        means[i] <- mean(x[, i])
    }
    means
}

columnmean(mtcars)

columnmean(airquality)


columnmean <- function(x, removeNA = TRUE) {
    nc <- ncol(x)
    means <- numeric(nc)
    for(i in seq_len(nc)) {
        means[i] <- mean(x[, i], na.rm = removeNA)
    }
    means
}

columnmean(airquality)


# Write a function using the airquality data set to return information
# based on Month and date input
# User Defined Function

head(airquality)

AQ_Month_Day <- function(M, D) {
    if (is.numeric(M) & is.numeric(D))
    {
    res <- airquality[airquality$Month == M & airquality$Day == D,]
    print(res)
    } else {warning("Please enter a number for Month and Day")}
}
    


AQ_Month_Day("a",1)

AQ_Month_Day(9,9)




# Module 5 content

newdata <- readLines("victims.txt")
newdata

is.vector(newdata)

is.data.frame(newdata)

class(newdata)

newdf <- as.data.frame(newdata)

newdf

#grepl - returns a logical T/F output and grep returns the positio of the character
#being searched for 

?grepl

grep("^%", newdata) # ^ - uesd for first position in the data set


grepl("^%", newdata)


split_text<- strsplit(newdata,",")
split_text

unlist (split_text)
length(split_text)

lines <- matrix(unlist(split_text),nrow = length(split_text),byrow = T)

lines


                