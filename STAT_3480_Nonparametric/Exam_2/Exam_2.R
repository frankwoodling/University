---
  title: "Exam 2"
author: "Frank Woodling"
date: "April 10, 2016"
output: word_document
---
########################
### Read in datasets ###
########################
wecometoyou <- read.delim("C:/Users/Frank/Desktop/STAT 3480/Exam II/wcty.txt", header=T) 
internal <- read.table('Internal+Research+-+WCtY+Time+Data.txt', header = T)
state <- read.delim("C:/Users/Frank/Desktop/STAT 3480/Exam II/State+Test+Data.txt", header=T)

  
 
##########################
### Summary Statistics ###
##########################

# 5 number summaries
wcty.comb <- c(wecometoyou[1:8,1], wecometoyou[1:6,2])
summary(wcty.comb)
summary(wecometoyou)

state.comb <- c(state[1:11,1], state[1:12,2], state[1:9,3], state[1:11,4], state[1:12,5], state[1:11,6])
summary(state.comb)
summary(state)

internal.comb <- c(internal[1:10,1], internal[1:10,2], internal[1:10,3], internal[1:10,4], internal[1:10,5])
summary(internal.comb)
summary(internal)


# Q-Q plots
par(mfrow=c(3,1))
qqnorm(wcty.comb, main = "Q-Q Plot of WCTY County Test Data")
qqline(wcty.comb)

qqnorm(state.comb, main = "Q-Q Plot of State Test Data")
qqline(state.comb)

qqnorm(internal.comb, main = "Q-Q Plot of Internal Research Time Data")
qqline(internal.comb)

# Histograms
par(mfrow=c(1,3))

hist(wcty.comb, breaks = 10,
     main = "Histogram of WCTY Data",
     xlab = "Test scores")

hist(state.comb, breaks = 30, 
     main = "Histogram of State Test Data",
     xlab = "Test scores")

hist(internal.comb, breaks = 15,
     main = "Histogram Internal Research Time Data",
     xlab = "Time Spent")

# Boxplots

par(mfrow=c(1,3))
boxplot(wecometoyou, names = c("On-site","WCTY"),
        ylab = "Test Scores",
        main = "Boxplot of WCTY County Test Data")

boxplot(state, names = c("Our State","State 1", "State 2", "State 3", "State 4", "State 5"),
        ylab = "Test Scores",
        main = "Boxplot of State Testing Data")

boxplot(internal, names = c("< 30 min","60 min", "90 min", "120 min", "180 min"),
        ylab = "Test Scores",
        xlab = "Approximate time spent",
        main = "Boxplot of Internal Research Time Data")

#####################################
### Permutation Test on Deviances ###
#####################################
# RMD WCTY data
rmd.x = wecometoyou[,1]
rmd.y = wecometoyou[1:6,2]

dev.x <- rmd.x - median(rmd.x)
dev.y <- rmd.y - median(rmd.y)
rmd.1 <- sum(abs(dev.x))/length(rmd.x)


rmd.2 <- sum(abs(dev.y))/length(rmd.y)
rmd.obs = rmd.1/rmd.2

rmd.comb <- c(rmd.x, rmd.y)
rmd.all <- rep(0, 100)

for(i in 1:100)
{
  rmd.samp <- sample(rmd.comb)
  dev.x <- rmd.samp[1:length(rmd.x)] - median(rmd.x)
  dev.y <- rmd.samp[1:length(rmd.y)] - median(rmd.y)
  rmd.1 <- sum(abs(dev.x))/length(rmd.x)
  rmd.2 <- sum(abs(dev.y))/length(rmd.y)
  rmd.all[i] = rmd.1/rmd.2
}

sum(rmd.all >= rmd.obs)/100

# state testing data
state.order <- state.comb
rmd.x <- state.order[12:23]
rmd.y <- state.order[1:11]

dev.x <- rmd.x - median(rmd.x)
dev.y <- rmd.y - median(rmd.y)
rmd.1 <- sum(abs(dev.x))/length(rmd.x)
rmd.2 <- sum(abs(dev.y))/length(rmd.y)
rmd.obs = rmd.1/rmd.2

rmd.comb <- c(rmd.x, rmd.y)
rmd.all <- rep(0, 100)

