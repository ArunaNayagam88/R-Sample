
# K-Means Clustering

rm(list = ls())

set.seed(2)

x=matrix(rnorm(50*2), ncol=2)

x

plot(x)

x[1:25,1]=x[1:25,1]+3

x

x[1:25,2]=x[1:25,2]-4

x

plot(x)

?kmeans()

km.out= kmeans(x,2,nstart=20)

km.out

km.out$cluster

plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=2", 
     xlab="", ylab="", pch=20, cex=2)


set.seed(4)

km.out=kmeans(x,3,nstart=20)

km.out

plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=3", xlab="", ylab="", pch=20, cex=2)

set.seed(3)

km.out=kmeans(x,3,nstart=1)

km.out$tot.withinss
km.out=kmeans(x,3,nstart=20)
km.out$tot.withinss

plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=3", xlab="", ylab="", pch=20, cex=2)


# Hierarchical Clustering

hc.complete=hclust(dist(x), method="complete")

hc.average=hclust(dist(x), method="average")

hc.single=hclust(dist(x), method="single")

par(mfrow=c(1,3))
plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
plot(hc.average, main="Average Linkage", xlab="", sub="", cex=.9)
plot(hc.single, main="Single Linkage", xlab="", sub="", cex=.9)

?cutree

cutree(hc.complete, 2)
cutree(hc.average, 2)
cutree(hc.single, 2)

cutree(hc.single, 4)

xsc=scale(x)

plot(hclust(dist(xsc), method="complete"), main="Hierarchical Clustering with Scaled Features")

x=matrix(rnorm(30*3), ncol=3)
dd=as.dist(1-cor(t(x)))

plot(hclust(dd, method="complete"), main="Complete Linkage with Correlation-Based Distance", xlab="", sub="")



# Cluster Analysis 

getwd()
setwd("C:/Users/a541789/Desktop/R studio")
mydata <- read.csv("Utilities.csv")
str(mydata)
head(mydata)
pairs(mydata)
attach(mydata)

# Scatter plot 
plot(mydata$Fuel_Cost~ mydata$Sales, data = mydata)

with(mydata,text(mydata$Fuel_Cost ~ mydata$Sales, labels=mydata$Company,pos=4, cex = .7))


# For cluster analysis we should remove qualitative variables
z = mydata[,-c(1,1)]
z

# Normalize - very Large or very numbers with respect to individual variables 
# can be misleading, so it is important to bring the data into a similar level

means = apply(z, MARGIN = 2, FUN = mean)

means

sds = apply(z,2,sd)

sds

?scale

nor = scale(z,center=means,scale=sds)

nor

##calculate distance matrix (default is Euclidean distance)
? dist

distance = dist(nor)

distance

print(distance, digits = 3)


# Hierarchical agglomerative clustering using default complete linkage 
mydata.hclust = hclust(distance)
plot(mydata.hclust)
plot(mydata.hclust,labels=mydata$Company,main='Default from hclust')
plot(mydata.hclust,hang=-1)

# Hierarchical agglomerative clustering using "average" linkage 
mydata.hclust<-hclust(distance,method="average")
plot(mydata.hclust,hang=-1)

# Cluster membership
member = cutree(mydata.hclust,3)
table(member)

#Characterizing clusters 
aggregate(nor,list(member),mean)
aggregate(mydata[,-c(1,1)],list(member),mean)

# Scree Plot
wss <- (nrow(nor)-1)*sum(apply(nor,2,var))
for (i in 2:20) wss[i] <- sum(kmeans(nor, centers=i)$withinss)
plot(1:20, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares") 

# K-means clustering
kc<-kmeans(nor,3)
