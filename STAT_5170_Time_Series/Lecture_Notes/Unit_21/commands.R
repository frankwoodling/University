soi<-scan("soi.dat")
rec<-scan("recruit.dat")

pdf("periodogram.pdf")
par(mfrow=c(2,1))
soi.per<-spec.pgram(soi, taper=0, log="no")
rec.per<-spec.pgram(rec, taper=0, log="no")
dev.off()

soi.per$spec[40]
soi.per$spec[10]

upper<-qchisq(0.025,2)
lower<-qchisq(0.975,2)

c(2*soi.per$spec[40]/lower, 2*soi.per$spec[40]/upper)
c(2*soi.per$spec[10]/lower, 2*soi.per$spec[10]/upper)

rec.per$spec[40]
rec.per$spec[10]

c(2*rec.per$spec[40]/lower, 2*rec.per$spec[40]/upper)
c(2*rec.per$spec[10]/lower, 2*rec.per$spec[10]/upper)

pdf("smoothed.pdf")
k<-kernel("daniell",4)
par(mfrow=c(2,1))
soi.smooth<-spec.pgram(soi,k,taper=0,log="no")
abline(v=1/12, lty=2)
abline(v=2/12, lty=2)
abline(v=3/12, lty=2)
abline(v=1/48, lty=2)

soi.smooth2<-spec.pgram(rec,k,taper=0,log="no")
abline(v=1/12, lty=2)
abline(v=2/12, lty=2)
abline(v=3/12, lty=2)
abline(v=1/48, lty=2)
dev.off()

df<-soi.smooth$df

U<-qchisq(0.025,df)
L<-qchisq(0.975,df)

soi.smooth$spec[10]
soi.smooth$spec[40]

c(df*soi.smooth$spec[10]/L, df*soi.smooth$spec[10]/U)
c(df*soi.smooth$spec[40]/L, df*soi.smooth$spec[40]/U)

df2<-soi.smooth2$df

U2<-qchisq(0.025,df2)
L2<-qchisq(0.975,df2)

soi.smooth2$spec[10]
soi.smooth2$spec[40]

c(df2*soi.smooth2$spec[10]/L2, df2*soi.smooth2$spec[10]/U2)
c(df2*soi.smooth2$spec[40]/L2, df2*soi.smooth2$spec[40]/U2)

