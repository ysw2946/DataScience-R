# 파이차트
city <- c("서울","부산","대구","인천","광주","대전","울산")
pm25 <- c(18,21,21,17,8,11,25)
colors <- c("red","orange","yellow","green","lightblue","blue","violet")
pie(pm25,labels=city,col=colors,main="지역별 초미세먼지 농도")

pie(pm25,labels=city,col=rainbow(3),main="지역별 초미세먼지 농도")

pie(pm25,labels=city,col=topo.colors(3),main="지역별 초미세먼지 농도")

#사용가능한색 찾기
colors()

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

display.brewer.pal(9, name="Oranges")
oranges <- brewer.pal(7,'Oranges')
pct <- round(pm25/sum(pm25)*100,0)
city_label <- paste(city,".",pct,"%",sep="")
#city_label <- paste(city,".",pm25,sep="")

pie(pm25, labels=city_label, col=oranges,main="지역별 초미세먼지 농도",
    init.angle=90,clockwise=T)

# 바 차트
dept <- c("영업 1팀","영업 2팀"," 영업 3팀","영업 4팀")
sales01 <- c(4,12,5,8)
barplot(sales01, names.arg=dept, main="부서별 영업 실적(1분기)",
        col=rainbow(length(dept)), xlab="부서",ylab="영업 실적(억 원)",
                    ylim=c(0,15))
# 수평선
abline(h=mean(sales01), col="orange", lty=2)
# a: y절편, b: 기울기, (y=bx+a)
abline(a=mean(sales01),b=0, col="black", lty=2)

# 데이터 라벨 출력
bp <-  barplot(sales01, names.arg = dept,
               main = '부서별 영업실적(1분기)',
               col= rainbow(length(dept)),
               xlab='부서', ylab= '영업실적(억원)',
               ylim = c(0,15))

text(x=bp,y=sales01, labels=sales01,pos=1)

# 바 차트의 회전(수평 바 차트)
barplot(sales01, names.arg = dept,
        main = '부서별 영업실적(1분기)',
        col= rainbow(length(dept)),
        ylab='부서', xlab= '영업실적(억원)',
        xlim = c(0,15),
        horiz = TRUE)

# 스택형 바 차트 
dept <- c('영업1팀', '영업2팀', '영업3팀', '영업4팀')
sales01 <- c(4,12,5,8)
sales02 <- c(12,8,8,4)
sales <- rbind(sales01, sales02)
sales

legend_lbl <- c('1분기', '2분기')
barplot(sales,main = '부서별 영업실적(1~2분기)',
        names.arg = dept,
        xlab='부서', ylab= '영업실적(억원)',
        col= c('green', 'orange'),
        ylim = c(0,30),
        args.legend = list(x= 'top', ncol=2))


barplot(sales,main = '부서별 영업실적(1~2분기)',
        names.arg = dept,
        xlab='부서', ylab= '영업실적(억원)',
        col= c('green', 'orange'),
        legend.text=legend_lbl,
        xlim = c(0,7),
        args.legend = list(x= 'right'))

# 그룹형 바 차트
barplot(sales,main = '부서별 영업실적(1~2분기)',
        names.arg = dept,
        xlab='부서', ylab= '영업실적(억원)',
        col= c('green', 'orange'),
        legend.text=legend_lbl,
        xlim = c(0,17),
        args.legend = list(x= 'right'),
        beside = TRUE)

# X-Y 플로팅
women
height <- women$height
weight <- women$weight
plot(x= height, y= weight, 
     xlab = '키', ylab = '몸무게',
     main = '키와 몸무게의 변화')

# 플로팅 문자의 활용 
plot(x= height, y= weight, 
     xlab = '키', ylab = '몸무게',
     main = '키와 몸무게의 변화',
     pch = 23, col = 'blue', bg = 'yellow', cex=1.5)


plot(height, weight, xlab = '키', ylab = '몸무게', type = 'S')



plot(height, weight, xlab = '키', ylab = '몸무게',
     type = 'l', lty = 2 , lwd =3)

plot(height, weight, 
     xlim = c(0,max(height)), ylim = c(0, max(weight)),
     xlab = '키', ylab = '몸무게',
     main = '키와 몸무게의 변화',
     pch = 23, col = 'blue', bg = 'yellow', cex=1.5)

quakes

mag <- quakes$mag
mag

hist(mag,
     main='지진 발생 강도의 분포',
     xlab = '지진 강도', ylab = '발생건수',
     col = rainbow(10))


hist(mag,
     main='지진 발생 강도의 분포',
     xlab = '지진 강도', ylab = '발생건수',
     col = rainbow(10),
     breaks = seq(4,6.5,by=0.5))

n <- 10

k <- sqrt(n)
k

k <- ceiling(1+3.3*log10(n))
k

k<- ceiling(2*n^(1/3))
k

hist(mag,
     main='지진 발생 강도의 분포',
     xlab = '지진 강도', ylab = '발생건수',
     col = rainbow(10),
     freq = FALSE)
lines(density(mag), lwd = 2)

mag <- quakes$mag
boxplot(mag, 
        main='지진 발생 강도의 분포',
        xlab = '지진 강도', ylab = '발생건수',
        col = 'red')


min(mag)

max(mag)

max(mag)

median(mag)

Q <- quantile(mag)

Q

Q[4]- Q[2]
IQR(mag)

fence.upper <- Q[4] + 1.5 * IQR(mag)
fence.upper

fence.lower <- Q[2] - 1.5 * IQR(mag)
fence.lower

max(mag[mag <= fence.upper])

# 실습과제
url <- "https://raw.githubusercontent.com/cran/BTYD/master/data/cdnowElog.csv"
data <- read.csv(url,header=T)
head(data)
quantity <- data$cds
prop.table(table(quantity))

colors <- c("red","orange","green","blue","navy")
hist(quantity,col=colors, main="CD 거래량 분포", xlab="CD 거래량", ylab="빈도수")

n <- 10:100
plot(x= n, y= k, 
     xlab = '데이터의 수(n)', ylab = '계급의 수(k)',
     main = '데이터의 수에 따른 계급의 수의 변화',
     pch = 21, col = 'white', bg = 'red', cex=1.5)

rivers
summary(rivers)
boxplot(rivers, main="강의 길이에 대한 분포",xlab="강의 길이 분포",ylab="강의 길이",col="blue")

 
