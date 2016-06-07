# STAT 5170 
# Assignment 3

### 1. ###
### a. ###
berk <- scan("berkeley.dat", what=list(double(0),double(0),double(0)))
time <- berk[[1]]
berkeley <- berk[[2]]
stbarb <- berk[[3]]

par(mfrow=c(3,1))
plot.ts(berkeley)
plot.ts(stbarb)
plot(berkeley~stbarb)

### b. ###
timefit <- lm(berkeley~time)
anova(timefit)
summary(timefit)
AIC(timefit)

par(mfrow=c(3,1))
timeres <- residuals(timefit)
plot(timeres)
abline(h=0, col="red")
acf(timeres)
qqnorm(timeres)
qqline(timeres, col="red")

# The residuals seem very uniform.  The ACF decays quickly and looks to be stationary
# The Q-Q plot shows that the data is mostly normal.  The tails have a couple of outliers.

### c. ###
timefit <- lm(berkeley~stbarb)
anova(timefit)
# Analysis of Variance Table
# 
# Response: berkeley
#             Df  Sum Sq Mean Sq F value    Pr(>F)    
# stbarb      1  7.2972  7.2972  26.765 1.153e-06 ***
# Residuals 102 27.8092  0.2726                      
# ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

summary(timefit)
# Call:
# lm(formula = berkeley ~ stbarb)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.97037 -0.33928 -0.06555  0.38689  1.39676 
# 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   7.9502     1.0943   7.265 7.67e-11 ***
# stbarb        0.3653     0.0706   5.173 1.15e-06 ***
#   ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 0.5221 on 102 degrees of freedom
# Multiple R-squared:  0.2079,	Adjusted R-squared:  0.2001 
# F-statistic: 26.77 on 1 and 102 DF,  p-value: 1.153e-06
        
AIC(timefit)

par(mfrow=c(3,1))
timeres <- residuals(timefit)
plot(timeres)
abline(h=0, col="red")
acf(timeres)
qqnorm(timeres)
qqline(timeres, col="red")

# The fit seems 


#############################################