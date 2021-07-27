data(Orange)
head(Orange)

model <- lm(circumference~age,Orange)
model

#circumfere = 17.3997 + 0.1068age + error
coef(model) # 회귀계수
r <- residuals(model) # 잔차확인

f <- fitted(model) #model이 예측한 값 구하기기
f
r <- residuals(model) 

#예측한 값에 잔차를 더하여 실제값과 동일한지 알아봄
f[0:4] + r[0:4]

#실제값
Orange[0:4,'circumference']

#잔차 제곱합
deviance(model)

#예측
predict.lm(model, newdata = data.frame(age=100))

#결정계수
summary(model)
cor(Orange$circumference, Orange$age) ^2 # 83%

#단순회귀 모델의 시각화
plot(Orange$age, Orange$circumference)
abline(coef(model))
