library(jsonlite)
day1 <-fromJSON("~/20181005_15.json")
day2 <-fromJSON("~/20181006_13.json")
day3 <-fromJSON("~/20181008_15.json")
day4 <-fromJSON("~/20181009_13.json")
day5 <-fromJSON("~/20181010_15.json")
day <- rbind(day1,day2,day3,day4,day5)
data.selecte<-day[day$SiteName=="新竹",]
library(ggplot2)
ggplot(data=data.selecte,aes(x=PublishTime, y=UVI))+geom_bar(stat="identity")