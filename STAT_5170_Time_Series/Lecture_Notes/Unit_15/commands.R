seasonal.ma1.sim <- arima.sim(list(order = c(0,0,12), ma = c(rep(0,11),0.5)), n = 1000)

seasonal.ar1.sim <- arima.sim(list(order = c(12,0,0), ar = c(rep(0,11),0.5)), n = 1000)

pdf("s_ma1.pdf")
par(mfrow=c(1,2))
acf(seasonal.ma1.sim, 36, xlim=c(1,36), ylim=c(-0.2,0.5), main="ACF of Seasonal MA(1)")
pacf(seasonal.ma1.sim, 36, ylim=c(-0.2,0.5), main="PACF of Seasonal MA(1)")
dev.off()

pdf("s_ar1.pdf")
par(mfrow=c(1,2))
acf(seasonal.ar1.sim, 36, xlim=c(1,36), ylim=c(-0.2,0.6), main="ACF of Seasonal AR(1)")
pacf(seasonal.ar1.sim, 36, ylim=c(-0.2,0.6), main="PACF of Seasonal AR(1)")
dev.off()

phi<-c(rep(0,11),0.8)

ACF<-ARMAacf(ar=phi, ma=-0.5, 50)[-1]
PACF<-ARMAacf(ar=phi, ma=-0.5, 50, pacf=TRUE)

pdf("arma_acf.pdf")
par(mfrow=c(1,2))
plot(ACF, type="h", xlab="lag", ylim=c(-0.4,0.8), main=expression("ACF of ARMA(0,1)x(1,0)"[12]))
plot(PACF, type="h", xlab="lag", ylim=c(-0.4,0.8), main=expression("PACF of ARMA(0,1)x(1,0)"[12]))
dev.off()