for(i in 1:100)
{
  rmd.samp <- sample(rmd.comb)
  dev.x <- rmd.samp[1:length(rmd.x)] - median(rmd.x)
  dev.y <- rmd.samp[1:length(rmd.y)] - median(rmd.y)
  rmd.1 <- sum(abs(dev.x))/length(rmd.x)
  rmd.2 <- sum(abs(dev.y))/length(rmd.y)
  rmd.all[i] = rmd.1/rmd.2
}

sum(rmd.all >= rmd.obs)/100


# internal research data
rmd.x <- internal.comb[12:23]
rmd.y <- internal.comb[1:11]

dev.x <- rmd.x - median(rmd.x)
dev.y <- rmd.y - median(rmd.y)
rmd.1 <- sum(abs(dev.x))/length(rmd.x)
rmd.2 <- sum(abs(dev.y))/length(rmd.y)
rmd.obs = rmd.1/rmd.2

rmd.comb <- c(rmd.x, rmd.y)
rmd.all <- rep(0, 100)

for(i in 1:100)
{
  rmd.samp <- sample(rmd.comb)
  dev.x <- rmd.samp[1:length(rmd.x)] - median(rmd.x)
  dev.y <- rmd.samp[1:length(rmd.y)] - median(rmd.y)
  rmd.1 <- sum(abs(dev.x))/length(rmd.x)
  rmd.2 <- sum(abs(dev.y))/length(rmd.y)
  rmd.all[i] = rmd.1/rmd.2
}

sum(rmd.all >= rmd.obs)/100


##########################
### Willcoxon Rank Sum ###
##########################
# WCTY data
x = wecometoyou[,1]
y = wecometoyou[1:6,2]
wilcox.test(x, y, alternative ="greater")

######################
### Kruskal-Wallis ###
######################
# Bonferroni adjustment
state.adj = .05/((6*(5)/2))
state.adj 

internal.adj = .05/((5*(4)/2))
internal.adj

kruskal.test(state)
# 	  Kruskal-Wallis rank sum test
# 
# data:  state
# Kruskal-Wallis chi-squared = 29.858, df = 5, p-value = 1.573e-05


kruskal.test(internal)
#     Kruskal-Wallis rank sum test
# 
# data:  internal
# Kruskal-Wallis chi-squared = 7.5586, df = 4, p-value = 0.1092


############################
### Pairwise differences ###
############################
mediantst <- function(x, y, nreps=100) 
{
  d.obs <- abs(median(x) - median(y))
  nx <- length(x)
  ny <- length(y)
  tail.prob <- 0
  
  for(i in 1:nreps) 
  {
    xy <- sample(c(x,y)) # permute combined list
    x <- xy[1:nx] # first nx are assigned to x
    y <- xy[seq(nx+1,nx+ny)] # next ny to y
    d.sim <- abs(median(x) - median(y))
    if(d.sim >= d.obs) # increment tail prob
      tail.prob <- tail.prob + 1
  }
  tail.prob <- tail.prob / nreps
  return(tail.prob)
}

mediantst(state[[1]][!is.na(state[1])],state[[2]][!is.na(state[2])])
mediantst(state[[1]][!is.na(state[1])],state[[3]][!is.na(state[3])])
mediantst(state[[1]][!is.na(state[1])],state[[4]][!is.na(state[4])])
mediantst(state[[1]][!is.na(state[1])],state[[5]][!is.na(state[5])])
mediantst(state[[1]][!is.na(state[1])],state[[6]][!is.na(state[6])])

mediantst(state[[2]][!is.na(state[2])],state[[3]][!is.na(state[3])])
mediantst(state[[2]][!is.na(state[3])],state[[4]][!is.na(state[4])])
mediantst(state[[2]][!is.na(state[2])],state[[5]][!is.na(state[5])])
mediantst(state[[2]][!is.na(state[2])],state[[6]][!is.na(state[6])])

mediantst(state[[3]][!is.na(state[3])],state[[4]][!is.na(state[4])])
mediantst(state[[3]][!is.na(state[3])],state[[5]][!is.na(state[5])])
mediantst(state[[3]][!is.na(state[3])],state[[6]][!is.na(state[6])])

mediantst(state[[4]][!is.na(state[4])],state[[5]][!is.na(state[5])])
mediantst(state[[4]][!is.na(state[4])],state[[6]][!is.na(state[6])])

mediantst(state[[5]][!is.na(state[5])],state[[6]][!is.na(state[6])])


