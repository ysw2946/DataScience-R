# 실습과제 1

# 수열 출력: 1~100 사이의 3의 배수 합
# install.packages("animation")
library(animation)
ani.options(interval = 0.5)
plot.new()
sum <- 0
for (i in 1:100) {
  if (i %% 3 == 0) {
    rect(0, 0, 1, 1, col="yellow")
    
    sum <- sum + i
    text(0.5, 0.5, sum, cex=3, col=rgb(0,0,1,1))
  }
  ani.pause()
}

# 실습과제 2

# 당구공 굴리기
#install.packages("magick")
library(magick)
# 당구공 이미지 읽기
ball <- image_read("C://data/ball.png")
# 당구대 이미지 읽기
table <- image_read("C://data/table.png")
# 당구공 이미지 가로X세로 변환
ball <- image_scale(ball, "40X40!")
# 당구대 이미지 가로X세로 변환
table <- image_scale(table, "300X400!")
# 당구공의 X, Y 위치 초기화
x <- 0
y <- 0
while(TRUE) {
  # X, Y의 위치
  position <- paste("+", x, "+", y, sep="")
  # table 이미지에 ball 이미지를 offset 위치로 겹침
  img <- image_composite(table, ball, offset = position)
  # img 이미지 출력
  print(img)
  # 0.1초 대기
  Sys.sleep(0.1)
  
  # X, Y의 위치 변환: 시작
  if (x == 0)
    x_dir <- 1
  if (x == 260)
    x_dir <- -1
  
  if (y == 0)
    y_dir <- 1
  if (y == 360)
    y_dir <- -1
  
  x <- x + 10 * x_dir
  y <- y + 10 * y_dir
  # X, Y의 위치 변환: 끝
}