#### ST505 Chapter 2
#### Last updated on: Wednesday, March 16, 2011 at 19:09

#### all the functions designed for Chapter 2 are save in functions-Ch2.R and can be called by using the following code:
#### Then you do not need copy and paste the functions to R window.
#### just use the source function every time before you carry out the analysis using those functions for Chapter 2

source("http://www4.stat.ncsu.edu/~lu/ST505/Rcode/functions-Ch2.R")


        ######################################################
        #          generate the plot of Chapter 2            #
        #          (location shift distributions)            #
        ######################################################

######
#pdf("/Users/hwang3/Documents/Teaching/ST505/s2011/slides/ch3-loc-shift.pdf")
x = y = seq(-9,14,length=100)
fx = dnorm(x, 0, 1)
fy = dnorm(y, 5, 1)

Fx = pnorm(x, 0, 1)
Fy = pnorm(y, 5, 1)

par(mfrow=c(1,2))
plot(fx~x, type="l", xlim=c(min(x), max(y)), ylab="PDF")
lines(fy~y, type="l", col=2, lty=5)
legend(-11, 0.4, c("f(x)", "g(y)"), col=c("black", "red"),
lty=c(1,5), bty="n")

plot(Fx~x, type="l", xlim=c(min(x), max(y)), ylab="CDF")
lines(Fy~y, type="l", col=2, lty=5)
legend(-11, 1, c("F(x)", "G(y)"), col=c("black", "red"),
lty=c(1,5), bty="n")

#dev.off()




        ######################################################
        #         exact two-sample permutation test          #
        ######################################################
## test scores of traditional versus new method
x = c(37, 55, 57)  #new
y =  c(23, 31, 70) #traditional

##
######generate the permutation table
##
m = length(x)
n = length(y)
N = m+n
xy = c(x, y)
idx = combinations(n=N, r=m)
R = nrow(idx)
permut = NULL
for(i in 1:R){
        permut = rbind(permut, c(xy[idx[i,]], xy[-idx[i,]]))
    }
delta1 = apply(permut,1, function(x) mean(x[1:3])-mean(x[4:6]))
delta2 = apply(permut,1, function(x) median(x[1:3])-median(x[4:6]))
permut = cbind(permut, delta1, delta2)
permut

##
##### obtain the permutation distribution of mean/median difference manually
##
idx = combinations(n=6, r=3)
x=c(37,55,57)
y=c(23,31,70)
xy = c(x,y) # the combined data set
permut = NULL # the permuted data set (a 20*6 matrix)
for(i in 1:20){
    permut = rbind(permut, c(xy[idx[i,]], xy[-idx[i,]]))
    }
permut.x = permut[, 1:3] # the permuted X matrix (20*3)
permut.y = permut[, 4:6] # the permuted Y matrix (20*3)

delta1 = apply(permut.x, 1, mean) - apply(permut.y, 1, mean)
delta2 = apply(permut.x, 1, median) - apply(permut.y, 1, median)

delta1.obs = mean(x)-mean(y)
delta2.obs = median(x) - median(y)

#pvalue for permutation of sample mean
pval1.upper = mean(delta1 >= delta1.obs)  #upper-tailed
pval1.2sided = mean(abs(delta1) >= abs(delta1.obs))  #two-tailed

#pvalue for permutation of sample median
pval2.upper = mean(delta2 >= delta2.obs)  #upper-tailed
pval2.2sided = mean(abs(delta2) >= abs(delta2.obs))  #two-tailed

pdf("/Users/hwang3/Dropbox/ST505/S2012/slides/Ex2-2-1.pdf")
par(mfrow=c(1,2))
hist(delta1)
abline(v= delta1.obs, col=2)
hist(delta.star.median)
abline(v= delta2.obs, col=2)
dev.off()


###
##### use the general function of permutation distribution
##### permutation of the 6 scores of two groups
###

x=c(37,55,57)
y=c(23,31,70)
perm.2sample(x, y, alternative = "greater", stat= "meandiff")
perm.2sample(x, y, alternative = "greater", stat= "sumX")
perm.2sample(x, y, alternative = "greater", stat= "trmdiff", trim=0.05)
perm.2sample(x, y, alternative = "greater", stat= "mediandiff")

            ####################################################
            ##    Random Sampling two-sample Permutation      ##
            ####################################################

##
##### Analysis of the "Toleration-of-Violence" data set
##

