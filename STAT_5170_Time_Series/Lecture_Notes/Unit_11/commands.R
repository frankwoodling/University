armasim<-function(phis, thetas, sigsq, T){
p<-length(phis) 
q<-length(thetas)
m<-max(p,q)
noise<-rnorm(T+m, sd=sqrt(sigsq))
x<-c(noise[1:m],rep(0,T))
for (i in (m+1):(T+m)){
x[i]<-phis %*% x[i-(1:p)] + thetas %*% noise[i-(1:q)] + noise[i]
}
x<-x[(m+1):(T+m)]
x
}

path.ar<-armasim(c(1.5,-0.75),0,1,1000)

path.ma<-armasim(0,c(1.5,-0.75),1,1000)

path.arma<-armasim(c(1.5,-0.75),c(1.5,-0.75),1,1000)

pdf("ar.pdf")
par(mfrow=c(1,2))
acf(path.ar,main="ACF of AR(2)")
pacf(path.ar,main="PACF of AR(2)")
dev.off()

pdf("ma.pdf")
par(mfrow=c(1,2))
acf(path.ma,main="ACF of MA(2)")
pacf(path.ma,main="PACF of MA(2)")
dev.off()

pdf("arma.pdf")
par(mfrow=c(1,2))
acf(path.arma,main="ACF of ARMA(2,2)")
pacf(path.arma,main="PACF of ARMA(2,2)")
dev.off()

rec<-scan("recruit.dat")

pdf("recruit.pdf")
par(mfrow=c(1,2))
acf(rec,main="ACF of Recruitment Series")
pacf(rec,main="PACF of Recruitment Series")
dev.off()
