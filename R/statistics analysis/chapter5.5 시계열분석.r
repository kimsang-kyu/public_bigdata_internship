n <- head(Nile)
n
#1�� ����
n.diff1 <- diff(n,differences = 1)
n.diff1

#2�� ����
n.diff2 <- diff(n,differences = 2)
n.diff2

#install.packages('forecast')
library(forecast)

auto.arima(Nile) # pdq 111�� ���� �ȴ�

Nile.arima <- arima(Nile,order=c(1,1,1))
Nile.arima

forecast(Nile.arima, h=5) # 5�� �⵵�� ����
# ������, 80~, 95~

plot(forecast(Nile.arima,h=5))

###���ؽð迭
plot(ldeaths)

ldeaths.decomp <- decompose(ldeaths)
plot(ldeaths.decomp)
#����, trend �߼�����, ������, ����