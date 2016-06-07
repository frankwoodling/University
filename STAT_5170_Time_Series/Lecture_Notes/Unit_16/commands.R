beer<-scan("beer.txt")

pdf("beer_ts.pdf")
plot.ts(beer, type="b", main="Beer Production in Australia")
dev.off()

pdf("beer_tsdiff.pdf")
par(mfrow=c(1,2))
plot.ts(diff(beer,1), main="First Difference (Non-Seasonal)")
plot.ts(diff(beer,4), main="Fourth Difference (Seasonal)")
dev.off()

pdf("beer_tssta.pdf")
plot.ts(diff(diff(beer),4), main="Time Series Plot with both non-seasonal and seasonal diff")
dev.off()

pdf("beer_acf.pdf")
par(mfrow=c(1,2))
acf(diff(diff(beer),4),16, xlim=c(1,16), ylim=c(-0.6,0.3), main="ACF with both differencing")
pacf(diff(diff(beer),4),16, ylim=c(-0.6,0.3), main="PACF with both differencing")
dev.off()

source("sarima.R")

fit1<-sarima(beer,2,1,0,0,1,2,4) ##ok. barely sig acf at lag 9

pdf("beer_m2.pdf")
fit2<-sarima(beer,0,1,1,0,1,2,4) ##pvalue not good
dev.off()

fit3<-sarima(beer,1,1,1,0,1,2,4) ##ok

f1.cri<-c(fit1$AIC,fit1$AICc,fit1$BIC)
f3.cri<-c(fit3$AIC,fit3$AICc,fit3$BIC)

f1.cri
f3.cri

fit3

fit4<-sarima(beer,1,1,1,0,1,1,4) ##ok

f4.cri<-c(fit4$AIC,fit4$AICc,fit4$BIC)

f3.cri
f4.cri

