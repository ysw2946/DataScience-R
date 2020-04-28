# 당구공 굴리기
#install.packages("magick")
library(magick)

# 당구공 이미지 읽기
ball <- image_read("D://Datascience-R/ball.png")
# 당구대 이미지 읽기
table <- image_read("D://Datascience-R/table.png")
# 당구공 이미지 가로X세로 변환
ball <- image_scale(ball, "40X40!")
# 당구대 이미지 가로X세로 변환
table <- image_scale(table, "300X400!")

# 당구공의 X, Y 위치 초기화
x <- 0
y <- 0
moving <- 0
while(TRUE) {
  # X, Y의 위치
  position <- paste("+", x, "+", y, sep="")
  # table 이미지에 ball 이미지를 offset 위치로 겹침
  img <- image_composite(table, ball,
                         offset = position)
  # img 이미지 출력
  print(img)
  # 0.1초 대기
  Sys.sleep(0.1)
  
  # X, Y의 위치 변환: 시작
  if(moving < 53){
    x <- x + 5
    y <- y + 1
    } else {
      x <- x - 5
      y <- y + 2
    }
  moving <- moving + 1
  if(moving > 105)
    break
# X, Y의 위치 변환: 끝
  
  }

