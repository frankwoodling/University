y<-ts(scan("varve.dat"))
y.t<-log(y, base=10)

year<-seq(1,455,1)
year.t<-year-mean(year)
year.t2<-year.t^2

result<-lm(y.t~year.t+year.t2)
summary(result)

par(mfrow=c(2,1))
acf(residuals(result))
pacf(residuals(result))

ar1<-arima(residuals(result),c(1,0,0))
ar1

ar1<-arima(residuals(result),c(1,0,0), include.mean=F)
ar1

y.mat<-cbind(as.ts(y.t), lag(y.t,-1))
year.mat<-cbind(as.ts(year.t), lag(year.t,-1))
year.mat2<-cbind(as.ts(year.t2), lag(year.t2,-1))


y.new<-y.mat[,1] - ar1$coef*y.mat[,2]
year.new<-year.mat[,1] - ar1$coef*year.mat[,2]
year.new2<-year.mat2[,1] - ar1$coef*year.mat2[,2]

result2<-lm(y.new~year.new+year.new2)
summary(result2)

par(mfrow=c(2,1))
acf(residuals(result2))
pacf(residuals(result2))

plot(residuals(result2))