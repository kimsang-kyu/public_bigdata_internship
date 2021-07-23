#####데이터조작방법1
head(Orange) 
head(Orange,3)

tail(Orange)
tail(Orange,3)

str(Orange) #data structure

summary(Orange) #summary

###data load
nhis <- read.csv('G:/R_pjt/R_basic/data/NHIS_OPEN_GJ_EUC-KR.csv')
head(nhis)
nhis <- read.csv('G:/R_pjt/R_basic/data/NHIS_OPEN_GJ_EUC-KR.csv', fileEncoding = 'EUC-KR')
nhis <- read.csv('G:/R_pjt/R_basic/data/NHIS_OPEN_GJ_UTF-8.csv', fileEncoding = 'UTF-8')

sample <- read.csv('G:/R_pjt/R_basic/data/sample.csv', header=F, fileEncoding = 'EUC-KR',stringsAsFactors = TRUE)
str(sample)

###load excel file
#install.packages('openxlsx')
library(openxlsx)

nhis_sheet <- read.xlsx('G:/R_pjt/R_basic/data/NHIS_OPEN_GJ_EUC-KR.csv')
nhis_sheet <- read.xlsx('G:/R_pjt/R_basic/data/NHIS_OPEN_GJ_EUC-KR.csv', sheet=2)

#load bigdata file
#install.packages('data.table')
library(data.table)

nhis_bigdata = fread("G:/R_pjt/R_basic/data/NHIS_OPEN_GJ_BIGDATA_UTF-8.csv", encoding = "UTF-8" )
str(nhis_bigdata) 

#####데이터 추출 
Orange[1,]
Orange[1:5,]
Orange[6:10,]
Orange[c(1,5),]
Orange[-c(1:29),]

Orange[Orange$age ==118,]
Orange[Orange$age %in% c(118,484),]
Orange[Orange$age >= 1372,]
Orange[,'circumference']

#row 
Orange[1,c('Tree','circumference')]

#col
Orange[,1]
Orange[,c(1,3)]
Orange[,c(1:3)]
Orange[,-c(1,3)]

#row,col
Orange[1:5,'circumference']
Orange[Orange$Tree %in% c(3,2), c('Tree','circumference')]

#order()
OrangeT1 <- Orange[Orange$circumference < 50,]
OrangeT1[order(OrangeT1$circumference),]

OrangeT1[order(-OrangeT1$circumference),]

#aggregate()
aggregate(circumference ~ Tree, Orange, mean)


##### 데이터 구조 변경
stu1 <- data.frame(no=c(1,2,3), midterm = c(100,90,80))
stu2 <- data.frame(no=c(1,2,3), finalterm = c(100,90,80))
stu3 <- data.frame(no=c(1,4,5), quiz = c(99,88,77))
stu4 <- data.frame(no=c(4,5,6), midterm = c(99,88,77))

###merge, rbind, cbind
merge(stu1,stu2)
merge(stu1,stu3)
merge(stu1,stu3,all=TRUE)

rbind(stu1,stu4)

cbind(stu1,stu2)
