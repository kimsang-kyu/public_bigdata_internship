##### 3.1 탐색적 데이터 분석

#### 3.1.4 데이터 관계 탐색

### 산점도 그래프

a_salary <- c(25,28,50,60,30,35,40,70,40,70,40,100,30,30)
a_hireyears <- c(1,1,5,6,3,3,4,7,4,7,4,10,3,3)

a <- data.frame(salary <- a_salary, hireyears <- a_hireyears)

#산점도
plot(a$hireyears, a$salary, xlab= '근무년수', ylab ='연봉(벡민단위)')

pairs(iris[,1:4], main='iris data')


### 상관계수
cor(a$hireyears, a$salary)

### 상관행렬
cor(iris[,1:4])

### 상관행렬 히트맵
heatmap(cor(iris[,1:4]))
