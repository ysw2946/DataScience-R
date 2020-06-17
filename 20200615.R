library(MASS)
library(neuralnet)
iris
data <- iris
# 결측값 찾기
na <- apply(data,2,is.na)
na
apply(na,2,sum)

# 데이터 정규화
maxs <- apply(data[,1:4],2,max)
maxs

mins <- apply(data[,1:4],2,min)
mins

# 출력 데이터 생성
data[,1:4] <- scale(data[,1:4], center = mins, scale = maxs - mins)
data[,1:4]

data$setosa <- ifelse(data$Species =="setosa",1,0)
data$virginica <- ifelse(data$Species =="virginica",1,0)
data$versicolor <- ifelse(data$Species =="versicolor",1,0)

head(data)

# 학습용과 테스트용 데이터 분리
n <- nrow(data)
n

set.seed(2000)
index <- sample(1:n,round(0.8*n))
index

train <- as.data.frame(data[index,])
head(train)

test <- as.data.frame(data[-index,])
head(test)

# 학습용 입출력 데이터
f.var.independent <- "Sepal.Length + Sepal.Width + Petal.Length + Petal.Width"
f.var.dependent <- "setosa + virginica + versicolor"
f <- paste(f.var.dependent,'~',f.var.independent)
f

# 학습 및 모형 출력
nn <- neuralnet(f,data = train, hidden = c(6,6), linear.output = F)
plot(nn)

# 테스트
predicted <- compute(nn, test[,-5:-8])
predicted$net.result

idx <- max.col(predicted$net.result)
idx
species <- c('setosa','virginica', 'versicolor')
predicted <- species[idx]
predicted

table(test$Species,predicted)
