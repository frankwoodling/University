##Chapter 10: nonparametric regression (curve smoothing)

### Section 1
### Histogram
### simulate a data set
set.seed(179011)
x = rnorm(100,0,1)
x = sort(x)
f0 = dnorm(x)

pdf("slides/ch10-hist.pdf")
par(mfrow=c(2,2))
hist(x, prob = TRUE, breaks=seq(-3,3,2), main="h=2", ylim=c(0,0.6))
lines(f0~x,col=2)
hist(x, prob = TRUE, breaks=seq(-3,3,1), main="h=1", ylim=c(0,0.6))
lines(f0~x,col=2)
hist(x, prob = TRUE, breaks=seq(-3,3,0.5), main="h=0.5", ylim=c(0,0.6))
lines(f0~x,col=2)
hist(x, prob = TRUE, breaks=seq(-3,3,0.1), main="h=0.1", ylim=c(0,0.6))
lines(f0~x,col=2)
dev.off()

#### Old Faithful Geyser: data set faithful
# two variables (272 observations):
# 1. eruptions: numeric, eruption time in mins
# 2. waiting: numeric, waiting time to next eruption in mins
duration = faithful$eruptions
n=length(duration)
pdf("slides/ch10-faithful.pdf")
	par(mfrow=c(2,2))
	#histogram
	out=hist(duration, breaks=seq(1.5,5.5,0.2), prob=TRUE, main="Histogram, h=0.2")
	z = (out$breaks[-1] + out$breaks[-19])/2
	lines(out$density~z, col="blue")
	
	#kernel density estimation
	d1 = density(duration, kernel="gaussian", bw=0.2)
	plot(d1, main="Gaussian kernel, h=0.2")
	d2=density(duration, kernel="gaussian", bw=0.05)
	plot(d2, main="Gaussian kernel, h=0.05")
	d3=density(duration, kernel="triangular", bw=0.2)
	plot(d3,main="Triangular kernel, h=0.2")
dev.off()

###
######## Section 2: nonparametric curve smoothing
###

## Example: motor cycle
### polynomial regression

library(MASS)
data(mcycle)
x = mcycle[,1]
y = mcycle[,2]

par(mfrow=c(2,2))
plot(y~x, main="scatter plot")
plot(y~x, main="linear fit")
abline(lm(y~x), col=2)
plot(y~x, main="quadratic fit")
x2 = x^2
fit2 = lm(y~x+x2)$fitted
lines(fit2~x, col=2)
x3=x^3
plot(y~x, main="cubic fit")
fit3 = lm(y~x+x2+x3)$fitted
lines(fit3~x, col=2)

### loess (default faimly="gaussian": least squares method)
par(mfrow=c(2,2))
lo <- loess(y ~ x, span = 0.75)  #span controls the degree of smoothing
plot(y~x, main="span=0.75")
newx = seq(min(x), max(x), length=50)
pred =predict(lo, data.frame(x = newx))
lines(pred ~newx, col=2)

lo <- loess(y ~ x, span = 0.5)  #span controls the degree of smoothing
plot(y~x, main="span=0.5")
newx = seq(min(x), max(x), length=50)
pred =predict(lo, data.frame(x = newx))
lines(pred ~newx, col=2)

lo <- loess(y ~ x, span = 0.2)  #span controls the degree of smoothing
plot(y~x, main="span=0.2")
newx = seq(min(x), max(x), length=50)
pred =predict(lo, data.frame(x = newx))
lines(pred ~newx, col=2)

lo <- loess(y ~ x, span = 0.1)  #span controls the degree of smoothing
plot(y~x, main="span=0.1")
newx = seq(min(x), max(x), length=50)
pred =predict(lo, data.frame(x = newx))
lines(pred ~newx, col=2)

