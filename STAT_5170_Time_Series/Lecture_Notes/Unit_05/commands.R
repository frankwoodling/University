globtemp<-scan("global.txt")
x<-globtemp[45:142]
t<- 1900:1997
fit<-lm(x~t)

pdf("plots1.pdf")
plot(t,x, type="o", ylab="global temp", xlab="year", main="Global Temp")
dev.off()

pdf("plots2.pdf")
plot(t,fit$res, type="o", ylab="detrended global temp", xlab="year", main="Detrended Data")
dev.off()

pdf("plots3.pdf")
y<-globtemp[44:142]
plot(t,diff(y), type="o", ylab="differenced global temp", xlab="year", main="Differenced Data")
dev.off()

pdf("acf1.pdf")
acf(x, main="ACF for Global Temp")
dev.off()

pdf("acf2.pdf")
acf(fit$res, main="ACF for Detrended Data")
dev.off()

pdf("acf3.pdf")
acf(diff(y), main="ACF for Differenced Data")
dev.off()

mean(diff(y))
sd(diff(y))/sqrt(length(diff(y)))

