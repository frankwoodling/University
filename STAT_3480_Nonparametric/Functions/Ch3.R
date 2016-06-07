#### ST505 Chapter 3
#### Some functions are modified based on Dr.  Christensen's R code
#### Wednesday, March 16, 2011 at 19:07

#### all the functions designed for Chapter 3 are save in functions-Ch3.R and can be called by using the following code:
#### Then you do not need copy and paste the functions to R window.
#### just use the source function every time before you carry out the analysis using those functions for Chapter 3

source("http://www4.stat.ncsu.edu/~lu/ST505/Rcode/functions-Ch3.R")

            ####################################################
            ##  Section 4.2-4.3 F-test and Permutation F-test ##
            ####################################################
####
####### Example 4.3.1: random samples from normal populations with unequal variance, 3 groups
####

## generate the simulation data
set.seed(1238991)
n=5
trt1 = rnorm(n, 15, 9)
trt2 = rnorm(n, 25, 9)
trt3 = rnorm(n, 30, 9)
x = c(trt1, trt2, trt3)
grps = rep(1:3, each=n)
(trtmeans <- getmeans(x,grps))

#ANOVA based on the assumption of normal distribution with equal variance
summary(aov(x ~ factor(grps)))

# Observed F-value
#Fobs <- summary(aov(x~factor(grps)))[[1]][1,4]
Fobs = getF(x,grps)
perm.F = perm.approx.F(x, grps, R=1000)
(perm.pval = mean(perm.F >= Fobs))


rank.x = rank(x)
N = length(x)
# Kruskal-Wallis test with chi-square approximation
kruskal.test(x,grps)

#Kruskal-Wallis test statistic value can also be calculated by the output of ANOVA test on the ranks
summary(aov(rank.x ~ factor(grps)))

SST = summary(aov(rank.x ~ factor(grps)))[[1]][1,2]
SST*12/(N*(N+1))

                ##########################################
                ##  Section 4.4.    Kruskal-Wallis Test ##
                ##########################################

####
####### Example 4.4.1: random samples from normal populations with unequal variance, 3 groups
####

## generate the simulation data
set.seed(1238991)
n=5
trt1 = rnorm(n, 15, 9)
trt2 = rnorm(n, 25, 9)
trt3 = rnorm(n, 30, 9)
x = c(trt1, trt2, trt3)
grps = rep(1:3, each=n)

rank.x = rank(x)
N = length(x)

# Kruskal-Wallis test with chi-square approximation
kruskal.test(x,grps)
summary(aov(rank.x ~ factor(grps)))

SST = summary(aov(rank.x ~ factor(grps)))[[1]][1,2]
SST*12/(N*(N+1))

# K-W test with permutation-based approx p-value
Fobs <- getF(rank.x, grps)
permFs <- perm.approx.F(rank.x, grps, R=1000)
mean(permFs >= Fobs)

dat = cbind(trt1, trt2, trt3, matrix(rank.x, byrow=F, ncol=3))
library(xtable)
dat = rbind(dat, apply(dat, 2, mean))
xtable(dat, digits=c(0,rep(1,3),rep(0,3)))

####
####### Example: Motivational Effect of Knowledge of Performance
####
ctrl = c(40, 35, 38, 43, 44, 41)
groupB = c(38, 40, 47, 44, 40, 42)
groupC = c(48, 40, 45, 43, 46, 44)
x = c(ctrl, groupB, groupC)
grps = rep(1:3, each=6)
rank.x = rank(x)
getmeans(x,grps)
getmeans(rank.x,grps)

# Kruskal-Wallis test with chi-square approximation
kruskal.test(x,grps)

# K-W test with permutation-based approx p-value
summary(aov(rank.x ~ factor(grps)))
(SST = summary(aov(rank.x ~ factor(grps)))[[1]][1,2])
(SR2 = var(rank.x))
(SST/SR2)

#Fobs <- summary(aov(rank(x)~factor(grps)))[1,4]
Fobs <- getF(rank.x, grps)
set.seed(122356)
permFs <- perm.approx.F(rank.x, grps, R=1000)
mean(permFs >= Fobs)


            #################################################
            #  Ch4.5 Multiple Comparison Permutation Tests  #
            #################################################
##
#######  A simulation study
##
x1=c(-0.01, 0.15, 0.25, -0.90, 0.86)       #generated from N(1,1)
x2 = c(11.14,  9.56, 10.33,  8.45,  9.59)  #generated from N(10,1)
x3 = c(0.77, 0.03, 1.96, 3.24, 2.40)       #generated from N(1,1)

x = c(x1, x2, x3)
grps =rep(1:3, each=5)
k = 3

#ANOVA:
summary(aov(x~factor(grps)))

#Pairiwse t-test:
t.test(x1, x2, var.equal=TRUE)
t.test(x1, x3, var.equal=TRUE)
t.test(x2, x3, var.equal=TRUE)

### Tukey's HDS is also implemented in R by function "TukeyHSD"
fm1=aov(x ~ factor(grps))
TukeyHSD(fm1, "factor(grps)", ordered = FALSE)


##
####### Example 4.5.1 Clay Percentage (example 3.3.1 in Higgins)
##
loc1 = c(26.5, 15, 18.2, 19.5, 23.1, 17.3)
loc2 = c(16.5, 15.8, 14.1, 30.2, 25.1, 17.4)
loc3 = c(19.2, 21.4, 26, 21.6, 35, 28.9)
loc4 = c(26.7, 37.3, 28, 30.1, 33.5, 26.3)

## construct the combined data vector and the group variable indicating the group index of each observation
x = c(loc1, loc2, loc3, loc4)
grps = rep(1:4, each=6)

