mortality<-scan("yule1.dat", skip=12)
marriages<-scan("yule2.dat", skip=12)
time<-1866:1911

par(mfrow=c(3,1))
plot.ts(marriages)
plot.ts(mortality)
plot(marriages~mortality)

timefit<-lm(marriages~time)
anova(timefit)
summary(timefit)
AIC(timefit)

timeres<-residuals(timefit)
plot(timeres)
abline(h=0, col="red")
acf(timeres)
qqnorm(timeres)
qqline(timeres, col="red")

fits<-timefit$fitted.values
plot(fits,timeres,main="Residuals against fitted values")
abline(h=0, col="red")
loess.fit<-loess(y~x, data.frame(x=fits,y=timeres)) 
yhat.grid<-seq(from=min(fits),to=max(fits),length=200) 
tmp<-predict(loess.fit,newdata=data.frame(x=yhat.grid), se=T) 
lines(yhat.grid,tmp$fit,lwd=3, col="blue")
lines(yhat.grid,tmp$fit-2*tmp$se.fit, lwd=2, lty=2, col="blue")
lines(yhat.grid,tmp$fit+2*tmp$se.fit, lwd=2, lty=2, col="blue")

timesq<-time^2
timefitsq<-lm(marriages~time+timesq)
anova(timefitsq) 
summary(timefitsq)
AIC(timefitsq)

timesqres<-residuals(timefitsq) ##
fits2<-timefitsq$fitted.values ##
plot(fits2,timesqres,main="Residuals against fitted values") ##
abline(h=0, col="red")
loess.fit<-loess(y~x, data.frame(x=fits2,y=timesqres)) ## 
yhat.grid<-seq(from=min(fits2),to=max(fits2),length=200) ## 
tmp<-predict(loess.fit,newdata=data.frame(x=yhat.grid), se=T) 
lines(yhat.grid,tmp$fit,lwd=3, col="blue")
lines(yhat.grid,tmp$fit-2*tmp$se.fit, lwd=2, lty=2, col="blue")
lines(yhat.grid,tmp$fit+2*tmp$se.fit, lwd=2, lty=2, col="blue")

acf(timeres)
qqnorm(timeres)
qqline(timeres, col="red")

comparefit<-lm(marriages~mortality)
anova(comparefit)
summary(comparefit)
AIC(comparefit)



