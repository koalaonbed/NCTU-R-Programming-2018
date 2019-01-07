library(rworldmap)
library(RColorBrewer)
gdp <- read.csv("gdpper.csv");


#colorRGB <- rep(rgb(1,1,1),248*57)
#dim(colorRGB) <- c(266,61)
#for(i in 5: 62){
#	for(j in 1:266){
#		gdp[i,j] <- gdp[i,j]/10000
#	}
#}

mapped_data <- joinCountryData2Map(gdp, joinCode = "ISO3", nameJoinColumn = "Country.Code")

for (year in 1960:2017) {
  picname <- paste(year,'.png',sep='')
  png(file = picname, width = 1080, height = 720)
  par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
  k<-paste0("X",year)
  mapCountryData(mapped_data, nameColumnToPlot = k)
  #title(year)
  dev.off()
}

