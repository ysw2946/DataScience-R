install.packages("plotrix")
library(plotrix)

# 기본 파이차트
x <- c(9,15,20,6)
label <- c("영업 1팀","영업 2팀","영업 3팀","영업 4팀")
x
pie(x,labels=label,clockwise=TRUE,main="부서별 영업 실적")

# 기준선변경
pie(x,init.angle=90,labels=label,main="부서별 영업 실적")

# 색과 라벨 변경
pct <- round(x/sum(x)*100)
label <- paste(label,pct)
label <- paste(label,"%",sep="")
pie(x,labels=label,init.angle=90,col=rainbow(length(x))
    ,main="부서별 영업 실적")

pie3D(x,labels=label,explode=0.1,labelcex=0.8,main="부서별 영업 실적")

# 기본 바 차트
height <- c(9,15,20,6)
name <- c("영업 1팀","영업 2팀","영업 3팀","영업 4팀")
barplot(height,names.arg=name,main="부서별 영업 실적")

#막대의 색 지정
barplot(height,names.arg=name,main="부서별 영업 실적"
        ,col=rainbow(length(height)))

#x,y축의 라벨과 크기
barplot(height,names.arg=name,main="부서별 영업 실적"
        ,col=rainbow(length(height)),xlab="부서",ylab="영업 실적(억 원)"
        ,ylim=c(0,25))

# 데이터 라벨 출력
bp <- barplot(height,names.arg=name,main="부서별 영업 실적"
              ,col=rainbow(length(height)),xlab="부서",ylab="영업 실적(억 원)"
              ,ylim=c(0,25))
text(x=bp,y=height,labels=round(height,0),pos=3)

bp <- barplot(height,names.arg=name,main="부서별 영업 실적"
              ,col=rainbow(length(height)),xlab="부서",ylab="영업 실적(억 원)"
              ,ylim=c(0,25))
text(x=bp,y=height,labels=round(height,0),pos=1)

# 바 차트의 수평 회전(가로 막대)
barplot(height,names.arg=name,main="영업별 부서 실적"
        ,col=rainbow(length(height)), xlab="영업 실적(억 원)",ylab="부서"
        ,horiz=TRUE,width=50)

# 스택형 바 차트
height1 <- c(4,18,5,8)
height2 <- c(9,15,20,6)

height <- rbind(height1,height2)
height

name <- c("영업 1팀","영업 2팀","영업 3팀","영업 4팀")
legend_lbl <- c("2014년","2015년")

barplot(height,main="부서별 영업 실적",
        names.arg=name,
        xlab="부서",ylab="영업 실적(억 원)",
        col=c("darkblue","red"),
        legend.text=legend_lbl,
        ylim=c(0,35))

# 그룹형 바 차트
barplot(height,main="부서별 영업 실적",
        names.arg=name,
        xlab="부서",ylab="영업 실적(억 원)",
        col=c("darkblue","red"),
        legend.text=legend_lbl,
        ylim=c(0,35),
        beside=TRUE,
        args.legend=list(x='top'))

# 일반적인 X-Y 플로팅
women
weight <- women$weight
plot(weight)

height <- women$height
plot(height,weight,xlab="키",ylab="몸무게")

# 플로팅 문자의 문자 유형, 외곽선 색, 내부 배경색, 크기
plot(height,weight,xlab="키",ylab="몸무게",pch=23,col="blue"
     ,bg="yellow",cex=1.5)

# 기본 히스토그램
head(quakes)
mag <- quakes$mag
hist(mag,main="지진 발생 강도의 분포", xlab = "지진 강도", ylab = "발생 건수")

# 계급 구간과 색
colors <- c("red","orange","yellow","green","blue","navy","violet")
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수",
     col=colors,breaks=seq(4,6.5,by=0.5))

# 확률밀도
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수",
     col=colors,breaks=seq(4,6.5,by=0.5),freq=FALSE)
lines(density(mag))

# 박스플롯
mag <- quakes$mag
min(mag)
max(mag)
median(mag)
quantile(mag,c(0,0.25,0.5,0.75))
boxplot(mag,main="지진 발생 강도의 분포", xlab="지진", ylab="발생 건수", col="red")

# 실습과제
url <- "https://raw.githubusercontent.com/cran/BTYD/master/data/cdnowElog.csv"
data <- read.csv(url,header=T)
head(data)
quantity <- data$cds
table(quantity)

colors <- c("red","orange","green","blue","navy")
hist(quantity,col=colors, main="CD 거래량 분포", xlab="CD 거래량", ylab="빈도수")

