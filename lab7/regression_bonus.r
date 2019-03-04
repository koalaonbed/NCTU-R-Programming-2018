model <- lm(formula = Sepal.Length ~ Sepal.Width+Petal.Length+Petal.Width, data = rbind(iris[1:40,], iris[51:90,], iris[101:140,]))
basic.rms <- 0
for(i in 1:3){
	for(j in 1:10){
		my.iris <- data.frame(Sepal.Width=iris[i*40+j,2], Petal.Length=iris[i*40+j,3], Petal.Width=iris[i*40+j,4])
		p_iris <- predict(model, my.iris)
		p_iris <- iris[i*40+j,1]-p_iris
		basic.rms <- basic.rms + p_iris*p_iris
	}
}	
basic.rms <- sqrt(basic.rms/30)


setosa.model <- lm(formula = Sepal.Length ~ Sepal.Width+Petal.Length+Petal.Width, data = iris[1:40,])
versicolor.model <- lm(formula = Sepal.Length ~ Sepal.Width+Petal.Length+Petal.Width, data = iris[51:90,])
virginica.model <- lm(formula = Sepal.Length ~ Sepal.Width+Petal.Length+Petal.Width, data = iris[101:140,])
bonus.rms <- 0

for(i in 41:50){
	my.iris <- data.frame(Sepal.Width=iris[i,2], Petal.Length=iris[i,3], Petal.Width=iris[i,4])
	p_iris <- predict(setosa.model, my.iris)
	p_iris <- iris[i,1]-p_iris
	bonus.rms <- bonus.rms + p_iris*p_iris
}


for(i in 91:100){
	my.iris <- data.frame(Sepal.Width=iris[i,2], Petal.Length=iris[i,3], Petal.Width=iris[i,4])
	p_iris <- predict(versicolor.model, my.iris)
	p_iris <- iris[i,1]-p_iris
	bonus.rms <- bonus.rms + p_iris*p_iris
}

for(i in 141:150){
	my.iris <- data.frame(Sepal.Width=iris[i,2], Petal.Length=iris[i,3], Petal.Width=iris[i,4])
	p_iris <- predict(virginica.model, my.iris)
	p_iris <- iris[i,1]-p_iris
	bonus.rms <- bonus.rms + p_iris*p_iris
}

bonus.rms <- sqrt(bonus.rms/30)

print(c(basic.rms, bonus.rms))