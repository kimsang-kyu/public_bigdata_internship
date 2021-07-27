n <- head(Nile)
n
#1차 차분
n.diff1 <- diff(n,differences = 1)
n.diff1

#2차 차분
n.diff2 <- diff(n,differences = 2)
n.diff2

#install.packages('forecast')
library(forecast)

auto.arima(Nile) # pdq 111을 쓰면 된다

Nile.arima <- arima(Nile,order=c(1,1,1))
Nile.arima

forecast(Nile.arima, h=5) # 5개 년도를 예측
# 점추정, 80~, 95~

plot(forecast(Nile.arima,h=5))

###분해시계열
plot(ldeaths)

ldeaths.decomp <- decompose(ldeaths)
plot(ldeaths.decomp)
#원본, trend 추세추출, 계절성, 잔차