# 데이터 셋 목록 보기
data(package = "datasets") # 피지라는 섬의 지진 데이터

# 데이터 셋 보기
quakes

# 시작부터 6개
head(quakes)

# 시작부터 10개
head(quakes, n = 10)

# 끝에서 6개
tail(quakes)

# 끝에서 10개
tail(quakes, n = 10)

# 변수 이름 추출
names(quakes)

# 행과 열 개수 확인
dim(quakes)

# 구조 확인
str(quakes)

# 변수별 요약값 확인
summary(quakes)

# 데이터 셋 저장하고 읽기
write.table(quakes, "D:/Datascience-R/quakes.csv",sep = ",")
df <- read.csv("D:/Datascience-R/quakes.csv", header = TRUE)
df

# 함수 정의와 호출
getTriangleArea <- function(w,h){
  area <- w*h/2
  return(area)
}
getTriangleArea(10,5)
getTriangleArea(10,10)

#원의 면적
circle <- function(r){
  area <- 3.14*r^2
  return(area)
}

circle(8)
circle(15)

#줄기-잎 그림
rivers
stem(rivers)
stem(rivers, scale=2) # scale은 줄기잎단위를 넓혀준다

#5장 stem 실습 과제
stem(rivers, scale=2)

#파이차트
city <- c("서울","부산","대구","인천","광주","대전","울산")
pm25 <- c(18,21,21,17,8,11,25)
colors <- c("red","orange","yellow","green","lightblue","blue","violet")
pie(pm25, labels=city, col=colors, main = "지역별 초미세먼지 농도")
pie(pm25, labels=city, col=colors, main = "지역별 초미세먼지 농도",
    init.angle=90,clockwise=T)

#사용 가능한 색깔
colors()

#라벨 변경