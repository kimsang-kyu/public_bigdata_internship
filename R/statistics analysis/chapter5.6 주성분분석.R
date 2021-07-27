#princomp() cor=TRUE  상관 / FALSE 공분산행렬
fit <- princomp(iris[,1:4], cor = TRUE)

#summary()
summary(fit)

#loadings()
loadings(fit) #각 주성분의 로딩 벡터를 구하는 예

#첫번째주성분
# comp1 = 0.521*S.L - 0.269*S.W + ... (전체 변동을 가장 잘 선명하는 선형 결합)

#주성분 개수 선택법 (스크리 그래프)
screeplot(fit, type='lines', main ='scree plot')
#수평을 유지하기 전단계로 주성분의 수를 결정 가능 
