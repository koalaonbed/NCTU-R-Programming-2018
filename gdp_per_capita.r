library(rworldmap)
library(RColorBrewer)
gdp <- read.csv("gdpper.csv");


#colorRGB <- rep(rgb(1,1,1),248*57)
#dim(colorRGB) <- c(266,61)


mapped_data <- joinCountryData2Map(gdp, joinCode = "ISO3", nameJoinColumn = "Country.Code")

for (year in 1960:2017) {
  picname <- paste(year,'.jpg',sep='')
  jpeg(file=picname)
  par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
  k<-paste0("X",year)
  mapCountryData(mapped_data, nameColumnToPlot = k)
  #title(year)
  dev.off()
}

