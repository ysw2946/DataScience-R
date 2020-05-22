library(XML)
library(ggplot2)
library(ggmap)
api <-"http://openapi.forest.go.kr/openapi/service/forestDisasterService/frstFireOpenAPI"

api_key <- "ggQ9CdlHiuIvoprsQ3hu5ruoHupVpP0UDXU2k5wtJBgREifAa2uneF9lWnj%2FMkIMANW4oaEcG1IM1UwNW0FwKQ%3D%3D"

searchStDt <- 20000101
searchEdDt <- 20170115
numOfRows <- 20
pageNo <- 1


url <- paste(api,
             "?serviceKey=", api_key,
             "&searchStDt=", searchStDt,
             "&searchEdDt=", searchEdDt,
             "&pageNo=", pageNo,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,sep="")
url

xmlFile <- xmlParse(url)
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile,"//items/item"))
df

pm <- df[,17]
pm <- pm[-15]
pm

register_google(key = "AIzaSyB4I4dsUqAj6pisgckesbLpy5JaiLoeSxk")
cities <- as.character(pm)

gc <- geocode(enc2utf8(cities))
gc

dmg <- df$dmgarea[-15]
dmg <- as.numeric(dmg)
str(dmg)

cen <- c((max(gc$lon)+min(gc$lon))/2,(max(gc$lat)+min(gc$lat))/2)
cen

df2 <- data.frame(지역명=cities,
                     산불면적=dmg,
                     경도=gc$lon,
                     위도=gc$lat,
                     stringAsFactors=F)
df2

map <- get_googlemap(center=cen,zoom=7)
ggmap(map) +
  geom_point(data=df2,
             aes(x=gc$lon,y=gc$lat),
             color=rainbow(19),
             size=(df2$산불면적)*2,
             alpha=0.5)