dat = read.csv("http://www4.stat.ncsu.edu/~wang/courses/ST505/data/toleration-violence.csv")
x = dat[,1]
y = dat[,2]
# take a look at the histograms
#pdf("/Users/hwang3/Documents/Teaching/ST505/s2011/slides/ch3-hist-tol-violence.pdf")
par(mfrow=c(1,3))
hist(x)
hist(y)
boxplot(x, y, names=c("x","y"))
#dev.off()

rand.perm(x, y, R=1000, alternative = "less", stat= "mediandiff")
rand.perm(x, y, R=1000, alternative = "less", stat= "meandiff")
rand.perm(x, y, R=1000, alternative = "less", stat= "sumX")
# compare to the two-sample t-test
t.test(x, y, "less")


        #################################################################
        # analysis of the "scores" example using Wilcoxon Rank Sum Test #
        #################################################################
# use the existing function:
x=c(37,55,57)
y=c(23,31,70)
wilcox.test(x, y, alternative ="greater")

# the distribution of the rank sum statistic
xy = c(x, y)
rank.xy = rank(xy)
W = sum(rank.xy[1:3])
idx = combinations(n=N, r=m)
R = nrow(idx)
permut = NULL
for(i in 1:R){
        permut = rbind(permut, c(rank.xy[idx[i,]], rank.xy[-idx[i,]]))
    }
permut.W = apply(permut,1, function(x) sum(x[1:3]))
permut = cbind(permut, permut.W)

library(xtable)
xtable(permut, digits=rep(0,8))


        ############################################################################
        # analysis of the "strawberry plants" example using Wilcoxon Rank Sum Test #
        ############################################################################


##treated
x = c(0.65, 0.59, 0.44, 0.60, 0.47, 0.58, 0.66, 0.52, 0.51)
## untreated
y = c(0.55,0.67,0.63,0.79,0.81,0.85,0.68)
##combined data set

dat = read.csv("http://www4.stat.ncsu.edu/~wang/courses/ST505/data/Ex207.csv")
x = dat[which(dat[,1]==1),2]; y = dat[which(dat[,1]==2),2]


xy = c(x, y)
m = length(x)  #no of observations in x
n = length(y) #no of observations in y
rank.xy = rank(xy)

##wilcoxon's rank sum test statistic and the permutation p-value
##Ha: x is shifted to the left
Wx = sum(rank.xy[1:m])

##obtain the permutation null distribution of Wx (rank sum of the group with m observations)
perm.Wx = perm.dist.sum(rank.xy, m)  ### too many partitionings, choose random permutation
perm.Wx = rand.perm.dist.sum(rank.xy, m, R=1000)

##permutation p-value
pval = mean(perm.Wx <= Wx)
pval

### use the R function wilcox.test(x,y)
wilcox.test(x,y,alternative="less")


            ##################################
            #  CI and H-L estimate for delta
            #################################
#Educationally Handicapped (EH) 77  78  70  72  65  74  ($m$ = 6)\\
#Educable Mentally Ret. (EMR)   60  62  70  76  68  72  70  ($n$ = 7)\\
#Give Hodges-Lehmann estimate and 95\% CI for $\delta$, where $X$ and $Y+\delta$ have the same distribution.

x = c(77, 78, 70, 72, 65, 74)
y = c(60, 62, 70, 76, 68, 72, 70)
pwd = outer(x,y,"-")
pwd = sort(pwd)
median(pwd)


            ##################################
            #  Tests for Equality of Scales  #
            ##################################
###
###### two distributions with different scales
###
x = seq(-12, 12, length=100)
f = dnorm(x, 0, 1)
g = dnorm(x, 0, 4)
#pdf("/Users/hwang3/Documents/Teaching/ST505/s2011/slides/ch3-scale.pdf")
plot(g~x, ylab="", type="l", lwd=2, ylim=c(0,max(f)))
lines(f~x, col=2, lwd=2, lty=5)
#dev.off()


###
###### Example 1: example2.8.1 on Higgins, page 53 (Volume of Beverages in Containers)
###
x = c(16.55, 15.36, 15.94, 16.43, 16.01)
y = c(16.05, 15.98, 16.1, 15.88, 15.91)
sd(x)
sd(y)
xy = c(x,y)
sort(xy)
srank.xy = siegelrank(xy,ansari=F)
#sum of ranks of X group
m = length(x)
n = length(y)
W = sum(srank.xy[1:m])

# the critical value
# qwilcox gives the quantiles of M-W's U distribution

# the lower critical value for W (works if m and n<50)
qwilcox(p=0.025, m, n) + m*(m+1)/2-1
# the lower critical value for Wx
qwilcox(p=0.975, m, n) + m*(m+1)/2+1
## p-values based on the exact permutation distribution of $W$

