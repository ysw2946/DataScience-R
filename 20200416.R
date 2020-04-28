# install.packages("animation")
library(animation)

ani.options(interval =1)
plot.new()
for(i in 10:0){
  rect(0,0,1,1,col="yellow")
  text_size=11-i
  text(0.5,0.5,i,cex=text_size,col=rgb(0,0,1,1))
  ani.pause()
}

# for문
sum <- 0
for(i in 1:10){
  sum <- sum + i
}
print(sum)

# next문
sum <- 0
for(i in 1:10){
  if(i %% 2 == 0)
    next
  sum <- sum + i
}
print(sum)

# while문
sum <- 0
i <- 1
while(i <= 10){
  sum <- sum + i
  i <- i + 1
}
print(sum)

# repeat문
sum <- 0
i <- 1
repeat{
  sum <- sum + i
  i <- i + 1
  if(i > 10)
    break
}
print(sum)

# 랜덤차트그래프
ani.options(interval = 1)

while(TRUE){
  y <- runif(5,0,1)
  barplot(y, ylim=c(0,1),col=rainbow(5))
  ani.pause()
}

# 동전그래프
plot.new()
count <- c(0,0,0)
for (n in 1:500){
  coin <- sample(c(0,1),2,replace=T)
  index <- sum(coin) + 1
  count[index] <- count[index] + 1
  probability <- count/n
  title <- paste("반복 수:",n,"/500")
  barplot(probability,names.arg=c(0,1,2),
          xlab="앞면이 나온 횟수",
          ylab="확률",
          col=rainbow(3),
          main = title)
Sys.sleep(0.05)
}

# 룰렛돌리기
# install.packages("imager")
library(imager)
img_path <- "D://Datascience-R/roulette.png"
img <- load.image(img_path)
plot(img)

# 룰렛 이미지 크기 변환
img <- resize(img, size_x= 400L, size_y = 400L)
plot(img, xlim=c(0,400), ylim=c(0,400))
plot(img,xlim=c(0,400),ylim=c(0,400),axes=FALSE)

# 룰렛 회전
rot.count <- sample(11:20,1)
rot.count
angle <- 0
for(i in 1:rot.count){
  angle <- angle + 36
  title <- paste("룰렛 회전:",i,"/",rot.count)
  imrotate(img,angle,cx=200,cy=200) %>% 
    draw_circle(x=200,y=30,radius=30,col=c(1,0,0), opacity =0.5) %>%
    plot(axes=FALSE, main=title)
  Sys.sleep(0.2)
}

# 라이온킹
# install.packages("magick")
library(magick)
lion_bg <- image_read("D://Datascience-R/lion_bg.png")
lion_1 <- image_read("D://Datascience-R/lion_1.png")
lion_2 <- image_read("D://Datascience-R/lion_2.png")

lion_bg <- image_scale(lion_bg,"600x300!")
lion_1 <- image_scale(lion_1,"100x50!")
lion_2 <- image_scale(lion_2,"100x50!")

print(lion_bg)
print(lion_1)
print(lion_2)

img <- image_composite(lion_bg,lion_1, offset = "+100+200")
print(img)

moving <- 0
x <- -100
y <- 150
while(TRUE){
  if(x < 0)
    position <- paste(x,"+",y,sep="")
  else
    position <- paste("+",x,"+",y,sep="")
  if(moving %% 2 == 0){
    img <- image_composite(lion_bg,lion_1,offset=position)
  } else {
    img <- image_composite(lion_bg,lion_2,offset=position)
  }
  print(img)
  Sys.sleep(0.3)
  if(x > 600)
    break
  moving <- moving + 1
  x <- x + 20
}


# 실습미션
ani.options(interval =1)
plot.new()
sum <- 0
for(i in 1:33){
  sum <- sum + 3*i
  rect(0,0,1,1,col="yellow")
  text_size=10
  text(0.5,0.5,sum,cex=text_size,col=rgb(0,0,1,1))
  ani.pause()
}

