auemp<-ts(scan("unemploy.dat", skip=1))
dauemp<-ts(diff(auemp))

pdf("auemp.pdf")
plot(auemp, ylab="Unemployment in thousands", main="Australian Unemployment Feb 1978-Aug 1995")
dev.off()

pdf("dauemp.pdf")
plot(dauemp, ylab="Differenced Unemployment in thousands", main="Australian Unemployment Feb 1978-Aug 1995 (Differenced)")
dev.off()

pdf("acfdauemp.pdf")
acf(dauemp,50, main="ACF for Differenced Data")
dev.off()

pdf("lagplotdauemp.pdf")
lag.plot(dauemp, lags=12, diag=F, main="Lag Plot for Unemployment Data")
dev.off()

pdf("perioddauemp.pdf")
temp<-spec.pgram(dauemp, taper=0, log="no")
dev.off()


freq<-temp$freq[temp$spec>5e9]
periods<-1/temp$freq[temp$spec>5e9]



#par(mfrow=c(6,1))

t=1:length(dauemp)
c1<-cos(2*pi*t*freq[1])
s1<-sin(2*pi*t*freq[1])
c2<-cos(2*pi*t*freq[2])
s2<-sin(2*pi*t*freq[2])
c3<-cos(2*pi*t*freq[3])
s3<-sin(2*pi*t*freq[3])
c4<-cos(2*pi*t*freq[4])
s4<-sin(2*pi*t*freq[4])
c5<-cos(2*pi*t*freq[5])
s5<-sin(2*pi*t*freq[5])
fit<-lm(dauemp~c1+s1+c2+s2+c3+s3+c4+s4+c5+s5)
#for (i in 1:length(periods)){
#plot(ts(cos(2*pi*freq[i]*(1:length(dauemp)))))
#plot(ts(fit$coef[2]*c1
#}
dauemp<-dauemp-mean(dauemp)
miny=min(dauemp)-100
maxy=max(dauemp)+100



pdf("promdauemp.pdf")
par(mfrow=c(1,1))
plot(dauemp )
plot(ts(fit$coef[2]*c1+fit$coef[3]*s1) )
plot(ts(fit$coef[4]*c2+fit$coef[5]*s2) )
plot(ts(fit$coef[6]*c3+fit$coef[7]*s3) )
plot(ts(fit$coef[8]*c4+fit$coef[9]*s4) )
plot(ts(fit$coef[10]*c5+fit$coef[11]*s5) )
dev.off()

fitted<-ts(fit$coef[2]*c1+fit$coef[3]*s1+fit$coef[4]*c2+fit$coef[5]*s2+fit$coef[6]*c3+fit$coef[7]*s3+fit$coef[8]*c4+fit$coef[9]*s4+fit$coef[10]*c5+fit$coef[11]*s5)


pdf("fitteddauemp.pdf")
par(mfrow=c(3,1))
plot(fitted, ylim=c(miny,maxy), main="Fitted Values")
plot(ts(fitted-dauemp), ylim=c(miny,maxy), main="Residuals")
acf(ts(fitted-dauemp), main="ACF for Residuals")
dev.off()

par(mfrow=c(1,1))

pdf("perioddiff.pdf")
spec.pgram(fitted-dauemp, taper=0, log="no")
dev.off()

