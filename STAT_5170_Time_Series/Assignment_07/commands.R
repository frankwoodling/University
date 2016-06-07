############
##matrices##
############

x<-matrix(c(2,3,1,4),nrow=2,ncol=2)

t(x)

solve(x)

y<-matrix(c(6,2),nrow=2)
x%*%y

################
##ARIMA models##
################

berk<-scan("berkeley.dat", what=list(double(0),double(0),double(0)))
berkeley<-ts(berk[[2]])
berk
par(mfrow=c(1,3))
plot(berkeley, main="Time Series Plot of Berkeley Avg Temp")
acf(berkeley, 20, xlim=c(1,20), ylim=c(-0.2,0.5),  main="ACF of Berkeley Avg Temp")
pacf(berkeley, ylim=c(-0.2,0.5), main="PACF of Berkeley Avg Temp")

dberk<-diff(berkeley)

par(mfrow=c(1,3))
plot(dberk, main="Time Series Plot of Differenced Berkeley Avg Temp")
acf(dberk, 20, xlim=c(1,20), ylim=c(-0.5,0.3),  main="ACF of 1st Diff")
pacf(dberk, ylim=c(-0.5,0.3), main="PACF of 1st Diff")

source("sarima.R")

fit1<-sarima(dberk, 0,0,1)
fit1<-sarima(berkeley, 0,1,1) ##same as above
fit1

qqnorm((fit1$fit)$resid)
qqline((fit1$fit)$resid, col="red")

fit2<-sarima(berkeley,2,1,0)
fit2

fit3<-sarima(berkeley,1,1,1)
fit3

fit4<-sarima(berkeley,4,1,0)
fit4

source("sarima.for.R")

sarima.for(dberk,5,0,0,1)

sarima.for(berkeley,5,0,1,1)