perm.W = perm.dist.sum(srank.xy, n1=5)
pval.1sided = mean(perm.W<=W)
pval.2sided = 2*mean(perm.W<=W)

pval.1sided
pval.2sided

siegel.tukey(x,y)
###
###### Example 2: Multivariate Analysis Exam Scores
###
x <- c(0.91,0.78,0.76,0.79,0.71,0.59,0.67,0.78,0.67,0.42)  ## M.S. students
y <- c(0.78,0.79,0.86,0.64,0.61,0.875,0.96,0.775,0.975)  ## Ph.D. students
sd(x)
sd(y)
# alternative: unequal (2-sided)

xy = c(x,y)
sort(xy)
srank.xy = siegelrank(xy,ansari=F)
#sum of ranks of X group
m = length(x)
n = length(y)
W = sum(srank.xy[1:m])  #112

#From Table A.4, upper-critical value=125, lower=75.
qwilcox(p=0.975, m, n) + m*(m+1)/2+1
qwilcox(p=0.025, m, n) + m*(m+1)/2-1
# So do not reject $H_0$

## p-values based on the exact permutation distribution of $W$
perm.W = perm.dist.sum(srank.xy, n1=10)
perm.W = rand.perm.dist.sum(srank.xy, n1=10, R=1000)
(pval.1sided = mean(perm.W>=W))
(pval.2sided = 2*pval.1sided)

siegel.tukey(x,y)


##### An Example with tied observations
x=c(0,4,5,5,6,5)
y=c(0,4,1,9,10,11)
xy = sort(c(x,y))
rk = siegelrank(xy)
rbind(rk, xy)

siegel.tukey(x,y)


 x=c(21.9, 20.2, 19.4, 20.3, 19.6, 20.4, 18.4, 20.1, 22.0, 18.9)
 y=c(20.2, 13.8, 21.8, 19.2, 19.6, 25.5, 17.0, 17.6, 19.5, 22.2)
 siegel.tukey(x,y)

            ########################
            #  Tests on Deviances  #
            ########################


###
####### Example 1: Multivariate Analysis Exam Scores ###
###
x = c(0.91,0.78,0.76,0.79,0.71,0.59,0.67,0.78,0.67,0.42)  ## M.S. students
y = c(0.78,0.79,0.86,0.64,0.61,0.875,0.96,0.775,0.975)  ## Ph.D. students
## alternative: two-sided
devx = x - median(x)
devy = y - median(y)
m = length(x)
n = length(y)
rmd2 <- max(mean(abs(devx)) , mean(abs(devy)) )/
       min(mean(abs(devx)) , mean(abs(devy))  )

####two-sided alternative
permrmds <- perm.dist.rmd(c(devx,devy),10)
mean(permrmds >= rmd2)

permrmds.approx <- perm.approx.rmd(c(devx,devy),10, R=1000)
mean(permrmds.approx >= rmd2)


###
##### Example2: a simulated data
set.seed(12345)
x = rchisq(8, df=2)
y = rnorm(7, 0, 0.3)
sd(x)
sd(y)
par(mfrow=c(2,2))
hist(x)
hist(y)

## alternative: two-sided
devx = x - median(x)
devy = y - median(y)
m = length(x)
n = length(y)

###two-sided alternative
rmd2 <- max( mean(abs(devx)) , mean(abs(devy)) )/
       min( mean(abs(devx)) , mean(abs(devy))  )
permrmds <- perm.dist.rmd2(c(devx,devy),8)
mean(permrmds >= rmd2)

###one-sided alternative Ha: sigma.x > sigma.y
rmd <- mean(abs(devx))/mean(abs(devy))
permrmds <- perm.dist.rmd(c(devx,devy),8)
mean(permrmds >= rmd)

            ############################
            #  Kolmogrov-Smirnov test  #
            ############################
###
###### Example 1: example2.8.1 on Higgins, page 53 (Volume of Beverages in Containers)
###
x = c(16.55, 15.36, 15.94, 16.43, 16.01)
y = c(16.05, 15.98, 16.1, 15.88, 15.91)

##plot the ECDF curves
plot(ecdf(x), verticals=TRUE)
lines(ecdf(y), verticals=TRUE, col="red", lty="dashed")

ks.test(x,y)



KS.obs = ks.test(x,y)$stat
m=length(x)
x.y = c(x,y)
KS.perm = perm.dist.ks(x.y, m)
(pval = mean(KS.perm>=KS.obs))
