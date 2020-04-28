# 6.4 동전 던지기 확률의 변화 차트

# 2개 동전 전지기[1]
plot.new()
count <- c(0, 0, 0)
for (n in 1:500) {
  coin <- sample(c(0, 1), 2, replace=T)
  
  ##### 앞면(1)과 뒷면(0)이 발생한 사건별 빈도: 시작 #####
  index <- sum(coin) + 1
  count[index] <- count[index] + 1
  ##### 앞면(1)과 뒷면(0)이 발생한 사건별 빈도: 끝 #####
  
  probability <- count / n
  
  title <- paste("반복 수: ", n, " / 500")
  barplot(probability,
          names.arg = c(0, 1, 2),
          xlab="앞면이 나온 횟수",
          ylab="확률",
          col=rainbow(3),
          main = title)
  
  Sys.sleep(0.05)
}

# 2개 동전 전지기[2]
plot.new()
count <- c(0, 0, 0)
for (n in 1:500) {
  coin <- sample(c(0, 1), 2, replace=T)
  
  ##### 앞면(1)과 뒷면(0)이 발생한 사건별 빈도: 시작 #####
  if (sum(coin) == 0)          # 2개 모두 뒷면인 경우 (0, 0)
    count[1] = count[1] + 1
  else if (sum(coin) == 1)   # 1개라도 앞면인 경우 (0, 1), (1, 0)
    count[2] = count[2] + 1
  else                                  # 2개 모두 앞면인 경우 (1, 1)
    count[3] = count[3] + 1
  ##### 앞면(1)과 뒷면(0)이 발생한 사건별 빈도: 끝 #####
  
  probability <- count / n
  
  title <- paste("반복 수: ", n, " / 500")  
  barplot(probability,
          names.arg = c(0, 1, 2),
          xlab="앞면이 나온 횟수",
          ylab="확률",
          col=rainbow(3),
          main = title)
  
  Sys.sleep(0.05)
}
