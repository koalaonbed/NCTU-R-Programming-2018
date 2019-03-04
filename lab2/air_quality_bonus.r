data.url <- "https://quality.data.gov.tw/dq_download_csv.php?nid=91734&md5_url=ef2c4d2409b03c7a6a1ca4452bb96832"
data.file <- "~/air.csv"
download.file(url = data.url, destfile = data.file, method = "curl")
data <- read.csv(data.file, header=TRUE, sep=",")
x.selected <- data[data$County=="新北市"&data$ItemEngName=="PM2.5",]
y.selected <- data[data$County=="新北市"&data$ItemEngName=="WIND_SPEED",]
z.selected <- merge(x.selected, y.selected, by = "MonitorDate")
plot(x=z.selected$Concentration.y, y=z.selected$Concentration.x,xlab="Wind Speed", ylab="PM2.5", xlim= c(1,2), ylim = c(20,35), main ="新北市")
