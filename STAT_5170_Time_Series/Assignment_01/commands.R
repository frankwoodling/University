getwd()

scan("soi.dat")

soi<-scan("soi.dat")

temp<-2

rm(temp)

plot(soi)

plot(soi,xlab="time",ylab="Southern Oscillation Index", main="Time Series Plot")

recruit<-scan("recruit.dat")

plot.ts(soi,main="SOI")

par(mfrow=c(1,2))

plot.ts(soi,main="Time Series Plot")
plot.ts(recruit,main="Time Series Plot")


jpeg("joint.jpg")
par(mfrow=c(1,2))
plot.ts(soi,main="Time Series Plot")
plot.ts(recruit,main="Time Series Plot")
dev.off()

pdf("joint.pdf")
par(mfrow=c(1,2))
plot.ts(soi,main="Time Series Plot")
plot.ts(recruit,main="Time Series Plot")
dev.off()

