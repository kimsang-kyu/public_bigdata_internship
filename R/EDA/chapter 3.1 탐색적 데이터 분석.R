##### 3.1 탐색적 데이터 분석 
#### 3.1.1 데이터 대표값 탐색

### 평균과 중앙값
a_salary <- c(25,28,50,60,30,35,40,70,40,70,40,100,30,30)
b_salary <- c(20,40,25,25,35,25,20,10,55,65,100,100,150,300)

mean(a_salary)
mean(b_salary)
mean(a_salary, na.rm = T)

median(a_salary)
median(b_salary)
median(a_salary, na.rm = T)

### 절사평균
mean(A_salary, trim = 0.1) 
mean(B_salary, trim = 0.1)

#### 3.1.2 데이터 분산도 탐색

### 최소값, 최대값으로 범위 탐색
range(a_salary)
range(b_salary)
min(a_salary)
min(b_salary)
max(a_salary)
max(b_salary)

### 분산과 표준편차
var(a_salary)
var(a_salary)
sd(b_salary)
sd(b_salary)

#### 