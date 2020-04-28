#install.packages("rvest")
library(rvest)

# 웹문서 읽기
url <- "D://Datascience-R/wep_scraping_1.html"
html <- read_html(url,encoding="utf-8")
html

title <- html_nodes(html,"div h1") %>%
  html_text()
title

# 미세먼지 농도 추출(1)
pm <- html_nodes(html,"div table tr td") %>%
  html_text()
pm
pm <- pm[-c(1:3)]
pm

str(pm)

# 미세먼지 농도 추출(2)
pm <- html_nodes(html,"div table") %>%
  html_table()
pm

# 첫번째 리스트
pm <- pm[[1]]
pm

# 항목별 추출
names <- as.character(pm[1,])
names

# 1행(항목명 데이터) 삭제
pm <- pm[-1,]

# 항목명 추가
colnames(pm) <- names
pm


# 웹문서 읽기
url <- "D://Datascience-R/wep_scraping_2.html"
html <- read_html(url, encoding="utf-8")
html

# 제목
title <- html_nodes(html, "#info_1 h1") %>%
  html_text()
title

# 미세먼지 농도(1)
pm <- html_nodes(html, "#info_1 table") %>%
  html_nodes(".pm")
pm
#pm <- pm[-1]
pm <- html_nodes(pm, "td") %>%
  html_text()
pm

# 미세먼지 농도(2)
pm <- html_nodes(html, "#info_1 table") %>%
  html_table()
pm
# 첫 번째 리스트
pm <- pm[[1]]
pm
str(pm)
# 항목명 추출
names <- as.character(pm[1, ])
names
# 1행(항목명 데이터) 삭제
pm <- pm[-1, ]
# 항목명 추가
colnames(pm) <- names
pm

# 유투브 동영상 제목
# 웹문서 읽기
url <- "https://www.youtube.com/results?search_query=%EC%95%8C%EB%9D%BC%EB%94%98+ost"
html <- read_html(url)
html
# 동영상 목록 제목
title <- html_nodes(html, ".yt-lockup-content") %>%
  html_nodes("h3 a") %>%
  html_text()
title

# 실습과제
# 웹문서 읽기
url <- "https://www.youtube.com/results?search_query=%EB%8D%B0%EB%A6%AC%EB%9F%AC%EA%B0%88%EA%B2%8C"
html <- read_html(url)
html
# 동영상 목록 제목
title <- html_nodes(html, ".yt-lockup-content") %>%
  html_nodes("h3 a") %>%
  html_text()
title

