######################
##simulation example##
######################

source("armasim.R")

set.seed(123)

path<-armasim(c(1.5,-0.75),0,1,1000)

gamma<-acf(path, type="covariance", plot=FALSE)

rho<-acf(path, type="correlation", plot=FALSE)

gamma[0]

rho[1:2]

Rhat<-matrix(c(1,rho$acf[2],rho$acf[2],1),c(2,2))

rhohat<-matrix(c(rho$acf[2],rho$acf[3]),c(2,1))

phihat<-solve(Rhat)%*%rhohat
phihat

sigsqhat<-gamma$acf[1]*(1-t(rhohat)%*%phihat)
sigsqhat

(1/1000)*as.numeric((sigsqhat/gamma$acf[1]))*solve(Rhat)

###########
##recruit##
###########

rec<-scan("recruit.dat")

pdf("recruit.pdf")
par(mfrow=c(1,2))
acf(rec, 20, xlim=c(1,20), ylim=c(-0.5,0.9), main="ACF of recruit.dat")
pacf(rec, 20, ylim=c(-0.5,0.9), main="PACF of recruit.dat")
dev.off()

rec.yw<-ar.yw(rec, order=2)
rec.yw$x.mean
rec.yw$ar

sqrt(diag(rec.yw$asy.var.coef))
rec.yw$var.pred
