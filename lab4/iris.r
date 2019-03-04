data<-iris
index<-sample(1:nrow(iris),75)
morning<-iris[index,]
evening<-iris[-index,]
print(morning)
print(evening)
