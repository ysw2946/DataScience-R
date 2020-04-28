library(magick)
judy_bg <- image_read("D://Datascience-R/judy_bg.jpg")
judy_1 <- image_read("D://Datascience-R/judy1.png")
judy_2 <- image_read("D://Datascience-R/judy2.png")
nick <- image_read("D://Datascience-R/nick.png")

judy_bg <- image_scale(judy_bg,"730x400!")
judy_1 <- image_scale(judy_1,"100x80!")
judy_2 <- image_scale(judy_2,"90x90!")
nick <- image_scale(nick,"80x80!")
nick
img_1 <- image_composite(judy_bg,nick,offset="+50+300")
img_1 

x <- 630
y <- 300
moving <- 0
while(TRUE){
  if(x < 0)
    position <- paste(x,"+",y,sep="")
  else
    position <- paste("+",x,"+",y,sep="")
  if(moving %% 2 == 0){
    img <- image_composite(img_1,judy_2,offset=position)
  } else {
    img <- image_composite(img_1,judy_1,offset=position)
  }
  print(img)
  Sys.sleep(0.3)
  if(moving > 25)
    break
  x <- x - 20
  moving <- moving + 1
}

