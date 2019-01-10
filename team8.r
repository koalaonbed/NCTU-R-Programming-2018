library(rworldmap)
library(animation)
gdpper <- read.csv("team8.csv");




#colorRGB <- rep(rgb(1,1,1),248*57)
#dim(colorRGB) <- c(266,61)
#for(i in 5: 62){
#	for(j in 1:266){
#		gdp[i,j]=gdp[i,j]*0.0001
#	}
#}

mapped_data <- joinCountryData2Map(gdpper, joinCode = "ISO3", nameJoinColumn = "Country.Code")
saveGIF({
for (year in 1960:2017) {
  
  
  par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
  k<-paste0("X",year)
  mapCountryData(mapped_data, nameColumnToPlot = k)
  #title(year)
  
}
}, movie.name = "animation.gif", interval = 0.5, ani.width = 1280
)

