data<-read.table("company.txt", header=FALSE,sep="")
colnames(data)<-c("company","industry")
attach(data)

result<-lm(company~industry)

summary(result)

res<-result$residuals

pdf("time.pdf")
par(mfrow=c(1,2))

plot(ts(res), ylab="Residuals", main="Plot of residuals against time")
pacf(res, main="PACF of Residuals")
dev.off()

ar.1<-arima(res,order = c(1,0,0), include.mean = FALSE)
phi.1<-ar.1$coef
phi.1

y<-cbind(as.ts(company),lag(company,-1))

ystar<-y[,1] - phi.1*y[,2]

x<-cbind(as.ts(industry),lag(industry,-1))

xstar<-x[,1] - phi.1*x[,2]

result.star<-lm(ystar~xstar)
summary(result.star)

pdf("ind.pdf")
par(mfrow=c(1,2))
acf(result.star$residuals)
pacf(result.star$residuals)
dev.off()


