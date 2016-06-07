setwd("C:/Users/Frank/Desktop/STAT 5170/Assignment 4")
gas<-scan("gas.dat")

magas<-filter(gas,sides=2,rep(1,13)/13)
plot(gas)
lines(magas, col="red")

m2<-filter(gas,sides=1,rep(1,12)/12)
lines(m2, lty=2, col="blue")
legend("topleft", c("centered","1-sided"), lty=c(1,2), col=c("red","blue"))

plot(gas-magas)

lgas<-log(gas)

malgas<-filter(lgas,sides=2,rep(1,13)/13)
plot(lgas)
lines(malgas)
resmalgas<-lgas-malgas
resmalgas<-resmalgas[!is.na(resmalgas)]
plot.ts(resmalgas)
acf(resmalgas)

ksmlgas<-ksmooth(1:length(lgas),lgas,"normal",bandwidth=3)$y
par(mfrow=c(3,1))
plot(lgas)
lines(ksmlgas, col="red")
resksmlgas<-ksmlgas-lgas
plot.ts(resksmlgas)
acf(resksmlgas)

ksmlgas<-ksmooth(1:length(lgas),lgas,"normal",bandwidth=3)$y
ksmlgas2<-ksmooth(1:length(lgas),lgas,"normal",bandwidth=12)$y
par(mfrow=c(2,1))
plot(lgas)
lines(ksmlgas, col="red")
plot(lgas)
lines(ksmlgas2, col="red")
