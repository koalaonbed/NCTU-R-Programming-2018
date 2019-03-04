library(titanic)
#data.file = "hw8_titanic.csv"
#titanic_data <- read.csv(data.file, header=FALSE, sep=",")


model <- lm(formula = Survived ~ Age+SibSp+Parch+Fare, data = titanic_train)
predict<-titanic_gender_model
correct<-0
for(i in 1:418){
  
  p.titanic <- data.frame(Age=titanic_test[i,5], SibSp=titanic_test[i,6], Parch=titanic_test[i,7], Fare=titanic_test[i,9])
  p_titanic <- predict(model, p.titanic)
  #print(p_titanic)
  if(is.na(p_titanic)){p_titanic=0}
  if(p_titanic<0.5){p_titanic=0}
  if(p_titanic>=0.5){p_titanic=1}
  if(p_titanic==predict[i,2]){correct=correct+1}
  predict[i,1] <- 891+i
  predict[i,2] <- p_titanic
  
}

write.csv(predict, file = "0416053.csv")

correct_rate=correct/418
print(correct_rate)





