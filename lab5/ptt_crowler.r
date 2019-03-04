library(httr)
library(XML)
html <- htmlParse(GET("https://disp.cc/m/")) 
ht_title <-xpathSApply(html, "//div[@class='ht_title']", xmlValue)
ht_desc <-xpathSApply(html, "//div[@class='ht_desc']", xmlValue)
data<-cbind(ht_title, ht_desc, "----")
file.path <- "post_bonus.txt"
write.table(data, file=file.path, sep="\n",row.names = F, col.names = F)
