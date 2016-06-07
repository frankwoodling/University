soi <- scan("soi.dat")

plot(soi, xlab="time", ylab="Southern Oscillation Index", 
     main="Time Series Plot")

recruit <- scan("recruit.dat")

jpeg("joint.jpg")
par(mfrow=c(1,2))
plot.ts(soi)
plot.ts(recruit)
dev.off()

 
#### 1. ####
#### a. ####
2*1:5
# [1]  2  4  6  8 10

(2*1):5
# [1] 2 3 4 5

# In the first one it is creating a sequence from 1 to 5 and then multiplying each number by 2.
# In the second operations inside the parantheses take priority, so the sequence only
# goes from 2 to 5.

#### b. #### 
x <- seq(1,19, by=2)
# [1]  1  3  5  7  9 11 13 15 17 19

#### c. ####
y = c(-1, 2, -3, 4, -5)
z = abs(y)
# [1] 1 2 3 4 5

#### d. ####
qchisq(.95, 10)

#### e. ####
set.seed(1234)
x = rnorm(1000)
summary(x)
#     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -3.39600 -0.67330 -0.03979 -0.02660  0.61580  3.19600 

mean(x)
# Mean: [1] -0.0265972

var(x)
# Variance: [1] 0.9946825

hist(x, main="Histogram of 1000 Random Numbers", xlab="data")


#########################################################
#### 2.####



#########################################################

