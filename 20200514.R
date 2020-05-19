#install.packages("XML")
#install.packages("ggplot2")
library(XML)
library(ggplot2)

api <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"

api_key <- "DEp3%2BU6FI4re6qF%2BIZJYOpPDwJF5pbv%2FzPJvACjVeXpumGywegcxEdPvxmwT%2B9MtgWrSu27WHgFsOwRT%2Bde5DQ%3D%3D"

numOfRows <- 10
pageNo <- 1
itemCode <- "PM10"
dataGubun <- "HOUR"
searchCondition <- "MONTH"

url <- paste(api,
             "?serviceKey=", api_key,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,
             "&itemCode=", itemCode,
             "&dataGubun=", dataGubun,
             "&searchCondition=", searchCondition, sep="")

url

xmlFile <- xmlParse(url)
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile,"//items/item"))
df

ggplot(data=df, aes(x=dataTime,y=seoul)) +
  geom_bar(stat="identity",fill="green")

# 라벨 추가
ggplot(data=df, aes(x=dataTime,y=seoul)) +
  geom_bar(stat="identity",fill="green") +
  theme(axis.text.x=element_text(angle=90)) +
  labs(title="시간대별 서울지역의 미세먼지 농도 변화",
       x="측정일시",y="농도")

# 막대 색 변환
ggplot(data=df, aes(x=dataTime,y=seoul, fill=dataTime)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=90)) +
  labs(title="시간대별 서울지역의 미세먼지 농도 변화",
       x="측정일시",y="농도") +
  scale_fill_manual(values=rainbow(10))


# 범례 삭제
ggplot(data=df, aes(x=dataTime,y=seoul, fill=dataTime)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=90),
        legend.position="none") +
  labs(title="시간대별 서울지역의 미세먼지 농도 변화",
       x="측정일시",y="농도") +
  scale_fill_manual(values=rainbow(10))

# 가로 막대 출력
ggplot(data=df, aes(x=dataTime,y=seoul, fill=dataTime)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=90),
        legend.position="none") +
  labs(title="시간대별 서울지역의 미세먼지 농도 변화",
       x="측정일시",y="농도") +
  scale_fill_manual(values=rainbow(10)) +
  coord_flip()

# 지도 비교
library(XML)
library(ggplot2)
library(ggmap)

api <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"

api_key <- "DEp3%2BU6FI4re6qF%2BIZJYOpPDwJF5pbv%2FzPJvACjVeXpumGywegcxEdPvxmwT%2B9MtgWrSu27WHgFsOwRT%2Bde5DQ%3D%3D"

numOfRows <- 10
pageNo <- 1
itemCode <- "PM10"
dataGubun <- "HOUR"
searchCondition <- "MONTH"

url <- paste(api,
             "?serviceKey=", api_key,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,
             "&itemCode=", itemCode,
             "&dataGubun=", dataGubun,
             "&searchCondition=", searchCondition, sep="")

url

xmlFile <- xmlParse(url)

df <- xmlToDataFrame(getNodeSet(xmlFile,"//items/item"))
df

pm <- df[1,4:20]
pm

register_google(key = "AIzaSyB4I4dsUqAj6pisgckesbLpy5JaiLoeSxk")

cities <- c("서울시","부산시","대구시","인천시","광주시",
            "대전시","울산시","경기도","강원도","충청북도",
            "충청남도","전라북도","전라남도","경상북도",
            "경상남도","제주시","세종시")
gc <- geocode(enc2utf8(cities))
gc

df2 <- data.frame(지역명=cities,
                     미세먼지=t(pm),
                     경도=gc$lon,
                     위도=gc$lat,
                     stringAsFactors=F)
df2

names(df2)[2] <- "미세먼지"
df2

str(df2)
df2[,2] <- as.numeric(df2[,2])
cen <- as.numeric(geocode(enc2utf8("전라북도")))
map <- get_googlemap(center=cen,zoom=7)
ggmap(map) +
  geom_point(data=df2,
             aes(x=경도,y=위도),
             color=rainbow(length(df2$미세먼지)),
             size=df2$미세먼지,
             alpha=0.5)
