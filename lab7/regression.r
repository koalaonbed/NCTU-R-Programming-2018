# Required Lib
library(ggplot2)

# Plotting
ggplot(data=iris) +
  geom_point(aes(x=Petal.Length, y=Petal.Width, color=Species)) +
  theme_bw()

# Lenear Model
model <- lm(formula = Sepal.Length ~ Sepal.Width+Petal.Length+Petal.Width, data = iris)
summary(model)

# Prediction
my.iris <- data.frame(Sepal.Width=3.5, Petal.Length=1.4, Petal.Width=0.2)
predict(model, my.iris)