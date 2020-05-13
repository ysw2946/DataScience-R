library(rvest)

url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html

api.list <- html_nodes(html,"#apiDataList.result-list ul li dl")
api.list

title <- html_nodes(api.list,"dt.title") %>%
  html_text()
title

title <- gsub("[\t|\r|\n]","",title)
title

desc <- html_nodes(api.list, ".ellipsis") %>%
  html_text()
desc

library(ggmap)
register_google(key = "AIzaSyB4I4dsUqAj6pisgckesbLpy5JaiLoeSxk")
map <- get_googlemap(center=c(126.975684,37.572752))
ggmap(map)


map <- get_googlemap(center = c(126.975684,37.572752),
                     maptype = 'roadmap')
ggmap(map)

map <- get_googlemap(center = c(126.975684,37.572752),
                     maptype = 'roadmap',
                     zoom=17)

ggmap(map)

map <- get_googlemap(center = c(126.975684,37.572752),
                     maptype = 'roadmap',
                     zoom=17,
                     size =c(320,320))
ggmap(map)

map <- get_googlemap(center = c(126.975684,37.572752),
                     maptype = 'roadmap',
                     zoom=17,
                     size =c(320,320))


ggmap(map, extent = 'device')

gc <- geocode(enc2utf8('충청북도 단양군'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen,
                     maptype = 'terrain',
                     markers = gc)
ggmap(map, extent = 'device')

#install.packages("ggplot2")
library("ggplot2")

names <- c("1.도담석봉/석문","2.구담/옥순봉","3.사인암","4.하선암","5.중선암","6.상선암")
addr <- c("충청북도 단양군 매포읍 삼봉로 644-23",
          "충청북도 단양군 단성면 월악로 3827",
          "충청북도 단양군 대강면 사인암2길 42",
          "충청북도 단양군 단성면 선암계곡로 1337",
          "충청북도 단양군 단성면 선암계곡로 868-2",
          "충청북도 단양군 단성면 선암계곡로 790")
gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=names,lon=gc$lon,lat=gc$lat)
df

cen <- c((max(df$lon)+min(df$lon))/2,
         (max(df$lat)+min(df$lat))/2)
cen

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 12,
                     markers = gc)
ggmap(map)

gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x=lon,y=lat),
                 size=5, label=df$name)


library(openxlsx)
df <- read.xlsx("C:/Users/82104/Desktop/Program/DATA SCIENCE/earthquakes.xlsx",sheet=1,startRow=4)
head(df)

df[,5] <- gsub("N","",df[,5])
df[,6] <- gsub("E","",df[,6])
df
df2 <- data.frame(lon=df[,6],lat=df[,5],mag=df[,3])
df2
str(df2)
head(df2)

df2[,1] <- as.numeric(as.character(df2[,1]))
df2[,2] <- as.numeric(as.character(df2[,2]))
df2[,3] <- as.numeric(as.character(df2[,3]))
str(df2)

cen <- c((max(df2$lon)+min(df2$lon))/2,
         (max(df2$lat)+min(df2$lat))/2)

map <- get_googlemap(center = cen,
                     zoom=6)
gmap <- ggmap(map)
gmap + geom_point(data=df2,
                  aes(x=lon,y=lat),
                  size= df2$mag,
                  color = "red",
                  alpha= 0.5)
