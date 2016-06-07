### 1. ###
# H0: D = 0
# H1: D != 0

(119.0 + 489.1)/2 - 147.8
# [1] 156.25

############################
### 2. ###
factorial(1+2)/(factorial(1)*factorial(2))
# [1] 3
# There are 3 possible combinations.

# Permutation 1: seeded: 147.8, 489.1; unseeded: 119.0
# Permutation 2: seeded: 489.1, 119.0; unseeded: 147.8
# Permutation 3: seeded: 119.0, 147.8; unseeded: 489.1

############################
### 3. ###
# Permutation 1:
(147.8 + 489.1)/2 - 119
# [1] 199.45

# Permutation 2:
(489.1 + 119.0)/2 - 147.8
# [1] 156.25

# Permutation 3:
(119.0 + 147.8)/2 - 489.1
# [1] -355.7

############################
### 4. ###
# P_twotail = number of |Ds| >= |D_obs|/choose(m+n, m)    pg 27 4.
1/choose(1+2,1)
# [1] 0.3333333

############################
### 5. ###
setwd("~/Documents/STAT 3480")
cloudseeding <- read.table('cloudseeding.txt', header=T)
attach(cloudseeding)

teststat.obs = mean(rainfall[treatment == "seeded"]) - mean(rainfall[treatment == "unseeded"])
teststat.obs

############################
### 6. ###
choose(10, 4)
# [1] 210

############################
### 7. ###
# install.packages('gtools')
library('gtools')
unseeded = combinations(10, 4, v = rainfall, set = F, repeats.allowed = F)

seeded = NULL
for(i in 1:210){
  seeded = rbind(seeded, setdiff(rainfall, unseeded[i,]))
}
seeded

############################
### 8. ###
teststat = rep(NA, 210)
for (i in 1:210){
  teststat[i] = mean(seeded[i,]) - mean(unseeded[i,])
}

############################
### 9. ###
teststat >= teststat.obs
sum(teststat >= teststat.obs)
sum(teststat >= teststat.obs)/210
# [1] 0.03809524

############################
### 10. ###
teststat.obs = median(rainfall[treatment == "seeded"]) - median(rainfall[treatment == "unseeded"])
# [1] 311.5

choose(10, 4)
# [1] 210

unseeded = combinations(10, 4, v = rainfall, set = F, repeats.allowed = F)

seeded = NULL
for(i in 1:210){
  seeded = rbind(seeded, setdiff(rainfall, unseeded[i,]))
}

teststat = rep(NA, 210)
for (i in 1:210){
  teststat[i] = median(seeded[i,]) - median(unseeded[i,])
}

teststat >= teststat.obs
sum(teststat >= teststat.obs)
sum(teststat >= teststat.obs)/210
# [1] 0.04285714

############################
### 11. ###
teststat.obs = sum(rainfall[treatment == "seeded"]) - sum(rainfall[treatment == "unseeded"])
teststat.obs
# [1] 4320.9

choose(10, 4)
# [1] 210

unseeded = combinations(10, 4, v = rainfall, set = F, repeats.allowed = F)

seeded = NULL
for(i in 1:210){
  seeded = rbind(seeded, setdiff(rainfall, unseeded[i,]))
}

teststat = rep(NA, 210)
for (i in 1:210){
  teststat[i] = sum(seeded[i,]) - sum(unseeded[i,])
}

teststat >= teststat.obs
sum(teststat >= teststat.obs)
sum(teststat >= teststat.obs)/210
# [1] 0.03809524

############################
### 12. ### wrong
teststat.obs = max(rainfall[treatment == "seeded"]) - max(rainfall[treatment == "unseeded"])
teststat.obs
# [1] 2597.8

choose(10, 4)
# [1] 210

unseeded = combinations(10, 4, v = rainfall, set = F, repeats.allowed = F)

seeded = NULL
for(i in 1:210){
  seeded = rbind(seeded, setdiff(rainfall, unseeded[i,]))
}

teststat = rep(NA, 210)
for (i in 1:210){
  teststat[i] = max(seeded[i,]) - max(unseeded[i,])
}
teststat
teststat >= teststat.obs
sum((teststat - teststat.obs) >= 0)/210
sum(teststat >= teststat.obs)/210
# [1] 0.07142857



