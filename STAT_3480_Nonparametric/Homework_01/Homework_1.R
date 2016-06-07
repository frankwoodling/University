# 1.

data.1 <- c(79, 74, 88, 80, 80, 66, 65, 86, 84, 80, 78, 72, 71, 74, 86, 96, 77, 81, 76, 80,
            76, 75, 78, 87, 87, 74, 85, 84, 76, 77, 76, 74, 85, 74, 76, 77, 76, 74, 81, 76)

b <- length(subset(data.1, data.1 > 70))
# [1] 38

z_b <- (38-20)/sqrt(.25*40)
# [1] 5.6921

p_val = pnorm(-z_b)
# [1] 6.274324e-09

# With a p-value of 6.274324e-09 we can reject the null hypothesis at a significance level
# of 95%.  We can conclude that the median exam score has increased from the previous semester's
# median of 70.

###########################################################

# 3.

data.3 <- c(21.3, 28.8, 17.6, 23.0, 27.2, 28.5, 32.8, 28.2, 25.9, 22.5, 
            27.2, 33.1, 28.7, 24.8, 24.3, 27.1, 30.6, 26.8, 18.9, 36.3,
            28.0, 17.9, 25.0, 27.5, 27.7, 32.1, 28.0, 30.9, 20.0, 20.2,
            33.5, 26.4, 30.9, 33.2)
# a.
(sqrt(.25*34)*-1.96)+(.5*34)
# a = [1] 11.28567
(sqrt(.25*34)*1.96)+(.5*34)+1
# b = [1] 23.71433

data.3.sorted <- sort(data.3)
data.3.sorted[11]
data.3.sorted[24]
# interval is (25, 28.7)


# b.
a <- -qnorm(.2)*sqrt(.25*34)+17
# [1] 19.45373
b <- qnorm(.2)*sqrt(.25*34)+18
# [1] 15.54627

data.3.sorted[19]
data.3.sorted[16]
# Interval for 20th percentile is (19.45373, 27.7)


a <- -qnorm(.8)*sqrt(.25*34)+17
b <- qnorm(.8)*sqrt(.25*34)+18
data.3.sorted[15]
data.3.sorted[20]
# Interval for 80th percentile is (27.1, 28)
a
b
# c.
# Rainfall is being averaged throughout the entire year for each observation.
# A record year or two could create a distribution that is more heavy-tailed than a normal
# distribution.



###########################################################

# 6.
# a.
1-pnorm(1.645)
# [1] 0.04998491

# b.
# As mu increases p also increases.  This increases the power, and the chance
# of tests to detect that mu is greater than 75.

# c.
# Increasing the sample size would lower the denominator of the right side of the 
# binomial test equation. As p-.5/(sqrt(1-p)/n) decreases the amount subtracted 
# from 0 also decreases, so the power would increase with sample size.