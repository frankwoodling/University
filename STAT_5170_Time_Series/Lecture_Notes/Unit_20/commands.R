soi<-scan("soi.dat")
rec<-scan("recruit.dat")

pdf("ts.pdf")
par(mfrow=c(2,1))
plot.ts(soi, main="Time Series Plot of SOI")
plot.ts(rec, main="Time Series Plot of Recruitment")
dev.off()

pdf("periodogram.pdf")
par(mfrow=c(2,1))
soi.per<-spec.pgram(soi, taper=0, log="no")
abline(v=1/12, col="red")
abline(v=1/48, col="blue")

rec.per<-spec.pgram(rec, taper=0, log="no")
abline(v=1/12, col="red")
abline(v=1/48, col="blue")
dev.off()

soi.per$spec[40]
soi.per$spec[10]

upper<-qchisq(0.025,2)
lower<-qchisq(0.975,2)

c(2*soi.per$spec[10]/lower, 2*soi.per$spec[10]/upper)
c(2*soi.per$spec[40]/lower, 2*soi.per$spec[40]/upper)

c(2*soi.per$spec[10]/lower, 2*soi.per$spec[10]/upper)
c(2*soi.per$spec[40]/lower, 2*soi.per$spec[40]/upper)

rec.per$spec[40]
rec.per$spec[10]

c(2*rec.per$spec[10]/lower, 2*rec.per$spec[10]/upper)
c(2*rec.per$spec[40]/lower, 2*rec.per$spec[40]/upper)

c(2*rec.per$spec[10]/lower, 2*rec.per$spec[10]/upper)
c(2*rec.per$spec[40]/lower, 2*rec.per$spec[40]/upper)