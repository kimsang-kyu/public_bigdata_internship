cor(Orange$circumference, Orange$age)
# 양의 상관관계를 가진다. // 인과관계는 아님 

plot(Orange$circumference, Orange$age, col='red', pch=19)

cor(iris[, 1:4])

#상관계수 검정
cor.test(iris$Petal.Length, iris$Petal.Width, method = 'pearson')

