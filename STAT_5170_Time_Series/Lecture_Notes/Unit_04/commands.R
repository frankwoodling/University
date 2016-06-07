mortality<-scan("yule1.dat", skip=12) #ignore the first 12 rows
mortality<-ts(mortality, start=1866)
marriages<-scan("yule2.dat", skip=12)
marriages<-ts(marriages, start=1866)
time<-1866:1911

##make marriages plot
pdf("marriagesplot.pdf")
plot(marriages, ylab="% of marriages in Church", main="Plot of Marriages by Year")
dev.off()


#do regression for marriages
timefit<-lm(marriages~time)
summary(timefit)
AIC(timefit)

#make plots
pdf("acftimefit.pdf")
acf(residuals(timefit))
dev.off()

pdf("qqnormtimefit.pdf")
qqnorm(residuals(timefit))
qqline(residuals(timefit), col="red")
dev.off()

res<-timefit$residuals
yhat<-timefit$fitted.values

pdf("residtimefit.pdf")
plot(yhat,res,main="Residuals against fitted values")
abline(h=0, col="red")
loess.fit<-loess(y~x, data.frame(x=yhat,y=res)) ##compute loess fit
yhat.grid<-seq(from=min(yhat),to=max(yhat),length=200) ##generate a sequence for fitted values, ranging from min to max, 200 points
tmp<-predict(loess.fit,newdata=data.frame(x=yhat.grid),
se=T) ##compute the predicted values from loess fit based on values of yhat above. se=T means to compute standard errors for loess fit.
lines(yhat.grid,tmp$fit,lwd=3, col="blue")
lines(yhat.grid,tmp$fit-2*tmp$se.fit, lwd=2, lty=2, col="blue")
lines(yhat.grid,tmp$fit+2*tmp$se.fit, lwd=2, lty=2, col="blue")
dev.off()

pdf("reglinetimefit.pdf")
plot(time,marriages)
abline(timefit)
dev.off()


timesq<-time^2
#do regression
timefitsq<-lm(marriages~time+timesq)
anova(timefitsq) 
summary(timefitsq)
AIC(timefitsq)

#make plots
pdf("acftimefitsq.pdf")
acf(residuals(timefitsq))
dev.off()

pdf("qqnormtimefitsq.pdf")
qqnorm(residuals(timefitsq))
qqline(residuals(timefitsq), col="red")
dev.off()

pdf("restimefitsq.pdf")
plot(ts(residuals(timefitsq)), ylab="Residuals for timefitsq", main="Time Series Plot of Residuals from timefitsq")
dev.off()

res<-timefitsq$residuals
yhat<-timefitsq$fitted.values

pdf("residtimefitsq.pdf")
plot(yhat,res,main="Residuals against fitted values")
abline(h=0, col="red")
loess.fit<-loess(y~x, data.frame(x=yhat,y=res)) ##compute loess fit
yhat.grid<-seq(from=min(yhat),to=max(yhat),length=200) ##generate a sequence for fitted values, ranging from min to max, 200 points
tmp<-predict(loess.fit,newdata=data.frame(x=yhat.grid),
se=T) ##compute the predicted values from loess fit based on values of yhat above. se=T means to compute standard errors for loess fit.
lines(yhat.grid,tmp$fit,lwd=3, col="blue")
lines(yhat.grid,tmp$fit-2*tmp$se.fit, lwd=2, lty=2, col="blue")
lines(yhat.grid,tmp$fit+2*tmp$se.fit, lwd=2, lty=2, col="blue")
dev.off()


comparefit<-lm(marriages~mortality)
anova(comparefit)
summary(comparefit)
AIC(comparefit)

#make plots

pdf("acfcomparefit.pdf")
acf(residuals(comparefit))
dev.off()

pdf("qqnormcomparefit.pdf")
qqnorm(residuals(comparefit))
qqline(residuals(comparefit), col="red")
dev.off()

res<-comparefit$residuals
yhat<-comparefit$fitted.values

pdf("residcomparefit.pdf")
plot(yhat,res,main="Residuals against fitted values")
abline(h=0, col="red")
loess.fit<-loess(y~x, data.frame(x=yhat,y=res)) ##compute loess fit
yhat.grid<-seq(from=min(yhat),to=max(yhat),length=200) ##generate a sequence for fitted values, ranging from min to max, 200 points
tmp<-predict(loess.fit,newdata=data.frame(x=yhat.grid),
se=T) ##compute the predicted values from loess fit based on values of yhat above. se=T means to compute standard errors for loess fit.
lines(yhat.grid,tmp$fit,lwd=3, col="blue")
lines(yhat.grid,tmp$fit-2*tmp$se.fit, lwd=2, lty=2, col="blue")
lines(yhat.grid,tmp$fit+2*tmp$se.fit, lwd=2, lty=2, col="blue")
dev.off()



comparetimefit<-lm(marriages~mortality+time)
anova(comparetimefit)
summary(comparetimefit)
AIC(comparetimefit)

#make plots
pdf("acfcomparetimefit.pdf")
acf(residuals(comparetimefit))
dev.off()

pdf("qqnormcomparetimefit.pdf")
qqnorm(residuals(comparetimefit))
qqline(residuals(comparetimefit), col="red")
dev.off()

res<-comparetimefit$residuals
yhat<-comparetimefit$fitted.values

pdf("residcomparetimefit.pdf")
plot(yhat,res,main="Residuals against fitted values")
abline(h=0, col="red")
loess.fit<-loess(y~x, data.frame(x=yhat,y=res)) ##compute loess fit
yhat.grid<-seq(from=min(yhat),to=max(yhat),length=200) ##generate a sequence for fitted values, ranging from min to max, 200 points
tmp<-predict(loess.fit,newdata=data.frame(x=yhat.grid),
se=T) ##compute the predicted values from loess fit based on values of yhat above. se=T means to compute standard errors for loess fit.
lines(yhat.grid,tmp$fit,lwd=3, col="blue")
lines(yhat.grid,tmp$fit-2*tmp$se.fit, lwd=2, lty=2, col="blue")
lines(yhat.grid,tmp$fit+2*tmp$se.fit, lwd=2, lty=2, col="blue")
dev.off()



