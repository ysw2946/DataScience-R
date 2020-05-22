library(RCurl)
library(RmecabKo)
library(wordcloud)
library(XML)
#install_mecab("C:Rlibs/mecab")

serchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "dldYzPelmQF1dAFHfHHL"
Client_Secret <- "tuv6N98p6A"

query <- URLencode(iconv("유승우","euc-kr","UTF-8"))
url <- paste(serchUrl,"?query=",query,"&display=20",sep="")

doc <- getURL(url,
              httpheader=c('Content-Type'="application/xml",
                           'X-Naver-Client-Id'=Client_ID,
                           'X-Naver-Client-Secret'=Client_Secret))

xmlFile <- xmlParse(doc)
df <- xmlToDataFrame(getNodeSet(xmlFile,"//item"))

str(df)

descripton <- df[,4]
descripton

descripton2 <- gsub("||d|<b>|</b>|&quot;","",descripton)
descripton2

nouns <- nouns(iconv(descripton2,"utf-8"))
nouns


nouns.all <- unlist(nouns,use.names = F)
nouns.all

nouns.all1 <- nouns.all[nchar(nouns.all)<=1]
nouns.all2 <- nouns.all[nchar(nouns.all)>=2]
nouns.freq <- table(nouns.all2)

nouns.df <- data.frame(nouns.freq,stringsAsFactors = F)

nouns.df.sort <- nouns.df[order(-nouns.df$Freq),]

wordcloud(nouns.df.sort[,1],
          freq=nouns.df.sort[,2],
          min.freq = 2,
          scale = c(3,1),
          rot.per = 0.25,
          random.order =F,
          random.color=T,
          colors = rainbow(10))