### kernel smoothing
par(mfrow=c(2,2))
    plot(y~x, main="ks, h=0.5")
    lines(ksmooth(x, y, "normal", bandwidth=0.5), col=2, lwd=2)
    
    plot(y~x, main="ks, h=2")
    lines(ksmooth(x, y, "normal", bandwidth=2), col=2, lwd=2)
    
    plot(y~x, main="ks, h=5")
    lines(ksmooth(x, y, "normal", bandwidth=5), col=2, lwd=2)

    plot(y~x, main="ks, h=10")
    lines(ksmooth(x, y, "normal", bandwidth=10), col=2, lwd=2)

###
######## Section 3: robust regression and curve smoothing
###

### Least absolute deviation regression (median regression)
library(quantreg)

### median cubic regression
x1 = x
x2 = x^2
x3 = x^3
lad1 = rq(y~x1+x2+x3, tau=0.5)
plot(y~x, main="median cubic regression")
lines(lad1$fitted~x, col="red")

### nonparametric median regression
library(kernlab)

qrm = kqr(x, y, tau=0.5, kernel="rbfdot", C=0.2) #Gaussian kernel
#C: smoothing parameter, smaller X==> more smooth, larger bias, smaller variance
ytest = predict(qrm, x)
plot(y~x, main="kernel median regression, C=0.2")
lines(ytest~x, col="red", lwd=2)

qrm = kqr(x, y, tau=0.5, kernel="rbfdot", C=5) #Gaussian kernel
#C: smoothing parameter, larger X==> less smooth, smaller bias, larger variance
ytest = predict(qrm, x)
plot(y~x, main="kernel median regression, C=5")
lines(ytest~x, col="red", lwd=2)

### Nonparametric M-estimation (Tukey Bisquare)
lo <- loess(y ~ x, span = 0.2, family="symmetric")  #span controls the degree of smoothing
plot(y~x, main="Tukey span=0.2")
newx = seq(min(x), max(x), length=50)
pred =predict(lo, data.frame(x = newx))
lines(pred ~newx, col=2)

#### Local constant median regression
lcrq <- function(x, y, h, m = 50, tau = 0.5) 
{
 xx <- seq(min(x), max(x), length = m)
 fv <- xx  # estimates of f
 for (i in 1:length(xx)) {
 z <- x - xx[i]
 wx <- dnorm(z/h)
 r <- rq(y ~1, weights = wx, tau = tau, ci = FALSE)
 fv[i] <- r$coef[1]
 }
 return(list(fv=fv, xx=xx))
}
par(mfrow=c(1,2))
plot(y~x, main="local constant median reg (h=0.5)")
fit1 = lcrq(x, y, h=0.5, m=50, tau=0.5)
lines(fit1$fv~fit1$xx, col="blue", lwd=2)

plot(y~x, main="local constant median reg (h=2)")
fit1 = lcrq(x, y, h=2, m=50, tau=0.5)
lines(fit1$fv~fit1$xx, col="blue", lwd=2)

#### Local linear median regression
llrq <- function(x, y, h, m = 50, tau = 0.5) 
{
 xx <- seq(min(x), max(x), length = m)
 fv <- xx  # estimates of f
 dv <- xx  # estimate of derivative of f
 for (i in 1:length(xx)) {
 z <- x - xx[i]
 wx <- dnorm(z/h)
 r <- rq(y ~ z, weights = wx, tau = tau, ci = FALSE)
 fv[i] <- r$coef[1]
 dv[i] <- r$coef[2]
 }
 return(list(fv=fv, dv=dv, xx=xx))
}
par(mfrow=c(1,2))
plot(y~x, main="local linear median reg (h=0.5)")
fit1 = llrq(x, y, h=0.5, m=50, tau=0.5)
lines(fit1$fv~fit1$xx, col="blue", lwd=2)

plot(y~x, main="local linear median reg (h=2)")
fit1 = llrq(x, y, h=2, m=50, tau=0.5)
lines(fit1$fv~fit1$xx, col="blue", lwd=2)

