data = read.csv('heart_disease.csv', header = T)
attach(data)
####################
### Arrange data ###
####################

# Split into vectors by region
northeast <- subset(data, data$Region=="Northeast")
northeast.rate <- northeast[,4]

midwest <- subset(data, data$Region=="Midwest")
midwest.rate <- midwest[,4]

south <- subset(data, data$Region=="South")
south.rate <- south[,4]

west <- subset(data, data$Region=="West")
west.rate <- west[,4]


# Create group vector: 1 Northeast, 2 Midwest, 3 South, 4 West
division_vec <- c(rep(1, length(northeast.rate)), rep(2, length(midwest.rate)), rep(3, length(south.rate)), 
                  rep(4, length(west.rate)))

rate_vec <- c(northeast.rate, midwest.rate, south.rate, west.rate)

#####################################
### Summary Statistics and plots  ###
#####################################
summary(Rate[1:51])
summary(northeast.rate)
summary(midwest.rate)
summary(south.rate)
summary(west.rate)

par(mfrow=c(1,1))
boxplot(northeast.rate,midwest.rate, south.rate, west.rate, 
        names = c("Northeast", "Midwest", "South", "West"))

par(mfrow=c(2,2))
hist(northeast.rate, main = "Northeast", xlab = "Rate")
hist(midwest.rate, main = "Midwest", xlab = "Rate")
hist(south.rate, main = "South", xlab = "Rate")
hist(west.rate, main = "west", xlab = "Rate")

#####################################
### Permutation Test on Deviances ###
#####################################
data.2 = read.csv('region_state_rates.csv', header = T)
attach(data.2)

test.deviance = function(trt1,trt2)
{
  dev1 = trt1 - median(trt1);
  dev2 <- trt2 - median(trt2)
  all = c(dev1, dev2)
  index = seq(along=all)
  indexIntrt1 = combn(index, 3)
  RMD = NULL
  
  for(i in 1:dim(indexIntrt1)[2])
  {
    RMD[i] = mean(abs(all[indexIntrt1[, i]]))/mean(abs(all[-indexIntrt1[, i]]))
  }
  
  p_value = sum(RMD >= RMD[1])/length(RMD)
  p_value
}

regions = list(0,0,0,0)

for (i in 1:4)
{
  regions[[i]] = data.2[[i]][!is.na(data.2[i])]
}

p.values.list = NULL

for (i in 1:4)
{
  for(j in 1:4)
  {
    p.values.list = c(p.values.list, test.deviance(regions[[i]],regions[[j]]))
  }
}

min(p.values.list)<=0.05
min(p.values.list)

###########################
### Kruskal-Wallis test ###
###########################
kruskal.test(rate_vec, division_vec) # kruskal.test(rate_vec~divison_vec) gives the same result
# Kruskal-Wallis rank sum test
# 
# data:  rate_vec.2 and division_vec.2
# Kruskal-Wallis chi-squared = 17.589, df = 3, p-value = 0.0005346

###################################
### Pairwise Test##
###################################
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

mediantst(data.2[[1]][!is.na(data.2[1])],data.2[[2]][!is.na(data.2[2])])
mediantst(data.2[[1]][!is.na(data.2[1])],data.2[[3]][!is.na(data.2[3])])
mediantst(data.2[[1]][!is.na(data.2[1])],data.2[[4]][!is.na(data.2[4])])
mediantst(data.2[[2]][!is.na(data.2[2])],data.2[[3]][!is.na(data.2[3])])
mediantst(data.2[[2]][!is.na(data.2[2])],data.2[[4]][!is.na(data.2[4])])
mediantst(data.2[[3]][!is.na(data.2[3])],data.2[[4]][!is.na(data.2[4])])




