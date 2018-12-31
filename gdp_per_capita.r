library(rworldmap)
gdp <- read.csv("gdpper.csv");
for (i in 1:266) {
  for (j in 1:61) {
    if(is.na(gdp[i,j])){
      gdp[i,j] <- 1
    }
  }
}
mapped_data <- joinCountryData2Map(gdp, joinCode = "ISO3", nameJoinColumn = "Country.Code")
par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
mapCountryData(mapped_data, nameColumnToPlot = "X2017")
