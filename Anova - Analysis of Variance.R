# Anova - Analysis of Variance
rm(list = ls())


warpbreaks

str(warpbreaks)

summary(warpbreaks)

boxplot(warpbreaks$breaks~warpbreaks$wool)

# null hypothesis states that there is no difference in the means of breaks
# between the 2 types of wool
tmodel <- t.test(warpbreaks$breaks ~ warpbreaks$wool, mu = 0, alt = "two.sided", 
                 conf = 0.95, var.eq = F, paired = F)

boxplot(warpbreaks$breaks~warpbreaks$tension)

tmodel2 <- t.test(warpbreaks$breaks ~ warpbreaks$tension, mu = 0, alt = "two.sided", 
                 conf = 0.95, var.eq = F, paired = T)

#Error in t.test.formula(warpbreaks$breaks ~ warpbreaks$tension, mu = 0,  : 
 #                         grouping factor must have exactly 2 levels

# So as we can see t.test can be performed only when we are comapring 2 values.
# here tension has more than one level



tmodel

model1<- aov(breaks ~ wool, data = warpbreaks)

summary(model1)

model2<- aov(breaks ~ tension , data = warpbreaks)

summary(model2)


model3<- aov(breaks ~ wool + tension , data = warpbreaks)

summary(model3)

model4<- aov(breaks ~ wool + tension + wool:tension , data = warpbreaks)


summary(model4)


model4<- aov(breaks ~ wool * tension , data = warpbreaks)

summary(model4)


# Lung Capacity as a result of smoking

lungcap <- read.csv(file.choose())

head(lungcap)

names(lungcap)

summary(lungcap)

str(lungcap)

lungcap$Smoker <- factor(lungcap$Smoker)

lungcap$Gender <- factor(lungcap$Gender)

lungcap$Exercise <- factor(lungcap$Exercise)


boxplot(lungcap$LungCapacity ~ lungcap$Smoker)

# Assuming that the mean difference between the 2 samples of smoker and 
# non smoker is zero so mu = 0
# So our null hypothesis states that the mean lung capacity for the 
# smokers and non smokers is the same

tmodel <- t.test(lungcap$LungCapacity ~ lungcap$Smoker, mu =0, alt = "two.sided", 
       conf = 0.95, var.eq = F, paired = F)


tmodel


var(lungcap$Smoker ==0)

var(lungcap$Smoker ==1)

# since the variance between the 2 samples are same, so we set "var.eq = T" below
tmodel2 <- t.test(lungcap$LungCapacity ~ lungcap$Smoker, mu =0, alt = "two.sided", 
                 conf = 0.95, var.eq = T, paired = F)

tmodel2


# lets use the aov model to study the variance between lungcapacity and smoking
# our null hypotheis states that both smoker and non smokers have the 
# mean lung capacity

amodel1<- aov(lungcap$LungCapacity ~ lungcap$Smoker, data = lungcap)

summary(amodel1)

# Based on the p value above, we will reject the null hypothesis

# Below we compare the mean lung capacity of Male (1) and Female (0)
boxplot(lungcap$LungCapacity ~ lungcap$Gender)

# Our null hypothesis states that there is no difference in the lung capacity
# of men and women
amodel2<- aov(lungcap$LungCapacity ~ lungcap$Gender , data = lungcap)

summary(amodel2)



amodel3<- aov(lungcap$LungCapacity ~ lungcap$Smoker * lungcap$Gender , data = lungcap)

summary(amodel3)

TukeyHSD(amodel3)

plot(TukeyHSD(amodel3))

boxplot(TukeyHSD(amodel3))

amodel4<- aov(lungcap$LungCapacity ~ lungcap$Smoker * lungcap$Exercise, data = lungcap)


summary(amodel4)

TukeyHSD(amodel4)

plot(TukeyHSD(amodel4))

boxplot(TukeyHSD(amodel4))




# filtering

smokerdata <- lungcap[lungcap$Smoker == 0,]

smokerdata
amodel5<- aov(smokerdata$LungCapacity ~ smokerdata$Exercise*smokerdata$Age, data = smokerdata)

summary(amodel5)

TukeyHSD(amodel5)

plot(TukeyHSD(amodel5))

boxplot(TukeyHSD(amodel5))



