# NCTU-R-Programming-2018
## Visualize GDP per capita

**R** is a powerful programming language of viasualization, so we want to make the best use of it.
I choose to visualize each country's GDP per capita.

Dependencies
```r
library(rworldmap)
library(animation)
```

First, read the data from World Bank.
```r
gdp <- read.csv("gdpper.csv");
```
Then, match data to world map.
```r
mapped_data <- joinCountryData2Map(gdpper, joinCode = "ISO3", nameJoinColumn = "Country.Code")
```
And, output image of each year!
```r
for (year in 1960:2017) {
  picname <- paste(year,'.png',sep='')
  png(file = picname, width = 1920, height = 1080)
  par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
  k<-paste0("X",year)
  mapCountryData(mapped_data, nameColumnToPlot = k)
  #title(year)
  dev.off()
}
```

Moreover, make a GIF!
```r
saveGIF({
	for (year in 1960:2017) {  
	  par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
	  k<-paste0("X",year)
	  mapCountryData(mapped_data, nameColumnToPlot = k)
	  #title(year)
	}
}, movie.name = "animation.gif", interval = 0.5, ani.width = 1280
)
```
![Image of GDPperCapita](https://github.com/koalaonbed/NCTU-R-Programming-2018/blob/master/GDP%20per%20capita.gif)

      
