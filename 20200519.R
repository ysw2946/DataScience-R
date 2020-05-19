library(XML)
library(ggplot2)
api <-"http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getStrtpntAlocFndExpbusInfo"
api_key <- "ggQ9CdlHiuIvoprsQ3hu5ruoHupVpP0UDXU2k5wtJBgREifAa2uneF9lWnj%2FMkIMANW4oaEcG1IM1UwNW0FwKQ%3D%3D"

numOfRows <- 10
pageNo <- 1
depTerminalId <- "NAEK010"
arrTerminalId <- "NAEK300"
depPlandTime <- 20200101
busGradeId <- 1

url <- paste(api,
             "?serviceKey=", api_key,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,
             "&depTerminalId=", depTerminalId,
             "&arrTerminalId=", arrTerminalId,
             "&depPlandTime=", depPlandTime,
             "&busGradeId=", busGradeId,
             "&",sep="")
url

xmlFile <- xmlParse(url)
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile,"//items/item"))
df

ggplot(data=df, aes(x=dataTime,y=seoul)) +
  geom_bar(stat="identity",fill="green")

http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getStrtpntAlocFndExpbusInfo?serviceKey=ggQ9CdlHiuIvoprsQ3hu5ruoHupVpP0UDXU2k5wtJBgREifAa2uneF9lWnj%2FMkIMANW4oaEcG1IM1UwNW0FwKQ%3D%3D&numOfRows=10&pageNo=1&depTerminalId=NAEK010&arrTerminalId=NAEK300&depPlandTime=20200101&busGradeId=1&
http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getStrtpntAlocFndExpbusInfo?serviceKey=ggQ9CdlHiuIvoprsQ3hu5ruoHupVpP0UDXU2k5wtJBgREifAa2uneF9lWnj%2FMkIMANW4oaEcG1IM1UwNW0FwKQ%3D%3D&numOfRows=10&pageNo=1&depTerminalId=NAEK010&arrTerminalId=NAEK300&depPlandTime=20200101&busGradeId=1"