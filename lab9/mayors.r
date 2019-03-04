library(jsonlite)
library(ggplot2)



pages<-list()
for(i in 1:2){
data.url <- sprintf("https://www.readr.tw/project-api/election-board/candidates_terms?election_year=2018&page=%d&type=mayors&max_results=100",i)
data.file <- sprintf("mayors_page%d.json",i)
download.file(url = data.url, destfile = data.file)
data <- fromJSON(data.file)
pages[[i]]<- data$results
}

data <- rbind_pages(pages)



data.selected <- data[data$county=="新竹市",]
png("0416053_mayors.png", width = 720, height = 720)
ggplot(data=data.selected, aes(x=name, y=verified_board_amount)) + geom_bar(stat="identity")
dev.off()


pages<-list()
for(i in 1:19){
data.url <- sprintf("https://www.readr.tw/project-api/election-board/candidates_terms?election_year=2018&page=%d&type=councilors&max_results=100",i)
data.file <- sprintf("councilors_page%d.json",i)
download.file(url = data.url, destfile = data.file)
data <- fromJSON(data.file)
pages[[i]]<- data$results
}

data <- rbind_pages(pages)
data.selected <- data[data$county=="新竹市",]
png("0416053_councilors.png", width = 2880, height = 360)
ggplot(data=data.selected, aes(x=name, y=verified_board_amount)) + geom_bar(stat="identity")
dev.off()


