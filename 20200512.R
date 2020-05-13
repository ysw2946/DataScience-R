library(ggmap)
library("ggplot2")

register_google(key = "AIzaSyB4I4dsUqAj6pisgckesbLpy5JaiLoeSxk")
cc <- c(56,67,66,68,67,52,56)
name <- c("서울","강원","경북","충남","광주","부산","제주")
dust <- paste0(name,cc)
dust

addr <- c("서울","강원","경북","충남","광주","부산","제주")
gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=dust,lon=gc$lon,lat=gc$lat)
df

cen <- c((max(df$lon)+min(df$lon))/2,
         (max(df$lat)+min(df$lat))/2)
cen

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 7,
                     markers = gc)
ggmap(map)

gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x=lon,y=lat),
                 size=5, label=df$name)
