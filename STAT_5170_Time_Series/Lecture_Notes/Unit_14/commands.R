gnp<-read.table("gnp96.dat", header=FALSE, sep="")

gnp<-gnp[,2]

gnp<-ts(gnp)

pdf("ts.pdf")
par(mfrow=c(1,2))
plot(gnp, main="US GNP")
acf(gnp, main="ACF of US GNP")
dev.off()


pdf("growth.pdf")
d.log.gnp<-diff(log(gnp))
par(mfrow=c(1,2))
plot(d.log.gnp, main="Growth Rate of US GNP")
acf(d.log.gnp, main="Growth Rate of US GNP")
dev.off()

pdf("acf.pdf")
par(mfrow=c(1,2))
acf(d.log.gnp, 20, xlim=c(1,20), ylim=c(-0.2,0.4), main="ACF of Growth Rate")
pacf(d.log.gnp, xlim=c(1,20), ylim=c(-0.2,0.4), main="PACF of Growth Rate")
dev.off()

source("sarima.R")

pdf("ar_diag.pdf")
res.ar<-sarima(d.log.gnp,1,0,0)
dev.off()

pdf("ma_diag.pdf")
res.ma<-sarima(d.log.gnp,0,0,2)
dev.off()

pdf("arma_diag.pdf")
res.arma<-sarima(d.log.gnp,2,0,2)
dev.off()

