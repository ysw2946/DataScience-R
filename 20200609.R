#install.packages("neuralnet")

library(neuralnet)
library(MASS)

Boston
head(Boston)

data <- Boston[,c(1,2,4,5,9,14)]
head(data)

na <- apply(data, 2, is.na)
na

apply(na, 2, sum)

maxs <- apply(data, 2, max)
maxs

mins <- apply(data, 2, min)
mins

data.scaled <-scale(data, center = mins, scale = maxs-mins)
data.scaled

set.seed(1234)

n <- nrow(data.scaled)
index <- sample(1:n,round(0.8*n,0))
index

train <-as.data.frame(data.scaled[index,])
head(train)

test <- as.data.frame(data.scaled[-index,])
head(test)

f <- "medv ~ crim + zn + chas + nox + rad"
f

model <- neuralnet(f, data= train, hidden = c(3,2), linear.out=T)
plot(model)

predicted <- compute(model, test)
predicted$net.result # 예측치

predicted.real <- predicted$net.result*(maxs[6]-mins[6])+mins[6]
predicted.real

test.real <- (test$medv)*(maxs[6] - mins[6]) + mins[6] 
test.real

plot(test.real,predicted.real,
     xlim=c(0,50),ylim=c(0,50),
     main="실제 값 대비 예측 값 분포",
     xlab="실제 값", ylab="예측 값",
     col="red",
     pch=18,cex=0.7)
abline(0,1,col="blue",lty=2)

MAPE <- sum(abs(test.real-predicted.real)/test.real*100)/length(test.real)
MAPE