##analyze the data
### mean of each trt group
trtmeans <- getmeans(x, grps)
### pairwise differences of means
meandiffs <- abs(outer(trtmeans, trtmeans,"-"))
meandiffs

nn <- table(factor(grps))  #size of each treatment group
k <- length(trtmeans)  #number of treatments

##
##### Method 1: Bonferroni correction
##
set.seed(1234567)  #you can change the seed
Bonf.adj(x, grps, k, alpha=0.05, R=1000, test="perm.meandiff")

Bonf.adj(x, grps, k, alpha=0.05, R=1000, test="ttest")

# Thus Locations 1 and 4 are significantly different

##
##### Method 2: Fisher's Protected LSD
##
Fisher.LSD(x, grps, k, alpha=0.05, R=1000)
### conclusion: location 4 differs from locations 1 and 2.

##
##### Method 3: Tukey's HSD (critical values are obtained by permutation)
##
Tukey.HSD(x, grps, k, alpha=0.05, R=1000)
### conclusion: location 4 differs from locations 1 and 2.

### Tukey's HDS is also implemented in R by function "TukeyHSD"
fm1=aov(x ~ factor(grps))

TukeyHSD(fm1, "factor(grps)", ordered = FALSE)
#ordered=TRUE: then the levels of the factor will be ordered according to increasing average in the sample before taking differences.
plot(TukeyHSD(fm1, "factor(grps)"))




#
##### Repeat the mult. comp. tests with ranks
#
trtmeans <- getmeans(rank(x), grps)
meandiffs <- abs(outer(trtmeans,trtmeans,"-"))
meandiffs
### this is the incorrect way to calculate mean rank differences for pairs
### as the ranks range from 1 to N=24 in this way
### The correct way: for comparing i and j, ranks are obtained based on only data from trts i and j, and ranks range from 1 to ni+nj.

meandiffs <- matrix(NA,k,k)
for (i in 2:k) {
   for (j in 1:(i-1)) {
   idx1 = which(grps==i)
   idx2 = which(grps==j)
   idx = c(idx1, idx2)
   temp <- rank(x[c(idx1, idx2)])
   rank.i = temp[1:length(idx1)]
   rank.j = temp[-(1:length(idx1))]
   meandiffs[i,j] <- abs(mean(rank.i) - mean(rank.j))
}}
meandiffs

### The above idea was implemented in functions Bonf.adj.rank, Fisher.LSD.rank and Tukey.HSD.rank
### for three methods with ranks, so you can use the above three functions directly.

##
##### Bonferroni with ranks
##
set.seed(123456)
Bonf.adj.rank(x, grps, k, alpha, R=1000)

set.seed(123456)
##
#### LSD with ranks
##
Fisher.LSD.rank(x, grps, k, alpha=0.05, R=1000)

##
###### Tukey's HSD with ranks
##
set.seed(123456)
Tukey.HSD.rank(x, grps, k, alpha=0.05, R=1000)
### conclusion: location 4 differs from locations 1 and 2.

#### boxplots of ranks by group
boxplot(split(rank(x),as.factor(grps)))



            ################################
            #  Ch4.6 Ordered Alternatives  #
            ################################
### Another R Function: jonckheere.test in the library: clinfun
#library(clinfun)
#jonckheere.test(x, grps, alternative="increasing") #based on MW test statistic

#### Example: BAI for Oak stands in southeastern Ohio
##
idx1 = c(1.91, 1.53, 2.08, 1.71)
idx2 = 2.44
idx3 = c(2.45, 2.04, 1.6, 2.37)
idx4 = c(2.52, 2.36, 2.73)
idx5 = c(2.78, 2.88, 2.10, 1.66)
x = c(idx1, idx2, idx3, idx4, idx5)
grps = c(rep(1,4), 2, rep(3,4), rep(4,3), rep(5,4))

trtmeans = getmeans(x, grps)
nn <- table(factor(grps))  #size of each treatment group
k <- length(trtmeans)  #number of treatments

### based on rank-sum statistic
set.seed(1235662)
JT.ranksum(x, grps, k, R=1000)

###based on Mann-Whitney statistic
set.seed(1235662)
JT.MW(x, grps, k, R=1000)


# Compare to p-value of KW test (or permutation F test)
kruskal.test(x, grps)
# by incorporating the direction of treatment effects, we are able to
# detect a significant difference among the treatments

Fobs <- getF(x,grps)
permFs <- perm.approx.F(x,grps,1000)
mean(permFs >= Fobs)


##
####### Example 3.4.1 from Higgins (mowing heights: agromonist postulated that the phosphorus levels tend to be lower in plants that have been mowed at greater heights)
### trt1: unmowed
### trt2: 20cm
### trt3: 10cm
### trt4: 5cm (order the trt such that mu1<mu2<..<muK as postulated)
##

x <- c(13,24.1,11.7,16.3,15.5,24.5,
       42,18,14,36,11.6,19,
       15.6,23.8,24.4,24,21,21.1,
       35.3,22.5,16.9,25,23.1,26)
grps <- c(rep(1,6),rep(2,6),rep(3,6),rep(4,6))
nn <- table(factor(grps))
trtmeans = getmeans(x, grps)
k <- length(trtmeans)
trtmeans

### based on rank-sum statistic
set.seed(1235662)
JT.ranksum(x, grps, k)

###based on Mann-Whitney statistic
set.seed(1235662)
JT.MW(x, grps, k)

# Compare to p-value of KW test (or permutation F test)
kruskal.test(x, grps)
Fobs <- getF(x,grps)

permFs <- perm.approx.F(x,grps,1000)
mean(permFs >= Fobs)
