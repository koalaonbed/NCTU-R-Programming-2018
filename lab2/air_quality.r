data.url <- "https://quality.data.gov.tw/dq_download_csv.php?nid=91734&md5_url=ef2c4d2409b03c7a6a1ca4452bb96832"
data.file <- "~/air.csv"
download.file(url = data.url, destfile = data.file, method = "curl")
data <- read.csv(data.file, header=TRUE, sep=",")
data$MergeName <- paste(data$County, data$SiteName)
data.selected <- data[data$MonitorDate=="2018/9/21 下午 02:00:00"&data$ItemEngName=="NOx",]
library(ggplot2)
ggplot(data=data.selected, aes(x=MergeName, y=Concentration)) + geom_bar(stat="identity")