##### data1_vector,matrix
### matrix
students_age <- c(11,12,13,20,15,21)
students_age

class(students_age)
length(students_age)

students_age[1]
students_age[3]
students_age[-1]

students_age[1:3]
students_age[4:6]

score <- c(1,2,3)
score[1] <- 10
score[4] <- 4
score

code <- c(1,2,"30")
class(code)
code

data <- c(1:10)
data

data1 <- seq(1,10)
data1

data2 <- seq(1,10, by=2)
data2

data3 <- rep(1, times = 5)
data3

data4 <- rep(1:3, each = 3)
data4


###matrix
var1 <- c(1,2,3,4,5,6)

x1 <- matrix(var1,nrow = 2, ncol = 3)
x1

x2 <- matrix(var1, ncol = 2)
x2

x1[1,]
x1[,1]
x1[2,2]

x1 <- rbind(x1,c(10,10,10))
x1 <- cbind(x1,c(20,20,20))

#####data2_dataframe,array,list
###dataframe
no <- c(10,20,30,40,50,60,70)
age <- c(18,15,13,12,10,9,7)
gender <- c('M','M','M','M','M','F','M')

student <- data.frame(no,age,gender)
student

colnames(student) #colname
rownames(student) #rowname

colnames(student) <- c('no','³ªÀÌ','¼ºº°')
rownames(student) <- c('A','B','C','D','E','F','G')

colnames(student) <- c('no','age','gender')

student$no
student$age

#col
student[,'no']
student[,1]
student[,'age']
student[,2]

#row
student['A',]
student[2,]

student[3,1]
student['A','no']

#add col
student$name <- c('ÀÌ¿ë','ÁØÈñ','ÀÌÈÆ','¼­Èñ','½ÂÈñ','ÇÏÁ¤','ÇÏÁØÁØ')
head(student)

student['H',] <- c(80,10,'M','È«±æµ¿')
tail(student)

### array
var1 <- seq(1,12)
arr1 <- array(var1, dim=c(2,2,3)) #(2*2)*3 
arr1

###list
v_data <- c('02-111-2222','01022223333') #vector
m_data <- matrix(c(21:26),nrow=2)
a_data <- array(c(31:36), dim= c(2,2,2))
d_data <- data.frame(address=c('seoul','busan'), name = c('Lee',"kim"),stringsAsFactors = F)

#list
list_data <- list(name='È«±æµ¿', tel =v_data, score1 = m_data, score2 = a_data, friends = d_data)
list_data

list_data$name #list_data[1]
list_data$tel
