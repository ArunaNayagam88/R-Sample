ls()
rm(list = ls())

#Read data file


mydata <- read.csv(file.choose())

head(mydata)

str(mydata)
# NSP =  Normal/ Suspect/ Pathalogic

mydata$NSPF <- as.factor(mydata$NSP)

# Partition data

set.seed(1234)

part <- sample(2, nrow(mydata), replace = T, prob = c(0.8, 0.2))

part

train <- mydata[part == 1,]

test <- mydata[part == 2,]


#Decision tree with party
 install.packages("party")

library(party)

head(train)
 
mytree <- ctree(NSPF~LB+AC+FM, train)


print(mytree)

plot(mytree)

# Pruning the tree
# 90% confidence that the variable is significant
# Only split the branch into 2 when the sample size reaches 100
mytree <- ctree(NSPF~LB+AC+FM, train, controls=ctree_control(mincriterion=0.9, minsplit=100))

print(mytree)

plot(mytree)

# Pruning the tree further
mytree <- ctree(NSPF~LB+AC+FM, train, controls=ctree_control(mincriterion=0.99, minsplit=500))

print(mytree)

plot(mytree)

# predicting test data based on training model

predict(mytree, test, type = "prob")

# rpart library

install.packages("rpart")
library(rpart)

mytree1 <- rpart(NSPF~LB+AC+FM, train)

install.packages("rpart.plot")
library(rpart.plot)

rpart.plot(mytree1, extra = 1)

rpart.plot(mytree1, extra = 4)

nrow(test)

predict(mytree1, test)

#Misclassification error
tab<-table(predict(mytree), train$NSPF)

print(tab)

testpred<- predict(mytree, test)

testtab <- table(testpred, test$NSPF)

testtab

# Random Forest
install.packages("randomForest")
library(randomForest)

fit <- randomForest(NSPF~LB+AC+FM, data = mydata)
print(fit) # view results 
importance(fit) # importance of each predictor

plot(fit)
