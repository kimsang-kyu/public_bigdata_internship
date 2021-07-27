height_father <- c(180,172,150,180,177,160,170,165,179,159)
height_mother <- c(160,164,166,188,160,160,171,158,169,159)
height_son <- c(180,173,163,184,165,165,175,168,179,160)
height <- data.frame(height_father,height_mother,height_son)
head(height)

#모델
model <- lm(height_son ~ height_father + height_mother, data = height)
model

#회귀계수
coef(model)

#잔차
r <- residuals(model)
r[0:4]

#예측
predict.lm(model, newdata = data.frame(height_father=170, height_mother=160))

#구간추정
predict.lm(model, newdata = data.frame(height_father=170, height_mother=160), interval = 'confidence')

summary(model)

#설명변수 선택
model <- lm(mpg ~., data = mtcars)

new_model <- step(model,direction = 'both')

lm(new_model)

