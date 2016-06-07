#######
##CCF##
#######

soi<-scan("soi.dat")
rec<-scan("recruit.dat")

library(TSA)

xy<-ts.intersect(as.ts(soi),as.ts(rec))

pdf("ccf_soi.pdf")
prewhiten(as.vector(xy[,1]),as.vector(xy[,2]),main="CCF with Prewhitened Data")$ccf
dev.off()

############
##bluebird##
############

data<-read.table("bluebird.dat")
sales<-data$V1
price<-data$V2

dy<-diff(sales)
dx<-diff(price)

library(TSA)

xy<-ts.intersect(as.ts(dx),as.ts(dy))

pdf("ccf.pdf")
prewhiten(as.vector(xy[,1]),as.vector(xy[,2]),main="CCF with Prewhitened Data")
dev.off()

result<-lm(dy~dx)
summary(result)

r<-residuals(result)

pdf("residuals.pdf")
par(mfrow=c(2,1))
acf(r, main="ACF of Residuals")
pacf(r, main="PACF of Residuals")
dev.off()

result.arma<-arima(dy,order=c(3,0,4),xreg=data.frame(dx))

result.arma

result.arma2<-arima(dy,order=c(2,0,3),xreg=data.frame(dx))

result.arma2

result.arma3<-arima(dy,order=c(2,0,3),xreg=data.frame(dx), fixed=c(0,NA,NA,NA,NA,0,NA))

result.arma3

r2<-residuals(result.arma3)

pdf("residuals2.pdf")
par(mfrow=c(2,1))
acf(r2, main="ACF of Residuals")
pacf(r2, main="PACF of Residuals")
dev.off()

