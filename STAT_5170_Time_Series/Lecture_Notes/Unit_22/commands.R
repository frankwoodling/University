omega<-seq(0,0.5, length=1000)

pdf("diff.pdf")
FR.diff<-abs(1-exp(2i*pi*omega))^2
plot(omega,FR.diff, type="l", main="Power Transfer Function of First Difference Filter")
dev.off()

pdf("ma.pdf")
FR.MA<-abs((1/12)*(1+cos(12*pi*omega)+2*cos(2*pi*omega)+2*cos(4*pi*omega)+2*cos(6*pi*omega)+2*cos(8*pi*omega)+2*cos(10*pi*omega)))^2
plot(omega,FR.MA, type="l", main="Power Transfer Function of Moving Average Filter")
dev.off()

##################
##worked example##
##################

soi<-scan("soi.dat")

pdf("ts.pdf")
par(mfrow=c(3,1))
plot.ts(soi, main="Time Series Plot of SOI")
plot.ts(diff(soi), main="First Difference Filter of SOI")
k<-kernel("modified.daniell", 6)
soif<-kernapply(soi,k)
plot.ts(soif, main="Moving Average Filter of SOI")
dev.off()

pdf("periodogram.pdf")
spectrum(soif,spans=9, log="no")
abline(v=1/52, lty=2)
dev.off()

omega<-seq(0,0.5, length=1000)

pdf("freq_response.pdf")
par(mfrow=c(2,1))

FR.diff<-abs(1-exp(2i*pi*omega))^2
plot(omega,FR.diff, type="l", main="Power Transfer Function of First Difference Filter")

FR.MA<-abs((1/12)*(1+cos(12*pi*omega)+2*cos(2*pi*omega)+2*cos(4*pi*omega)+2*cos(6*pi*omega)+2*cos(8*pi*omega)+2*cos(10*pi*omega)))^2
plot(omega,FR.MA, type="l", main="Power Transfer Function of Moving Average Filter")
dev.off()