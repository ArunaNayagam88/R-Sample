
# Multiple Linear Regression

rm(list = ls())


Startup50 <- read.csv(file.choose())

head(Startup50)

str(Startup50)

levels(Startup50$State)
Startup50$State <- factor(Startup50$State)



# As part of linear regression we would like to observe the impact of RnD spending,
# Administration and Marketing Spending on Profit- which is the Dependent Variable

# Defining the null hypothesis we declare that none of the Independepent Variables
# have any impact on the Profit - H0

# plotting all the corelations on a scatterplot

pairs(Startup50)

plot(Startup50)

# values of R the corelation
cor(Startup50)

dummy.code(Startup50$State)

# Dummify
Startup50$State <- ifelse(Startup50$State == 'New York', 1, 0)

cor(Startup50)

attach(Startup50)

# Muliple linear regression
?lm



StartModel <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend + State)

StartModel

summary(StartModel)

str(Startup50)

-1.485e+03

8.003e-01
# one dollar spent on R&D will increase profit by 80 cents

predict(StartModel)

StartModel_wo_Adm <- lm(Profit ~ R.D.Spend + Marketing.Spend )

summary(StartModel_wo_Adm)

StartModel_wo_Marketing <- lm(Profit ~ R.D.Spend)



head(data.frame(Startup50, fitted(StartModel_without_Admin), residuals(StartModel_without_Admin)))

StartModel_wo_Adm

StartModel_wo_Marketing

plot(Profit ~ R.D.Spend)

plot(StartModel_wo_Adm)

resid(StartModel_wo_Adm)

fitted(StartModel_wo_Adm)

plot(resid(StartModel_without_Admin)~fitted(StartModel_without_Admin))

plot(resid(StartModel_without_Admin)~ R.D.Spend)

plot(fitted(StartModel_without_Admin) ~ R.D.Spend)


boxplot(resid(StartModel_without_Admin))

head(Startup50)

predict(StartModel_wo_Adm, newdata = data.frame(144372.4))

hist(resid(StartModel_without_Admin))

# Akaike's An Information Criterion

AIC(StartModel)

AIC(StartModel_wo_Adm)

AIC(StartModel_wo_Marketing)

AIC(StartModel_without_Marketing)


AIC(StartModel_with_Marketing)

StartModel_without_Marketing
                             
AIC(StartModel_without_Marketing)  

StartModel

AIC(StartModel)


# More examples - Using Cars data


# 
install.packages("caret")

data("cars", package = "caret")


head(cars)

str(cars)

cars_new <- cars;

is.data.frame(cars_new)

cars_new
head(cars_new)
attach(cars_new)

pairs(cars_new)

cars_new$Doors <- NULL
cars_new$Saab <- NULL
cars_new$Saturn <- NULL
cars_new$convertible <- NULL
cars_new$coupe <- NULL
cars_new$wagon <- NULL
cars_new$Buick <- NULL
cars_new$Pontiac <- NULL


pairs(cars_new)


model1 <- lm(Price ~ Mileage + Chevy + Cylinder + Cruise + 
                 Leather + sedan)

summary(model1)

# Pearson's correlation of age 

par()
par(mar = rep(1, 4))

plot(resid(model1) ~ fitted(model1))

par(mfrow = c(2,2) )

plot(model1)

# Transform by doing a 1/ sqrt(price)
model2 <- lm( (1/ sqrt(Price)) ~ Mileage + Chevy +  Cylinder + Cruise + 
                  Leather)

summary(model2)

par(mfrow = c(2,2) )
plot(model2)

# Log Transform
model3 <- lm(log(Price) ~ Mileage + Chevy + Cylinder + Cruise + 
                 Leather)

vcov(model3)

?vcov

summary(model3)



plot(resid(model2) ~ fitted(model2))

plot(resid(model3) ~ fitted(model3))

plot(resid(model1) ~ fitted(model1))


par(mfrow = c(2,2) )
plot(model3)


AIC(model1)
AIC(model2)
AIC(model3)

