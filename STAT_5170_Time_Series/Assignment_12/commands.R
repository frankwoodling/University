data<-read.table("bluebird.dat")
sales<-data$V1
price<-data$V2

dy<-diff(sales)
dx<-diff(price)

library(TSA)

xy<-ts.intersect(as.ts(dx),as.ts(dy))

prewhiten(as.vector(xy[,1]),as.vector(xy[,2]), main="CCF of Prewhitened Data")

prewhiten(as.vector(xy[,1]),as.vector(xy[,2]), main="CCF of Prewhitened Data")$ccf

result<-lm(dy~dx)

r<-residuals(result)

par(mfrow=c(2,1))
acf(r)
pacf(r)

result.arma<-arima(dy,order=c(3,0,4),xreg=data.frame(dx))

result.arma

result.arma2<-arima(dy,order=c(2,0,3),xreg=data.frame(dx))

result.arma2

result.arma3<-arima(dy,order=c(2,0,3),xreg=data.frame(dx), fixed=c(0,NA,NA,NA,NA,0,NA))

result.arma3

r2<-residuals(result.arma3)
par(mfrow=c(2,1))
acf(r2)
pacf(r2)

##################
##HW walkthrough##
##################

x<-ts(scan("lead.dat"))
y<-ts(scan("sales.dat"))

dx<-diff(x)
dy<-diff(diff(y))

ccf(dx,dy)

dx1<-lag(dx,-1)
dx2<-lag(dx,-2)
dx3<-lag(dx,-3)
a<-cbind(dy,dx1,dx2,dx3)
result<-lm(dy~dx1+dx2+dx3) ##R complains due to presence of NAs

result<-lm(dy~dx1+dx2+dx3,data=a,na.action=na.omit)

summary(result)

library(TSA)

xy<-ts.intersect(as.ts(dx),as.ts(dy))

prewhiten(as.vector(xy[,1]),as.vector(xy[,2]), main="CCF of Prewhitened Data")

dx4<-lag(dx,-4)
b<-cbind(dy,dx2,dx3,dx4)
result2<-lm(dy~dx2+dx3+dx4,data=b,na.action=na.omit)

result.arma<-arima(dy,order=c(1,0,1),xreg=data.frame(dx2,dx3,dx4))

b
dy<-b[4:148,1]
dx2<-b[4:148,2]
dx3<-b[4:148,3]
dx4<-b[4:148,4]
result.arma<-arima(dy,order=c(1,0,1),xreg=data.frame(dx2,dx3,dx4))
result.arma

r<-residuals(result.arma)

par(mfrow=c(2,1))
acf(r, main="ACF of Residuals")
pacf(r, main="PACF of Residuals")






