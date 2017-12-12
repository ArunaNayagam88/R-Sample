
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

# values of R the corelation
cor(Startup50)

dummy.code(Startup50$State)

# Dummify
Startup50$State <- ifelse(Startup50$State == 'New York', 1, 0)

cor(Startup50)
?cor

attach(Startup50)

# Muliple linear regression
StartModel <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend + State)

summary(StartModel)

str(Startup50)




predict(StartModel)
StartModel_without_Admin <- lm(Profit ~ R.D.Spend + Marketing.Spend + State)
summary(StartModel_without_Admin)

8.003e-01
2.859e-02

StartModel_with_Marketing <- lm(Profit ~ R.D.Spend + Marketing.Spend)
summary(StartModel_with_Marketing)


StartModel_without_Marketing <- lm(Profit ~ R.D.Spend)



head(data.frame(Startup50, fitted(StartModel_without_Admin), residuals(StartModel_without_Admin)))


plot(Profit ~ R.D.Spend)

plot(StartModel_without_Admin)

resid (StartModel_without_Admin)

fitted(StartModel_without_Admin)

plot(resid(StartModel_without_Admin)~fitted(StartModel_without_Admin))

plot(resid(StartModel_without_Admin)~ R.D.Spend)

plot(fitted(StartModel_without_Admin) ~ R.D.Spend)


boxplot(resid(StartModel_without_Admin))


hist(resid(StartModel_without_Admin))

# Akaike's An Information Criterion

StartModel_with_Marketing

AIC(StartModel_with_Marketing)

StartModel_without_Marketing
                             
AIC(StartModel_without_Marketing)  

StartModel

AIC(StartModel)

