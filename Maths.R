#data type double is default
x<-2
x

typeof(x)

#Data type enforcing interger
x<-2L
typeof(x)

x<- 2147483647L  #max interger value, > that this is max value

.Machine$integer.max

.Machine$double.xmax
.Machine$double.xmin


is.integer(x)
is.double(x)


#Data type complex
x<- 2+3i

typeof (x)
typeof (2.3+5L)

#operations using variables

?srqt

sqrt (4)

#Exponent

x^2

#logarithm

log (16,2)
log2 (16)
log10 (25)

19000e-5

1.9e2

#vectors

x<-1

typeof (x)

class(x)

seq(10,20, by =2)

seq(10,20, length.out = 5)

x<-1:10
x

x<- c(3,5,7,9,10,12) #c- combine function
x

is.vector(x)

x[3]
x[1:2]

x[c(1,3)]
x[-2]

y <- c(5,10,15,20,25,30)

x[6:1]
plot (x,y)

cor(x[6:1],y)

plot (x[6:1],y)

plot (x,y,type = "b",ylim = c(1,30))

mean(y)
median(y)
mode(y)

rnorm (20)
r<-rnorm(50,mean =50, sd=2)
r
hist(r) #histogram plot

rbinom(50,10,0.5)

hist(rbinom(50,10,0.5))

set.seed(999) # set the same value algorithim for the rnorm/rbinom
rnorm(10,5,2)
set.seed(999)
rnorm(10,5,2)

min(x)
max(x)
range(y)
sum(y)
quantile(y)

rank(r)

#Rank methord
x2 <- c(3,2,1,4,5,6,8,9,4)

rank (x2,ties.method = "first") # first occurance wins

#Matrices

?matrix

m<- matrix(1:6,nrow =3)
m
m<- matrix(c(1:6),ncol =3)
m
m<- matrix(c(1:6),ncol =3,byrow = T)
m
m<- matrix(c(1:6),nrow =3,byrow = F)
m

class (m)

#transpose
t(m)

#subsetting
m[1]
m[5]
m[3,2]
rownames(m)<=rownames(m,do.NULL = FALSE,prefix = "Test.")
colnames(m)<=colnames(m,do.NULL = FALSE,prefix = "Test.")
m

# creating Arrays
