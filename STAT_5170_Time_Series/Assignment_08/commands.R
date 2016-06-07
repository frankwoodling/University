motel<-read.table("motel.dat")
nights<-motel$V1[1:100]

plot.ts(nights, main="Time Series Plot for Room Occupancy")

plot.ts(diff(nights), main="Time Series Plot for Differenced Data")

lnights<-log(nights)

par(mfrow=c(1,2))
plot.ts(diff(lnights), main="Time Series Plot for Differenced of Logarithm")
plot.ts(diff(lnights,12), main="Time Series Plot for Seasonal Differenced of Logarithm")

## plot.ts(diff(diff(lnights),12), main="Time Series Plot with both regular and seasonal diff")

par(mfrow=c(1,2))
acf(diff(diff(lnights),12),36, xlim=c(1,36), ylim=c(-0.4,0.3), main="ACF with both regular and seasonal differencing")
pacf(diff(diff(lnights),12),36, ylim=c(-0.4,0.2), main="PACF with both regular and seasonal differencing")

source("sarima.R")

fit1<-sarima(lnights,1,1,0,1,1,0,12) ##diagnostics are off

fit2<-sarima(lnights,1,1,0,1,1,1,12)  #diagnostics are off

fit3<-sarima(lnights,0,1,1,1,1,0,12)  #diagnostics are ok

fit4<-sarima(lnights,0,1,1,1,1,1,12) #diagnostics are ok

fit5<-sarima(lnights,1,1,1,1,1,0,12)  #diagnostics are ok

fit6<-sarima(lnights,1,1,1,1,1,1,12) #diagnostics are ok

f3.cri<-c(fit3$AIC,fit3$AICc,fit3$BIC)
f4.cri<-c(fit4$AIC,fit4$AICc,fit4$BIC)
f5.cri<-c(fit5$AIC,fit5$AICc,fit5$BIC)
f6.cri<-c(fit6$AIC,fit6$AICc,fit6$BIC)

f3.cri
f4.cri
f5.cri
f6.cri

fit6

sarima.for(lnights,12,1,1,1,1,1,1,12)

all_nights<-motel$V1
lines(101:112, log(all_nights[101:112]), type="b")

lnights3<-lnights[1:88]
sarima.for(lnights3,12,1,1,1,1,1,1,12)
lines(89:100, lnights[89:100], type="b")