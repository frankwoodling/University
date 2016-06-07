#library(gregmisc)

source("http://www4.stat.ncsu.edu/~wang/courses/ST505/Rcode/combinations.R")

#Null distribution of signed rank statistic (n=6). Ex 1.3.1

D = c(8,5,3.5,-1.5,1,1.5)
ranks = rank(abs(D))
n = length(D)
SR = 0 #none is selected
for(i in 1:n)
{
    if(n>10) warning("n is too large, the computation will take a while")
    #select i ranks
    ind = combinations(n, i)
    for(j in 1:nrow(ind))
    {
        SR = c(SR, sum(ranks[ind[j,]]))
    }
}
