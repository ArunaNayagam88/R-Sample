

# Logistic Regression

rm(list = ls())

email <- read.csv(file.choose())


head(email)

str(email)

# Dummify
email$Male <- ifelse(email$Gender == "Male", 1, 0)

email$Female <- ifelse(email$Gender == "Male", 0, 1)

email$Male <- factor(email$Male)

email$Female <- factor(email$Female)

str(email)

# email$TookAction <- factor(email$TookAction)

attach(email)


plot(TookAction ~ Age)
plot(log(TookAction) ~ Age)

abline(lm(log(TookAction)~Age), col = "red")

# Run linear regression
model1 <- lm(TookAction ~ Age + Male)

pairs(email)

plot(model1)

plot(resid(model1) ~ fitted(model1))

summary(model1)

model2 <- lm(TookAction ~ Age + Female)

summary(model2)

data.frame(model2$fitted.values, model2$residuals)

plot(resid(model1) ~ fitted(model1))

# Run logistic regression

?glm

lmodel1 <- glm(formula = TookAction ~ Age + Male, family = binomial)

plot(lmodel1)

plot(resid(lmodel1) ~ fitted(lmodel1))

data.frame(lmodel1$fitted.values, lmodel1$residuals)



#############################################

install.packages("ISLR")

library(ISLR)
?Smarket

attach (Smarket)
head (Smarket)

summary(Smarket)

Smarket[Smarket$Direction == "Up",]

cor(Smarket[,-9])

pairs(Smarket)

pairs(Smarket,col = Smarket$Direction)


#Step 2 : Split the data into training and testing data

training = (Year < 2005)
testing = !training

training_data = Smarket[training,]
testing_data = Smarket[testing,]

#Step 3: fit a logistic regression model using training data

stock_model = glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
                  data = training_data, family = binomial)

summary (stock_model)

#step 4: Use the fitted model to do predictions for the test data

model_pred_probs = predict(stock_model, testing_data, type = "response")

model_pred_probs

model_pred_direction = rep("Down", 252)

contrasts(Direction)

Direction[training]



Direction_testing = Direction[testing]
table(model_pred_direction, Direction_testing)
