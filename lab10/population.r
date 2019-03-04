# Insttall Pkg
##packageNames <- c("dplyr", "stringr", "data.table",
##                  "ggplot2", "maptools", "knitr", 
##                  "mapproj", "RColorBrewer")
##install.packages(packageNames)

# Required Lib
library(dplyr)
library(stringr)
library(data.table)
library(ggplot2)
library(maptools)
library(knitr)
library(mapproj)
library(RColorBrewer)
#library(pracma)

# Read Dataframe
df <- fread("hw10_tw_population.csv", h = T, , encoding = 'UTF-8')
df <- data.frame(df)

# Reading Shapefile
tw_shp <- readShapeSpatial("gadm36_TWN_2.shp")
tw_map <- fortify(tw_shp)
ggplot(tw_map, aes(x = long, y = lat, group=group)) +
  geom_path() + 
  coord_map()

#################################
# For HW#10, Do Something Below #
#################################

# Process Dataset
chinese_name <- c("金門縣", "連江縣", "高雄市", "新北市", "臺中市",
                  "臺南市", "臺北市", "彰化縣", "嘉義市", "嘉義縣",
                  "新竹市", "新竹縣", "花蓮縣", "基隆市", "苗栗縣",
                  "南投縣", "澎湖縣", "屏東縣", "臺東縣", "桃園市",
                  "宜蘭縣", "雲林縣")


mydata <- data.frame(NAME_1=tw_shp$NAME_2,
                     NAME_2=chinese_name)
#mydata$id <- 0
mydata$id <- c(20, 22, 3, 1, 2, 6, 4, 7, 18, 12,
                15, 10, 17, 16, 11, 13, 21, 8, 19, 5,
                14, 9)

tw_map$id <- as.character(as.integer(tw_map$id)+1)

mydata$population <- 0
for(i in 1:22){
  mydata$population[i] <- df$population[mydata$id[i]]
}
#mydata <- merge(mydata, df, by = "id", all = TRUE)
for(i in 0:22){
  mydata$id[i] <- i
}
tw.plot<-merge(tw_map,mydata,by="id",all.x=T)
head(tw.plot, 10)

#################################
# For HW#10, Do Something Above #
#################################

# Plotting
tw_ppl_dist <- ggplot() +
  geom_polygon(data = tw.plot, 
               aes(x = long, y = lat, group = group, 
                   fill = population/10000), 
               color = "black", size = 0.25) + 
  coord_map()+
  scale_fill_gradientn(colours = brewer.pal(9,"Reds"),
                       name = "Population (10k)") +
  #theme_void()+
  labs(title="Population Distrubution of Taiwan", 
       x ="Latitude", y = "Longitude")

tw_ppl_dist
