#### 3.2 데이터 분포 탐색 

### 백분위수, 사분위수
a_salary <- c(25,28,50,60,30,35,40,70,40,70,40,100,30,30)
b_salary <- c(20,40,25,25,35,25,20,10,55,65,100,100,150,300)

quantile(a_salary,0.9)
quantile(b_salary,0.9)

quantile(a_salary)
quantile(b_salary)

### boxplot
boxplot(a_salary,b_salary, names = c('a salary','b salary'))

### hist
hist(a_salary, xlab = 'a salary', ylab = '인원수', breaks = 5)
hist(b_salary, xlab = 'b salary', ylab = '인원수', breaks = 5)

### 도수분포표
cut_value <- cut(a_salary, breaks = 5)
freq <- table(cut_value)
freq

a_gender <- as.factor(c('남','남','남','남','남','남','남','남','남','여',
                        '여','여','여','여'))
b_gender <- as.factor(c('남','남','남','남','여','여','여','여','여','여','여',
                        '남','여','여'))
a <- data.frame(gender <- a_gender, salary <- a_salary)
b <- data.frame(gender <- b_gender, salary <- b_salary)
freqA <- table(a$gender)
freqA

freqb <- table(b$gender)
freqb

#상대적 빈도표
prop.table(freqA)

prop.table(freqb)

### barplot
barplot(freqA, names = c('남','여'), col = c('skyblue','pink'), ylim = c(0,10))
title(main ='A')

barplot(freqb, names = c('남','여'), col = c('skyblue','pink'), ylim = c(0,10))
title(main ='B')

### pie
pie(x=freqA,col = c('skyblue','pink'),main ='A')
pie(x=freqb,col = c('skyblue','pink'),main ='B')
