data(Orange)
head(Orange)

model <- lm(circumference~age,Orange)
model

#circumfere = 17.3997 + 0.1068age + error
coef(model) # ȸ�Ͱ��
r <- residuals(model) # ����Ȯ��

f <- fitted(model) #model�� ������ �� ���ϱ��
f
r <- residuals(model) 

#������ ���� ������ ���Ͽ� �������� �������� �˾ƺ�
f[0:4] + r[0:4]

#������
Orange[0:4,'circumference']

#���� ������
deviance(model)

#����
predict.lm(model, newdata = data.frame(age=100))

#�������
summary(model)
cor(Orange$circumference, Orange$age) ^2 # 83%

#�ܼ�ȸ�� ���� �ð�ȭ
plot(Orange$age, Orange$circumference)
abline(coef(model))
