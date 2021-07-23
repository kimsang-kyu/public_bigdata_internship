#####변수와 데이터 타입
###변수
age <- 20
age

age <- 30
age 

###데이터 타입
#숫자 타입
age <- 20
class(age)

#문자 타입 
name <- 'KSK'
class(name)

#논리 타입
is_effective <- TRUE
is_effective

is_effective <- FALSE
is_effective

class(is_effective)

#펙터 타입
sido <- factor('서울',c('서울','부산','제주'))
sido
class(sido)
levels(sido)

###상수
#NULL과 NA
a <-NULL
jumsu <- c(NA, 90, 100)

#Inf와 NaN
10/0
0/0
